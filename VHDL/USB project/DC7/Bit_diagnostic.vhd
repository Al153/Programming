----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:49 08/14/2013 
-- Design Name: 
-- Module Name:    Bit_diagnostic - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bit_diagnostic is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Control : in STD_LOGIC;
           Bit_in : in  STD_LOGIC;
           Bit_out : out  STD_LOGIC);
end Bit_diagnostic;

architecture Behavioral of Bit_diagnostic is
	signal  ShiftReg : std_logic_vector(255 downto 0); 
	
begin
	operate : process (Clock, Reset, Control)
	begin
		if Reset = '0' then
			for i in 0 to 255 loop
				ShiftReg(i) <= '0';
			end loop;
		else
			if rising_edge(Clock) then 
				if Control = '0' then -- input
					ShiftReg(255 downto 1) <= ShiftReg(254 downto 0);
					ShiftReg(0) <= Bit_in;
				else
					Bit_out <= ShiftReg(255); --output
					ShiftReg(255 downto 1) <= ShiftReg(254 downto 0);
				end if;
			end if;
		end if;
	end process operate;
end Behavioral;

