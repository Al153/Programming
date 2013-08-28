----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:11:40 08/14/2013 
-- Design Name: 
-- Module Name:    bit_diagnostic_2 - Behavioral 
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

entity bit_diagnostic_2 is
    Port ( PCI_clock : in  STD_LOGIC;
           Data_line : in  STD_LOGIC;
           IO_control : in  STD_LOGIC;
           Byte_out : out  STD_LOGIC);
end bit_diagnostic_2;

architecture Behavioral of bit_diagnostic_2 is

begin


end Behavioral;

