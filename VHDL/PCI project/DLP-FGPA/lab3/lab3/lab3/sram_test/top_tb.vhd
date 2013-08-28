--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1.03i
--  \   \         Application : ISE
--  /   /         Filename : top_tb.vhw
-- /___/   /\     Timestamp : Wed Jun 27 00:10:00 2007
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: top_tb
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY top_tb IS
END top_tb;

ARCHITECTURE testbench_arch OF top_tb IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT top
        PORT (
            clk_in : In std_logic;
            rst_in : In std_logic;
            a : Out std_logic_vector (16 DownTo 0);
            d : InOut std_logic_vector (7 DownTo 0);
            oe_n : Out std_logic;
            we_n : Out std_logic;
            heartbeat_led : Out std_logic
        );
    END COMPONENT;

	COMPONENT cy62128dv30l_70
	PORT(
		CE1_b : IN std_logic;
		CE2 : IN std_logic;
		WE_b : IN std_logic;
		OE_n : IN std_logic;
		A : IN std_logic_vector(16 downto 0);       
		IO : INOUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

    SIGNAL clk_in : std_logic := '0';
    SIGNAL rst_in : std_logic := '0';
    SIGNAL a : std_logic_vector (16 DownTo 0) := "00000000000000000";
    SIGNAL d : std_logic_vector (7 DownTo 0) := "ZZZZZZZZ";
    SIGNAL oe_n : std_logic := '0';
    SIGNAL we_n : std_logic := '0';
    SIGNAL heartbeat_led : std_logic := '0';

    constant PERIOD : time := 166 ns;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : top
        PORT MAP (
            clk_in => clk_in,
            rst_in => rst_in,
            a => a,
            d => d,
            oe_n => oe_n,
            we_n => we_n,
            heartbeat_led => heartbeat_led
        );

	Inst_cy62128dv30l_70: cy62128dv30l_70 PORT MAP(
				CE1_b =>'0', -- active low enable
				CE2 => '0',  -- active high enable
				WE_b => we_n, 
				OE_n => oe_n,
				A => a,
				IO => d
	);


        PROCESS    -- clock process for clk_in
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk_in <= '0';
                WAIT FOR PERIOD/2;
                clk_in <= '1';
                WAIT FOR PERIOD/2;
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  666ns
                WAIT FOR 666 ns;
                rst_in <= '1';
                -- -------------------------------------
                WAIT FOR 500 ns;

            END PROCESS;

    END testbench_arch;

