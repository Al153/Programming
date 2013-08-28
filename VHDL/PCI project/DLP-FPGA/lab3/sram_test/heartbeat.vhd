----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:51 06/15/2007 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity heartbeat is
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
           heartbeat_led : out  STD_LOGIC);
end heartbeat;

architecture Behavioral of heartbeat is

	signal count : std_logic_vector(17 downto 0);

begin

	process (clk_in, rst_in) 
	begin
		if rst_in='1' then 
			count <= (others => '0');
		elsif clk_in='1' and clk_in'event then
			count <= count + 1;
		end if;
	end process;
	
	heartbeat_led <= count(17);

end Behavioral;
