library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

--library synplify;
--use synplify.attributes.all;


--	2002-05-30	Problems with latest MSI-Turbo2 Board (1000Mhz Duron)
-- 		not booting cleanly, and not running 3 DB6 boards on some motherboards
--	1. Remove references to ConfigWrite (not used) to simplify design.

--	2003-01-29	Added Configured bit, readable in status word (bit 4)
--				Configured =0 on reset, and set to 1 after a Word1 write,
--				for testing if chip has spuriously reset.


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
	signal x86_Din					: std_logic_vector( 19 downto 0 );
	signal x86_IOAddress			: std_logic_vector(3 downto 0);
	signal x86_Hold				: std_logic;
	signal x86_Read				: std_logic;
	signal x86_Write				: std_logic;
	signal x86_Active				: std_logic;
	signal x86_Test				: std_logic;
	

	signal x86_Dlast				: std_logic_vector( 19 downto 0 );
	
	--	========================	FTDI USB interface		====================================
	
	--signal USBDir				: std_logic;	-- control tristate byte-wide IO buffer
	signal DataToHost				: std_logic_vector(7 downto 0);
	signal HostTxDone				: std_logic;
	signal WriteToHost				: std_logic;
	
	signal DataFromHost			: std_logic_vector(7 downto 0);
	signal HostRxValid				: std_logic;
	signal ReadFromHost			: std_logic;

	signal HostWriteCount			: std_logic_vector(7 downto 0);
	signal HostReadCount			: std_logic_vector(7 downto 0);
	
--	signal Switcher				: std_logic;

	--	========================	Front panel LED display	=====================================
	
	signal LEDRegister				: std_logic_vector( 15 downto 0);
	signal LEDShift				: std_logic;
	signal Yellow					: std_logic;
--	signal DisplayData				: std_logic;
	signal LEDIndex				: std_logic_vector(3 downto 0);
	
--	signal LSDir					: std_logic;
--	signal LSOut					: std_logic_vector(3 downto 0);
--
--	signal Word0Write, Word1Write	: std_logic;
--

	--	========================	DB7 SSI interface	=========================================
	
	signal DB7_SSClock			: std_logic;
	signal DB7_SSDO				: std_logic;
	signal DB7_Dout				: std_logic_vector(15 downto 0);
	signal DB7_Din				: std_logic_vector(15 downto 0);
	signal DB7_Address			: std_logic_vector(7 downto 0);
	signal DB7_Strobe				: std_logic;
	signal DB7_Ready				: std_logic;
	
	signal x86_to_DB7				: std_logic;
	signal SSIProbe				: std_logic;


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
	
--	signal DiagReg				: std_logic_vector(7 downto 0 );
	
begin

	x86 : PCI port map
	(
		CLK		=> PCI_Clock, 
		RST	=> PCI_Reset, 
		FRAME 	=> Frame, 
		IRDY 	=> IRdy, 
		IDSEL 	=> IDSel, 
		TRDY 	=> TRdy, 
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
		StateOut	=> StateOut,
		Probe	=> SSIProbe,
		
		--	External signals to DB7 boards
		SCLK 	=>	DB7_SSClock,
		SDI 		=>	SSDIn,
		SDO 	=>	DB7_SSDO,
		SADR 	=>	SSAddr,
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
		USBRead	=>	USBRead,
		USBWrite	=> 	USBWrite,
		
		--	Internal interface
		TxData 		=> 	DataToHost,
		TxDone	 	=> 	HostTxDone,
		SendByte 	=> 	WriteToHost,
		
		RxData 		=> 	DataFromHost,
		RxValid 		=> 	HostRxValid,
		GetByte 		=> 	ReadFromHost,
		
		ReadCount	=>	HostReadCount,
		WriteCount	=>	HostWriteCount
		
		
	);
	
--	================================	Diagnostics	================================

	
	--LEDOut	<= x86_Test or FaultBlink;
	LED		<= not LEDOut;	--DataToHost(0);--(YellowLED or PulseReg(15) or Show);
--	LED		<= not x86_Hold;	--DataToHost(0);--(YellowLED or PulseReg(15) or Show);
	Probe 	<= x86_Hold;	--DataFromHost(0);
		Show	<= SSIProbe;

	--	========================	DB7 SSI interface	=========================================
	
	SSDOut	<= DB7_SSDO;
	SSClock	<= DB7_SSClock;
