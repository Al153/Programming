----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:33 02/03/2009 
-- Design Name: 
-- Module Name:    SSI - Behavioral 
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
use ieee.numeric_std.all;
--
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSI is

    Port
	 (
	 
		Clock	: in std_logic;
		Reset	: in std_logic;
		
		
		--	Internal signals (parallel data and address)
		
		Address	: in  	std_logic_vector (7 downto 0);
		D		: in	std_logic_vector (15 downto 0);
		Q		: out	std_logic_vector (15 downto 0);
		Strobe	: in  	std_logic;
		Ready 	: out	std_logic;
		NoResponse	: out STD_LOGIC;
		--	Diagnostics
		StateOut	: out std_logic_vector (3 downto 0);
		Probe	: out std_logic;



		--	External signals to DB7 boards
		
		SCLK 	: out std_logic;
		SDI 		: in  	std_logic;
		SDO 	: out std_logic;
		SADR 	: out std_logic;
		SSTB 	: out std_logic;
		SACK 	: in  	std_logic
		
	);
	
end SSI;

architecture Behavioral of SSI is

type		ShiftState	is (ssIDLE, ssASETUP, ssADR, ssASTBSETUP, ssASTB, ssENDASTB, ssDSETUP, ssDATA, ssDSTBSETUP, ssDSTB);
signal	State		: ShiftState;
signal	AddressPhase	: std_logic;
signal	ShiftCount	: std_logic_vector(3 downto 0);
signal	Shifting		: std_logic;
signal	StrobeOut	: std_logic;
signal	SClock		: std_logic_vector(1 downto 0);
signal	Accumulator	: std_logic_vector( 15 downto 0 );
signal	Diagnose		: std_logic;
signal	DataOut		: std_logic;
signal	DiagData		: std_logic;
signal	DelayTimer	: std_logic_vector(7 downto 0);
signal	AckSync	: std_logic;

begin

		Q		<=  Accumulator;
		SADR	<= AddressPhase;
		SCLK	<= SClock(1);
		SSTB	<= StrobeOut;
		SDO	<= DataOut when Diagnose = '0' else DiagData;
		StateOut	<= std_logic_vector(to_unsigned(ShiftState'pos(State), StateOut'length));

--		ledsel <= std_logic_vector(opmode_t'pos(opmode_v ), ledsel'length));		
		DataOut	<= Address(to_integer(unsigned(ShiftCount(2 downto 0)))) when AddressPhase='1' else D(to_integer(unsigned(ShiftCount))) ;
		
		Probe		<= Accumulator(5);
		Run : process( Clock, Reset, Strobe)
		begin

			if Reset = '0' then
				State	<= ssIDLE;
				Shifting	<= '0';
				StrobeOut<= '0';
				Ready		<= '1';
				AddressPhase<= '0';
				SClock	<= "00";
				DiagData	<= '0';
				Diagnose	<= '0';
				ShiftCount <= x"0";
				NoResponse <= '0';
			else
				
				if rising_edge(Clock) then
				
					AckSync <= SACK;
					if Shifting = '1' then
						SClock <= SClock + 1;
					end if;
					
					--Probe	<= Strobe;
					
					case State is
						
						when ssIDLE	=>

										if Strobe='1' then
											if Address(7) = '0' then	-- normal behaviour is to start FSM
												Diagnose		<= '0';
												AddressPhase <= '1';
												StrobeOut	<= '0';
												Ready		<= '0';
												State 		<= ssASETUP;
											else					-- MSB set indicates diagnostic mode, 4 o/p bits set to 4 LSBs of Address
												Diagnose		<= '1';
												SClock(1)		<= Address(0);
												AddressPhase	<= Address(1);
												StrobeOut	<= Address(2);
												DiagData		<= Address(3);
											end if;
										end if;
										
						when ssASETUP =>
						
												State 		<= ssADR;
												ShiftCount	<= x"7";
												Shifting		<= '1';
						
						when ssADR	=>
									
									if SClock = "11" then
										if Shifting	= '1' then
											ShiftCount 	<= ShiftCount-1;
											if ShiftCount = 0 then
												Shifting	<= '0';
												State		<= ssASTBSETUP;
												DelayTimer	<= x"01";
											end if;
										end if;
									end if;

						when ssASTBSETUP	=>
										DelayTimer <= DelayTimer - 1;
										if DelayTimer = x"0" then
												ShiftCount	<= x"F";
												StrobeOut	<= '1';
												State		<=ssASTB;
												DelayTimer	<= x"40";
										end if;

						when ssASTB	=>
										DelayTimer <= DelayTimer - 1;
										if DelayTimer = x"0" then		-- Fault : no response
											Accumulator <= x"0000";
											NoResponse <= '1';
											StrobeOut<= '0';
											State	<= ssIDLE;
											Ready	<= '1';
										end if;
						
										if AckSync='0' and DelayTimer < x"3F" then
											NoResponse	<= '0';
											StrobeOut	<= '0';
											State		<= ssENDASTB;
											DelayTimer	<= x"40";
										end if;
										
						when ssENDASTB =>							-- Wait until timeout or response to release STB
										DelayTimer <= DelayTimer - 1;
										if DelayTimer = x"0" then		-- Fault : no response
											Accumulator <= x"0000";
											NoResponse <= '1';
											StrobeOut<= '0';
											State	<= ssIDLE;
											Ready	<= '1';
										end if;
						
										if AckSync='1' and DelayTimer < x"3F" then
											NoResponse	<= '0';
											AddressPhase <=  '0';
											State		<= ssDSETUP;
											DelayTimer	<= x"01";	-- Delay before changing to Data phase
										end if;
						
						when ssDSETUP =>
--										DelayTimer <= DelayTimer - 1;
--										if DelayTimer = x"0" then
											State	<= ssDATA;
											Shifting		<= '1';
--										end if;
						
						
						when ssDATA	=>
					

										if SClock = "11" then
											if ShiftCount=0 then
												Shifting	<= '0';
												State		<=ssDSTBSETUP;
												DelayTimer	<= x"01";
											else
												ShiftCount 	<= ShiftCount-1;
											end if;
										end if;
										
										if SClock = "01" then	-- just about to go high ie +ve edge
												Accumulator <= Accumulator( 14 downto 0) & SDI;
										end if;

										
						when ssDSTBSETUP	=>
					
										DelayTimer <= DelayTimer - 1;
										if DelayTimer = x"0" then
											StrobeOut	<= '1';
											State		<=ssDSTB;
											DelayTimer	<= x"40";
										end if;
										
						when ssDSTB	=>
										DelayTimer <= DelayTimer - 1;
										if DelayTimer = x"0" or (AckSync='0'  and DelayTimer < x"3F" ) then
											StrobeOut<= '0';
											State	<= ssIDLE;
											Ready	<= '1';
											--Probe	<= '0';
										end if;
						when others =>
										Shifting 	<= '0';
										StrobeOut<= '0';
										State	<= ssIDLE;
					end case;
						
					--end if;	-- SClock = 1
					
				end if;	-- clock edge
				
			end if;		
			
	end process;
	
end Behavioral;

