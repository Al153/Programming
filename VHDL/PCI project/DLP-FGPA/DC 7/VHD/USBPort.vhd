----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:47 06/24/2008 
-- Design Name: 
-- Module Name:    USBPort - Behavioral 
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

entity USBPort is
    Port ( 
		Clock		: in  STD_LOGIC;
		Reset		: in  STD_LOGIC;

		--	USB FTDI FIFO interface
		USBRxValid	: in	STD_LOGIC;
		USBTxReady	: in	STD_LOGIC;
		USBData 	: inout	std_logic_vector(7 downto 0);
		USBRead 	: out		STD_LOGIC;
		USBWrite 	: out		STD_LOGIC;

		-- internal interface
		TxData		: in  STD_LOGIC_VECTOR(7 downto 0);
		TxDone 		: out STD_LOGIC;
		SendByte	: in	std_logic;

		RxData 		: out	std_logic_vector(7 downto 0);
		RxValid 		: out STD_LOGIC;
		GetByte 		: in	std_logic
	);
end USBPort;

architecture Behavioral of USBPort is
	type		USBReadState is (IDLE, IssueRD, GetExternalData, DeadTime);
	signal	GettingByte 	: USBReadState;
	signal	RxBufferFull	: std_logic;
	signal	DeadDelay	: std_logic_vector(1 downto 0);

	type		USBWriteState is (IDLE, EstablishData, IssueWR, ReleaseData);
	signal	PuttingByte 	: USBWriteState;

	signal	USBDir		: std_logic;
 begin

	USBData <= TxData when USBDir = '0' else (others=>'Z');
	RxValid	<= RxBufferFull;
	
	Run : Process( Clock, Reset, GetByte, DeadDelay )
	 begin
	 
		if Reset = '0' then
			
			USBRead	<= '1';
			USBWrite	<= '1';
			USBDir		<= '1';	-- set default i/o direction = READ ('1');
			
			RxBufferFull	<= '0';	-- no data received/stored yet
			TxDone		<= '0';
			RxData		<=	(others=>'1');
			
			PuttingByte	<= IDLE;
			GettingByte	<= IDLE;
			DeadDelay	<= "00";
			
		elsif rising_edge(Clock) then
				
			if GetByte = '1' then
				RxBufferFull	<= '0';
			end if;
			
			if SendByte = '0' then
				TxDone	<= '0';
			end if;
				
			--	Writing data to USB, subordinate to reading
				
			case PuttingByte is
				
				when IDLE =>
				
				-- Reading data from USB to internal
				case GettingByte is
				
					when IDLE =>
						if USBRxValid = '0' and RxBufferFull = '0' then
							USBRead	<= '0';
							USBDir		<= '1';
							GettingByte 	<= IssueRD;
						else
							if SendByte = '1' and USBTxReady = '0' then
								USBDir	<= '0';
								PuttingByte <= EstablishData;
							else
								USBWrite <= '1';
							end if;
						end if;
					
					when IssueRD =>	-- data should now be valid
						RxData	<= USBData;
						RxBufferFull	<= '1';
						GettingByte <= GetExternalData;
					when GetExternalData =>
						USBRead	<= '1';
						GettingByte <= DeadTime;
						DeadDelay <= "00";
					when DeadTime =>
						if DeadDelay="11" then
							GettingByte <= IDLE;
						else
							DeadDelay <= DeadDelay +1;
						end if;
						
					when others =>
				end case;
				
				when EstablishData =>
					USBWrite <= '0';
					PuttingByte <= IssueWR;
				when IssueWR =>
					USBDir <= '1';
					PuttingByte <= ReleaseData;
					TxDone <= '1';
				when ReleaseData =>
					USBWrite	<= '1';
					PuttingByte <= IDLE;
				
				when others =>
							
				
			end case;
				
		end if;	-- endif(rising_edge)
			
			
			
	end Process Run;
	
end Behavioral;