--	DB7_Dout<= x86_Din(15 downto 0);
--	DB7_Address	<= x86_Din(7 downto 0);
	DB7_Strobe <= x86_to_DB7;
	

	--	========================	Front panel LED display	=====================================
	
	DClock 	<= (not PCI_Clock and LEDShift) or (not LEDShift and Yellow);
	DData 	<= LEDRegister(to_integer(unsigned(LEDIndex))) when LEDShift='1' else 'Z';
	
	
	
	
	--ADOut <= Dout when BusOutEnable = '1' else (others=>'Z');
			
			
	
	x86Transfer : process(PCI_Clock, PCI_Reset, x86_Write, x86_Read, x86_IOAddress)
	begin
		if PCI_Reset = '0' then
			x86_Hold 		<= '0';
			x86_to_DB7		<= '0';
			DB7_Address		<= x"A5";
			ReadFromHost	<= '0';
			x86_Active		<= '0';
			WriteToHost		<= '0';
			x86_Dlast		<=  BaseAddress;
--			Switcher			<= '0';
		else
			if rising_edge(PCI_Clock) then
			
				--	===============		PCI component requests Read ie requires data to be returned to x86	================
--				if Show='1'  then
--					LEDOut<='1';
--				end if;
				if x86_Read = '1' then
				
					x86_Active <= '1';
					
					case x86_IOAddress is
					
						when x"0" =>	--	Read status (byte read) or SSI data from previous write (word read)
						
							case CBE is
							
								when "1110" =>	--	byte read
									x86_Hold <= '0';
									x86_Dout(7 downto 0)	<= StateOut & "00" & x86_Hold & DB7_Ready;
									
								when "1100" =>	--	word read
									if DB7_Ready = '1' then
									
										x86_Hold <= '0';
										x86_Dout 	<= DData &"0" & DB7_Din;
									else
										x86_Hold <= '1';
									end if;
									
								when "0000" =>	--	dword read
										x86_Dout 	<=  x86_Dlast(17  downto 0);
										
								when others =>	--	dword read
								
							end case;
							
						when x"1" =>	--	Read from USB port
								x86_Hold <= '0';	-- USB component is buffered, and allows immediate read
								if CBE = "1101" then
									x86_Dout(15 downto 8) <= x"0" & DData &  DB7_Ready & HostTxDone &HostRxValid; -- read just the status in b0, b1
								else
									x86_Dout( 17 downto 8) <= HostTxDone & HostRxValid & DataFromHost;	-- Supply 18 bit word, bit 8 shows validity of USB input; b17 is STOP button status.
									if x86_Active='0' then
										ReadFromHost	<= '1';	-- provide Read pulse to USB component
									end if;
								end if;
						when x"4" =>	-- read USB transaction counts
								x86_Dout 	<= "00" & HostWriteCount & HostReadCount;
						when x"5" =>	-- Read STOP and status
								x86_Hold <= '0';
								x86_Dout 	<= DData & "0" & x"000" & DB7_Ready & "0" & HostTxDone & HostRxValid;
											
						when others =>
						
					end case;
					
				elsif x86_Write = '1' then
				
					x86_Active	<= '1';
					x86_Dlast	<= x86_Din;
					
					case x86_IOAddress is
					
						when x"0" =>

										Yellow <= '1';	-- show activity
										x86_Hold <= '0';
										--WriteToHost <= '1';
										--DataToHost	<=  x"3"&CBE;	-- diagnostic
										
										case CBE is
										
											when "1110"  =>	-- low byte write specifies SPI address/board
											
												if DB7_Ready = '1' then
													DB7_Address	<= x86_Din(7 downto 0);
													x86_to_DB7 	<= '1';
												else
													x86_Hold <= '1';	--	Has not finished sending last packet
												end if;
											when others =>						-- otherwise write data (at least 16 bits 
											
												DB7_Dout 	<= x86_Din(15 downto 0);
												x86_to_DB7 	<= '1';
										end case;
										
						when x"1" =>	--	Write to USB port
										WriteToHost <= '1';
										DataToHost	<=  x86_Din(15 downto 8);
						
								
						when x"5" =>		LEDRegister	<= x86_Din( 15 downto 0);
										LEDIndex	<= x"F";
										LEDShift		<= '1';
										Yellow 		<= '1';

						when others =>
						
					end case;
				else
					x86_Active	<= '0';
				end if;
				
				if ReadFromHost = '1' then
					ReadFromHost <= '0';
				end if;
				if HostTxDone = '1' and WriteToHost = '1' then
					WriteToHost	<= '0';
				end if;
				
				if x86_to_DB7 = '1' then
					x86_to_DB7 <= '0';
				end if;
				
				if LEDShift = '1' then
					LEDIndex <= std_logic_vector(unsigned(LEDIndex) - 1);
					if LEDIndex = x"0" then
						LEDShift <= '0';
					end if;
				end if;
				
			end if;
		end if;
	end process x86Transfer;
	
	Blink : process(PCI_Clock, PCI_Reset, Show, Scaler)
	begin
		if PCI_Reset = '0' then
			Scaler 	<= x"0000";
			LEDOut 	<= '0';
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
				
			end if;
		end if;
	end process Blink;
	
	

	
end behave;

