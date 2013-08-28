library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

--library synplify;
--use synplify.attributes.all;


--	2011-05-27		PCI I/O map condensed to Base+0 (DB7), Base+1 (USB) plus mirror of last read at Base+4 to solve lacinputk of parity capability

entity DC7_PCI is
    port(
		--	PCI Interface
		PCI_Clock				: in	std_logic;
		PCI_Reset				: in	std_logic;
		IRdy					: in	std_logic;
		Frame	 				: in	std_logic;
		IDSel 					: in	std_logic;
		DevSel 					: out	std_logic;
		TRdy					: out	std_logic;
		CBE 					: in	std_logic_vector (3 downto 0 );
		AD 						: inout std_logic_vector (17 downto 0);
		ADEx					: in	std_logic_vector( 1 downto 0);

		--	USB FTDI FIFO interface
		USBRxValid				: in	STD_LOGIC;
		USBTxReady				: in	STD_LOGIC;
		USBData	 				: inout	STD_LOGIC_VECTOR (7 downto 0);
		USBRead 				: out STD_LOGIC;
		USBWrite 				: out STD_LOGIC;

		--	MCCDisplay
		DData					: inout std_logic;
		DClock					: out std_logic;

		--	Synchronous Serial Interface (SSI)
		SSClock					: out std_logic;
		SSAddr					: out std_logic;
		SSStrobe					: out	std_logic;
		SSDOut					: out	std_logic;
		SSDIn					: in	std_logic;
		SSAck					: in	std_logic;

		-- Diagnostics
		LED 					: out std_logic;
		Probe					: out std_logic
    );
end DC7_PCI;



architecture behave of DC7_PCI is
--type word is std_logic_vector(15 downto 0);

component PCI is

    Port (
		--			Physical Bus connections
		CLK	 		: in  std_logic;
		RST	 	: in  std_logic;
		FRAME 		: in  std_logic;
		IRDY 		: in  std_logic;
		IDSEL 		: in  std_logic;
		TRDY 		: out std_logic;
		DEVSEL 		: out std_logic;
		ADEx		: in  std_logic_vector (1 downto 0);
		AD			: inout  std_logic_vector (17 downto 0);
		CBE 		: in  std_logic_vector (3 downto 0);
		
		--			Internal access signals
		D 			: in  std_logic_vector (17 downto 0);	-- data to be supplied to the PCI bus
		Q 			: out std_logic_vector (19 downto 0);	--	data read from the PCI bus
		ALow 		: out std_logic_vector (3 downto 0);	-- least significant four bits to access function
		ReadReq 	: out std_logic;--_vector (1 downto 0);
		WriteReq		: out std_logic;--_vector (1 downto 0);
		Hold 		: in  std_logic;
		Active		: out std_logic;
		PCI_Cfg		: out std_logic;
		TestPoint		: out std_logic
	 );

end component;

component USBPort
    Port ( 
    
		Clock		: in  STD_LOGIC;
		Reset		: in  STD_LOGIC;

		--	USB FTDI FIFO interface
		USBRxValid	: in	STD_LOGIC;
		USBTxReady	: in	STD_LOGIC;
		USBData		: inout	STD_LOGIC_VECTOR (7 downto 0);
		USBRead 	: out STD_LOGIC;
		USBWrite 	: out STD_LOGIC;

		-- internal interface
		TxData 		: in  STD_LOGIC_VECTOR (7 downto 0);
		TxDone	 	: out STD_LOGIC;
		SendByte	: in	std_logic;

		RxData 		: out	STD_LOGIC_VECTOR (7 downto 0);
		RxValid 		: out STD_LOGIC;
		GetByte 		: in	std_logic;
		
		WriteCount	: out std_logic_vector(7 downto 0);
		ReadCount	: out std_logic_vector(7 downto 0)
		
	);
end component;


