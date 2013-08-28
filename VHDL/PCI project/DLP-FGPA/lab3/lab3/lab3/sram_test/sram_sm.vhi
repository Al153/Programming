
-- VHDL Instantiation Created from source file sram_sm.vhd -- 00:24:05 06/25/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_sram_sm: sram_sm PORT MAP(
		sm_clk_in => ,
		fpga_clk_in => ,
		rst_in => ,
		a => ,
		din => ,
		dout => ,
		dir => ,
		oe_n => ,
		we_n => ,
		errors => ,
		test_failed => 
	);


