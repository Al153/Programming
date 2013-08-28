--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: top_timesim.vhd
-- /___/   /\     Timestamp: Mon Dec 17 11:44:49 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -filter "C:/Xilinx/Projects/DLP-FGPA/lab2/second try/heartbeat 2.0/iseconfig/filter.filter" -intstyle ise -s 4 -pcf top.pcf -rpw 100 -tpw 0 -ar Structure -tm top -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim top.ncd top_timesim.vhd 
-- Device	: 3s250etq144-4 (PRODUCTION 1.27 2012-04-23)
-- Input file	: top.ncd
-- Output file	: C:\Xilinx\Projects\DLP-FGPA\lab2\second try\heartbeat 2.0\netgen\par\top_timesim.vhd
-- # of Entities	: 3
-- Design Name	: top
-- Xilinx	: C:\Xilinx\14.1\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity low_dcm is
  port (
    RST_IN : in STD_LOGIC := 'X'; 
    CLKIN_IN : in STD_LOGIC := 'X'; 
    CLKIN_IBUFG_OUT : out STD_LOGIC; 
    CLK0_OUT : out STD_LOGIC; 
    LOCKED_OUT : out STD_LOGIC; 
    CLKDV_OUT : out STD_LOGIC 
  );
end low_dcm;

architecture Structure of low_dcm is
  signal NlwRenamedSig_OI_CLKIN_IBUFG_OUT : STD_LOGIC; 
  signal NlwRenamedSig_OI_CLK0_OUT : STD_LOGIC; 
  signal CLK0_BUF : STD_LOGIC; 
  signal CLKDV_BUF : STD_LOGIC; 
  signal clk_in_INBUF : STD_LOGIC; 
  signal Inst_low_dcm_CLK0_BUFG_INST_S_INVNOT : STD_LOGIC; 
  signal Inst_low_dcm_CLK0_BUFG_INST_I0_INV : STD_LOGIC; 
  signal Inst_low_dcm_CLKDV_BUFG_INST_S_INVNOT : STD_LOGIC; 
  signal Inst_low_dcm_CLKDV_BUFG_INST_I0_INV : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLK90 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLK180 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLK270 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLK2X : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLK2X180 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLKFX : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLKFX180 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS7 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS6 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS5 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS4 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS3 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS2 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS1 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_STATUS0 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_PSDONE : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_PSCLKINV_730 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLKFB_BUF_729 : STD_LOGIC; 
  signal Inst_low_dcm_DCM_SP_INST_CLKIN_BUF_728 : STD_LOGIC; 
  signal NlwBufferSignal_Inst_low_dcm_DCM_SP_INST_RST : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_DCM_SP_INST_DSSEN_UNCONNECTED : STD_LOGIC; 
begin
  CLKIN_IBUFG_OUT <= NlwRenamedSig_OI_CLKIN_IBUFG_OUT;
  CLK0_OUT <= NlwRenamedSig_OI_CLK0_OUT;
  CLKIN_IBUFG_INST : X_BUF
    generic map(
      LOC => "IPAD108",
      PATHPULSE => 638 ps
    )
    port map (
      I => CLKIN_IN,
      O => clk_in_INBUF
    );
  CLK0_BUFG_INST : X_BUFGMUX
    generic map(
      LOC => "BUFGMUX_X1Y0"
    )
    port map (
      I0 => Inst_low_dcm_CLK0_BUFG_INST_I0_INV,
      I1 => GND,
      S => Inst_low_dcm_CLK0_BUFG_INST_S_INVNOT,
      O => NlwRenamedSig_OI_CLK0_OUT
    );
  Inst_low_dcm_CLK0_BUFG_INST_SINV : X_INV
    generic map(
      LOC => "BUFGMUX_X1Y0",
      PATHPULSE => 638 ps
    )
    port map (
      I => '1',
      O => Inst_low_dcm_CLK0_BUFG_INST_S_INVNOT
    );
  Inst_low_dcm_CLK0_BUFG_INST_I0_USED : X_BUF
    generic map(
      LOC => "BUFGMUX_X1Y0",
      PATHPULSE => 638 ps
    )
    port map (
      I => CLK0_BUF,
      O => Inst_low_dcm_CLK0_BUFG_INST_I0_INV
    );
  CLKDV_BUFG_INST : X_BUFGMUX
    generic map(
      LOC => "BUFGMUX_X2Y1"
    )
    port map (
      I0 => Inst_low_dcm_CLKDV_BUFG_INST_I0_INV,
      I1 => GND,
      S => Inst_low_dcm_CLKDV_BUFG_INST_S_INVNOT,
      O => CLKDV_OUT
    );
  Inst_low_dcm_CLKDV_BUFG_INST_SINV : X_INV
    generic map(
      LOC => "BUFGMUX_X2Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => '1',
      O => Inst_low_dcm_CLKDV_BUFG_INST_S_INVNOT
    );
  Inst_low_dcm_CLKDV_BUFG_INST_I0_USED : X_BUF
    generic map(
      LOC => "BUFGMUX_X2Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => CLKDV_BUF,
      O => Inst_low_dcm_CLKDV_BUFG_INST_I0_INV
    );
  Inst_low_dcm_DCM_SP_INST_PSCLKINV : X_BUF
    generic map(
      LOC => "DCM_X1Y0",
      PATHPULSE => 638 ps
    )
    port map (
      I => '0',
      O => Inst_low_dcm_DCM_SP_INST_PSCLKINV_730
    );
  DCM_SP_INST : X_DCM_SP
    generic map(
      DUTY_CYCLE_CORRECTION => TRUE,
      FACTORY_JF => X"C080",
      CLKDV_DIVIDE => 16.000000,
      CLKFX_DIVIDE => 1,
      CLKFX_MULTIPLY => 4,
      CLKOUT_PHASE_SHIFT => "NONE",
      CLKIN_PERIOD => 166.667000,
      DESKEW_ADJUST => "7",
      DFS_FREQUENCY_MODE => "LOW",
      STARTUP_WAIT => FALSE,
      CLK_FEEDBACK => "1X",
      DLL_FREQUENCY_MODE => "LOW",
      CLKIN_DIVIDE_BY_2 => FALSE,
      PHASE_SHIFT => 0,
      LOC => "DCM_X1Y0"
    )
    port map (
      CLKIN => Inst_low_dcm_DCM_SP_INST_CLKIN_BUF_728,
      CLKFB => Inst_low_dcm_DCM_SP_INST_CLKFB_BUF_729,
      RST => NlwBufferSignal_Inst_low_dcm_DCM_SP_INST_RST,
      DSSEN => NLW_DCM_SP_INST_DSSEN_UNCONNECTED,
      PSINCDEC => '0',
      PSEN => '0',
      PSCLK => Inst_low_dcm_DCM_SP_INST_PSCLKINV_730,
      PSDONE => Inst_low_dcm_DCM_SP_INST_PSDONE,
      LOCKED => LOCKED_OUT,
      CLKFX180 => Inst_low_dcm_DCM_SP_INST_CLKFX180,
      CLKFX => Inst_low_dcm_DCM_SP_INST_CLKFX,
      CLKDV => CLKDV_BUF,
      CLK2X180 => Inst_low_dcm_DCM_SP_INST_CLK2X180,
      CLK2X => Inst_low_dcm_DCM_SP_INST_CLK2X,
      CLK270 => Inst_low_dcm_DCM_SP_INST_CLK270,
      CLK180 => Inst_low_dcm_DCM_SP_INST_CLK180,
      CLK90 => Inst_low_dcm_DCM_SP_INST_CLK90,
      CLK0 => CLK0_BUF,
      STATUS(7) => Inst_low_dcm_DCM_SP_INST_STATUS7,
      STATUS(6) => Inst_low_dcm_DCM_SP_INST_STATUS6,
      STATUS(5) => Inst_low_dcm_DCM_SP_INST_STATUS5,
      STATUS(4) => Inst_low_dcm_DCM_SP_INST_STATUS4,
      STATUS(3) => Inst_low_dcm_DCM_SP_INST_STATUS3,
      STATUS(2) => Inst_low_dcm_DCM_SP_INST_STATUS2,
      STATUS(1) => Inst_low_dcm_DCM_SP_INST_STATUS1,
      STATUS(0) => Inst_low_dcm_DCM_SP_INST_STATUS0
    );
  Inst_low_dcm_DCM_SP_INST_CLKFB_BUF : X_BUF
    generic map(
      LOC => "DCM_X1Y0",
      PATHPULSE => 638 ps
    )
    port map (
      I => NlwRenamedSig_OI_CLK0_OUT,
      O => Inst_low_dcm_DCM_SP_INST_CLKFB_BUF_729
    );
  Inst_low_dcm_DCM_SP_INST_CLKIN_BUF : X_BUF
    generic map(
      LOC => "DCM_X1Y0",
      PATHPULSE => 638 ps
    )
    port map (
      I => NlwRenamedSig_OI_CLKIN_IBUFG_OUT,
      O => Inst_low_dcm_DCM_SP_INST_CLKIN_BUF_728
    );
  clk_in_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD108",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in_INBUF,
      O => NlwRenamedSig_OI_CLKIN_IBUFG_OUT
    );
  NlwBufferBlock_Inst_low_dcm_DCM_SP_INST_RST : X_BUF
    generic map(
      PATHPULSE => 638 ps
    )
    port map (
      I => RST_IN,
      O => NlwBufferSignal_Inst_low_dcm_DCM_SP_INST_RST
    );
  NlwBlock_Inst_low_dcm_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity heartbeat is
  port (
    clk_in : in STD_LOGIC := 'X'; 
    rst_in : in STD_LOGIC := 'X'; 
    heartbeat_led : out STD_LOGIC 
  );