component SSI is

    Port
	 (
	 
		Clock		: in	std_logic;
		Reset		: in	std_logic;
		
		
		--	Internal signals (parallel data and address)
		Address 		: in	STD_LOGIC_VECTOR (7 downto 0);
		D		 	: in	STD_LOGIC_VECTOR (15 downto 0);
		Q			: out	STD_LOGIC_VECTOR (15 downto 0);
		Strobe		: in	STD_LOGIC;
		Ready 		: out STD_LOGIC;
		NoResponse	: out STD_LOGIC;
		StateOut		: out std_logic_vector (3 downto 0);
		Probe		: out std_logic;

		--	External signals to DB7 boards
		SCLK 		: out	STD_LOGIC;
		SDI 			: in	STD_LOGIC;
		SDO 		: out STD_LOGIC;
		SADR 		: out STD_LOGIC;
		SSTB 		: out STD_LOGIC;
		SACK 		: in  	STD_LOGIC
		
		
	);
	
end component;


component Reg16 is
    port(
		Clock	: in std_logic;
		Reset	: in std_logic;
		Write	: in std_logic;
		DataIn	: in std_logic_vector( 15 downto 0 );
		DataOut	: out std_logic_vector( 15 downto 0 )
    );
end component;

component Div2
    port(
		Clock	: in std_logic;
		Reset	: in std_logic;
		ClockOut  : out std_logic
    );
end component;




	constant BaseAddress	: std_logic_vector( 19 downto 0 ) := x"00318";	-- board address is in 16-bit I/O address space, so widen to 

	type	SSI_State is (stIDLE, stWAIT_TO_WRITE, stWRITE);

	--	=======================	signals associated with 80x86 PCI bus	==========================
	
	signal x86_Dout				: std_logic_vector( 17 downto 0 );
	signal Last_x86_Dout			: std_logic_vector( 17 downto 0 );
	signal x86_Din					: std_logic_vector( 19 downto 0 );
	signal x86_IOAddress			: std_logic_vector(3 downto 0);
	signal x86_Hold				: std_logic;
	signal x86_Read				: std_logic;
	signal x86_Write				: std_logic;
	signal x86_Active				: std_logic;
	signal x86_PCI_Cfg				: std_logic;
	signal x86_PCI_Cfg_Latch		: std_logic;
	signal x86_Test				: std_logic;
	signal FiducialMarker			 : std_logic;

	signal x86_Dlast				: std_logic_vector( 19 downto 0 );
	signal DWordMode				: std_logic_vector(3 downto 0);
	
	--	========================	FTDI USB interface		====================================
	
	signal USBControl				: std_logic_vector(7 downto 0);	-- control tristate byte-wide IO buffer
	signal DataToHost				: std_logic_vector(7 downto 0);
	signal HostTxDone				: std_logic;
	signal WriteToHost				: std_logic;
	signal USBSend				: std_logic;
	signal DataFromHost			: std_logic_vector(7 downto 0);
	signal HostRxValid				: std_logic;
	signal ReadFromHost			: std_logic;

	signal HostWriteCount			: std_logic_vector(7 downto 0);
	signal HostReadCount			: std_logic_vector(7 downto 0);
	
	--	signal Switcher				: std_logic;
	signal USBReadWire			: std_logic;
	signal USBWriteWire			: std_logic;

	signal DACKCounter			: std_logic;

	--	========================	Front panel LED display	=====================================
	
	signal LEDRegister				: std_logic_vector( 31 downto 0);
	signal LEDShift					: std_logic;
	signal LEDWrite				: std_logic;
	signal Yellow					: std_logic;
	--	signal DisplayData				: std_logic;
	signal LEDIndex				: std_logic_vector(4 downto 0);
	
	--	signal LSDir					: std_logic;
	--	signal LSOut					: std_logic_vector(3 downto 0);
	--
	--	signal Word0Write, Word1Write	: std_logic;
	--

	--	========================	DB7 SSI interface	=========================================
		
		signal DB7_SClock			: std_logic;
		signal DB7_SDO			: std_logic;
		signal DB7_SADR			: std_logic;
		signal DB7_Dout			: std_logic_vector(15 downto 0);
		signal DB7_Din			: std_logic_vector(15 downto 0);
		signal DB7_Address		: std_logic_vector(7 downto 0);
		signal DB7_Strobe			: std_logic;
		signal DB7_Ready			: std_logic;
		signal DB7_NoResponse	: std_logic;
		
		signal x86_to_DB7			: std_logic;
		signal SSIProbe			: std_logic;
	

	--	========================	Dignostics and on-card signals	==============================
	
	signal Show					: std_logic;
	signal Show_PCI				: std_logic;
	signal LEDOut					: std_logic;
	signal FaultBlink				: std_logic;
	signal Fault_PCIOut				: std_logic;
	signal Fault_PCIIn				: std_logic;
	signal Fault_DB7Out			: std_logic;
	signal Fault_DB7In				: std_logic;
	signal StateOut				: std_logic_vector(3 downto 0);
	signal Scaler					: std_logic_vector(15 downto 0 );
	signal ProbeSelect				: std_logic_vector(4 downto 0);
	signal nsCounter				: std_logic_vector(17 downto 0 );
	--signal DiagReg				: std_logic_vector(7 downto 0 );
	signal Blinker					: std_logic_vector(1 downto 0);
	signal LastCBE					: std_logic_vector(3 downto 0);
	signal ReadStarted				: std_logic;
	signal not_x86_Read 				: std_logic;
	signal Diagnostic					: std_logic;
	
	--===================Signals for SR bit diagnostic tool======================
	--===========================Obsolete========================================
	--signal SR_clock : std_logic;
	--signal SR_control : std_logic;
	--signal SR_in	: std_logic;
	--signal SR_out	: std_logic;

	--===================Signals for bit array test==============================

	signal index : std_logic_vector(6 downto 0); -- 7 bits
	signal Bit_array : std_logic_vector(63 downto 0);
	signal testbit : std_logic;
	signal sample_enable: std_logic;
	signal sample_select: std_logic_vector(3 downto 0);
	signal sample_in : std_logic;
	constant zero :std_logic := '0';
	--signal int_index : integer range -8 to 7;

	signal Shift_register : std_logic_vector(3 downto 0);
	signal Shift_register_sample : std_logic;
	signal Shift_register_select : std_logic_vector(3 downto 0);
	signal Scope_config : std_logic_vector(7 downto 0);

	signal USB_index : std_logic_vector(1 downto 0);

	signal TRDY_test : std_logic;

