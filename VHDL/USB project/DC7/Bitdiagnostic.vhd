----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:05 08/14/2013 
-- Design Name: 
-- Module Name:    Bitdiagnostic - Behavioral 
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

entity Bitdiagnostic is
    Port ( Reset : in  STD_LOGIC;
           Clock in : in  STD_LOGIC;
           Bit input : in  STD_LOGIC;
           Bit output : out  STD_LOGIC);
end Bitdiagnostic;

architecture Behavioral of Bitdiagnostic is

begin


end Behavioral;