end heartbeat;

architecture Structure of heartbeat is
  signal Mcount_count_cy_1_Q : STD_LOGIC; 
  signal Mcount_count_cy_3_Q : STD_LOGIC; 
  signal Mcount_count_cy_5_Q : STD_LOGIC; 
  signal Mcount_count_cy_7_Q : STD_LOGIC; 
  signal Mcount_count_cy_9_Q : STD_LOGIC; 
  signal Mcount_count_cy_11_Q : STD_LOGIC; 
  signal Mcount_count_cy_13_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_0_DXMUX_255 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_XORF_253 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_LOGIC_ONE_252 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_CYINIT_251 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_CYSELF_242 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_BXINV_240 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_DYMUX_233 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_XORG_231 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_CYMUXG_230 : STD_LOGIC; 
  signal Mcount_count_cy_0_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_0_LOGIC_ZERO_228 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_CYSELG_219 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_G : STD_LOGIC; 
  signal Inst_heartbeat_count_0_SRINV_217 : STD_LOGIC; 
  signal Inst_heartbeat_count_0_CLKINV_216 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_DXMUX_311 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_XORF_309 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYINIT_308 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_F : STD_LOGIC; 
  signal Inst_heartbeat_count_2_DYMUX_292 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_XORG_290 : STD_LOGIC; 
  signal Mcount_count_cy_2_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYSELF_288 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYMUXFAST_287 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYAND_286 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_FASTCARRY_285 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYMUXG2_284 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYMUXF2_283 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_LOGIC_ZERO_282 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CYSELG_273 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_G : STD_LOGIC; 
  signal Inst_heartbeat_count_2_SRINV_271 : STD_LOGIC; 
  signal Inst_heartbeat_count_2_CLKINV_270 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_FFY_RST : STD_LOGIC; 
  signal Inst_heartbeat_count_4_DXMUX_367 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_XORF_365 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYINIT_364 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_F : STD_LOGIC; 
  signal Inst_heartbeat_count_4_DYMUX_348 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_XORG_346 : STD_LOGIC; 
  signal Mcount_count_cy_4_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYSELF_344 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYMUXFAST_343 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYAND_342 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_FASTCARRY_341 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYMUXG2_340 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYMUXF2_339 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_LOGIC_ZERO_338 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CYSELG_329 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_G : STD_LOGIC; 
  signal Inst_heartbeat_count_4_SRINV_327 : STD_LOGIC; 
  signal Inst_heartbeat_count_4_CLKINV_326 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_DXMUX_423 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_XORF_421 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYINIT_420 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_F : STD_LOGIC; 
  signal Inst_heartbeat_count_6_DYMUX_404 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_XORG_402 : STD_LOGIC; 
  signal Mcount_count_cy_6_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYSELF_400 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYMUXFAST_399 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYAND_398 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_FASTCARRY_397 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYMUXG2_396 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYMUXF2_395 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_LOGIC_ZERO_394 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CYSELG_385 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_G : STD_LOGIC; 
  signal Inst_heartbeat_count_6_SRINV_383 : STD_LOGIC; 
  signal Inst_heartbeat_count_6_CLKINV_382 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_DXMUX_479 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_XORF_477 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYINIT_476 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_F : STD_LOGIC; 
  signal Inst_heartbeat_count_8_DYMUX_460 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_XORG_458 : STD_LOGIC; 
  signal Mcount_count_cy_8_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYSELF_456 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYMUXFAST_455 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYAND_454 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_FASTCARRY_453 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYMUXG2_452 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYMUXF2_451 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_LOGIC_ZERO_450 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CYSELG_441 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_G : STD_LOGIC; 
  signal Inst_heartbeat_count_8_SRINV_439 : STD_LOGIC; 
  signal Inst_heartbeat_count_8_CLKINV_438 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_DXMUX_535 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_XORF_533 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYINIT_532 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_F : STD_LOGIC; 
  signal Inst_heartbeat_count_10_DYMUX_516 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_XORG_514 : STD_LOGIC; 
  signal Mcount_count_cy_10_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYSELF_512 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYMUXFAST_511 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYAND_510 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_FASTCARRY_509 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYMUXG2_508 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYMUXF2_507 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_LOGIC_ZERO_506 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CYSELG_497 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_G : STD_LOGIC; 
  signal Inst_heartbeat_count_10_SRINV_495 : STD_LOGIC; 
  signal Inst_heartbeat_count_10_CLKINV_494 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_DXMUX_591 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_XORF_589 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYINIT_588 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_F : STD_LOGIC; 
  signal Inst_heartbeat_count_12_DYMUX_572 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_XORG_570 : STD_LOGIC; 
  signal Mcount_count_cy_12_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYSELF_568 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYMUXFAST_567 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYAND_566 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_FASTCARRY_565 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYMUXG2_564 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYMUXF2_563 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_LOGIC_ZERO_562 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CYSELG_553 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_G : STD_LOGIC; 
  signal Inst_heartbeat_count_12_SRINV_551 : STD_LOGIC; 
  signal Inst_heartbeat_count_12_CLKINV_550 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_DXMUX_647 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_XORF_645 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYINIT_644 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_F : STD_LOGIC; 
  signal Inst_heartbeat_count_14_DYMUX_628 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_XORG_626 : STD_LOGIC; 
  signal Mcount_count_cy_14_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYSELF_624 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYMUXFAST_623 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYAND_622 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_FASTCARRY_621 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYMUXG2_620 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYMUXF2_619 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_LOGIC_ZERO_618 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CYSELG_609 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_G : STD_LOGIC; 
  signal Inst_heartbeat_count_14_SRINV_607 : STD_LOGIC; 
  signal Inst_heartbeat_count_14_CLKINV_606 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_DXMUX_696 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_XORF_694 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_LOGIC_ZERO_693 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_CYINIT_692 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_CYSELF_683 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_F : STD_LOGIC; 
  signal Inst_heartbeat_count_16_DYMUX_675 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_XORG_673 : STD_LOGIC; 
  signal Mcount_count_cy_16_Q : STD_LOGIC; 
  signal Inst_heartbeat_count_16_G : STD_LOGIC; 
  signal Inst_heartbeat_count_16_SRINV_662 : STD_LOGIC; 
  signal Inst_heartbeat_count_16_CLKINV_661 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NlwRenamedSig_OI_count : STD_LOGIC_VECTOR ( 17 downto 17 ); 
  signal count : STD_LOGIC_VECTOR ( 16 downto 0 ); 
  signal Mcount_count_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