begin

	x86 : PCI port map
	(
		CLK		=> PCI_Clock, 
		RST	=> PCI_Reset, 
		FRAME 	=> Frame, 
		IRDY 	=> IRdy, 
		IDSEL 	=> IDSel, 
		TRDY 	=> TRDY_test, 
		DEVSEL	=> DevSel, 
		ADEx	=> ADEx,
		AD		=> AD,
		CBE 	=> CBE, 

		--			Internal access signals
		D 		=> x86_Dout, 
		Q 		=> x86_Din, 
		Alow 	=> x86_IOAddress, 
		ReadReq=> x86_Read, 
		WriteReq	=>	x86_Write, 
		Hold 	=> x86_Hold,
		PCI_Cfg	=> x86_PCI_Cfg,
		Active	=> Show_PCI,
		TestPoint	=> x86_Test
    );

	DB7 : SSI port map
	(
		Clock	=>	PCI_Clock,
		Reset	=>	PCI_Reset,
		
		--	Internal signals (parallel data and address)
		Address 	=> DB7_Address,
		D	 	=> DB7_Dout,
		Q		=> DB7_Din,
		Strobe	=> DB7_Strobe,
		Ready 	=> DB7_Ready,
		NoResponse	=> DB7_NoResponse,

		StateOut	=> StateOut,
		Probe	=> SSIProbe,
		
		--	External signals to DB7 boards
		SCLK 	=>	DB7_SClock,
		SDI 		=>	SSDIn,
		SDO 	=>	DB7_SDO,
		SADR 	=>	DB7_SADR,
		SSTB 	=>	SSStrobe,
		SACK 	=>	SSAck
	);


	Host: USBPort PORT MAP(
		
		Clock 		=> 	PCI_Clock,
		Reset 		=> 	PCI_Reset,
		
		--	USB External signals
		USBData		=> 	USBData,
		USBRxValid	=> 	USBRxValid,
		USBTxReady	=> 	USBTxReady,
		USBRead	=>	USBReadWire,
		USBWrite	=> 	USBWriteWire,
		
		--	Internal interface
		TxData 		=> 	DataToHost,
		TxDone	 	=> 	HostTxDone,
		SendByte 	=> 	USBSend,
		
		RxData 		=> 	DataFromHost,
		RxValid 		=> 	HostRxValid,
		GetByte 		=> 	ReadFromHost,
		
		ReadCount	=>	HostReadCount,
		WriteCount	=>	HostWriteCount
		
		
	);


	
	--	================================	Diagnostics	================================

	LED		<= Diagnostic; --Blinker(1);--HostReadCount(0);	--DACKCounter; -- '0' when DataFromHost=x"44" else '1';	--not LEDOut;	--DataToHost(0);--(YellowLED or PulseReg(15) or Show);
	Show	<= SSIProbe;
	--USB_index <= Scope_config(1 downto 0);

	--======================= allowing TRDY to be read =======================================	
	TRdy <= TRDY_test;

	
	With ProbeSelect Select      -- creates a 32-to-1 multiplexer
		Probe 	<=	x86_Hold		When '0' & x"1",
					x86_to_DB7	When '0' & x"2",
					x86_Active	When '0' & x"3",
					x86_Read	When '0' & x"4",
					x86_Write	When '0' & x"5",
					FiducialMarker	When '0' & x"6",

					SSIProbe		When '0' & x"8",
					DB7_SClock	When '0' & x"9",
					DB7_SDO	When '0' & x"A",
					DB7_Strobe	When '0' & x"B",
					DB7_Ready	When '0' & x"C",
					DB7_SADR	When '0' & x"D",
					SSAck		When '0' & x"E",
					SSDin		When '0' & x"F",
  

					USBRxValid	When '1' & x"0",
					USBTxReady	When '1' & x"1",
					USBReadWire When '1' & x"2",
					USBWriteWire	When '1' & x"3",
					 
					PCI_Clock		When others;
			

	--============================Controls input to digital oscilliscope shift register==================================
	--	if USB_shiftreg_control = "01" then
		with Scope_config(3 downto 0) select
			Shift_register_sample <= CBE(0) when x"0",
												CBE(1) when x"1",
												CBE(2) when x"2",
												CBE(3) when x"3",
												 
												x86_read when x"4",
												Frame when x"5",
												IRDY when x"6",
												TRDY_test when x"7",
											 
												AD(0) when x"8",
												AD(1) when x"9",
												AD(2) when x"A",
												AD(3) when x"B",
											 
												x86_test when x"C",
												x86_Write when x"D",
												Show_PCI when x"E",
											 
												zero when others;
	--	end if;
	--=========================== List of scope triggers: ===================================

	-- Scope_config(6 downto 4)  |   Trigger

	--				000				|  NONE
	--          001            |	Byte-read
	--				010				|  Word-read
	--          011            |	Dword-read
	--				100				|	byte write
	--          101            |	word-write
	--				110				|	Dword-write
	--          111            |	byte out-in
	--===========================	DB7 SSI interface	=========================================
	
	SSDOut		<= DB7_SDO;
	SSClock		<= DB7_SClock;
	SSAddr		<= DB7_SADR;
	DB7_Strobe	<= x86_to_DB7;
	
	USBRead	<= USBReadWire;
	USBWrite	<= USBWriteWire;

	--	========================	Front panel LED display	=====================================
	DClock 	<= (nsCounter(0) and LEDShift);
	DData 	<=  'Z' When (LEDWrite='0' and Yellow='0') else (LEDRegister(to_integer(unsigned(LEDIndex))) or ((not LEDWrite) and Yellow));
	


	--=========================== Start of Main Process ==========================================
	x86Transfer : process(PCI_Clock, PCI_Reset, x86_Write, x86_Read, x86_IOAddress, Blinker)
	begin
		if PCI_Reset = '0' then
			x86_Hold 		<= '0';
			x86_to_DB7		<= '0';
			DB7_Address		<= x"A5";
			Scope_config		<= x"00";
			ReadFromHost	<= '0';
			x86_Active		<= '0';
			WriteToHost		<= '0';
			USBSend		<= '0';
			x86_Dlast		<=  BaseAddress;
			DWordMode		<= x"0";
			x86_PCI_Cfg_Latch<= '0';
			LEDRegister		<= x"FFFFFFFF";
			LEDShift			<= '1';
			LEDWrite			<= '1';
			LEDIndex		<= "11111";
			FiducialMarker 	<= '0';
			DACKCounter	<= '0';
			Blinker			<= "11";
			LastCBE		<= "1111";
			not_x86_Read <= '1';
			Diagnostic <= '0';
			
			Bit_array <= x"0123456789abcdef";
			index <= "1000000";
			sample_enable <= '0';
			Shift_Register <= "0000";
			Shift_register_select <= x"0";
			USB_index <= "11";

			
		else
			--sample_select <= x"2";
			if rising_edge(PCI_Clock) then
			
				--	===============		PCI component requests Read ie requires data to be returned to x86	================

				
				if x86_PCI_Cfg = '1'  and x86_PCI_Cfg_Latch = '0' then	-- ConfigRead done
					x86_PCI_Cfg_Latch<= '1';
					LEDRegister		<= x"AAAAAAAA";
					LEDShift			<= '1';
					LEDWrite			<= '1';
					LEDIndex		<= "11111";
				end if;
		
				if x86_Read = '1' then 
				
					ReadStarted <= '1';
					x86_Active <= '1';
					Yellow	<= '0';
					
					
					case x86_IOAddress is
					
						When x"0" =>	--	Read status (byte read) or SSI data from previous write (word read)
						
							case CBE is
							
								When "1110" =>	--	byte read
									x86_Hold <= '0';
									x86_Dout(7 downto 0)	<= StateOut &  x86_Hold & DData & DB7_NoResponse & DB7_Ready;
									Last_x86_Dout(7 downto 0)	<= StateOut &  x86_Hold & DData & DB7_NoResponse & DB7_Ready;
								When "1100" =>	--	word read
									if DB7_Ready = '1' then
									
										x86_Hold <= '0';
										x86_Dout( 15 downto 0) 	<= DB7_Din;
										Last_x86_Dout( 15 downto 0) 	<= DB7_Din;
									else
										ReadStarted <= '0';
										x86_Hold <= '1';
									end if;
									
								When "0000" =>	--	dword read
								
									case DWordMode is
										When x"0" | x"1" =>
													x86_Dout 	<=  x86_Dlast(17  downto 0);
													Last_x86_Dout<=  x86_Dlast(17  downto 0);
										When others =>
													x86_Dout 	<= nsCounter;
													Last_x86_Dout<= nsCounter;
									end case;
								
								When others =>	--	dword read
								
							end case;
							
						When x"1" =>	--	Read from USB port

							x86_Hold <= '0';	-- USB component is buffered, and allows immediate read
							case CBE is
							
								when "1101" =>
									if Scope_config(6 downto 4) = "001" then --trigger scope
										sample_enable <= '1';
									end if;
									x86_Dout <= "00000" & DData & DB7_NoResponse &  DB7_Ready & HostTxDone &HostRxValid & x"00"; -- read just the status in b0, b1
									Last_x86_Dout <= "00000" & DData & DB7_NoResponse &  DB7_Ready & HostTxDone &HostRxValid & x"00"; -- read just the status in b0, b1
								
								when "1001" =>


									if Scope_config(6 downto 4) = "010" then --trigger scope
										sample_enable <= '1';
									end if;

									x86_Dout( 17 downto 8) <= HostTxDone & HostRxValid & DataFromHost;	-- Supply 18 bit word, bit 8 shows validity of USB input;
									Last_x86_Dout( 17 downto 8) <= HostTxDone & HostRxValid & DataFromHost;	-- Store it for subsequent read at  port+4
									if x86_Active='0' then
										ReadFromHost	<= '1';	-- provide Read pulse to USB component
										if DataFromHost = x"44" then
											if  DACKCounter ='1'  then
												DACKCounter <= '0';
											else 
												DACKCounter <= '1';
											end if;
										end if;
									end if;
	--								when "0000" =>

								when others =>
									if Scope_config(6 downto 4) = "011" then --trigger scope
										sample_enable <= '1';
									end if;
									--if ReadStarted = '0' then
									LastCBE <= CBE;
									case USB_index	is 
									-- indexes go "backwards" to match stack in forth
										when "00" =>
											x86_Dout 	  <= "00" & Bit_array(63 downto 48);--(15 downto 4) & Shift_Register;	--& HostWriteCount(3 downto 0) 
											last_x86_Dout <= "00" & Bit_array(63 downto 48);--(15 downto 4) & Shift_Register;
											USB_index <= "11";
										when "01" =>
											x86_Dout 	  <= "00" & Bit_array(47 downto 32);--(15 downto 4) & Shift_Register;	--& HostWriteCount(3 downto 0) 
											last_x86_Dout <= "00" & Bit_array(47 downto 32);--(15 downto 4) & Shift_Register;
											USB_index <= "00";
										when "10" =>
											x86_Dout 	  <= "00" & Bit_array(31 downto 16);--(15 downto 4) & Shift_Register;	--& HostWriteCount(3 downto 0) 
											last_x86_Dout <= "00" & Bit_array(31 downto 16);--(15 downto 4) & Shift_Register;
											USB_index <= "01";
										when "11" =>
											x86_Dout 	  <= "00" & Bit_array(15 downto  0);--(15 downto 4) & Shift_Register;  	--& HostWriteCount(3 downto 0) 
											last_x86_Dout <= "00" & Bit_array(15 downto  0);--(15 downto 4) & Shift_Register;
											USB_index <= "10";
										when others =>
											USB_index <= "00"; -- reset
									end case;
									--end if;
					
							end case;

						--When x"2" =>	--	Read from timer port
						--		x86_Dout 	<= nsCounter;
						--		Last_x86_Dout<= nsCounter;

							
						When x"4" =>	--	Read last data - to solve PCI parity error failure
						
							case CBE is
							
								When "1110" =>	--	byte read
									x86_Hold <= '0';
									x86_Dout(7 downto 0)	<= Last_x86_Dout(7 downto 0);
									
								When "1100" =>	--	word read
									if DB7_Ready = '1' then
									
										x86_Hold <= '0';
										x86_Dout( 15 downto 0) 	<= Last_x86_Dout(15 downto 0);
									else
										x86_Hold <= '1';
									end if;
									
								When "0000" =>	--	dword read
										x86_Dout 	<=  Last_x86_Dout;
										
								When others =>	--	dword read
								
							end case;
							
						When x"5" =>	--	Read last data - to solve PCI parity error failure
						
							x86_Hold <= '0';
							Diagnostic <= not Diagnostic;		
							
							case CBE is
							
								When "1101" =>	--	byte read
									x86_Dout(15 downto 8)	<= Last_x86_Dout(15 downto 8);
									
								When "1001" =>	--	word read
									x86_Dout(17 downto 8) 	<= Last_x86_Dout(17 downto 8);
									
								--When "0000" =>	--	dword read
										
								When others =>	--	dword read
									x86_Dout 	<=  Last_x86_Dout;
								
							end case;
							
						--When x"6" =>	--	Read from timer port
						--		x86_Dout 	<= Last_x86_Dout;
											
						When others =>
						
					end case;
					
				elsif x86_Write = '1' then
				
					x86_Active	<= '1';
					x86_Dlast	<= x86_Din;
					
					case x86_IOAddress is
					
						When x"0" =>

										--Yellow <= '1';	-- show activity
										x86_Hold <= '0';

										
										case CBE is
										
											When "1110"  =>	-- low byte write specifies SPI address/board
											
												if DB7_Ready = '1' then
													DB7_Address	<= x86_Din(7 downto 0);
													--x86_to_DB7 	<= '1';
												else
													x86_Hold <= '1';	--	Has not finished sending last packet
												end if;
												
											When "1100"	=>			--	write 16 bits of data to addressed DB7 board
											
												DB7_Dout 	<= x86_Din(15 downto 0);
												x86_to_DB7 	<= '1';
												
											When others =>						-- otherwise write dword
											
												DWordMode	<= x86_Din(15 downto 12);
												case x86_Din(15 downto 12) is
												

													When x"0" =>
													
														case x86_Din(9 downto 8) is
								
															when "00" =>	LEDRegister(7 downto 0)	<= x86_Din(7 downto 0);
															when "01" =>	LEDRegister(15 downto 8)	<= x86_Din(7 downto 0);
															when "10" =>	LEDRegister(23 downto 16)	<= x86_Din(7 downto 0);
															when "11" =>	LEDRegister(31 downto 24)	<= x86_Din(7 downto 0);
															
															when others =>						-- otherwise nothing
																
														end case;
														
														if x86_Din(11) = '1' then
															Yellow		<= x86_Din(10);
														end if;
														LEDIndex	<= "11111";
														LEDWrite	<= '1';
													
													When x"1" =>
														ProbeSelect	<= x86_Din( 4 downto 0 );
													
													When x"F" =>
														FiducialMarker <= x86_Din(0);
													When others =>
												end case;
												
											end case;
										
						When x"1" =>

										case CBE is
										
											When "1101"  =>		--	Write to USB port
												if (Scope_config(6 downto 4) = "100") or (Scope_config(6 downto 4) = "111") then --trigger scope
													sample_enable <= '1';
												end if;															
												USBSend		<= '1';

												DataToHost	<=  x86_Din(15 downto 8);
											
											When "1001"  =>		--	Write to USB Configuration Register
												--sample_enable <= '0';
												if x86_Din(17 downto 16) = "01" then -- set up oscilliscope
													sample_enable <= '0';
													Scope_config <= x86_Din(15 downto 8);
													index <=  "0111111";
													USB_index <= "11";

													--sample_enable <= '0';
												else
													if Scope_config(6 downto 4) = "101" then --trigger scope
														sample_enable <= '1';
													end if;
													USBcontrol <= x86_Din(15 downto 8);
												end if;


												
											When others =>
												if Scope_config(6 downto 4) = "110" then --trigger scope
													sample_enable <= '1';
												end if;
										end case;

						When others =>
						
					end case;
				else
					x86_Active	<= '0';
				end if;
				
				if ReadFromHost = '1' then
					ReadFromHost <= '0';
					ReadStarted <= '0';
				end if;
				
				if HostTxDone = '1' then
					if  WriteToHost = '1' then
						USBSend		<= '1';
						WriteToHost <= '0';
					else
						USBSend		<= '0';
					end if;
				end if;
				
				if x86_to_DB7 = '1' then
					x86_to_DB7 <= '0';
				end if;
				if  LEDWrite	= '1' then
					LEDShift <= '1';
				end if;

				if LEDShift = '1'  and nsCounter(0) = '1' then
					LEDIndex <= std_logic_vector(unsigned(LEDIndex) - 1);
					if LEDIndex = "00000" then
						LEDShift <= '0';
						LEDWrite<= '0';
					end if;
				end if;
				
	--=========================Digital oscilliscope===================================
				if index(6) = '0' and sample_enable = '1' then
					index <= std_logic_vector(unsigned(index)-1);
					Bit_array(to_integer(unsigned(index(5 downto 0)))) <= Shift_register(1);
				elsif index(6) = '1' then
					sample_enable <= '0';
				end if;
	--================================================================================
				
	--================Shift register for digital oscilliscope==========================
				Shift_Register(3 downto 1) <= Shift_Register(2 downto 0);
				Shift_register(0) <= Shift_register_sample;
	--=================================================================================				
				
			end if;
		end if;
	end process x86Transfer;
	
	Blink : process(PCI_Clock, PCI_Reset, Show, Scaler)
	begin
		if PCI_Reset = '0' then
			Scaler 	<= x"0000";
			LEDOut 	<= '0';
			nsCounter		<= "00"&x"0000";
		else
			if rising_edge(PCI_Clock) then
			
				if Show = '1' then
					Scaler	<= x"0000";
					LEDOut <= '1';
				end if;
				
				if LEDOut = '1' then
					Scaler	<=	std_logic_vector(unsigned(Scaler) + 1);
				end if;
				
				if Scaler(15 downto 12)= x"F" then
						LEDOut	<= '0';
				end if;

				nsCounter <= std_logic_vector(unsigned(nsCounter) + 1);
			end if;
		end if;
	end process Blink;
		
end behave;
