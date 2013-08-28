
-- VHDL Instantiation Created from source file Bit_diagnostic.vhd -- 13:28:08 08/14/2013
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Bit_diagnostic
	PORT(
		Clock : IN std_logic;
		Reset : IN std_logic;
		Control : IN std_logic;
		Bit_in : IN std_logic;          
		Bit_out : OUT std_logic
		);
	END COMPONENT;

	Inst_Bit_diagnostic: Bit_diagnostic PORT MAP(
		Clock => ,
		Reset => ,
		Control => ,
		Bit_in => ,
		Bit_out => 
	);