begin
  heartbeat_led <= NlwRenamedSig_OI_count(17);
  Inst_heartbeat_count_0_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      O => Inst_heartbeat_count_0_LOGIC_ZERO_228
    );
  Inst_heartbeat_count_0_LOGIC_ONE : X_ONE
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      O => Inst_heartbeat_count_0_LOGIC_ONE_252
    );
  Inst_heartbeat_count_0_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_0_XORF_253,
      O => Inst_heartbeat_count_0_DXMUX_255
    );
  Inst_heartbeat_count_0_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      I0 => Inst_heartbeat_count_0_CYINIT_251,
      I1 => Mcount_count_lut(0),
      O => Inst_heartbeat_count_0_XORF_253
    );
  Inst_heartbeat_count_0_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      IA => Inst_heartbeat_count_0_LOGIC_ONE_252,
      IB => Inst_heartbeat_count_0_CYINIT_251,
      SEL => Inst_heartbeat_count_0_CYSELF_242,
      O => Mcount_count_cy_0_Q
    );
  Inst_heartbeat_count_0_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_0_BXINV_240,
      O => Inst_heartbeat_count_0_CYINIT_251
    );
  Inst_heartbeat_count_0_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_lut(0),
      O => Inst_heartbeat_count_0_CYSELF_242
    );
  Inst_heartbeat_count_0_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => '0',
      O => Inst_heartbeat_count_0_BXINV_240
    );
  Inst_heartbeat_count_0_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_0_XORG_231,
      O => Inst_heartbeat_count_0_DYMUX_233
    );
  Inst_heartbeat_count_0_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      I0 => Mcount_count_cy_0_Q,
      I1 => Inst_heartbeat_count_0_G,
      O => Inst_heartbeat_count_0_XORG_231
    );
  Inst_heartbeat_count_0_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_0_CYMUXG_230,
      O => Mcount_count_cy_1_Q
    );
  Inst_heartbeat_count_0_CYMUXG : X_MUX2
    generic map(
      LOC => "SLICE_X39Y1"
    )
    port map (
      IA => Inst_heartbeat_count_0_LOGIC_ZERO_228,
      IB => Mcount_count_cy_0_Q,
      SEL => Inst_heartbeat_count_0_CYSELG_219,
      O => Inst_heartbeat_count_0_CYMUXG_230
    );
  Inst_heartbeat_count_0_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_0_G,
      O => Inst_heartbeat_count_0_CYSELG_219
    );
  Inst_heartbeat_count_0_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_0_SRINV_217
    );
  Inst_heartbeat_count_0_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_0_CLKINV_216
    );
  Inst_heartbeat_count_2_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      O => Inst_heartbeat_count_2_LOGIC_ZERO_282
    );
  Inst_heartbeat_count_2_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_2_XORF_309,
      O => Inst_heartbeat_count_2_DXMUX_311
    );
  Inst_heartbeat_count_2_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      I0 => Inst_heartbeat_count_2_CYINIT_308,
      I1 => Inst_heartbeat_count_2_F,
      O => Inst_heartbeat_count_2_XORF_309
    );
  Inst_heartbeat_count_2_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      IA => Inst_heartbeat_count_2_LOGIC_ZERO_282,
      IB => Inst_heartbeat_count_2_CYINIT_308,
      SEL => Inst_heartbeat_count_2_CYSELF_288,
      O => Mcount_count_cy_2_Q
    );
  Inst_heartbeat_count_2_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      IA => Inst_heartbeat_count_2_LOGIC_ZERO_282,
      IB => Inst_heartbeat_count_2_LOGIC_ZERO_282,
      SEL => Inst_heartbeat_count_2_CYSELF_288,
      O => Inst_heartbeat_count_2_CYMUXF2_283
    );
  Inst_heartbeat_count_2_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_1_Q,
      O => Inst_heartbeat_count_2_CYINIT_308
    );
  Inst_heartbeat_count_2_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_2_F,
      O => Inst_heartbeat_count_2_CYSELF_288
    );
  Inst_heartbeat_count_2_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_2_XORG_290,
      O => Inst_heartbeat_count_2_DYMUX_292
    );
  Inst_heartbeat_count_2_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      I0 => Mcount_count_cy_2_Q,
      I1 => Inst_heartbeat_count_2_G,
      O => Inst_heartbeat_count_2_XORG_290
    );
  Inst_heartbeat_count_2_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_2_CYMUXFAST_287,
      O => Mcount_count_cy_3_Q
    );
  Inst_heartbeat_count_2_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_1_Q,
      O => Inst_heartbeat_count_2_FASTCARRY_285
    );
  Inst_heartbeat_count_2_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      I0 => Inst_heartbeat_count_2_CYSELG_273,
      I1 => Inst_heartbeat_count_2_CYSELF_288,
      O => Inst_heartbeat_count_2_CYAND_286
    );
  Inst_heartbeat_count_2_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      IA => Inst_heartbeat_count_2_CYMUXG2_284,
      IB => Inst_heartbeat_count_2_FASTCARRY_285,
      SEL => Inst_heartbeat_count_2_CYAND_286,
      O => Inst_heartbeat_count_2_CYMUXFAST_287
    );
  Inst_heartbeat_count_2_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y2"
    )
    port map (
      IA => Inst_heartbeat_count_2_LOGIC_ZERO_282,
      IB => Inst_heartbeat_count_2_CYMUXF2_283,
      SEL => Inst_heartbeat_count_2_CYSELG_273,
      O => Inst_heartbeat_count_2_CYMUXG2_284
    );
  Inst_heartbeat_count_2_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_2_G,
      O => Inst_heartbeat_count_2_CYSELG_273
    );
  Inst_heartbeat_count_2_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_2_SRINV_271
    );
  Inst_heartbeat_count_2_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y2",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_2_CLKINV_270
    );
  Inst_heartbeat_count_4_FFY_RSTOR : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_SRINV_327,
      O => Inst_heartbeat_count_4_FFY_RST
    );
  count_5 : X_FF
    generic map(
      LOC => "SLICE_X39Y3",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_4_DYMUX_348,
      CE => VCC,
      CLK => Inst_heartbeat_count_4_CLKINV_326,
      SET => GND,
      RST => Inst_heartbeat_count_4_FFY_RST,
      O => count(5)
    );
  Inst_heartbeat_count_4_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      O => Inst_heartbeat_count_4_LOGIC_ZERO_338
    );
  Inst_heartbeat_count_4_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_XORF_365,
      O => Inst_heartbeat_count_4_DXMUX_367
    );
  Inst_heartbeat_count_4_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      I0 => Inst_heartbeat_count_4_CYINIT_364,
      I1 => Inst_heartbeat_count_4_F,
      O => Inst_heartbeat_count_4_XORF_365
    );
  Inst_heartbeat_count_4_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      IA => Inst_heartbeat_count_4_LOGIC_ZERO_338,
      IB => Inst_heartbeat_count_4_CYINIT_364,
      SEL => Inst_heartbeat_count_4_CYSELF_344,
      O => Mcount_count_cy_4_Q
    );
  Inst_heartbeat_count_4_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      IA => Inst_heartbeat_count_4_LOGIC_ZERO_338,
      IB => Inst_heartbeat_count_4_LOGIC_ZERO_338,
      SEL => Inst_heartbeat_count_4_CYSELF_344,
      O => Inst_heartbeat_count_4_CYMUXF2_339
    );
  Inst_heartbeat_count_4_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_3_Q,
      O => Inst_heartbeat_count_4_CYINIT_364
    );
  Inst_heartbeat_count_4_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_F,
      O => Inst_heartbeat_count_4_CYSELF_344
    );
  Inst_heartbeat_count_4_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_XORG_346,
      O => Inst_heartbeat_count_4_DYMUX_348
    );
  Inst_heartbeat_count_4_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      I0 => Mcount_count_cy_4_Q,
      I1 => Inst_heartbeat_count_4_G,
      O => Inst_heartbeat_count_4_XORG_346
    );
  Inst_heartbeat_count_4_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_CYMUXFAST_343,
      O => Mcount_count_cy_5_Q
    );
  Inst_heartbeat_count_4_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_3_Q,
      O => Inst_heartbeat_count_4_FASTCARRY_341
    );
  Inst_heartbeat_count_4_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      I0 => Inst_heartbeat_count_4_CYSELG_329,
      I1 => Inst_heartbeat_count_4_CYSELF_344,
      O => Inst_heartbeat_count_4_CYAND_342
    );
  Inst_heartbeat_count_4_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      IA => Inst_heartbeat_count_4_CYMUXG2_340,
      IB => Inst_heartbeat_count_4_FASTCARRY_341,
      SEL => Inst_heartbeat_count_4_CYAND_342,
      O => Inst_heartbeat_count_4_CYMUXFAST_343
    );
  Inst_heartbeat_count_4_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y3"
    )
    port map (
      IA => Inst_heartbeat_count_4_LOGIC_ZERO_338,
      IB => Inst_heartbeat_count_4_CYMUXF2_339,
      SEL => Inst_heartbeat_count_4_CYSELG_329,
      O => Inst_heartbeat_count_4_CYMUXG2_340
    );
  Inst_heartbeat_count_4_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_4_G,
      O => Inst_heartbeat_count_4_CYSELG_329
    );
  Inst_heartbeat_count_4_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_4_SRINV_327
    );
  Inst_heartbeat_count_4_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y3",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_4_CLKINV_326
    );
  Inst_heartbeat_count_6_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      O => Inst_heartbeat_count_6_LOGIC_ZERO_394
    );
  Inst_heartbeat_count_6_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_6_XORF_421,
      O => Inst_heartbeat_count_6_DXMUX_423
    );
  Inst_heartbeat_count_6_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      I0 => Inst_heartbeat_count_6_CYINIT_420,
      I1 => Inst_heartbeat_count_6_F,
      O => Inst_heartbeat_count_6_XORF_421
    );
  Inst_heartbeat_count_6_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      IA => Inst_heartbeat_count_6_LOGIC_ZERO_394,
      IB => Inst_heartbeat_count_6_CYINIT_420,
      SEL => Inst_heartbeat_count_6_CYSELF_400,
      O => Mcount_count_cy_6_Q
    );
  Inst_heartbeat_count_6_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      IA => Inst_heartbeat_count_6_LOGIC_ZERO_394,
      IB => Inst_heartbeat_count_6_LOGIC_ZERO_394,
      SEL => Inst_heartbeat_count_6_CYSELF_400,
      O => Inst_heartbeat_count_6_CYMUXF2_395
    );
  Inst_heartbeat_count_6_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_5_Q,
      O => Inst_heartbeat_count_6_CYINIT_420
    );
  Inst_heartbeat_count_6_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_6_F,
      O => Inst_heartbeat_count_6_CYSELF_400
    );
  Inst_heartbeat_count_6_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_6_XORG_402,
      O => Inst_heartbeat_count_6_DYMUX_404
    );
  Inst_heartbeat_count_6_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      I0 => Mcount_count_cy_6_Q,
      I1 => Inst_heartbeat_count_6_G,
      O => Inst_heartbeat_count_6_XORG_402
    );
  Inst_heartbeat_count_6_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_6_CYMUXFAST_399,
      O => Mcount_count_cy_7_Q
    );
  Inst_heartbeat_count_6_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_5_Q,
      O => Inst_heartbeat_count_6_FASTCARRY_397
    );
  Inst_heartbeat_count_6_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      I0 => Inst_heartbeat_count_6_CYSELG_385,
      I1 => Inst_heartbeat_count_6_CYSELF_400,
      O => Inst_heartbeat_count_6_CYAND_398
    );
  Inst_heartbeat_count_6_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      IA => Inst_heartbeat_count_6_CYMUXG2_396,
      IB => Inst_heartbeat_count_6_FASTCARRY_397,
      SEL => Inst_heartbeat_count_6_CYAND_398,
      O => Inst_heartbeat_count_6_CYMUXFAST_399
    );
  Inst_heartbeat_count_6_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y4"
    )
    port map (
      IA => Inst_heartbeat_count_6_LOGIC_ZERO_394,
      IB => Inst_heartbeat_count_6_CYMUXF2_395,
      SEL => Inst_heartbeat_count_6_CYSELG_385,
      O => Inst_heartbeat_count_6_CYMUXG2_396
    );
  Inst_heartbeat_count_6_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_6_G,
      O => Inst_heartbeat_count_6_CYSELG_385
    );
  Inst_heartbeat_count_6_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_6_SRINV_383
    );
  Inst_heartbeat_count_6_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y4",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_6_CLKINV_382
    );
  count_7 : X_FF
    generic map(
      LOC => "SLICE_X39Y4",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_6_DYMUX_404,
      CE => VCC,
      CLK => Inst_heartbeat_count_6_CLKINV_382,
      SET => GND,
      RST => Inst_heartbeat_count_6_SRINV_383,
      O => count(7)
    );
  Inst_heartbeat_count_8_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      O => Inst_heartbeat_count_8_LOGIC_ZERO_450
    );
  Inst_heartbeat_count_8_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_8_XORF_477,
      O => Inst_heartbeat_count_8_DXMUX_479
    );
  Inst_heartbeat_count_8_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      I0 => Inst_heartbeat_count_8_CYINIT_476,
      I1 => Inst_heartbeat_count_8_F,
      O => Inst_heartbeat_count_8_XORF_477
    );
  Inst_heartbeat_count_8_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      IA => Inst_heartbeat_count_8_LOGIC_ZERO_450,
      IB => Inst_heartbeat_count_8_CYINIT_476,
      SEL => Inst_heartbeat_count_8_CYSELF_456,
      O => Mcount_count_cy_8_Q
    );
  Inst_heartbeat_count_8_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      IA => Inst_heartbeat_count_8_LOGIC_ZERO_450,
      IB => Inst_heartbeat_count_8_LOGIC_ZERO_450,
      SEL => Inst_heartbeat_count_8_CYSELF_456,
      O => Inst_heartbeat_count_8_CYMUXF2_451
    );
  Inst_heartbeat_count_8_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_7_Q,
      O => Inst_heartbeat_count_8_CYINIT_476
    );
  Inst_heartbeat_count_8_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_8_F,
      O => Inst_heartbeat_count_8_CYSELF_456
    );
  Inst_heartbeat_count_8_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_8_XORG_458,
      O => Inst_heartbeat_count_8_DYMUX_460
    );
  Inst_heartbeat_count_8_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      I0 => Mcount_count_cy_8_Q,
      I1 => Inst_heartbeat_count_8_G,
      O => Inst_heartbeat_count_8_XORG_458
    );
  Inst_heartbeat_count_8_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_8_CYMUXFAST_455,
      O => Mcount_count_cy_9_Q
    );
  Inst_heartbeat_count_8_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_7_Q,
      O => Inst_heartbeat_count_8_FASTCARRY_453
    );
  Inst_heartbeat_count_8_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      I0 => Inst_heartbeat_count_8_CYSELG_441,
      I1 => Inst_heartbeat_count_8_CYSELF_456,
      O => Inst_heartbeat_count_8_CYAND_454
    );
  Inst_heartbeat_count_8_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      IA => Inst_heartbeat_count_8_CYMUXG2_452,
      IB => Inst_heartbeat_count_8_FASTCARRY_453,
      SEL => Inst_heartbeat_count_8_CYAND_454,
      O => Inst_heartbeat_count_8_CYMUXFAST_455
    );
  Inst_heartbeat_count_8_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y5"
    )
    port map (
      IA => Inst_heartbeat_count_8_LOGIC_ZERO_450,
      IB => Inst_heartbeat_count_8_CYMUXF2_451,
      SEL => Inst_heartbeat_count_8_CYSELG_441,
      O => Inst_heartbeat_count_8_CYMUXG2_452
    );
  Inst_heartbeat_count_8_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_8_G,
      O => Inst_heartbeat_count_8_CYSELG_441
    );
  Inst_heartbeat_count_8_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_8_SRINV_439
    );
  Inst_heartbeat_count_8_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y5",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_8_CLKINV_438
    );
  Inst_heartbeat_count_10_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      O => Inst_heartbeat_count_10_LOGIC_ZERO_506
    );
  Inst_heartbeat_count_10_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_10_XORF_533,
      O => Inst_heartbeat_count_10_DXMUX_535
    );
  Inst_heartbeat_count_10_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      I0 => Inst_heartbeat_count_10_CYINIT_532,
      I1 => Inst_heartbeat_count_10_F,
      O => Inst_heartbeat_count_10_XORF_533
    );
  Inst_heartbeat_count_10_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      IA => Inst_heartbeat_count_10_LOGIC_ZERO_506,
      IB => Inst_heartbeat_count_10_CYINIT_532,
      SEL => Inst_heartbeat_count_10_CYSELF_512,
      O => Mcount_count_cy_10_Q
    );
  Inst_heartbeat_count_10_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      IA => Inst_heartbeat_count_10_LOGIC_ZERO_506,
      IB => Inst_heartbeat_count_10_LOGIC_ZERO_506,
      SEL => Inst_heartbeat_count_10_CYSELF_512,
      O => Inst_heartbeat_count_10_CYMUXF2_507
    );
  Inst_heartbeat_count_10_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_9_Q,
      O => Inst_heartbeat_count_10_CYINIT_532
    );
  Inst_heartbeat_count_10_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_10_F,
      O => Inst_heartbeat_count_10_CYSELF_512
    );
  Inst_heartbeat_count_10_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_10_XORG_514,
      O => Inst_heartbeat_count_10_DYMUX_516
    );
  Inst_heartbeat_count_10_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      I0 => Mcount_count_cy_10_Q,
      I1 => Inst_heartbeat_count_10_G,
      O => Inst_heartbeat_count_10_XORG_514
    );
  Inst_heartbeat_count_10_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_10_CYMUXFAST_511,
      O => Mcount_count_cy_11_Q
    );
  Inst_heartbeat_count_10_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_9_Q,
      O => Inst_heartbeat_count_10_FASTCARRY_509
    );
  Inst_heartbeat_count_10_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      I0 => Inst_heartbeat_count_10_CYSELG_497,
      I1 => Inst_heartbeat_count_10_CYSELF_512,
      O => Inst_heartbeat_count_10_CYAND_510
    );
  Inst_heartbeat_count_10_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      IA => Inst_heartbeat_count_10_CYMUXG2_508,
      IB => Inst_heartbeat_count_10_FASTCARRY_509,
      SEL => Inst_heartbeat_count_10_CYAND_510,
      O => Inst_heartbeat_count_10_CYMUXFAST_511
    );
  Inst_heartbeat_count_10_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y6"
    )
    port map (
      IA => Inst_heartbeat_count_10_LOGIC_ZERO_506,
      IB => Inst_heartbeat_count_10_CYMUXF2_507,
      SEL => Inst_heartbeat_count_10_CYSELG_497,
      O => Inst_heartbeat_count_10_CYMUXG2_508
    );
  Inst_heartbeat_count_10_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_10_G,
      O => Inst_heartbeat_count_10_CYSELG_497
    );
  Inst_heartbeat_count_10_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_10_SRINV_495
    );
  Inst_heartbeat_count_10_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y6",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_10_CLKINV_494
    );
  Inst_heartbeat_count_12_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      O => Inst_heartbeat_count_12_LOGIC_ZERO_562
    );
  Inst_heartbeat_count_12_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_12_XORF_589,
      O => Inst_heartbeat_count_12_DXMUX_591
    );
  Inst_heartbeat_count_12_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      I0 => Inst_heartbeat_count_12_CYINIT_588,
      I1 => Inst_heartbeat_count_12_F,
      O => Inst_heartbeat_count_12_XORF_589
    );
  Inst_heartbeat_count_12_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      IA => Inst_heartbeat_count_12_LOGIC_ZERO_562,
      IB => Inst_heartbeat_count_12_CYINIT_588,
      SEL => Inst_heartbeat_count_12_CYSELF_568,
      O => Mcount_count_cy_12_Q
    );
  Inst_heartbeat_count_12_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      IA => Inst_heartbeat_count_12_LOGIC_ZERO_562,
      IB => Inst_heartbeat_count_12_LOGIC_ZERO_562,
      SEL => Inst_heartbeat_count_12_CYSELF_568,
      O => Inst_heartbeat_count_12_CYMUXF2_563
    );
  Inst_heartbeat_count_12_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_11_Q,
      O => Inst_heartbeat_count_12_CYINIT_588
    );
  Inst_heartbeat_count_12_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_12_F,
      O => Inst_heartbeat_count_12_CYSELF_568
    );
  Inst_heartbeat_count_12_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_12_XORG_570,
      O => Inst_heartbeat_count_12_DYMUX_572
    );
  Inst_heartbeat_count_12_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      I0 => Mcount_count_cy_12_Q,
      I1 => Inst_heartbeat_count_12_G,
      O => Inst_heartbeat_count_12_XORG_570
    );
  Inst_heartbeat_count_12_COUTUSED : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_12_CYMUXFAST_567,
      O => Mcount_count_cy_13_Q
    );
  Inst_heartbeat_count_12_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_11_Q,
      O => Inst_heartbeat_count_12_FASTCARRY_565
    );
  Inst_heartbeat_count_12_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      I0 => Inst_heartbeat_count_12_CYSELG_553,
      I1 => Inst_heartbeat_count_12_CYSELF_568,
      O => Inst_heartbeat_count_12_CYAND_566
    );
  Inst_heartbeat_count_12_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      IA => Inst_heartbeat_count_12_CYMUXG2_564,
      IB => Inst_heartbeat_count_12_FASTCARRY_565,
      SEL => Inst_heartbeat_count_12_CYAND_566,
      O => Inst_heartbeat_count_12_CYMUXFAST_567
    );
  Inst_heartbeat_count_12_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y7"
    )
    port map (
      IA => Inst_heartbeat_count_12_LOGIC_ZERO_562,
      IB => Inst_heartbeat_count_12_CYMUXF2_563,
      SEL => Inst_heartbeat_count_12_CYSELG_553,
      O => Inst_heartbeat_count_12_CYMUXG2_564
    );
  Inst_heartbeat_count_12_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_12_G,
      O => Inst_heartbeat_count_12_CYSELG_553
    );
  Inst_heartbeat_count_12_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_12_SRINV_551
    );
  Inst_heartbeat_count_12_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y7",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_12_CLKINV_550
    );
  Inst_heartbeat_count_14_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      O => Inst_heartbeat_count_14_LOGIC_ZERO_618
    );
  Inst_heartbeat_count_14_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_14_XORF_645,
      O => Inst_heartbeat_count_14_DXMUX_647
    );
  Inst_heartbeat_count_14_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      I0 => Inst_heartbeat_count_14_CYINIT_644,
      I1 => Inst_heartbeat_count_14_F,
      O => Inst_heartbeat_count_14_XORF_645
    );
  Inst_heartbeat_count_14_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      IA => Inst_heartbeat_count_14_LOGIC_ZERO_618,
      IB => Inst_heartbeat_count_14_CYINIT_644,
      SEL => Inst_heartbeat_count_14_CYSELF_624,
      O => Mcount_count_cy_14_Q
    );
  Inst_heartbeat_count_14_CYMUXF2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      IA => Inst_heartbeat_count_14_LOGIC_ZERO_618,
      IB => Inst_heartbeat_count_14_LOGIC_ZERO_618,
      SEL => Inst_heartbeat_count_14_CYSELF_624,
      O => Inst_heartbeat_count_14_CYMUXF2_619
    );
  Inst_heartbeat_count_14_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_13_Q,
      O => Inst_heartbeat_count_14_CYINIT_644
    );
  Inst_heartbeat_count_14_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_14_F,
      O => Inst_heartbeat_count_14_CYSELF_624
    );
  Inst_heartbeat_count_14_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_14_XORG_626,
      O => Inst_heartbeat_count_14_DYMUX_628
    );
  Inst_heartbeat_count_14_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      I0 => Mcount_count_cy_14_Q,
      I1 => Inst_heartbeat_count_14_G,
      O => Inst_heartbeat_count_14_XORG_626
    );
  Inst_heartbeat_count_14_FASTCARRY : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Mcount_count_cy_13_Q,
      O => Inst_heartbeat_count_14_FASTCARRY_621
    );
  Inst_heartbeat_count_14_CYAND : X_AND2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      I0 => Inst_heartbeat_count_14_CYSELG_609,
      I1 => Inst_heartbeat_count_14_CYSELF_624,
      O => Inst_heartbeat_count_14_CYAND_622
    );
  Inst_heartbeat_count_14_CYMUXFAST : X_MUX2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      IA => Inst_heartbeat_count_14_CYMUXG2_620,
      IB => Inst_heartbeat_count_14_FASTCARRY_621,
      SEL => Inst_heartbeat_count_14_CYAND_622,
      O => Inst_heartbeat_count_14_CYMUXFAST_623
    );
  Inst_heartbeat_count_14_CYMUXG2 : X_MUX2
    generic map(
      LOC => "SLICE_X39Y8"
    )
    port map (
      IA => Inst_heartbeat_count_14_LOGIC_ZERO_618,
      IB => Inst_heartbeat_count_14_CYMUXF2_619,
      SEL => Inst_heartbeat_count_14_CYSELG_609,
      O => Inst_heartbeat_count_14_CYMUXG2_620
    );
  Inst_heartbeat_count_14_CYSELG : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_14_G,
      O => Inst_heartbeat_count_14_CYSELG_609
    );
  Inst_heartbeat_count_14_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_14_SRINV_607
    );
  Inst_heartbeat_count_14_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y8",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_14_CLKINV_606
    );
  Inst_heartbeat_count_16_LOGIC_ZERO : X_ZERO
    generic map(
      LOC => "SLICE_X39Y9"
    )
    port map (
      O => Inst_heartbeat_count_16_LOGIC_ZERO_693
    );
  Inst_heartbeat_count_16_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_16_XORF_694,
      O => Inst_heartbeat_count_16_DXMUX_696
    );
  Inst_heartbeat_count_16_XORF : X_XOR2
    generic map(
      LOC => "SLICE_X39Y9"
    )
    port map (
      I0 => Inst_heartbeat_count_16_CYINIT_692,
      I1 => Inst_heartbeat_count_16_F,
      O => Inst_heartbeat_count_16_XORF_694
    );
  Inst_heartbeat_count_16_CYMUXF : X_MUX2
    generic map(
      LOC => "SLICE_X39Y9"
    )
    port map (
      IA => Inst_heartbeat_count_16_LOGIC_ZERO_693,
      IB => Inst_heartbeat_count_16_CYINIT_692,
      SEL => Inst_heartbeat_count_16_CYSELF_683,
      O => Mcount_count_cy_16_Q
    );
  Inst_heartbeat_count_16_CYINIT : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_14_CYMUXFAST_623,
      O => Inst_heartbeat_count_16_CYINIT_692
    );
  Inst_heartbeat_count_16_CYSELF : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_16_F,
      O => Inst_heartbeat_count_16_CYSELF_683
    );
  Inst_heartbeat_count_16_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => Inst_heartbeat_count_16_XORG_673,
      O => Inst_heartbeat_count_16_DYMUX_675
    );
  Inst_heartbeat_count_16_XORG : X_XOR2
    generic map(
      LOC => "SLICE_X39Y9"
    )
    port map (
      I0 => Mcount_count_cy_16_Q,
      I1 => Inst_heartbeat_count_16_G,
      O => Inst_heartbeat_count_16_XORG_673
    );
  Inst_heartbeat_count_16_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in,
      O => Inst_heartbeat_count_16_SRINV_662
    );
  Inst_heartbeat_count_16_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X39Y9",
      PATHPULSE => 638 ps
    )
    port map (
      I => clk_in,
      O => Inst_heartbeat_count_16_CLKINV_661
    );
  count_4 : X_FF
    generic map(
      LOC => "SLICE_X39Y3",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_4_DXMUX_367,
      CE => VCC,
      CLK => Inst_heartbeat_count_4_CLKINV_326,
      SET => GND,
      RST => Inst_heartbeat_count_4_SRINV_327,
      O => count(4)
    );
  count_1 : X_FF
    generic map(
      LOC => "SLICE_X39Y1",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_0_DYMUX_233,
      CE => VCC,
      CLK => Inst_heartbeat_count_0_CLKINV_216,
      SET => GND,
      RST => Inst_heartbeat_count_0_SRINV_217,
      O => count(1)
    );
  Mcount_count_lut_0_INV_0 : X_LUT4
    generic map(
      INIT => X"00FF",
      LOC => "SLICE_X39Y1"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => count(0),
      O => Mcount_count_lut(0)
    );
  count_0 : X_FF
    generic map(
      LOC => "SLICE_X39Y1",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_0_DXMUX_255,
      CE => VCC,
      CLK => Inst_heartbeat_count_0_CLKINV_216,
      SET => GND,
      RST => Inst_heartbeat_count_0_SRINV_217,
      O => count(0)
    );
  count_3 : X_FF
    generic map(
      LOC => "SLICE_X39Y2",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_2_DYMUX_292,
      CE => VCC,
      CLK => Inst_heartbeat_count_2_CLKINV_270,
      SET => GND,
      RST => Inst_heartbeat_count_2_SRINV_271,
      O => count(3)
    );
  count_2 : X_FF
    generic map(
      LOC => "SLICE_X39Y2",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_2_DXMUX_311,
      CE => VCC,
      CLK => Inst_heartbeat_count_2_CLKINV_270,
      SET => GND,
      RST => Inst_heartbeat_count_2_SRINV_271,
      O => count(2)
    );
  count_6 : X_FF
    generic map(
      LOC => "SLICE_X39Y4",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_6_DXMUX_423,
      CE => VCC,
      CLK => Inst_heartbeat_count_6_CLKINV_382,
      SET => GND,
      RST => Inst_heartbeat_count_6_SRINV_383,
      O => count(6)
    );
  count_9 : X_FF
    generic map(
      LOC => "SLICE_X39Y5",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_8_DYMUX_460,
      CE => VCC,
      CLK => Inst_heartbeat_count_8_CLKINV_438,
      SET => GND,
      RST => Inst_heartbeat_count_8_SRINV_439,
      O => count(9)
    );
  count_8 : X_FF
    generic map(
      LOC => "SLICE_X39Y5",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_8_DXMUX_479,
      CE => VCC,
      CLK => Inst_heartbeat_count_8_CLKINV_438,
      SET => GND,
      RST => Inst_heartbeat_count_8_SRINV_439,
      O => count(8)
    );
  count_11 : X_FF
    generic map(
      LOC => "SLICE_X39Y6",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_10_DYMUX_516,
      CE => VCC,
      CLK => Inst_heartbeat_count_10_CLKINV_494,
      SET => GND,
      RST => Inst_heartbeat_count_10_SRINV_495,
      O => count(11)
    );
  count_10 : X_FF
    generic map(
      LOC => "SLICE_X39Y6",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_10_DXMUX_535,
      CE => VCC,
      CLK => Inst_heartbeat_count_10_CLKINV_494,
      SET => GND,
      RST => Inst_heartbeat_count_10_SRINV_495,
      O => count(10)
    );
  count_13 : X_FF
    generic map(
      LOC => "SLICE_X39Y7",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_12_DYMUX_572,
      CE => VCC,
      CLK => Inst_heartbeat_count_12_CLKINV_550,
      SET => GND,
      RST => Inst_heartbeat_count_12_SRINV_551,
      O => count(13)
    );
  count_12 : X_FF
    generic map(
      LOC => "SLICE_X39Y7",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_12_DXMUX_591,
      CE => VCC,
      CLK => Inst_heartbeat_count_12_CLKINV_550,
      SET => GND,
      RST => Inst_heartbeat_count_12_SRINV_551,
      O => count(12)
    );
  count_15 : X_FF
    generic map(
      LOC => "SLICE_X39Y8",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_14_DYMUX_628,
      CE => VCC,
      CLK => Inst_heartbeat_count_14_CLKINV_606,
      SET => GND,
      RST => Inst_heartbeat_count_14_SRINV_607,
      O => count(15)
    );
  count_14 : X_FF
    generic map(
      LOC => "SLICE_X39Y8",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_14_DXMUX_647,
      CE => VCC,
      CLK => Inst_heartbeat_count_14_CLKINV_606,
      SET => GND,
      RST => Inst_heartbeat_count_14_SRINV_607,
      O => count(14)
    );
  Inst_heartbeat_count_16_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"FF00",
      LOC => "SLICE_X39Y9"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => NlwRenamedSig_OI_count(17),
      O => Inst_heartbeat_count_16_G
    );
  count_17 : X_FF
    generic map(
      LOC => "SLICE_X39Y9",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_16_DYMUX_675,
      CE => VCC,
      CLK => Inst_heartbeat_count_16_CLKINV_661,
      SET => GND,
      RST => Inst_heartbeat_count_16_SRINV_662,
      O => NlwRenamedSig_OI_count(17)
    );
  count_16 : X_FF
    generic map(
      LOC => "SLICE_X39Y9",
      INIT => '0'
    )
    port map (
      I => Inst_heartbeat_count_16_DXMUX_696,
      CE => VCC,
      CLK => Inst_heartbeat_count_16_CLKINV_661,
      SET => GND,
      RST => Inst_heartbeat_count_16_SRINV_662,
      O => count(16)
    );
  Inst_heartbeat_count_0_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X39Y1"
    )
    port map (
      ADR0 => VCC,
      ADR1 => count(1),
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_0_G
    );
  Inst_heartbeat_count_2_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA",
      LOC => "SLICE_X39Y2"
    )
    port map (
      ADR0 => count(2),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_2_F
    );
  Inst_heartbeat_count_2_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"FF00",
      LOC => "SLICE_X39Y2"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => count(3),
      O => Inst_heartbeat_count_2_G
    );
  Inst_heartbeat_count_4_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X39Y3"
    )
    port map (
      ADR0 => VCC,
      ADR1 => count(4),
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_4_F
    );
  Inst_heartbeat_count_4_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X39Y3"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => count(5),
      ADR3 => VCC,
      O => Inst_heartbeat_count_4_G
    );
  Inst_heartbeat_count_6_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA",
      LOC => "SLICE_X39Y4"
    )
    port map (
      ADR0 => count(6),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_6_F
    );
  Inst_heartbeat_count_6_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X39Y4"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => count(7),
      ADR3 => VCC,
      O => Inst_heartbeat_count_6_G
    );
  Inst_heartbeat_count_8_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"FF00",
      LOC => "SLICE_X39Y5"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => count(8),
      O => Inst_heartbeat_count_8_F
    );
  Inst_heartbeat_count_8_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X39Y5"
    )
    port map (
      ADR0 => VCC,
      ADR1 => count(9),
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_8_G
    );
  Inst_heartbeat_count_10_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA",
      LOC => "SLICE_X39Y6"
    )
    port map (
      ADR0 => count(10),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_10_F
    );
  Inst_heartbeat_count_10_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"FF00",
      LOC => "SLICE_X39Y6"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => count(11),
      O => Inst_heartbeat_count_10_G
    );
  Inst_heartbeat_count_12_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X39Y7"
    )
    port map (
      ADR0 => VCC,
      ADR1 => count(12),
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_12_F
    );
  Inst_heartbeat_count_12_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X39Y7"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => count(13),
      ADR3 => VCC,
      O => Inst_heartbeat_count_12_G
    );
  Inst_heartbeat_count_14_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"AAAA",
      LOC => "SLICE_X39Y8"
    )
    port map (
      ADR0 => count(14),
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_14_F
    );
  Inst_heartbeat_count_14_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"F0F0",
      LOC => "SLICE_X39Y8"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => count(15),
      ADR3 => VCC,
      O => Inst_heartbeat_count_14_G
    );
  Inst_heartbeat_count_16_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"CCCC",
      LOC => "SLICE_X39Y9"
    )
    port map (
      ADR0 => VCC,
      ADR1 => count(16),
      ADR2 => VCC,
      ADR3 => VCC,
      O => Inst_heartbeat_count_16_F
    );
  NlwBlock_Inst_heartbeat_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_Inst_heartbeat_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity top is
  port (
    clk_in : in STD_LOGIC := 'X'; 
    rst_in : in STD_LOGIC := 'X'; 
    heartbeat_led : out STD_LOGIC 
  );
