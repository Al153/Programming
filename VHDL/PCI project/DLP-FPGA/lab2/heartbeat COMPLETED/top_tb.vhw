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
-- /___/   /\     Timestamp : Wed Jun 20 17:18:13 2007
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
            heartbeat_led : Out std_logic
        );
    END COMPONENT;

    SIGNAL clk_in : std_logic := '0';
    SIGNAL rst_in : std_logic := '0';
    SIGNAL heartbeat_led : std_logic := '0';

    constant PERIOD : time := 166 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : top
        PORT MAP (
            clk_in => clk_in,
            rst_in => rst_in,
            heartbeat_led => heartbeat_led
        );

        PROCESS    -- clock process for clk_in
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk_in <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk_in <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
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

