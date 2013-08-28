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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSI is

    Port
	 (
	 
		Clock		: in std_logic;
		Reset		: in std_logic;
		
		
		--	Internal signals (parallel data and address)
		
		Address	: in  	STD_LOGIC_VECTOR (7 downto 0);
		D		 	: in		STD_LOGIC_VECTOR (15 downto 0);
		Q			: out		STD_LOGIC_VECTOR (15 downto 0);
		Strobe	: in  	STD_LOGIC;
		Ready 	: out  	STD_LOGIC;



		--	External signals to DB7 boards
		
		SCLK 		: out  	STD_LOGIC;
		SDI 			: in  	STD_LOGIC;
		SDO 		: out  	STD_LOGIC;
		SADR 		: out  	STD_LOGIC;
		SSTB 		: out  	STD_LOGIC;
		SACK 		: in  	STD_LOGIC
		
	);
	
end SSI;

architecture Behavioral of SSI is

signal	ShiftA		: std_logic_vector(7 downto 0);
signal	ShiftD		: std_logic_vector(15 downto 0);
signal	State			: std_logic_vector(4 downto 0);
signal	Shifting		: std_logic;
signal	StrobeOut	: std_logic;

begin

		Q		<= ShiftD;
		SADR	<= '1' when State<9 else '0';
		SCLK	<= Shifting and not Clock;
		SSTB	<= StrobeOut;
		
		Run : process( Clock, Reset, Strobe)
		begin

			if Reset = '0' then
				ShiftA	<= (others=>'0');
				ShiftD	<= (others=>'0');
				State		<= (others=>'0');
				SDO		<= '0';
				Shifting	<= '0';
				StrobeOut<= '0';
				Ready		<= '1';
				--AddressPhase<= '0';
			else
			
				if rising_edge(Clock) then
				
					if (State = 0) then

						if Strobe='1' then
							ShiftA 	<= Address;
							ShiftD	<= D;
							Shifting <= '1';
							SDO		<= Address(7);
							State 	<= State+1;
							StrobeOut<= '0';
							Ready		<= '0';
						end if;
						
					elsif State < 8 then
					
						State 	<= State+1;
						ShiftA		<= ShiftA(6 downto 0) & ShiftA(7);	-- shift left
						SDO			<= ShiftA(6);
						
					elsif State = 8 then
						
						Shifting <= '0';
						StrobeOut<= '1';
						
						if StrobeOut = '1' and SACK='0' then
							StrobeOut<= '0';
							State		<= State + 1;
							SDO		<= ShiftD(15);
							Shifting	<= '1';
						end if;
						
					elsif State <24 then
					
						State 	<= State+1;
						ShiftD	<= ShiftD(14 downto 0) & SDI;	-- shift left
						SDO		<= ShiftD(14);
						
					else
					
						Shifting <= '0';
						StrobeOut<= '1';
						
						if StrobeOut = '1' and SACK='0' then
							StrobeOut<= '0';
							State <= (others=>'0');
							Ready		<= '1';
						end if;
						
					end if;
					
				end if;
				
			end if;		
			
	end process;
	
end Behavioral;

