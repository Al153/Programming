----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:43 12/15/2012 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.numeric_std.all;


library UNISIM;
use UNISIM.VComponents.all;

entity top is
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
           heartbeat_led : out  STD_LOGIC);
end top;

architecture Behavioral of top is

	COMPONENT low_dcm
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT heartbeat
	PORT(
		rst_in : IN std_logic;
		clk_in : IN std_logic;          
		heartbeat_led : OUT std_logic
		);
	END COMPONENT;
	
signal reset_dcm, reset_locked, low_dcm_locked : std_logic;
signal clock_6m, clock_375k, no_connect : std_logic;


begin

-- active high reset signal for DCMs
reset_dcm <= '1' when (rst_in = '0')else '0';

-- active high reset signal for blocks driven by low_dcm
reset_locked <= '0' when low_dcm_locked = '1' else'1';

Inst_low_dcm: low_dcm PORT MAP(
		CLKIN_IN => clk_in,
		RST_IN => reset_dcm,
		CLKDV_OUT => clock_375k,
		CLKIN_IBUFG_OUT => no_connect,
		CLK0_OUT => clock_6m,
		LOCKED_OUT => low_dcm_locked
	);
	
Inst_heartbeat: heartbeat PORT MAP(
		rst_in => clock_375k,
		clk_in => reset_locked,
		heartbeat_led => heartbeat_led
	);




end Behavioral;

