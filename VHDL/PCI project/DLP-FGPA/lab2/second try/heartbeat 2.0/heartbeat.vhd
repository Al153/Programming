----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:23 12/15/2012 
-- Design Name: 
-- Module Name:    heartbeat - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.STD_LOGIC_ARITH.ALL;


entity heartbeat is
    Port ( rst_in : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           heartbeat_led : out  STD_LOGIC);
end heartbeat;

architecture Behavioral of heartbeat is
	signal count : std_logic_vector(17 downto 0);
	signal count_two : std_logic_vector(17 downto 0);
begin

process (clk_in, rst_in)
begin
   if rst_in ='1' then 
      count <= (others => '0');
   elsif clk_in ='1' and clk_in 'event then
	count <= count + 1;
   end if;
end process;

process (count(17))
begin
heartbeat_led <= count (17);
end process;

end Behavioral;

