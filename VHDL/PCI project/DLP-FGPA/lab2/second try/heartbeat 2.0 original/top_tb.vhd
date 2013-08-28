  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  
  library UNISIM;
  use UNISIM.VComponents.all;

  ENTITY top_tb IS
  END top_tb;

  ARCHITECTURE behavior OF top_tb IS 

  -- Component Declaration
          COMPONENT top
          Port(
					clk_in : in  STD_LOGIC;
					rst_in : in  STD_LOGIC;
					heartbeat_led : out  STD_LOGIC
					);
          END COMPONENT;

	SIGNAL clk_in :  std_logic := '0';
	SIGNAL rst_in :  std_logic := '0';
	signal heartbeat_led : std_logic;
	Constant clock_period : time := 0.166 us;

  BEGIN

  -- Component Instantiation
         uut: top PORT MAP(
                  clk_in => clk_in,
                  rst_in => rst_in,
		  heartbeat_led => heartbeat_led
          );
			clock_process :PROCESS
			BEGIN
				clk_in <= '0';
				wait for clock_period/2;
				clk_in <= '1' ;
				wait for clock_period/2;
			END PROCESS;

  --  Test Bench Statements
			tb : PROCESS
			BEGIN
			
				wait for clock_period;
				rst_in <= '0';
				wait for clock_period*5;
				rst_in <= '1';
--				wait for clock_period*16;
--				rst_in <= '0';
				wait;
			

         END PROCESS tb;
  --  End Test Bench 

  END;
