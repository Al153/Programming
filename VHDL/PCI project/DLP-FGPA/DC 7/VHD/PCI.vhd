----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:48 02/06/2009 
-- Design Name: 
-- Module Name:    PCI - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCI is

    Port (
		--			Physical Bus connections
		CLK	 	: in  std_logic;
		RST 	: in  std_logic;
		FRAME 	: in  std_logic;
		IRDY 	: in  std_logic;
		IDSEL 	: in  std_logic;
		TRDY 	: out std_logic;
		DEVSEL 	: out std_logic;
		AD 		: inout  std_logic_vector (17 downto 0);
		ADEx 	: in  std_logic_vector (1 downto 0);
		CBE 	: in  std_logic_vector (3 downto 0);
		
		--			Internal access signals
		D 		: in  std_logic_vector (17 downto 0);	--	data to be supplied to the PCI bus
		Q 		: out std_logic_vector (19 downto 0);	--	data read from the PCI bus
		Alow 	: out std_logic_vector (3 downto 0);	--	least significant four bits to access function
		ReadReq : out std_logic;--_vector (1 downto 0);
		WriteReq	: out std_logic;--_vector (1 downto 0);
		Hold 	: in  std_logic;
		Active	: out std_logic
	 );

end PCI;

architecture Behavioral of PCI is

type	PCI_State is (stIDLE, stREAD, stWRITE, stDATA_TO_BUS, stFINISH);

	signal Dout 			: std_logic_vector( 17 downto 0 );
	signal DoutEx 			: std_logic_vector( 1 downto 0 );
	signal AddressLatch	: std_logic_vector(3 downto 0);
	signal State			: PCI_State;
	
	signal FSMActive		: std_logic;
	signal BusOutEnable	: std_logic;
	signal TReady			: std_logic;
	signal Selected 		: std_logic;
	
	signal ConfigRead		: std_logic;
	signal IOWrite			: std_logic;
	signal IORead			: std_logic;


--	signal Configured		: std_logic;
	
begin



	--	Combinational logic section to generate <Selected>, <BusOutEnable>


	DEVSEL <= not Selected when FSMActive = '1' else 'Z';
	TRDY <= Hold or not TReady when FSMActive = '1' else 'Z'; --and LS(2)='0'
	AD <= Dout when BusOutEnable = '1' else (others=>'Z');

	-- Map the internal signals to the output cells

	Dout	<= D when ConfigRead = '0' else "00" & x"D10E";
	
	Q		<= ADEx & AD;
	Alow	<= AddressLatch(3 downto 0);
	Active	<= FSMActive;

	ReadReq <= IORead and not IRDY;
	WriteReq <= IOWrite and not IRDY;
	
--	================================	Diagnostics	================================



	Run : process(CLK, RST, FRAME, IRDY, IDSEL, AD, ADEx, CBE)
	begin

		if  RST = '0' then
		
			BusOutEnable	<= '0';
			Selected			<= '0';
			TReady			<= '0';
			AddressLatch		<= x"F";--x"FFFFF";
			State			<= stIDLE;
			IORead			<= '0';
			IOWrite			<= '0';
			ConfigRead		<= '0';
			FSMActive		<= '0';
			
		elsif  rising_edge(CLK)  then
		
			case State is
			
				when stIDLE =>
				
					if Frame='0' then	-- start of PCI transaction
						
						AddressLatch <= AD(3 downto 0);-- ADEx & AD;
						
						case CBE is
							when "0010" =>
								if IDSEL='0' and (ADEx = "00") and (AD(17 downto 3)="000000001100011") then
									IORead 	<= '1';
									Selected	<= '1';
									FSMActive<= '1';
									State 	<= stREAD;
								end if;
							when "0011" =>
								if IDSEL='0' and (ADEx = "00") and (AD(17 downto 3)="000000001100011") then
									IOWrite 	<= '1';
									Selected	<= '1';
									TReady 	<= '1';
									FSMActive<= '1';
									State 	<= stWRITE;
								end if;
							when "1010" =>
								if IDSEL = '1' then	-- ConfigRead
									ConfigRead 	<= '1';
									Selected		<= '1';
									FSMActive	<= '1';
									State 		<= stREAD;
								end if;
							when others =>
						end case;
						
					end if;

				when stREAD =>	-- must wait for IRDY to go low, signalling that host is ready to receive data
				
					if Hold = '0' then
						TReady <= '1';
						if IRDY='0' then
							BusOutEnable<= '1';
							State <= stDATA_TO_BUS;
						end if;
					end if;
				
				when stDATA_TO_BUS => -- supply data until IRDY goes high
					
					if IRDY='1' and FRAME = '1' then
						BusOutEnable<= '0';
						TReady <= '0';
						Selected <= '0';
						State <= stFINISH;
					end if;
					
				when stWRITE => -- must wait for IRDY to go low, signalling that host data is valid
					
					if IRDY='1' and FRAME = '1' then
						TReady <= '0';
						Selected <= '0';
						State <= stFINISH;
					end if;
					
				when stFINISH =>	-- Terminate the transaction by releasing TRDY and DEVSEL
				
						FSMActive 	<= '0';
						BusOutEnable	<= '0';
						IORead		<= '0';
						IOWrite		<= '0';
						ConfigRead	<= '0';
						TReady		<= '0';
						State 		<= stIDLE;

				when others =>
						BusOutEnable<= '0';
						TReady 		<= '0';
						Selected 	<= '0';
						IORead		<= '0';
						IOWrite		<= '0';
						ConfigRead	<= '0';
						State 		<= stIDLE;
				
			end case;
						

		end if;
		
	end process Run;


end Behavioral;

