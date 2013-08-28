
-- VHDL Instantiation Created from source file heartbeat.vhd -- 16:53:04 12/15/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT heartbeat
	PORT(
		rst_in : IN std_logic;
		clk_in : IN std_logic;          
		heartbeat_led : OUT std_logic
		);
	END COMPONENT;

	Inst_heartbeat: heartbeat PORT MAP(
		rst_in => ,
		clk_in => ,
		heartbeat_led => 
	);