end top;

architecture Structure of top is
  component heartbeat
    port (
      clk_in : in STD_LOGIC := 'X'; 
      rst_in : in STD_LOGIC := 'X'; 
      heartbeat_led : out STD_LOGIC 
    );
  end component;
  component low_dcm
    port (
      RST_IN : in STD_LOGIC := 'X'; 
      CLKIN_IN : in STD_LOGIC := 'X'; 
      CLKIN_IBUFG_OUT : out STD_LOGIC; 
      CLK0_OUT : out STD_LOGIC; 
      LOCKED_OUT : out STD_LOGIC; 
      CLKDV_OUT : out STD_LOGIC 
    );
  end component;
  signal NlwRenamedSig_IO_rst_in : STD_LOGIC; 
  signal clock_375k : STD_LOGIC; 
  signal reset_locked_0 : STD_LOGIC; 
  signal heartbeat_led_OBUF_204 : STD_LOGIC; 
  signal reset_dcm_0 : STD_LOGIC; 
  signal low_dcm_locked : STD_LOGIC; 
  signal rst_in_IBUF_207 : STD_LOGIC; 
  signal heartbeat_led_O : STD_LOGIC; 
  signal rst_in_INBUF : STD_LOGIC; 
  signal reset_dcm : STD_LOGIC; 
  signal reset_locked : STD_LOGIC; 
  signal NLW_Inst_low_dcm_CLKIN_IBUFG_OUT_UNCONNECTED : STD_LOGIC; 
  signal NLW_Inst_low_dcm_CLK0_OUT_UNCONNECTED : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
