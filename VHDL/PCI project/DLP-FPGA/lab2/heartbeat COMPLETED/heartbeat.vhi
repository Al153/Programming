
-- VHDL Instantiation Created from source file heartbeat.vhd -- 14:22:10 06/15/2007
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT heartbeat
	PORT(
		clk_in : IN std_logic;
		rst_in : IN std_logic;          
		heartbeat_led : OUT std_logic
		);
	END COMPONENT;

	Inst_heartbeat: heartbeat PORT MAP(
		clk_in => ,
		rst_in => ,
		heartbeat_led => 
	);


