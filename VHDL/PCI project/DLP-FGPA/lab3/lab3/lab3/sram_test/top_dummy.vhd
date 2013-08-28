----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:07:59 06/15/2007 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_dummy is
    Port ( clk_in : in  STD_LOGIC;
           rst_in : in  STD_LOGIC;
			  a : out  STD_LOGIC_VECTOR (16 downto 0);
           d : inout  STD_LOGIC_VECTOR (7 downto 0);
           oe_n : out  STD_LOGIC;
           we_n : out  STD_LOGIC;
           heartbeat_led : out  STD_LOGIC);
end top_dummy;

architecture Behavioral of top_dummy is

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
		clk_in : IN std_logic;
		rst_in : IN std_logic;          
		heartbeat_led : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT mid_dcm
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT sram_sm
	PORT(
		sm_clk_in : IN std_logic;
		fpga_clk_in : IN std_logic;
		rst_in : IN std_logic;
		din : IN std_logic_vector(7 downto 0);          
		a : OUT std_logic_vector(16 downto 0);
		dout : OUT std_logic_vector(7 downto 0);
		dir : OUT std_logic;
		oe_n : OUT std_logic;
		we_n : OUT std_logic;
		errors : OUT std_logic_vector(16 downto 0);
		test_failed : OUT std_logic
		);
	END COMPONENT;
	
signal reset_dcm,reset_locked,low_dcm_locked : std_logic;
signal clock_6m,clock_375K,no_connect : std_logic;
signal clkin_ibufg,clock_25m,mid_dcm_locked : std_logic;
signal din, dout :std_logic_vector(7 downto 0);
signal dir,test_failed,heartbeat_strobe :std_logic;
signal errors :std_logic_vector(16 downto 0);

begin

-- active high reset signal for DCMs
reset_dcm <= '1' when (rst_in = '0') else '0';

-- active high reset signal for blocks driven by low_dcm
reset_locked <= '0' when (low_dcm_locked = '1' and
                          mid_dcm_locked = '1') else '1'; 
								  
	Inst_low_dcm: low_dcm PORT MAP(
		CLKIN_IN => clk_in,
		RST_IN => reset_dcm,
		CLKDV_OUT => clock_375k,
		CLKIN_IBUFG_OUT => clkin_ibufg,
		CLK0_OUT => clock_6m,
		LOCKED_OUT => low_dcm_locked
	);
	
	Inst_heartbeat: heartbeat PORT MAP(
		clk_in => clock_375k,
		rst_in => reset_locked,
		heartbeat_led => heartbeat_strobe 
	);

	Inst_mid_dcm: mid_dcm PORT MAP(
		CLKIN_IN => clkin_ibufg,
		RST_IN => reset_dcm,
		CLKFX_OUT => clock_25m,
		CLK0_OUT => no_connect,
		LOCKED_OUT => mid_dcm_locked
	);
	
	Inst_sram_sm: sram_sm PORT MAP(
		sm_clk_in => clock_25m,
		fpga_clk_in => clkin_ibufg,
		rst_in => reset_locked,
		a => a,
		din => din,
		dout => dout,
		dir => dir,
		oe_n => oe_n,
		we_n => we_n,
		errors => errors,
		test_failed => test_failed
	);

	   -- data bus IO tristate logic
   inst_IOBUF0 : IOBUF
   generic map (
      DRIVE => 12,
      IBUF_DELAY_VALUE => "0", -- Specify the amount of added input delay for buffer, "0"-"16" (Spartan-3E only)
      IFD_DELAY_VALUE => "AUTO", -- Specify the amount of added delay for input register, "AUTO", "0"-"8" (Spartan-3E only)
      IOSTANDARD => "LVCMOS33",
      SLEW => "FAST")
   port map (
      O => din(0),   -- Buffer output
      IO => d(0),    -- Buffer inout port (connect directly to top-level port)
      I => dout(0),  -- Buffer input
      T => dir       -- 3-state enable input 
   );

end Behavioral;
	