begin
  NlwRenamedSig_IO_rst_in <= rst_in;
  Inst_heartbeat : heartbeat
    port map (
      clk_in => clock_375k,
      rst_in => reset_locked_0,
      heartbeat_led => heartbeat_led_OBUF_204
    );
  Inst_low_dcm : low_dcm
    port map (
      RST_IN => reset_dcm_0,
      CLKIN_IN => clk_in,
      CLKIN_IBUFG_OUT => NLW_Inst_low_dcm_CLKIN_IBUFG_OUT_UNCONNECTED,
      CLK0_OUT => NLW_Inst_low_dcm_CLK0_OUT_UNCONNECTED,
      LOCKED_OUT => low_dcm_locked,
      CLKDV_OUT => clock_375k
    );
  heartbeat_led_OBUF : X_OBUF
    generic map(
      LOC => "PAD86"
    )
    port map (
      I => heartbeat_led_O,
      O => heartbeat_led
    );
  rst_in_PULLUP : X_PU
    generic map(
      LOC => "IPAD22"
    )
    port map (
      O => NlwRenamedSig_IO_rst_in
    );
  rst_in_IBUF : X_BUF
    generic map(
      LOC => "IPAD22",
      PATHPULSE => 638 ps
    )
    port map (
      I => NlwRenamedSig_IO_rst_in,
      O => rst_in_INBUF
    );
  reset_dcm_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X25Y33",
      PATHPULSE => 638 ps
    )
    port map (
      I => reset_dcm,
      O => reset_dcm_0
    );
  reset_locked_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X34Y1",
      PATHPULSE => 638 ps
    )
    port map (
      I => reset_locked,
      O => reset_locked_0
    );
  rst_in_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD22",
      PATHPULSE => 638 ps
    )
    port map (
      I => rst_in_INBUF,
      O => rst_in_IBUF_207
    );
  reset_dcm1_INV_0 : X_LUT4
    generic map(
      INIT => X"00FF",
      LOC => "SLICE_X25Y33"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => rst_in_IBUF_207,
      O => reset_dcm
    );
  reset_locked1_INV_0 : X_LUT4
    generic map(
      INIT => X"00FF",
      LOC => "SLICE_X34Y1"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => low_dcm_locked,
      O => reset_locked
    );
  heartbeat_led_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD86",
      PATHPULSE => 638 ps
    )
    port map (
      I => heartbeat_led_OBUF_204,
      O => heartbeat_led_O
    );
  NlwBlock_top_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

