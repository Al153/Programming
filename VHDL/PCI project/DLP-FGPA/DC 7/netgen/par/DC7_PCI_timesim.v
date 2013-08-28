////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.70d
//  \   \         Application: netgen
//  /   /         Filename: DC7_PCI_timesim.v
// /___/   /\     Timestamp: Tue Feb 22 15:53:52 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf DC7_PCI.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers false -w -dir netgen/par -ofmt verilog -sim DC7_PCI.ncd DC7_PCI_timesim.v 
// Device	: 3s250etq144-4 (PRODUCTION 1.27 2010-09-15)
// Input file	: DC7_PCI.ncd
// Output file	: C:\Make\V.25\DC7\DC7_PCI\netgen\par\DC7_PCI_timesim.v
// # of Modules	: 1
// Design Name	: DC7_PCI
// Xilinx        : C:\Xilinx\12.3\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module DC7_PCI (
  DData, SSClock, USBRxValid, SSAck, DevSel, IRdy, USBTxReady, USBRead, TRdy, IDSel, USBWrite, Probe, Frame, DClock, PCI_Reset, SSDOut, SSDIn, 
SSStrobe, SSAddr, PCI_Clock, LED, AD, USBData, ADEx, CBE
);
  inout DData;
  output SSClock;
  input USBRxValid;
  input SSAck;
  output DevSel;
  input IRdy;
  input USBTxReady;
  output USBRead;
  output TRdy;
  input IDSel;
  output USBWrite;
  output Probe;
  input Frame;
  output DClock;
  input PCI_Reset;
  output SSDOut;
  input SSDIn;
  output SSStrobe;
  output SSAddr;
  input PCI_Clock;
  output LED;
  inout [17 : 0] AD;
  inout [7 : 0] USBData;
  input [1 : 0] ADEx;
  input [3 : 0] CBE;
  wire NlwRenamedSig_IO_SSAck;
  wire NlwRenamedSig_IO_SSDIn;
  wire \Host/RCount_not0001_0 ;
  wire PCI_Clock_IBUF_2741;
  wire PCI_Reset_IBUF_2742;
  wire \Host/Mcount_RCount_cy[1] ;
  wire \Host/Mcount_RCount_cy[3] ;
  wire \Host/PuttingByte_cmp_eq0001_0 ;
  wire \Host/Mcount_WCount_cy[1] ;
  wire \Host/Mcount_WCount_cy[3] ;
  wire Scaler_not0001_0;
  wire SSAck_IBUF_2768;
  wire LEDOut_2770;
  wire \Mcount_Scaler_cy[1] ;
  wire \Mcount_Scaler_cy[3] ;
  wire \Mcount_Scaler_cy[5] ;
  wire \Mcount_Scaler_cy[7] ;
  wire \Mcount_Scaler_cy[9] ;
  wire \Mcount_Scaler_cy[11] ;
  wire Mmux__varindex0000_4_f5;
  wire Mmux__varindex0000_5_f5;
  wire Mmux__varindex0000_3_f6;
  wire Mmux__varindex0000_4_f6;
  wire Mmux__varindex0000_5_f51;
  wire Mmux__varindex0000_6_f5;
  wire PCI_Clock_IBUF1;
  wire CBE_0_IBUF_2821;
  wire CBE_1_IBUF_2822;
  wire CBE_2_IBUF_2823;
  wire CBE_3_IBUF_2824;
  wire \Host/USBWrite_2826 ;
  wire \DB7/AddressPhase_2827 ;
  wire IRdy_IBUF_2828;
  wire \x86/FSMActive_2830 ;
  wire LEDShift_2831;
  wire N43;
  wire \x86/Selected_2833 ;
  wire IDSel_IBUF_2834;
  wire \Host/USBRead_2835 ;
  wire USBRxValid_IBUF_2836;
  wire USBTxReady_IBUF_2838;
  wire \DB7/SClock_2839 ;
  wire Frame_IBUF_2840;
  wire ADEx_0_IBUF_2841;
  wire ADEx_1_IBUF_2842;
  wire \DB7/StrobeOut_2844 ;
  wire \Host/USBDir_2847 ;
  wire \x86/BusOutEnable_2858 ;
  wire N611;
  wire N60;
  wire N511;
  wire N591;
  wire N50;
  wire N58;
  wire N49;
  wire N571;
  wire N48;
  wire N56;
  wire N47;
  wire N55;
  wire N46;
  wire N54;
  wire N45;
  wire N53;
  wire N44;
  wire N521;
  wire \DB7/State_FSM_FFd1_2902 ;
  wire x86_Dout_6_mux00007;
  wire \x86/State_FSM_FFd2_2904 ;
  wire N26_0;
  wire \x86/State_FSM_FFd3_2906 ;
  wire \x86/State_FSM_FFd1_2907 ;
  wire x86_Hold_2908;
  wire x86_Dout_8_cmp_eq0004_0;
  wire N01;
  wire N7;
  wire \DB7/Ready_2916 ;
  wire N97_0;
  wire x86_Hold_and0001;
  wire x86_Dout_17_mux00003;
  wire x86_Dout_1_mux00006;
  wire \x86/TReady_2922 ;
  wire \x86/LastFrame_2923 ;
  wire N162_0;
  wire x86_to_DB7_2925;
  wire \DB7/State_FSM_FFd5_2927 ;
  wire \DB7/N112_0 ;
  wire \DB7/N14 ;
  wire \DB7/N411 ;
  wire \DB7/SDO13_0 ;
  wire \DB7/SDO85 ;
  wire \DB7/SDO28_0 ;
  wire \DB7/SDO179 ;
  wire \DB7/SDO236 ;
  wire \DB7/SDO401_0 ;
  wire N191;
  wire \DB7/SDO304 ;
  wire \DB7/SDO357 ;
  wire N63;
  wire x86_Dout_0_cmp_eq0002;
  wire N141;
  wire \DB7/StrobeTimer_or0000 ;
  wire \DB7/StrobeTimer_mux0000<2>_SW0/O ;
  wire \DB7/N28_0 ;
  wire \DB7/N13 ;
  wire x86_Read_0;
  wire \ReadFromHost_not0001_SW0_SW0/O ;
  wire ReadFromHost_2977;
  wire x86_Active_2978;
  wire \DB7/State_FSM_FFd5-In24_SW1/O ;
  wire \DB7/State_FSM_FFd3_2981 ;
  wire \DB7/State_FSM_FFd5-In19_0 ;
  wire \DB7/State_FSM_FFd5-In11/O ;
  wire \DB7/State_FSM_FFd5-In31_0 ;
  wire \DB7/State_FSM_FFd5-In5_0 ;
  wire \DB7/N7 ;
  wire \x86_Dout_0_mux000027_SW0/O ;
  wire \Host/RxBufferFull_2988 ;
  wire x86_Dout_0_mux000027_0;
  wire x86_Dout_0_and0000_0;
  wire N11;
  wire \x86_Dout_0_mux0000128/O ;
  wire N142_0;
  wire x86_Dout_0_mux00005_0;
  wire \x86_Dout_1_mux000038/O ;
  wire \Host/TxDone_2997 ;
  wire x86_Dout_1_mux000039_0;
  wire \x86_Dout_1_mux000020/O ;
  wire N213_0;
  wire N16;
  wire x86_Dout_2_mux00000_0;
  wire \x86_Dout_2_mux000011/O ;
  wire x86_Dout_2_mux00001_0;
  wire N207_0;
  wire x86_to_DB7_cmp_eq0000;
  wire \x86_Hold_mux000220/O ;
  wire x86_Hold_mux000210_0;
  wire x86_Dout_8_cmp_eq0000;
  wire x86_Hold_mux000236_0;
  wire \x86_Dout_3_mux000023_SW0/O ;
  wire x86_Dout_3_mux000023_0;
  wire \x86_Hold_mux000281/O ;
  wire x86_Hold_mux000269_0;
  wire \x86_Dout_3_mux000010/O ;
  wire x86_Dout_3_mux00000_0;
  wire N209_0;
  wire x86_Dout_4_mux00001_0;
  wire x86_Dout_4_mux00004_0;
  wire x86_Dout_4_mux000011_0;
  wire x86_Dout_4_mux000021_0;
  wire \x86_Dout_4_mux00000/O ;
  wire x86_to_DB7_and0001;
  wire \x86/IOWrite_3029 ;
  wire \x86/IORead_3030 ;
  wire \x86_Dout_5_mux00006/O ;
  wire N108_0;
  wire \DB7/State_FSM_FFd2_3034 ;
  wire x86_Dout_5_mux000017_0;
  wire x86_Dout_6_mux00000_0;
  wire \x86_Dout_6_mux000021/O ;
  wire N2111_0;
  wire x86_Dout_7_mux00000_0;
  wire \x86_Dout_7_mux000011/O ;
  wire x86_Dout_7_mux00001_0;
  wire N205_0;
  wire x86_Dout_8_mux000024_0;
  wire x86_Dout_10_mux000025_0;
  wire x86_Dout_8_mux00009_0;
  wire \x86_Dout_8_mux00004/O ;
  wire N5_0;
  wire N17_0;
  wire x86_Write_0;
  wire LEDIndex_and0003;
  wire LEDRegister_and0000_0;
  wire N103_0;
  wire \DB7/State_cmp_eq0001_0 ;
  wire \DB7/StrobeTimer_mux0000<0>13/O ;
  wire N178_0;
  wire x86_Dout_9_mux000024_0;
  wire x86_Dout_9_mux00009_0;
  wire \x86_Dout_9_mux00004/O ;
  wire \DB7/N16_0 ;
  wire \DB7/StrobeTimer_mux0000<1>16_0 ;
  wire N184_0;
  wire \DB7/StrobeTimer_mux0000<1>25_SW1/O ;
  wire \DB7/StrobeTimer_mux0000<1>8_0 ;
  wire \DB7/StrobeTimer_mux0000<4>17_0 ;
  wire \DB7/StrobeTimer_mux0000<4>5/O ;
  wire \x86/IORead_and0000 ;
  wire \x86/AddressLatch_not0001_0 ;
  wire DataToHost_or0000_3080;
  wire N176_0;
  wire DataToHost_and0000_0;
  wire \Host/PuttingByte_cmp_eq0000 ;
  wire WriteToHost_3084;
  wire \Host/PuttingByte_cmp_ne0000 ;
  wire \Host/GettingByte_FSM_FFd2_3086 ;
  wire \Host/GettingByte_FSM_FFd1_3087 ;
  wire \Host/USBDir_mux000024_0 ;
  wire \DB7/N18 ;
  wire N174_0;
  wire \DB7/ShiftCount_mux0001<0>26/O ;
  wire \DB7/ShiftCount_mux0001<0>8_0 ;
  wire \Host/USBDir_mux00007/O ;
  wire \DB7/ShiftCount_mux0001<1>25_0 ;
  wire \DB7/ShiftCount_mux0001<1>20/O ;
  wire \DB7/State_FSM_FFd4_3097 ;
  wire N22;
  wire N15;
  wire x86_Dout_15_mux00009_0;
  wire N51_0;
  wire \x86/State_cmp_ne0000 ;
  wire \x86/ConfigData_and0000_0 ;
  wire N4_0;
  wire \x86/State_cmp_eq0003_0 ;
  wire N59;
  wire \x86/IORead_and0001 ;
  wire \DB7/State_FSM_FFd2-In21_SW0/O ;
  wire \DB7/Shifting_mux00000_0 ;
  wire \x86_to_DB7_not00011_SW0/O ;
  wire \DB7/Ready_mux00008/O ;
  wire N152_0;
  wire \DB7/Shifting_and0000_0 ;
  wire \DB7_Dout_and00001_SW0/O ;
  wire DB7_Dout_and0000_0;
  wire \DB7/StrobeOut_mux000116_0 ;
  wire \DB7/StrobeOut_mux00017_0 ;
  wire \DB7/StrobeOut_mux000123/O ;
  wire N144_0;
  wire N156_0;
  wire N154_0;
  wire N114_0;
  wire N29_0;
  wire x86_Dout_10_mux000024_0;
  wire x86_Dout_10_mux00009_0;
  wire \x86_Dout_10_mux000041/O ;
  wire \x86_Hold_cmp_eq00011/O ;
  wire N20_0;
  wire x86_Dout_11_mux000024_0;
  wire x86_Dout_11_mux00009_0;
  wire \x86_Dout_11_mux00004/O ;
  wire x86_Dout_12_mux00009_0;
  wire \x86_Dout_12_mux00004/O ;
  wire x86_Dout_13_mux00009_0;
  wire \x86_Dout_13_mux00004/O ;
  wire x86_Dout_14_mux00009_0;
  wire \x86_Dout_14_mux00004/O ;
  wire \x86/State_FSM_FFd2-In33_SW0/O ;
  wire N203_0;
  wire \x86_Dout_15_mux00004/O ;
  wire \x86_Dout_17_mux0000111_SW0/O ;
  wire \DB7/StrobeOut_mux00015_0 ;
  wire N211_0;
  wire N126_0;
  wire \DB7/Shifting_3167 ;
  wire \DB7/Shifting_mux000010/O ;
  wire N146_0;
  wire LEDShift_and000020_0;
  wire \x86_Dout_16_mux0000_SW0_SW0/O ;
  wire \DB7/State_FSM_FFd1-In1_SW0/O ;
  wire \DB7/N3_0 ;
  wire \DB7/State_FSM_FFd1-In_SW1/O ;
  wire \DB7/State_FSM_FFd1-In21/O ;
  wire \Host/PuttingByte_FSM_FFd2_3179 ;
  wire \Host/PuttingByte_FSM_FFd1_3180 ;
  wire \x86/ConfigRead_3183 ;
  wire N2_0;
  wire N6;
  wire N14;
  wire \Host/PuttingByte_cmp_eq0002_0 ;
  wire \x86/State_FSM_FFd2-In14_0 ;
  wire \Host/RxData_not0001_0 ;
  wire N31_0;
  wire \x86/State_cmp_eq0000_0 ;
  wire LEDIndex_and0000_0;
  wire x86_Dout_0_mux0000120_0;
  wire N193_0;
  wire \x86/Configured_and0001_0 ;
  wire x86_Dout_0_cmp_eq0001;
  wire LEDShift_and00002;
  wire \DB7/DiagData_3227 ;
  wire N57;
  wire \x86/State_cmp_eq0006_0 ;
  wire N19;
  wire N182;
  wire N02;
  wire \DB7/Accumulator_and0000_0 ;
  wire DB7_Address_not0001_0;
  wire \x86/ConfigData_and0000128_3250 ;
  wire N139_0;
  wire N138_0;
  wire \DB7/AddressPhase_mux000139_3253 ;
  wire \DB7/Diagnose_3254 ;
  wire \x86/FSMActive_mux0000218_3255 ;
  wire \x86/FSMActive_mux0000220_0 ;
  wire N168_0;
  wire \x86/ConfigRead_mux000011_3260 ;
  wire N180_0;
  wire N197;
  wire \x86/IORead_and000118_0 ;
  wire \x86/IORead_and000136_3265 ;
  wire N195_0;
  wire \x86/IORead_and000161_3267 ;
  wire N199_0;
  wire N161;
  wire N8;
  wire \Host/RCount<0>/DXMUX_3323 ;
  wire \Host/RCount<0>/XORF_3321 ;
  wire \Host/RCount<0>/LOGIC_ONE_3320 ;
  wire \Host/RCount<0>/CYINIT_3319 ;
  wire \Host/RCount<0>/CYSELF_3310 ;
  wire \Host/RCount<0>/BXINV_3308 ;
  wire \Host/RCount<0>/DYMUX_3300 ;
  wire \Host/RCount<0>/XORG_3298 ;
  wire \Host/RCount<0>/CYMUXG_3297 ;
  wire \Host/Mcount_RCount_cy[0] ;
  wire \Host/RCount<0>/LOGIC_ZERO_3295 ;
  wire \Host/RCount<0>/CYSELG_3286 ;
  wire \Host/RCount<0>/G ;
  wire \Host/RCount<0>/SRINVNOT ;
  wire \Host/RCount<0>/CLKINV_3283 ;
  wire \Host/RCount<0>/CEINV_3282 ;
  wire \Host/RCount<2>/DXMUX_3383 ;
  wire \Host/RCount<2>/XORF_3381 ;
  wire \Host/RCount<2>/CYINIT_3380 ;
  wire \Host/RCount<2>/F ;
  wire \Host/RCount<2>/DYMUX_3363 ;
  wire \Host/RCount<2>/XORG_3361 ;
  wire \Host/Mcount_RCount_cy[2] ;
  wire \Host/RCount<2>/CYSELF_3359 ;
  wire \Host/RCount<2>/CYMUXFAST_3358 ;
  wire \Host/RCount<2>/CYAND_3357 ;
  wire \Host/RCount<2>/FASTCARRY_3356 ;
  wire \Host/RCount<2>/CYMUXG2_3355 ;
  wire \Host/RCount<2>/CYMUXF2_3354 ;
  wire \Host/RCount<2>/LOGIC_ZERO_3353 ;
  wire \Host/RCount<2>/CYSELG_3344 ;
  wire \Host/RCount<2>/G ;
  wire \Host/RCount<2>/SRINVNOT ;
  wire \Host/RCount<2>/CLKINV_3341 ;
  wire \Host/RCount<2>/CEINV_3340 ;
  wire \Host/RCount<4>/DXMUX_3443 ;
  wire \Host/RCount<4>/XORF_3441 ;
  wire \Host/RCount<4>/CYINIT_3440 ;
  wire \Host/RCount<4>/F ;
  wire \Host/RCount<4>/DYMUX_3423 ;
  wire \Host/RCount<4>/XORG_3421 ;
  wire \Host/Mcount_RCount_cy[4] ;
  wire \Host/RCount<4>/CYSELF_3419 ;
  wire \Host/RCount<4>/CYMUXFAST_3418 ;
  wire \Host/RCount<4>/CYAND_3417 ;
  wire \Host/RCount<4>/FASTCARRY_3416 ;
  wire \Host/RCount<4>/CYMUXG2_3415 ;
  wire \Host/RCount<4>/CYMUXF2_3414 ;
  wire \Host/RCount<4>/LOGIC_ZERO_3413 ;
  wire \Host/RCount<4>/CYSELG_3404 ;
  wire \Host/RCount<4>/G ;
  wire \Host/RCount<4>/SRINVNOT ;
  wire \Host/RCount<4>/CLKINV_3401 ;
  wire \Host/RCount<4>/CEINV_3400 ;
  wire \Host/RCount<6>/DXMUX_3496 ;
  wire \Host/RCount<6>/XORF_3494 ;
  wire \Host/RCount<6>/LOGIC_ZERO_3493 ;
  wire \Host/RCount<6>/CYINIT_3492 ;
  wire \Host/RCount<6>/CYSELF_3483 ;
  wire \Host/RCount<6>/F ;
  wire \Host/RCount<6>/DYMUX_3474 ;
  wire \Host/RCount<6>/XORG_3472 ;
  wire \Host/Mcount_RCount_cy[6] ;
  wire \Host/RCount<7>_rt_3469 ;
  wire \Host/RCount<6>/SRINVNOT ;
  wire \Host/RCount<6>/CLKINV_3460 ;
  wire \Host/RCount<6>/CEINV_3459 ;
  wire \Host/WCount<0>/DXMUX_3554 ;
  wire \Host/WCount<0>/XORF_3552 ;
  wire \Host/WCount<0>/LOGIC_ONE_3551 ;
  wire \Host/WCount<0>/CYINIT_3550 ;
  wire \Host/WCount<0>/CYSELF_3541 ;
  wire \Host/WCount<0>/BXINV_3539 ;
  wire \Host/WCount<0>/DYMUX_3531 ;
  wire \Host/WCount<0>/XORG_3529 ;
  wire \Host/WCount<0>/CYMUXG_3528 ;
  wire \Host/Mcount_WCount_cy[0] ;
  wire \Host/WCount<0>/LOGIC_ZERO_3526 ;
  wire \Host/WCount<0>/CYSELG_3517 ;
  wire \Host/WCount<0>/G ;
  wire \Host/WCount<0>/SRINVNOT ;
  wire \Host/WCount<0>/CLKINV_3514 ;
  wire \Host/WCount<0>/CEINV_3513 ;
  wire \Host/WCount<2>/DXMUX_3614 ;
  wire \Host/WCount<2>/XORF_3612 ;
  wire \Host/WCount<2>/CYINIT_3611 ;
  wire \Host/WCount<2>/F ;
  wire \Host/WCount<2>/DYMUX_3594 ;
  wire \Host/WCount<2>/XORG_3592 ;
  wire \Host/Mcount_WCount_cy[2] ;
  wire \Host/WCount<2>/CYSELF_3590 ;
  wire \Host/WCount<2>/CYMUXFAST_3589 ;
  wire \Host/WCount<2>/CYAND_3588 ;
  wire \Host/WCount<2>/FASTCARRY_3587 ;
  wire \Host/WCount<2>/CYMUXG2_3586 ;
  wire \Host/WCount<2>/CYMUXF2_3585 ;
  wire \Host/WCount<2>/LOGIC_ZERO_3584 ;
  wire \Host/WCount<2>/CYSELG_3575 ;
  wire \Host/WCount<2>/G ;
  wire \Host/WCount<2>/SRINVNOT ;
  wire \Host/WCount<2>/CLKINV_3572 ;
  wire \Host/WCount<2>/CEINV_3571 ;
  wire \Host/WCount<4>/DXMUX_3674 ;
  wire \Host/WCount<4>/XORF_3672 ;
  wire \Host/WCount<4>/CYINIT_3671 ;
  wire \Host/WCount<4>/F ;
  wire \Host/WCount<4>/DYMUX_3654 ;
  wire \Host/WCount<4>/XORG_3652 ;
  wire \Host/Mcount_WCount_cy[4] ;
  wire \Host/WCount<4>/CYSELF_3650 ;
  wire \Host/WCount<4>/CYMUXFAST_3649 ;
  wire \Host/WCount<4>/CYAND_3648 ;
  wire \Host/WCount<4>/FASTCARRY_3647 ;
  wire \Host/WCount<4>/CYMUXG2_3646 ;
  wire \Host/WCount<4>/CYMUXF2_3645 ;
  wire \Host/WCount<4>/LOGIC_ZERO_3644 ;
  wire \Host/WCount<4>/CYSELG_3635 ;
  wire \Host/WCount<4>/G ;
  wire \Host/WCount<4>/SRINVNOT ;
  wire \Host/WCount<4>/CLKINV_3632 ;
  wire \Host/WCount<4>/CEINV_3631 ;
  wire \Host/WCount<6>/DXMUX_3727 ;
  wire \Host/WCount<6>/XORF_3725 ;
  wire \Host/WCount<6>/LOGIC_ZERO_3724 ;
  wire \Host/WCount<6>/CYINIT_3723 ;
  wire \Host/WCount<6>/CYSELF_3714 ;
  wire \Host/WCount<6>/F ;
  wire \Host/WCount<6>/DYMUX_3705 ;
  wire \Host/WCount<6>/XORG_3703 ;
  wire \Host/Mcount_WCount_cy[6] ;
  wire \Host/WCount<7>_rt_3700 ;
  wire \Host/WCount<6>/SRINVNOT ;
  wire \Host/WCount<6>/CLKINV_3691 ;
  wire \Host/WCount<6>/CEINV_3690 ;
  wire \Scaler<0>/DXMUX_3784 ;
  wire \Scaler<0>/XORF_3782 ;
  wire \Scaler<0>/CYINIT_3781 ;
  wire \Scaler<0>/CYSELF_3774 ;
  wire \Scaler<0>/DYMUX_3764 ;
  wire \Scaler<0>/XORG_3762 ;
  wire \Scaler<0>/CYMUXG_3761 ;
  wire \Mcount_Scaler_cy[0] ;
  wire \Scaler<0>/LOGIC_ZERO_3759 ;
  wire \Scaler<0>/CYSELG_3752 ;
  wire \Scaler<0>/SRINVNOT ;
  wire \Scaler<0>/CLKINV_3749 ;
  wire \Scaler<0>/CEINV_3748 ;
  wire \Scaler<2>/DXMUX_3844 ;
  wire \Scaler<2>/XORF_3842 ;
  wire \Scaler<2>/CYINIT_3841 ;
  wire \Scaler<2>/DYMUX_3826 ;
  wire \Scaler<2>/XORG_3824 ;
  wire \Mcount_Scaler_cy[2] ;
  wire \Scaler<2>/CYSELF_3822 ;
  wire \Scaler<2>/CYMUXFAST_3821 ;
  wire \Scaler<2>/CYAND_3820 ;
  wire \Scaler<2>/FASTCARRY_3819 ;
  wire \Scaler<2>/CYMUXG2_3818 ;
  wire \Scaler<2>/CYMUXF2_3817 ;
  wire \Scaler<2>/LOGIC_ZERO_3816 ;
  wire \Scaler<2>/CYSELG_3809 ;
  wire \Scaler<2>/SRINVNOT ;
  wire \Scaler<2>/CLKINV_3806 ;
  wire \Scaler<2>/CEINV_3805 ;
  wire \Scaler<4>/DXMUX_3904 ;
  wire \Scaler<4>/XORF_3902 ;
  wire \Scaler<4>/CYINIT_3901 ;
  wire \Scaler<4>/DYMUX_3886 ;
  wire \Scaler<4>/XORG_3884 ;
  wire \Mcount_Scaler_cy[4] ;
  wire \Scaler<4>/CYSELF_3882 ;
  wire \Scaler<4>/CYMUXFAST_3881 ;
  wire \Scaler<4>/CYAND_3880 ;
  wire \Scaler<4>/FASTCARRY_3879 ;
  wire \Scaler<4>/CYMUXG2_3878 ;
  wire \Scaler<4>/CYMUXF2_3877 ;
  wire \Scaler<4>/LOGIC_ZERO_3876 ;
  wire \Scaler<4>/CYSELG_3869 ;
  wire \Scaler<4>/SRINVNOT ;
  wire \Scaler<4>/CLKINV_3866 ;
  wire \Scaler<4>/CEINV_3865 ;
  wire \Scaler<6>/DXMUX_3964 ;
  wire \Scaler<6>/XORF_3962 ;
  wire \Scaler<6>/CYINIT_3961 ;
  wire \Scaler<6>/DYMUX_3946 ;
  wire \Scaler<6>/XORG_3944 ;
  wire \Mcount_Scaler_cy[6] ;
  wire \Scaler<6>/CYSELF_3942 ;
  wire \Scaler<6>/CYMUXFAST_3941 ;
  wire \Scaler<6>/CYAND_3940 ;
  wire \Scaler<6>/FASTCARRY_3939 ;
  wire \Scaler<6>/CYMUXG2_3938 ;
  wire \Scaler<6>/CYMUXF2_3937 ;
  wire \Scaler<6>/LOGIC_ZERO_3936 ;
  wire \Scaler<6>/CYSELG_3929 ;
  wire \Scaler<6>/SRINVNOT ;
  wire \Scaler<6>/CLKINV_3926 ;
  wire \Scaler<6>/CEINV_3925 ;
  wire \Scaler<8>/DXMUX_4024 ;
  wire \Scaler<8>/XORF_4022 ;
  wire \Scaler<8>/CYINIT_4021 ;
  wire \Scaler<8>/DYMUX_4006 ;
  wire \Scaler<8>/XORG_4004 ;
  wire \Mcount_Scaler_cy[8] ;
  wire \Scaler<8>/CYSELF_4002 ;
  wire \Scaler<8>/CYMUXFAST_4001 ;
  wire \Scaler<8>/CYAND_4000 ;
  wire \Scaler<8>/FASTCARRY_3999 ;
  wire \Scaler<8>/CYMUXG2_3998 ;
  wire \Scaler<8>/CYMUXF2_3997 ;
  wire \Scaler<8>/LOGIC_ZERO_3996 ;
  wire \Scaler<8>/CYSELG_3989 ;
  wire \Scaler<8>/SRINVNOT ;
  wire \Scaler<8>/CLKINV_3986 ;
  wire \Scaler<8>/CEINV_3985 ;
  wire \Scaler<10>/DXMUX_4084 ;
  wire \Scaler<10>/XORF_4082 ;
  wire \Scaler<10>/CYINIT_4081 ;
  wire \Scaler<10>/DYMUX_4066 ;
  wire \Scaler<10>/XORG_4064 ;
  wire \Mcount_Scaler_cy[10] ;
  wire \Scaler<10>/CYSELF_4062 ;
  wire \Scaler<10>/CYMUXFAST_4061 ;
  wire \Scaler<10>/CYAND_4060 ;
  wire \Scaler<10>/FASTCARRY_4059 ;
  wire \Scaler<10>/CYMUXG2_4058 ;
  wire \Scaler<10>/CYMUXF2_4057 ;
  wire \Scaler<10>/LOGIC_ZERO_4056 ;
  wire \Scaler<10>/CYSELG_4049 ;
  wire \Scaler<10>/SRINVNOT ;
  wire \Scaler<10>/CLKINV_4046 ;
  wire \Scaler<10>/CEINV_4045 ;
  wire \Scaler<12>/DXMUX_4144 ;
  wire \Scaler<12>/XORF_4142 ;
  wire \Scaler<12>/CYINIT_4141 ;
  wire \Scaler<12>/DYMUX_4126 ;
  wire \Scaler<12>/XORG_4124 ;
  wire \Mcount_Scaler_cy[12] ;
  wire \Scaler<12>/CYSELF_4122 ;
  wire \Scaler<12>/CYMUXFAST_4121 ;
  wire \Scaler<12>/CYAND_4120 ;
  wire \Scaler<12>/FASTCARRY_4119 ;
  wire \Scaler<12>/CYMUXG2_4118 ;
  wire \Scaler<12>/CYMUXF2_4117 ;
  wire \Scaler<12>/LOGIC_ZERO_4116 ;
  wire \Scaler<12>/CYSELG_4109 ;
  wire \Scaler<12>/SRINVNOT ;
  wire \Scaler<12>/CLKINV_4106 ;
  wire \Scaler<12>/CEINV_4105 ;
  wire \Scaler<14>/DXMUX_4197 ;
  wire \Scaler<14>/XORF_4195 ;
  wire \Scaler<14>/LOGIC_ZERO_4194 ;
  wire \Scaler<14>/CYINIT_4193 ;
  wire \Scaler<14>/CYSELF_4186 ;
  wire \Scaler<14>/DYMUX_4177 ;
  wire \Scaler<14>/XORG_4175 ;
  wire \Mcount_Scaler_cy[14] ;
  wire \Scaler<14>/SRINVNOT ;
  wire \Scaler<14>/CLKINV_4165 ;
  wire \Scaler<14>/CEINV_4164 ;
  wire \Mmux__varindex0000_4_f5/F5MUX_4234 ;
  wire Mmux__varindex0000_5_4232;
  wire \Mmux__varindex0000_4_f5/BXINV_4226 ;
  wire \Mmux__varindex0000_4_f5/F6MUX_4225 ;
  wire Mmux__varindex0000_6_4223;
  wire \Mmux__varindex0000_4_f5/BYINV_4217 ;
  wire \_varindex0000/F5MUX_4265 ;
  wire Mmux__varindex0000_61_4263;
  wire \_varindex0000/BXINV_4257 ;
  wire \_varindex0000/F6MUX_4255 ;
  wire Mmux__varindex0000_7_4253;
  wire \_varindex0000/BYINV_4247 ;
  wire \Mmux__varindex0000_5_f51/F5MUX_4295 ;
  wire Mmux__varindex0000_62_4293;
  wire \Mmux__varindex0000_5_f51/BXINV_4287 ;
  wire \Mmux__varindex0000_5_f51/F6MUX_4286 ;
  wire Mmux__varindex0000_71_4284;
  wire \Mmux__varindex0000_5_f51/BYINV_4278 ;
  wire \Mmux__varindex0000_6_f5/F5MUX_4319 ;
  wire Mmux__varindex0000_72_4317;
  wire \Mmux__varindex0000_6_f5/BXINV_4311 ;
  wire Mmux__varindex0000_8_4309;
  wire \PCI_Clock/INBUF ;
  wire \CBE<0>/INBUF ;
  wire \CBE<1>/INBUF ;
  wire \CBE<2>/INBUF ;
  wire \CBE<3>/INBUF ;
  wire \SSDOut/O ;
  wire \USBWrite/O ;
  wire \SSAddr/O ;
  wire \IRdy/INBUF ;
  wire \TRdy/O ;
  wire \TRdy/T ;
  wire \PCI_Reset/INBUF ;
  wire \DData/O ;
  wire \DData/T ;
  wire \DData/INBUF ;
  wire \DevSel/O ;
  wire \DevSel/T ;
  wire \IDSel/INBUF ;
  wire \USBRead/O ;
  wire \USBRxValid/INBUF ;
  wire \SSDIn/INBUF ;
  wire \USBTxReady/INBUF ;
  wire \LED/O ;
  wire \SSAck/INBUF ;
  wire \SSClock/O ;
  wire \Frame/INBUF ;
  wire \ADEx<0>/INBUF ;
  wire \ADEx<1>/INBUF ;
  wire \DClock/O ;
  wire \SSStrobe/O ;
  wire \Probe/O ;
  wire \USBData<0>/O ;
  wire \USBData<0>/T ;
  wire \USBData<0>/INBUF ;
  wire \USBData<1>/O ;
  wire \USBData<1>/T ;
  wire \USBData<1>/INBUF ;
  wire \USBData<2>/O ;
  wire \USBData<2>/T ;
  wire \USBData<2>/INBUF ;
  wire \USBData<3>/O ;
  wire \USBData<3>/T ;
  wire \USBData<3>/INBUF ;
  wire \USBData<4>/O ;
  wire \USBData<4>/T ;
  wire \USBData<4>/INBUF ;
  wire \AD<0>/O ;
  wire \AD<0>/T ;
  wire \AD<0>/INBUF ;
  wire \USBData<5>/O ;
  wire \USBData<5>/T ;
  wire \USBData<5>/INBUF ;
  wire \AD<1>/O ;
  wire \AD<1>/T ;
  wire \AD<1>/INBUF ;
  wire \AD<10>/O ;
  wire \AD<10>/T ;
  wire \AD<10>/INBUF ;
  wire \USBData<6>/O ;
  wire \USBData<6>/T ;
  wire \USBData<6>/INBUF ;
  wire \AD<2>/O ;
  wire \AD<2>/T ;
  wire \AD<2>/INBUF ;
  wire \AD<11>/O ;
  wire \AD<11>/T ;
  wire \AD<11>/INBUF ;
  wire \USBData<7>/O ;
  wire \USBData<7>/T ;
  wire \USBData<7>/INBUF ;
  wire \AD<3>/O ;
  wire \AD<3>/T ;
  wire \AD<3>/INBUF ;
  wire \AD<12>/O ;
  wire \AD<12>/T ;
  wire \AD<12>/INBUF ;
  wire \AD<4>/O ;
  wire \AD<4>/T ;
  wire \AD<4>/INBUF ;
  wire \AD<13>/O ;
  wire \AD<13>/T ;
  wire \AD<13>/INBUF ;
  wire \AD<5>/O ;
  wire \AD<5>/T ;
  wire \AD<5>/INBUF ;
  wire \AD<14>/O ;
  wire \AD<14>/T ;
  wire \AD<14>/INBUF ;
  wire \AD<6>/O ;
  wire \AD<6>/T ;
  wire \AD<6>/INBUF ;
  wire \AD<15>/O ;
  wire \AD<15>/T ;
  wire \AD<15>/INBUF ;
  wire \AD<7>/O ;
  wire \AD<7>/T ;
  wire \AD<7>/INBUF ;
  wire \AD<16>/O ;
  wire \AD<16>/T ;
  wire \AD<16>/INBUF ;
  wire \AD<8>/O ;
  wire \AD<8>/T ;
  wire \AD<8>/INBUF ;
  wire \AD<17>/O ;
  wire \AD<17>/T ;
  wire \AD<17>/INBUF ;
  wire \AD<9>/O ;
  wire \AD<9>/T ;
  wire \AD<9>/INBUF ;
  wire \PCI_Clock_IBUF_BUFG/S_INVNOT ;
  wire \PCI_Clock_IBUF_BUFG/I0_INV ;
  wire \x86_Dout_6_mux00007/F5MUX_5109 ;
  wire N232;
  wire \x86_Dout_6_mux00007/BXINV_5102 ;
  wire N231;
  wire \x86/BusOutEnable/DXMUX_5140 ;
  wire \x86/BusOutEnable/F5MUX_5138 ;
  wire N218;
  wire \x86/BusOutEnable/BXINV_5131 ;
  wire N217;
  wire \x86/BusOutEnable/CLKINV_5123 ;
  wire \N7/F5MUX_5170 ;
  wire N240;
  wire \N7/BXINV_5163 ;
  wire N239;
  wire \x86_Dout_17_mux00003/F5MUX_5195 ;
  wire N190;
  wire \x86_Dout_17_mux00003/BXINV_5188 ;
  wire N189;
  wire \x86_Dout_1_mux00006/F5MUX_5220 ;
  wire N234;
  wire \x86_Dout_1_mux00006/BXINV_5213 ;
  wire N233;
  wire \x86/TReady/DXMUX_5251 ;
  wire \x86/TReady/F5MUX_5249 ;
  wire N216;
  wire \x86/TReady/BXINV_5242 ;
  wire N215;
  wire \x86/TReady/CLKINV_5234 ;
  wire \x86/State_FSM_FFd3/FFX/RST ;
  wire \x86/State_FSM_FFd3/DXMUX_5287 ;
  wire \x86/State_FSM_FFd3/F5MUX_5285 ;
  wire N236;
  wire \x86/State_FSM_FFd3/BXINV_5277 ;
  wire N235;
  wire \x86/State_FSM_FFd3/CLKINV_5269 ;
  wire \DB7/SClock/FFX/RST ;
  wire \DB7/SClock/DXMUX_5325 ;
  wire \DB7/SClock/F5MUX_5323 ;
  wire \DB7/SClock_mux00002 ;
  wire \DB7/SClock/BXINV_5316 ;
  wire \DB7/SClock_mux000021_5314 ;
  wire \DB7/SClock/CLKINV_5305 ;
  wire \DB7/SClock/CEINV_5304 ;
  wire \DB7/ShiftCount<1>/DXMUX_5362 ;
  wire \DB7/ShiftCount<1>/F5MUX_5360 ;
  wire \DB7/ShiftCount_mux0001<2>1_5358 ;
  wire \DB7/ShiftCount<1>/BXINV_5352 ;
  wire \DB7/ShiftCount_mux0001<2>2_5350 ;
  wire \DB7/ShiftCount<1>/CLKINV_5343 ;
  wire \DB7/ShiftCount<1>/CEINV_5342 ;
  wire \N191/F5MUX_5390 ;
  wire N230;
  wire \N191/BXINV_5383 ;
  wire N229;
  wire \DB7/SDO304/F5MUX_5415 ;
  wire N224;
  wire \DB7/SDO304/BXINV_5407 ;
  wire N223;
  wire \DB7/SDO236/F5MUX_5440 ;
  wire N228;
  wire \DB7/SDO236/BXINV_5433 ;
  wire N227;
  wire \DB7/SDO179/F5MUX_5465 ;
  wire N222;
  wire \DB7/SDO179/BXINV_5458 ;
  wire N221;
  wire \DB7/SDO357/F5MUX_5490 ;
  wire N226;
  wire \DB7/SDO357/BXINV_5482 ;
  wire N225;
  wire \x86/Selected/DXMUX_5521 ;
  wire \x86/Selected/F5MUX_5519 ;
  wire N238;
  wire \x86/Selected/BXINV_5512 ;
  wire N237;
  wire \x86/Selected/CLKINV_5504 ;
  wire \DB7/SDO85/F5MUX_5551 ;
  wire N220;
  wire \DB7/SDO85/BXINV_5543 ;
  wire N219;
  wire \N141/F5MUX_5576 ;
  wire N188;
  wire \N141/BXINV_5569 ;
  wire \N141/G ;
  wire \DB7/StrobeTimer<5>/DXMUX_5606 ;
  wire \DB7/StrobeTimer_mux0000<2>_SW0/O_pack_2 ;
  wire \DB7/StrobeTimer<5>/CLKINV_5589 ;
  wire \DB7/StrobeTimer<5>/CEINV_5588 ;
  wire ReadFromHost_not0001_5632;
  wire \ReadFromHost_not0001_SW0_SW0/O_pack_1 ;
  wire \DB7/State_FSM_FFd5-In19_5656 ;
  wire \DB7/State_FSM_FFd5-In24_SW1/O_pack_1 ;
  wire \DB7/State_FSM_FFd5/DXMUX_5687 ;
  wire \DB7/State_FSM_FFd5-In ;
  wire \DB7/State_FSM_FFd5-In11/O_pack_1 ;
  wire \DB7/State_FSM_FFd5/SRINVNOT ;
  wire \DB7/State_FSM_FFd5/CLKINV_5670 ;
  wire x86_Dout_0_mux000027_5714;
  wire \x86_Dout_0_mux000027_SW0/O_pack_1 ;
  wire \x86_Dout<0>/DXMUX_5745 ;
  wire x86_Dout_0_mux0000;
  wire \x86_Dout_0_mux0000128/O_pack_2 ;
  wire \x86_Dout<0>/CLKINV_5730 ;
  wire \x86_Dout<0>/CEINV_5729 ;
  wire x86_Dout_1_mux000039_5771;
  wire \x86_Dout_1_mux000038/O_pack_1 ;
  wire \x86_Dout<1>/DXMUX_5802 ;
  wire x86_Dout_1_mux0000;
  wire \x86_Dout_1_mux000020/O_pack_2 ;
  wire \x86_Dout<1>/CLKINV_5787 ;
  wire \x86_Dout<1>/CEINV_5786 ;
  wire \x86_Dout<2>/DXMUX_5835 ;
  wire x86_Dout_2_mux0000;
  wire \x86_Dout_2_mux000011/O_pack_2 ;
  wire \x86_Dout<2>/CLKINV_5820 ;
  wire \x86_Dout<2>/CEINV_5819 ;
  wire x86_Hold_mux000236_5861;
  wire \x86_Hold_mux000220/O_pack_1 ;
  wire x86_Dout_3_mux000023_5885;
  wire \x86_Dout_3_mux000023_SW0/O_pack_1 ;
  wire \x86_Hold/DXMUX_5918 ;
  wire x86_Hold_mux0002;
  wire \x86_Hold_mux000281/O_pack_2 ;
  wire \x86_Hold/CLKINV_5901 ;
  wire \x86_Hold/CEINV_5900 ;
  wire \x86_Hold/FFX/RSTAND_5924 ;
  wire \x86_Dout<3>/DXMUX_5954 ;
  wire x86_Dout_3_mux0000;
  wire \x86_Dout_3_mux000010/O_pack_2 ;
  wire \x86_Dout<3>/CLKINV_5939 ;
  wire \x86_Dout<3>/CEINV_5938 ;
  wire x86_Dout_4_mux000021_5980;
  wire N16_pack_1;
  wire \x86_Dout<4>/DXMUX_6011 ;
  wire x86_Dout_4_mux0000;
  wire \x86_Dout_4_mux00000/O_pack_2 ;
  wire \x86_Dout<4>/CLKINV_5996 ;
  wire \x86_Dout<4>/CEINV_5995 ;
  wire x86_Hold_not0001;
  wire x86_to_DB7_and0001_pack_1;
  wire x86_Dout_5_mux000017_6061;
  wire \x86_Dout_5_mux00006/O_pack_1 ;
  wire \x86_Dout<6>/DXMUX_6092 ;
  wire x86_Dout_6_mux0000;
  wire \x86_Dout_6_mux000021/O_pack_2 ;
  wire \x86_Dout<6>/CLKINV_6077 ;
  wire \x86_Dout<6>/CEINV_6076 ;
  wire \x86_Dout<7>/DXMUX_6125 ;
  wire x86_Dout_7_mux0000;
  wire \x86_Dout_7_mux000011/O_pack_2 ;
  wire \x86_Dout<7>/CLKINV_6110 ;
  wire \x86_Dout<7>/CEINV_6109 ;
  wire \x86_Dout<8>/DXMUX_6158 ;
  wire x86_Dout_8_mux0000;
  wire \x86_Dout_8_mux00004/O_pack_2 ;
  wire \x86_Dout<8>/CLKINV_6143 ;
  wire \x86_Dout<8>/CEINV_6142 ;
  wire LEDRegister_and0000;
  wire LEDIndex_and0003_pack_1;
  wire \DB7/State_cmp_eq0001 ;
  wire \DB7/N13_pack_1 ;
  wire \DB7/StrobeTimer<7>/DXMUX_6239 ;
  wire \DB7/StrobeTimer_mux0000<0>13/O_pack_2 ;
  wire \DB7/StrobeTimer<7>/CLKINV_6224 ;
  wire \DB7/StrobeTimer<7>/CEINV_6223 ;
  wire \x86_Dout<9>/DXMUX_6272 ;
  wire x86_Dout_9_mux0000;
  wire \x86_Dout_9_mux00004/O_pack_2 ;
  wire \x86_Dout<9>/CLKINV_6257 ;
  wire \x86_Dout<9>/CEINV_6256 ;
  wire \DB7/StrobeTimer<6>/DXMUX_6305 ;
  wire \DB7/StrobeTimer_mux0000<1>25_SW1/O_pack_2 ;
  wire \DB7/StrobeTimer<6>/CLKINV_6289 ;
  wire \DB7/StrobeTimer<6>/CEINV_6288 ;
  wire \DB7/StrobeTimer<3>/DXMUX_6338 ;
  wire \DB7/StrobeTimer_mux0000<4>5/O_pack_2 ;
  wire \DB7/StrobeTimer<3>/CLKINV_6323 ;
  wire \DB7/StrobeTimer<3>/CEINV_6322 ;
  wire \x86/AddressLatch_not0001 ;
  wire \x86/IORead_and0000_pack_1 ;
  wire DataToHost_and0000;
  wire DataToHost_or0000_pack_1;
  wire \Host/USBDir_mux000024_6412 ;
  wire \Host/PuttingByte_cmp_eq0000_pack_1 ;
  wire \DB7/ShiftCount<3>/DXMUX_6443 ;
  wire \DB7/ShiftCount_mux0001[0] ;
  wire \DB7/ShiftCount_mux0001<0>26/O_pack_3 ;
  wire \DB7/ShiftCount<3>/CLKINV_6428 ;
  wire \DB7/ShiftCount<3>/CEINV_6427 ;
  wire \Host/USBDir/DXMUX_6476 ;
  wire \Host/USBDir_mux0000 ;
  wire \Host/USBDir_mux00007/O_pack_2 ;
  wire \Host/USBDir/CLKINV_6460 ;
  wire \DB7/ShiftCount<2>/DXMUX_6510 ;
  wire \DB7/ShiftCount_mux0001[1] ;
  wire \DB7/ShiftCount_mux0001<1>20/O_pack_2 ;
  wire \DB7/ShiftCount<2>/CLKINV_6495 ;
  wire \DB7/ShiftCount<2>/CEINV_6494 ;
  wire \DB7/N28 ;
  wire \DB7/StrobeTimer_or0000_pack_1 ;
  wire x86_Dout_15_mux00009_6560;
  wire N15_pack_1;
  wire \x86/ConfigData_and0000 ;
  wire \x86/State_cmp_ne0000_pack_1 ;
  wire \x86/IOWrite/FFX/RST ;
  wire \x86/IOWrite/DXMUX_6615 ;
  wire \x86/IOWrite_mux0000 ;
  wire N59_pack_2;
  wire \x86/IOWrite/CLKINV_6599 ;
  wire \DB7/Shifting_mux00000_6643 ;
  wire \DB7/State_FSM_FFd2-In21_SW0/O_pack_1 ;
  wire x86_to_DB7_not0001;
  wire \x86_to_DB7_not00011_SW0/O_pack_1 ;
  wire \DB7/Ready/DXMUX_6698 ;
  wire \DB7/Ready_mux0000 ;
  wire \DB7/Ready_mux00008/O_pack_3 ;
  wire \DB7/Ready/CLKINV_6682 ;
  wire DB7_Dout_and0000;
  wire \DB7_Dout_and00001_SW0/O_pack_1 ;
  wire \DB7/StrobeOut/DXMUX_6756 ;
  wire \DB7/StrobeOut_mux0001 ;
  wire \DB7/StrobeOut_mux000123/O_pack_2 ;
  wire \DB7/StrobeOut/CLKINV_6740 ;
  wire N154;
  wire N11_pack_1;
  wire N114;
  wire \DB7/N18_pack_1 ;
  wire N5;
  wire N01_pack_1;
  wire \x86_Dout<10>/DXMUX_6863 ;
  wire x86_Dout_10_mux0000;
  wire \x86_Dout_10_mux000041/O_pack_2 ;
  wire \x86_Dout<10>/CLKINV_6848 ;
  wire \x86_Dout<10>/CEINV_6847 ;
  wire N20;
  wire \x86_Hold_cmp_eq00011/O_pack_1 ;
  wire \x86_Dout<11>/DXMUX_6920 ;
  wire x86_Dout_11_mux0000;
  wire \x86_Dout_11_mux00004/O_pack_2 ;
  wire \x86_Dout<11>/CLKINV_6905 ;
  wire \x86_Dout<11>/CEINV_6904 ;
  wire \x86_Dout<12>/DXMUX_6953 ;
  wire x86_Dout_12_mux0000;
  wire \x86_Dout_12_mux00004/O_pack_2 ;
  wire \x86_Dout<12>/CLKINV_6938 ;
  wire \x86_Dout<12>/CEINV_6937 ;
  wire \x86_Dout<13>/DXMUX_6986 ;
  wire x86_Dout_13_mux0000;
  wire \x86_Dout_13_mux00004/O_pack_2 ;
  wire \x86_Dout<13>/CLKINV_6971 ;
  wire \x86_Dout<13>/CEINV_6970 ;
  wire \x86_Dout<14>/DXMUX_7019 ;
  wire x86_Dout_14_mux0000;
  wire \x86_Dout_14_mux00004/O_pack_2 ;
  wire \x86_Dout<14>/CLKINV_7004 ;
  wire \x86_Dout<14>/CEINV_7003 ;
  wire N203;
  wire \x86/State_FSM_FFd2-In33_SW0/O_pack_1 ;
  wire \DB7/ShiftCount<0>/DXMUX_7076 ;
  wire \DB7/ShiftCount_mux0001[3] ;
  wire \DB7/N14_pack_2 ;
  wire \DB7/ShiftCount<0>/CLKINV_7060 ;
  wire \DB7/ShiftCount<0>/CEINV_7059 ;
  wire \x86_Dout<15>/DXMUX_7109 ;
  wire x86_Dout_15_mux0000;
  wire \x86_Dout_15_mux00004/O_pack_2 ;
  wire \x86_Dout<15>/CLKINV_7094 ;
  wire \x86_Dout<15>/CEINV_7093 ;
  wire \x86_Dout<17>/DXMUX_7142 ;
  wire x86_Dout_17_mux0000;
  wire \x86_Dout_17_mux0000111_SW0/O_pack_2 ;
  wire \x86_Dout<17>/CLKINV_7127 ;
  wire \x86_Dout<17>/CEINV_7126 ;
  wire \DB7/StrobeOut_mux00017_7168 ;
  wire \StateOut<0>_pack_1 ;
  wire N17;
  wire x86_Hold_and0001_pack_1;
  wire x86_Dout_14_mux00009_7216;
  wire N22_pack_1;
  wire N184;
  wire \DB7/N411_pack_1 ;
  wire \DB7/Shifting/DXMUX_7271 ;
  wire \DB7/Shifting_mux0000 ;
  wire \DB7/Shifting_mux000010/O_pack_2 ;
  wire \DB7/Shifting/CLKINV_7255 ;
  wire LEDShift_and000020_7299;
  wire \Msub_LEDIndex_addsub0000_cy<1>_pack_1 ;
  wire \x86_Dout<16>/DXMUX_7330 ;
  wire x86_Dout_16_mux0000_7327;
  wire \x86_Dout_16_mux0000_SW0_SW0/O_pack_2 ;
  wire \x86_Dout<16>/CLKINV_7314 ;
  wire \x86_Dout<16>/CEINV_7313 ;
  wire \DB7/N3 ;
  wire \DB7/State_FSM_FFd1-In1_SW0/O_pack_1 ;
  wire \DB7/Shifting_and0000 ;
  wire \DB7/N7_pack_1 ;
  wire \DB7/State_FSM_FFd1/DXMUX_7411 ;
  wire \DB7/State_FSM_FFd1-In_7408 ;
  wire \DB7/State_FSM_FFd1-In_SW1/O_pack_2 ;
  wire \DB7/State_FSM_FFd1/CLKINV_7394 ;
  wire \DB7/State_FSM_FFd2/DXMUX_7446 ;
  wire \DB7/State_FSM_FFd2-In ;
  wire \DB7/State_FSM_FFd1-In21/O_pack_2 ;
  wire \DB7/State_FSM_FFd2/CLKINV_7428 ;
  wire \Host/RxBufferFull_not0001 ;
  wire \Host/PuttingByte_cmp_ne0000_pack_1 ;
  wire DClock_OBUF_7507;
  wire \LEDShift/DYMUX_7496 ;
  wire LEDShift_mux0000;
  wire \LEDShift/CLKINV_7488 ;
  wire \LEDShift/CEINV_7487 ;
  wire \x86/ConfigData<1>/DYMUX_7530 ;
  wire \x86/ConfigData<1>/CLKINV_7521 ;
  wire \x86/ConfigData<1>/CEINV_7520 ;
  wire \x86/ConfigData<3>/DXMUX_7576 ;
  wire \x86/ConfigData<3>/DYMUX_7563 ;
  wire \x86/ConfigData<3>/CLKINV_7554 ;
  wire \x86/ConfigData<3>/CEINV_7553 ;
  wire \x86/ConfigData<5>/DXMUX_7614 ;
  wire \x86/ConfigData<5>/DYMUX_7601 ;
  wire \x86/ConfigData<5>/CLKINV_7592 ;
  wire \x86/ConfigData<5>/CEINV_7591 ;
  wire \x86/ConfigData<7>/DXMUX_7652 ;
  wire \x86/ConfigData<7>/DYMUX_7639 ;
  wire \x86/ConfigData<7>/CLKINV_7630 ;
  wire \x86/ConfigData<7>/CEINV_7629 ;
  wire \Host/PuttingByte_cmp_eq0002 ;
  wire \Host/TxDone/DYMUX_7679 ;
  wire \Host/TxDone/GYMUX_7678 ;
  wire \Host/PuttingByte_cmp_eq0001 ;
  wire \Host/TxDone/CLKINV_7668 ;
  wire \Host/TxDone/CEINV_7667 ;
  wire \x86/ConfigData<11>/DXMUX_7729 ;
  wire \x86/ConfigData<11>/DYMUX_7716 ;
  wire \x86/ConfigData<11>/CLKINV_7707 ;
  wire \x86/ConfigData<11>/CEINV_7706 ;
  wire \x86/ConfigData<13>/DXMUX_7767 ;
  wire \x86/ConfigData<13>/DYMUX_7754 ;
  wire \x86/ConfigData<13>/CLKINV_7745 ;
  wire \x86/ConfigData<13>/CEINV_7744 ;
  wire \x86/ConfigData<15>/DXMUX_7805 ;
  wire \x86/ConfigData<15>/DYMUX_7792 ;
  wire \x86/ConfigData<15>/CLKINV_7783 ;
  wire \x86/ConfigData<15>/CEINV_7782 ;
  wire \x86/ConfigData<17>/DXMUX_7843 ;
  wire \x86/ConfigData<17>/DYMUX_7830 ;
  wire \x86/ConfigData<17>/CLKINV_7821 ;
  wire \x86/ConfigData<17>/CEINV_7820 ;
  wire N176;
  wire \x86_Active/DYMUX_7869 ;
  wire x86_Active_mux0002;
  wire \x86_Active/CLKINV_7859 ;
  wire \x86/State_FSM_FFd2/DXMUX_7918 ;
  wire \x86/State_FSM_FFd2-In ;
  wire \x86/State_FSM_FFd2/DYMUX_7904 ;
  wire \x86/State_FSM_FFd1-In ;
  wire \x86/State_FSM_FFd2/SRINVNOT ;
  wire \x86/State_FSM_FFd2/CLKINV_7894 ;
  wire \Host/RxData_not0001 ;
  wire \Host/RxBufferFull/DYMUX_7949 ;
  wire \Host/RxBufferFull/GYMUX_7948 ;
  wire \Host/RCount_not0001 ;
  wire \Host/RxBufferFull/CLKINV_7940 ;
  wire \Host/RxBufferFull/CEINV_7939 ;
  wire \DB7/State_FSM_FFd4/DXMUX_7999 ;
  wire \DB7/State_FSM_FFd4-In ;
  wire \DB7/State_FSM_FFd4/DYMUX_7985 ;
  wire \DB7/State_FSM_FFd3-In_7982 ;
  wire \DB7/State_FSM_FFd4/SRINVNOT ;
  wire \DB7/State_FSM_FFd4/CLKINV_7976 ;
  wire \x86_Dout<5>/DYMUX_8022 ;
  wire x86_Dout_5_mux0000;
  wire \x86_Dout<5>/CLKINV_8013 ;
  wire \x86_Dout<5>/CEINV_8012 ;
  wire \WriteToHost/FFY/RST ;
  wire WriteToHost_not0001_pack_3;
  wire \WriteToHost/DYMUX_8049 ;
  wire WriteToHost_mux0000;
  wire \WriteToHost/CLKINV_8038 ;
  wire \WriteToHost/CEINV_8037 ;
  wire \LEDOut/FFY/RST ;
  wire \LEDOut/DYMUX_8083 ;
  wire LEDOut_mux0000;
  wire \LEDOut/CLKINV_8074 ;
  wire \LEDOut/CEINV_8073 ;
  wire \DB7/StrobeTimer<1>/DXMUX_8124 ;
  wire \DB7/StrobeTimer<1>/DYMUX_8112 ;
  wire \DB7/StrobeTimer<1>/CLKINV_8104 ;
  wire \DB7/StrobeTimer<1>/CEINV_8103 ;
  wire \DB7/StrobeTimer<4>/DXMUX_8162 ;
  wire \DB7/StrobeTimer<4>/DYMUX_8150 ;
  wire \DB7/StrobeTimer<4>/CLKINV_8142 ;
  wire \DB7/StrobeTimer<4>/CEINV_8141 ;
  wire \Host/GettingByte_FSM_FFd2/DXMUX_8205 ;
  wire \Host/GettingByte_FSM_FFd2-In ;
  wire \Host/GettingByte_FSM_FFd2/DYMUX_8190 ;
  wire \Host/GettingByte_FSM_FFd1-In ;
  wire \Host/GettingByte_FSM_FFd2/SRINVNOT ;
  wire \Host/GettingByte_FSM_FFd2/CLKINV_8181 ;
  wire \Host/GettingByte_FSM_FFd2/CEINV_8180 ;
  wire x86_Dout_0_and0000;
  wire \x86/IORead/DYMUX_8233 ;
  wire \x86/IORead_mux0000 ;
  wire \x86/IORead/CLKINV_8224 ;
  wire \Host/DeadDelay<1>/DXMUX_8286 ;
  wire \Host/DeadDelay<1>/DYMUX_8271 ;
  wire \Host/DeadDelay<1>/SRINVNOT ;
  wire \Host/DeadDelay<1>/CLKINV_8262 ;
  wire \Host/DeadDelay<1>/CEINV_8261 ;
  wire \LEDIndex<1>/DXMUX_8327 ;
  wire \LEDIndex<1>/DYMUX_8314 ;
  wire \LEDIndex<1>/CLKINV_8304 ;
  wire \LEDIndex<1>/CEINV_8303 ;
  wire \LEDIndex<3>/DXMUX_8365 ;
  wire \LEDIndex<3>/DYMUX_8353 ;
  wire \LEDIndex<3>/CLKINV_8345 ;
  wire \LEDIndex<3>/CEINV_8344 ;
  wire x86_Dout_0_mux0000120_8391;
  wire x86_Dout_8_cmp_eq0004;
  wire x86_Dout_4_mux00004_8415;
  wire x86_Dout_0_mux00005_8408;
  wire x86_Dout_6_mux00000_8439;
  wire x86_Dout_2_mux00000_8432;
  wire x86_Dout_3_mux00000_8463;
  wire x86_Dout_2_mux00001_8454;
  wire N103;
  wire \DB7/State_FSM_FFd5-In31_8478 ;
  wire N178;
  wire \DB7/N16 ;
  wire \x86/AddressLatch<1>/DXMUX_8533 ;
  wire \x86/AddressLatch<1>/DYMUX_8525 ;
  wire \x86/AddressLatch<1>/SRINVNOT ;
  wire \x86/AddressLatch<1>/CLKINV_8522 ;
  wire \x86/AddressLatch<1>/CEINV_8521 ;
  wire \x86/AddressLatch<3>/DXMUX_8559 ;
  wire \x86/AddressLatch<3>/DYMUX_8551 ;
  wire \x86/AddressLatch<3>/SRINVNOT ;
  wire \x86/AddressLatch<3>/CLKINV_8548 ;
  wire \x86/AddressLatch<3>/CEINV_8547 ;
  wire N193;
  wire \x86/Configured_and0001 ;
  wire N156;
  wire x86_Dout_0_cmp_eq0001_pack_1;
  wire LEDIndex_and0000;
  wire LEDShift_and00002_pack_1;
  wire x86_Dout_11_mux00009_8659;
  wire x86_Dout_8_mux00009_8652;
  wire \DB7/SDO28_8683 ;
  wire \DB7/StrobeTimer_mux0000<1>8_8676 ;
  wire \DB7/DiagData/DYMUX_8695 ;
  wire \DB7/DiagData/CLKINV_8692 ;
  wire \DB7/DiagData/CEINV_8691 ;
  wire \LEDRegister<11>/DXMUX_8718 ;
  wire \LEDRegister<11>/DYMUX_8712 ;
  wire \LEDRegister<11>/CLKINV_8710 ;
  wire \LEDRegister<11>/CEINV_8709 ;
  wire \x86/State_cmp_eq0006 ;
  wire N57_pack_1;
  wire N4;
  wire N162;
  wire \LEDRegister<13>/DXMUX_8786 ;
  wire \LEDRegister<13>/DYMUX_8780 ;
  wire \LEDRegister<13>/CLKINV_8778 ;
  wire \LEDRegister<13>/CEINV_8777 ;
  wire \LEDRegister<15>/DXMUX_8806 ;
  wire \LEDRegister<15>/DYMUX_8800 ;
  wire \LEDRegister<15>/CLKINV_8798 ;
  wire \LEDRegister<15>/CEINV_8797 ;
  wire N29;
  wire x86_Hold_mux000210_8823;
  wire Scaler_and0000_inv;
  wire Scaler_not0001;
  wire N142;
  wire x86_Hold_mux000269_8872;
  wire N108;
  wire x86_Dout_4_mux000011_8896;
  wire \Host/PuttingByte_FSM_FFd2/DXMUX_8945 ;
  wire \Host/PuttingByte_FSM_FFd2-In_8942 ;
  wire \Host/PuttingByte_FSM_FFd2/DYMUX_8931 ;
  wire N182_pack_4;
  wire \Host/PuttingByte_FSM_FFd2/SRINVNOT ;
  wire \Host/PuttingByte_FSM_FFd2/CLKINV_8921 ;
  wire \DB7/DiagData_not0001 ;
  wire N152;
  wire N97;
  wire x86_Dout_8_cmp_eq0000_pack_1;
  wire LEDOut_not0001_9021;
  wire N02_pack_1;
  wire N2;
  wire \x86/ConfigData<8>/DXMUX_9064 ;
  wire N6_pack_2;
  wire \x86/ConfigData<8>/CLKINV_9048 ;
  wire \x86/ConfigData<8>/CEINV_9047 ;
  wire x86_Dout_11_mux000024_9090;
  wire x86_Dout_8_mux000024_9083;
  wire x86_Dout_10_mux000024_9114;
  wire x86_Dout_9_mux000024_9107;
  wire x86_Dout_7_mux00000_9138;
  wire x86_Dout_10_mux000025;
  wire \DB7/StrobeTimer_mux0000<4>17_9162 ;
  wire \DB7/StrobeTimer_mux0000<1>16_9154 ;
  wire \ReadFromHost/FFY/RST ;
  wire \ReadFromHost/DYMUX_9174 ;
  wire \ReadFromHost/CLKINV_9171 ;
  wire \ReadFromHost/CEINV_9170 ;
  wire \DB7/Accumulator<1>/DXMUX_9197 ;
  wire \DB7/Accumulator<1>/DYMUX_9191 ;
  wire \DB7/Accumulator<1>/CLKINV_9189 ;
  wire \DB7/Accumulator<1>/CEINV_9188 ;
  wire \DB7/Accumulator<3>/DXMUX_9217 ;
  wire \DB7/Accumulator<3>/DYMUX_9211 ;
  wire \DB7/Accumulator<3>/CLKINV_9209 ;
  wire \DB7/Accumulator<3>/CEINV_9208 ;
  wire N26;
  wire x86_Write;
  wire \DB7/Accumulator<5>/DXMUX_9261 ;
  wire \DB7/Accumulator<5>/DYMUX_9255 ;
  wire \DB7/Accumulator<5>/CLKINV_9253 ;
  wire \DB7/Accumulator<5>/CEINV_9252 ;
  wire \DB7/Accumulator<7>/DXMUX_9281 ;
  wire \DB7/Accumulator<7>/DYMUX_9275 ;
  wire \DB7/Accumulator<7>/CLKINV_9273 ;
  wire \DB7/Accumulator<7>/CEINV_9272 ;
  wire \DB7/Accumulator<9>/DXMUX_9301 ;
  wire \DB7/Accumulator<9>/DYMUX_9295 ;
  wire \DB7/Accumulator<9>/CLKINV_9293 ;
  wire \DB7/Accumulator<9>/CEINV_9292 ;
  wire \DB7/SDO401_9327 ;
  wire \DB7/ShiftCount_mux0001<1>25_9320 ;
  wire \DB7/StrobeOut_mux000116_9351 ;
  wire \DB7/N112 ;
  wire x86_Dout_10_mux00009_9375;
  wire x86_Dout_13_mux00009_9368;
  wire \DataToHost<1>/DXMUX_9393 ;
  wire \DataToHost<1>/DYMUX_9387 ;
  wire \DataToHost<1>/CLKINV_9385 ;
  wire \DataToHost<1>/CEINV_9384 ;
  wire \DataToHost<3>/DXMUX_9413 ;
  wire \DataToHost<3>/DYMUX_9407 ;
  wire \DataToHost<3>/CLKINV_9405 ;
  wire \DataToHost<3>/CEINV_9404 ;
  wire \DataToHost<5>/DXMUX_9433 ;
  wire \DataToHost<5>/DYMUX_9427 ;
  wire \DataToHost<5>/CLKINV_9425 ;
  wire \DataToHost<5>/CEINV_9424 ;
  wire \DataToHost<7>/DXMUX_9453 ;
  wire \DataToHost<7>/DYMUX_9447 ;
  wire \DataToHost<7>/CLKINV_9445 ;
  wire \DataToHost<7>/CEINV_9444 ;
  wire \DB7/State_FSM_FFd5-In5_9479 ;
  wire \DB7/Diagnose_not0001 ;
  wire \Host/RxData<1>/DXMUX_9501 ;
  wire \Host/RxData<1>/DYMUX_9493 ;
  wire \Host/RxData<1>/SRINVNOT ;
  wire \Host/RxData<1>/CLKINV_9490 ;
  wire \Host/RxData<1>/CEINV_9489 ;
  wire \Host/RxData<3>/DXMUX_9527 ;
  wire \Host/RxData<3>/DYMUX_9519 ;
  wire \Host/RxData<3>/SRINVNOT ;
  wire \Host/RxData<3>/CLKINV_9516 ;
  wire \Host/RxData<3>/CEINV_9515 ;
  wire \Host/RxData<5>/DXMUX_9553 ;
  wire \Host/RxData<5>/DYMUX_9545 ;
  wire \Host/RxData<5>/SRINVNOT ;
  wire \Host/RxData<5>/CLKINV_9542 ;
  wire \Host/RxData<5>/CEINV_9541 ;
  wire \Host/RxData<7>/DXMUX_9579 ;
  wire \Host/RxData<7>/DYMUX_9571 ;
  wire \Host/RxData<7>/SRINVNOT ;
  wire \Host/RxData<7>/CLKINV_9568 ;
  wire \Host/RxData<7>/CEINV_9567 ;
  wire \x86/State_cmp_eq0000 ;
  wire N211;
  wire \DB7_Address<1>/DXMUX_9629 ;
  wire \DB7_Address<1>/DYMUX_9621 ;
  wire \DB7_Address<1>/SRINVNOT ;
  wire \DB7_Address<1>/CLKINV_9618 ;
  wire \DB7_Address<1>/CEINV_9617 ;
  wire \DB7_Address<3>/DXMUX_9656 ;
  wire \DB7_Address<3>/DYMUX_9648 ;
  wire \DB7_Address<3>/SRINVNOT ;
  wire \DB7_Address<3>/CLKINV_9645 ;
  wire \DB7_Address<3>/CEINV_9644 ;
  wire \DB7_Address<5>/DXMUX_9684 ;
  wire \DB7_Address<5>/DYMUX_9675 ;
  wire \DB7_Address<5>/SRINVNOT ;
  wire \DB7_Address<5>/CLKINV_9672 ;
  wire \DB7_Address<5>/CEINV_9671 ;
  wire \DB7_Address<7>/DXMUX_9711 ;
  wire \DB7_Address<7>/DYMUX_9702 ;
  wire \DB7_Address<7>/SRINVNOT ;
  wire \DB7_Address<7>/CLKINV_9699 ;
  wire \DB7_Address<7>/CEINV_9698 ;
  wire N51;
  wire \x86/ConfigData_and0000128_pack_1 ;
  wire \DB7/AddressPhase/DXMUX_9770 ;
  wire \DB7/AddressPhase_mux0001 ;
  wire \DB7/AddressPhase_mux000139_pack_1 ;
  wire \DB7/AddressPhase/CLKINV_9754 ;
  wire \DB7/Diagnose/DYMUX_9786 ;
  wire \DB7/Diagnose/CLKINV_9783 ;
  wire \DB7/Diagnose/CEINV_9782 ;
  wire N139;
  wire N138;
  wire \LEDRegister<1>/DXMUX_9833 ;
  wire \LEDRegister<1>/DYMUX_9827 ;
  wire \LEDRegister<1>/CLKINV_9825 ;
  wire \LEDRegister<1>/CEINV_9824 ;
  wire \x86/FSMActive_mux0000220_9859 ;
  wire \x86/FSMActive_mux0000218_pack_1 ;
  wire \x86/State_FSM_FFd2-In14_9883 ;
  wire x86_Read;
  wire \LEDRegister<3>/DXMUX_9901 ;
  wire \LEDRegister<3>/DYMUX_9895 ;
  wire \LEDRegister<3>/CLKINV_9893 ;
  wire \LEDRegister<3>/CEINV_9892 ;
  wire N213;
  wire \x86/State_cmp_eq0003 ;
  wire \LEDRegister<5>/DXMUX_9945 ;
  wire \LEDRegister<5>/DYMUX_9939 ;
  wire \LEDRegister<5>/CLKINV_9937 ;
  wire \LEDRegister<5>/CEINV_9936 ;
  wire \DB7/StrobeOut_mux00015_9971 ;
  wire \DB7/SClock_not0001 ;
  wire \x86/FSMActive/DXMUX_10002 ;
  wire \x86/FSMActive_mux0000 ;
  wire N63_pack_2;
  wire \x86/FSMActive/CLKINV_9986 ;
  wire \LEDRegister<7>/DXMUX_10024 ;
  wire \LEDRegister<7>/DYMUX_10018 ;
  wire \LEDRegister<7>/CLKINV_10016 ;
  wire \LEDRegister<7>/CEINV_10015 ;
  wire x86_Dout_4_mux00001_10050;
  wire x86_Dout_0_cmp_eq0002_pack_1;
  wire \LEDRegister<9>/DXMUX_10068 ;
  wire \LEDRegister<9>/DYMUX_10062 ;
  wire \LEDRegister<9>/CLKINV_10060 ;
  wire \LEDRegister<9>/CEINV_10059 ;
  wire \DB7/Accumulator<11>/DXMUX_10088 ;
  wire \DB7/Accumulator<11>/DYMUX_10082 ;
  wire \DB7/Accumulator<11>/CLKINV_10080 ;
  wire \DB7/Accumulator<11>/CEINV_10079 ;
  wire \DB7/Accumulator<13>/DXMUX_10108 ;
  wire \DB7/Accumulator<13>/DYMUX_10102 ;
  wire \DB7/Accumulator<13>/CLKINV_10100 ;
  wire \DB7/Accumulator<13>/CEINV_10099 ;
  wire \DB7/Accumulator<15>/DXMUX_10128 ;
  wire \DB7/Accumulator<15>/DYMUX_10122 ;
  wire \DB7/Accumulator<15>/CLKINV_10120 ;
  wire \DB7/Accumulator<15>/CEINV_10119 ;
  wire N180;
  wire \x86/ConfigRead_mux000011_pack_1 ;
  wire x86_Dout_7_mux00001_10166;
  wire x86_Dout_12_mux00009_10190;
  wire x86_Dout_9_mux00009_10183;
  wire \DB7/SDO13_10310 ;
  wire \DB7/ShiftCount_mux0001<0>8_10303 ;
  wire \x86/TRDY_or0000 ;
  wire \x86_to_DB7/DYMUX_10358 ;
  wire \x86_to_DB7/CLKINV_10355 ;
  wire \x86_to_DB7/CEINV_10354 ;
  wire N31;
  wire \DB7_Dout<11>/DXMUX_10393 ;
  wire \DB7_Dout<11>/DYMUX_10387 ;
  wire \DB7_Dout<11>/CLKINV_10385 ;
  wire \DB7_Dout<11>/CEINV_10384 ;
  wire \DB7_Dout<13>/DXMUX_10413 ;
  wire \DB7_Dout<13>/DYMUX_10407 ;
  wire \DB7_Dout<13>/CLKINV_10405 ;
  wire \DB7_Dout<13>/CEINV_10404 ;
  wire \DB7_Dout<15>/DXMUX_10433 ;
  wire \DB7_Dout<15>/DYMUX_10427 ;
  wire \DB7_Dout<15>/CLKINV_10425 ;
  wire \DB7_Dout<15>/CEINV_10424 ;
  wire \Host/USBRead/DXMUX_10468 ;
  wire \Host/USBRead_mux0001 ;
  wire N19_pack_2;
  wire \Host/USBRead/CLKINV_10450 ;
  wire \Host/USBRead/CEINV_10449 ;
  wire \x86/ConfigRead/DXMUX_10503 ;
  wire \x86/ConfigRead_mux0000 ;
  wire N197_pack_3;
  wire \x86/ConfigRead/CLKINV_10487 ;
  wire N174;
  wire \DB7/Accumulator_and0000 ;
  wire \x86_Dlast<11>/DXMUX_10554 ;
  wire \x86_Dlast<11>/DYMUX_10545 ;
  wire \x86_Dlast<11>/SRINVNOT ;
  wire \x86_Dlast<11>/CLKINV_10542 ;
  wire \x86_Dlast<11>/CEINV_10541 ;
  wire \x86_Dlast<13>/DXMUX_10582 ;
  wire \x86_Dlast<13>/DYMUX_10573 ;
  wire \x86_Dlast<13>/SRINVNOT ;
  wire \x86_Dlast<13>/CLKINV_10570 ;
  wire \x86_Dlast<13>/CEINV_10569 ;
  wire \x86_Dlast<15>/DXMUX_10610 ;
  wire \x86_Dlast<15>/DYMUX_10601 ;
  wire \x86_Dlast<15>/SRINVNOT ;
  wire \x86_Dlast<15>/CLKINV_10598 ;
  wire \x86_Dlast<15>/CEINV_10597 ;
  wire N209;
  wire N2111;
  wire \x86/LastFrame/DYMUX_10649 ;
  wire \x86/LastFrame/CLKINV_10646 ;
  wire \x86_Dlast<17>/DXMUX_10675 ;
  wire \x86_Dlast<17>/DYMUX_10666 ;
  wire \x86_Dlast<17>/SRINVNOT ;
  wire \x86_Dlast<17>/CLKINV_10663 ;
  wire \x86_Dlast<17>/CEINV_10662 ;
  wire N205;
  wire N207;
  wire \x86/IORead_and000118_10716 ;
  wire N195;
  wire \x86/IORead_and000136_pack_1 ;
  wire N199;
  wire \x86/IORead_and000161_pack_1 ;
  wire N168;
  wire \x86/IORead_and0001_pack_1 ;
  wire \Host/TxDone_not0001 ;
  wire \x86/ConfigData<9>/DXMUX_10831 ;
  wire N14_pack_2;
  wire \x86/ConfigData<9>/CLKINV_10815 ;
  wire \x86/ConfigData<9>/CEINV_10814 ;
  wire \x86/ConfigData<0>/DXMUX_10864 ;
  wire N161_pack_3;
  wire \x86/ConfigData<0>/CLKINV_10848 ;
  wire \x86/ConfigData<0>/CEINV_10847 ;
  wire N126;
  wire N146;
  wire \DB7_Dout<1>/DXMUX_10956 ;
  wire \DB7_Dout<1>/DYMUX_10950 ;
  wire \DB7_Dout<1>/CLKINV_10948 ;
  wire \DB7_Dout<1>/CEINV_10947 ;
  wire \DB7_Dout<3>/DXMUX_10976 ;
  wire \DB7_Dout<3>/DYMUX_10970 ;
  wire \DB7_Dout<3>/CLKINV_10968 ;
  wire \DB7_Dout<3>/CEINV_10967 ;
  wire \DB7_Dout<5>/DXMUX_10996 ;
  wire \DB7_Dout<5>/DYMUX_10990 ;
  wire \DB7_Dout<5>/CLKINV_10988 ;
  wire \DB7_Dout<5>/CEINV_10987 ;
  wire \DB7_Dout<7>/DXMUX_11016 ;
  wire \DB7_Dout<7>/DYMUX_11010 ;
  wire \DB7_Dout<7>/CLKINV_11008 ;
  wire \DB7_Dout<7>/CEINV_11007 ;
  wire \DB7_Dout<9>/DXMUX_11060 ;
  wire \DB7_Dout<9>/DYMUX_11054 ;
  wire \DB7_Dout<9>/CLKINV_11052 ;
  wire \DB7_Dout<9>/CEINV_11051 ;
  wire \x86_Dlast<1>/DXMUX_11097 ;
  wire \x86_Dlast<1>/DYMUX_11088 ;
  wire \x86_Dlast<1>/SRINVNOT ;
  wire \x86_Dlast<1>/CLKINV_11085 ;
  wire \x86_Dlast<1>/CEINV_11084 ;
  wire \x86_Dlast<3>/DXMUX_11125 ;
  wire \x86_Dlast<3>/DYMUX_11116 ;
  wire \x86_Dlast<3>/SRINVNOT ;
  wire \x86_Dlast<3>/CLKINV_11113 ;
  wire \x86_Dlast<3>/CEINV_11112 ;
  wire \x86_Dlast<5>/DXMUX_11151 ;
  wire \x86_Dlast<5>/DYMUX_11143 ;
  wire \x86_Dlast<5>/SRINVNOT ;
  wire \x86_Dlast<5>/CLKINV_11140 ;
  wire \x86_Dlast<5>/CEINV_11139 ;
  wire \x86_Dlast<7>/DXMUX_11179 ;
  wire \x86_Dlast<7>/DYMUX_11170 ;
  wire \x86_Dlast<7>/SRINVNOT ;
  wire \x86_Dlast<7>/CLKINV_11167 ;
  wire \x86_Dlast<7>/CEINV_11166 ;
  wire \x86_Dlast<9>/DXMUX_11206 ;
  wire \x86_Dlast<9>/DYMUX_11198 ;
  wire \x86_Dlast<9>/SRINVNOT ;
  wire \x86_Dlast<9>/CLKINV_11195 ;
  wire \x86_Dlast<9>/CEINV_11194 ;
  wire LEDShift_and0000;
  wire N144;
  wire \Host/USBWrite/DXMUX_11265 ;
  wire \Host/USBWrite_mux0000_11262 ;
  wire N8_pack_2;
  wire \Host/USBWrite/CLKINV_11249 ;
  wire SSDOut_OBUF_11280;
  wire DB7_Address_not0001;
  wire x86_to_DB7_cmp_eq0000_pack_1;
  wire \x86/BusOutEnable/FFX/RSTAND_5145 ;
  wire \x86/TReady/FFX/RSTAND_5256 ;
  wire \x86/Selected/FFX/RSTAND_5526 ;
  wire \Host/USBDir/FFX/SET ;
  wire \DB7/Ready/FFX/SET ;
  wire \DB7/StrobeOut/FFX/RSTAND_6761 ;
  wire \DB7/Shifting/FFX/RSTAND_7276 ;
  wire \DB7/State_FSM_FFd1/FFX/RSTAND_7416 ;
  wire \DB7/State_FSM_FFd2/FFX/RSTAND_7451 ;
  wire \Host/TxDone/FFY/RSTAND_7685 ;
  wire \x86_Active/FFY/RSTAND_7874 ;
  wire \Host/RxBufferFull/FFY/RSTAND_7955 ;
  wire \x86/IORead/FFY/RSTAND_8238 ;
  wire \DB7/DiagData/FFY/RSTAND_8701 ;
  wire \DB7/AddressPhase/FFX/RSTAND_9775 ;
  wire \DB7/Diagnose/FFY/RSTAND_9792 ;
  wire \x86/FSMActive/FFX/RSTAND_10007 ;
  wire \x86_to_DB7/FFY/RSTAND_10364 ;
  wire \Host/USBRead/FFX/SET ;
  wire \x86/ConfigRead/FFX/RSTAND_10508 ;
  wire \x86/LastFrame/FFY/SET ;
  wire \Host/USBWrite/FFX/SET ;
  wire GND;
  wire VCC;
  wire [3 : 0] NlwRenamedSig_IO_CBE;
  wire [7 : 0] \Host/RCount ;
  wire [7 : 0] \Host/WCount ;
  wire [15 : 0] Scaler;
  wire [3 : 0] LEDIndex;
  wire [15 : 0] LEDRegister;
  wire [7 : 0] \Host/RxData ;
  wire [7 : 0] DataToHost;
  wire [17 : 0] x86_Dlast;
  wire [3 : 0] \x86/AddressLatch ;
  wire [7 : 0] DB7_Address;
  wire [3 : 0] \DB7/ShiftCount ;
  wire [15 : 0] DB7_Dout;
  wire [7 : 0] \DB7/StrobeTimer ;
  wire [17 : 0] x86_Dout;
  wire [0 : 0] StateOut;
  wire [15 : 0] \DB7/Accumulator ;
  wire [1 : 1] Msub_LEDIndex_addsub0000_cy;
  wire [17 : 0] \x86/ConfigData ;
  wire [1 : 0] \Host/DeadDelay ;
  wire [0 : 0] \Host/Mcount_RCount_lut ;
  wire [0 : 0] \Host/Mcount_WCount_lut ;
  wire [15 : 0] Mcount_Scaler_lut;
  wire [7 : 0] \DB7/StrobeTimer_mux0000 ;
  wire [17 : 0] \x86/Dout ;
  wire [17 : 0] \x86/ConfigData_mux0000 ;
  wire [1 : 0] \Host/DeadDelay_mux0000 ;
  wire [3 : 0] LEDIndex_mux0000;
  assign
    NlwRenamedSig_IO_SSAck = SSAck,
    NlwRenamedSig_IO_SSDIn = SSDIn,
    NlwRenamedSig_IO_CBE[3] = CBE[3],
    NlwRenamedSig_IO_CBE[2] = CBE[2],
    NlwRenamedSig_IO_CBE[1] = CBE[1],
    NlwRenamedSig_IO_CBE[0] = CBE[0];
  initial $sdf_annotate("netgen/par/dc7_pci_timesim.sdf");
  X_ZERO #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/LOGIC_ZERO  (
    .O(\Host/RCount<0>/LOGIC_ZERO_3295 )
  );
  X_ONE #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/LOGIC_ONE  (
    .O(\Host/RCount<0>/LOGIC_ONE_3320 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/DXMUX  (
    .I(\Host/RCount<0>/XORF_3321 ),
    .O(\Host/RCount<0>/DXMUX_3323 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/XORF  (
    .I0(\Host/RCount<0>/CYINIT_3319 ),
    .I1(\Host/Mcount_RCount_lut [0]),
    .O(\Host/RCount<0>/XORF_3321 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CYMUXF  (
    .IA(\Host/RCount<0>/LOGIC_ONE_3320 ),
    .IB(\Host/RCount<0>/CYINIT_3319 ),
    .SEL(\Host/RCount<0>/CYSELF_3310 ),
    .O(\Host/Mcount_RCount_cy[0] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CYINIT  (
    .I(\Host/RCount<0>/BXINV_3308 ),
    .O(\Host/RCount<0>/CYINIT_3319 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CYSELF  (
    .I(\Host/Mcount_RCount_lut [0]),
    .O(\Host/RCount<0>/CYSELF_3310 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/BXINV  (
    .I(1'b0),
    .O(\Host/RCount<0>/BXINV_3308 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/DYMUX  (
    .I(\Host/RCount<0>/XORG_3298 ),
    .O(\Host/RCount<0>/DYMUX_3300 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/XORG  (
    .I0(\Host/Mcount_RCount_cy[0] ),
    .I1(\Host/RCount<0>/G ),
    .O(\Host/RCount<0>/XORG_3298 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/COUTUSED  (
    .I(\Host/RCount<0>/CYMUXG_3297 ),
    .O(\Host/Mcount_RCount_cy[1] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CYMUXG  (
    .IA(\Host/RCount<0>/LOGIC_ZERO_3295 ),
    .IB(\Host/Mcount_RCount_cy[0] ),
    .SEL(\Host/RCount<0>/CYSELG_3286 ),
    .O(\Host/RCount<0>/CYMUXG_3297 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CYSELG  (
    .I(\Host/RCount<0>/G ),
    .O(\Host/RCount<0>/CYSELG_3286 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RCount<0>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RCount<0>/CLKINV_3283 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/CEINV  (
    .I(\Host/RCount_not0001_0 ),
    .O(\Host/RCount<0>/CEINV_3282 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/LOGIC_ZERO  (
    .O(\Host/RCount<2>/LOGIC_ZERO_3353 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/DXMUX  (
    .I(\Host/RCount<2>/XORF_3381 ),
    .O(\Host/RCount<2>/DXMUX_3383 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/XORF  (
    .I0(\Host/RCount<2>/CYINIT_3380 ),
    .I1(\Host/RCount<2>/F ),
    .O(\Host/RCount<2>/XORF_3381 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYMUXF  (
    .IA(\Host/RCount<2>/LOGIC_ZERO_3353 ),
    .IB(\Host/RCount<2>/CYINIT_3380 ),
    .SEL(\Host/RCount<2>/CYSELF_3359 ),
    .O(\Host/Mcount_RCount_cy[2] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYMUXF2  (
    .IA(\Host/RCount<2>/LOGIC_ZERO_3353 ),
    .IB(\Host/RCount<2>/LOGIC_ZERO_3353 ),
    .SEL(\Host/RCount<2>/CYSELF_3359 ),
    .O(\Host/RCount<2>/CYMUXF2_3354 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYINIT  (
    .I(\Host/Mcount_RCount_cy[1] ),
    .O(\Host/RCount<2>/CYINIT_3380 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYSELF  (
    .I(\Host/RCount<2>/F ),
    .O(\Host/RCount<2>/CYSELF_3359 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/DYMUX  (
    .I(\Host/RCount<2>/XORG_3361 ),
    .O(\Host/RCount<2>/DYMUX_3363 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/XORG  (
    .I0(\Host/Mcount_RCount_cy[2] ),
    .I1(\Host/RCount<2>/G ),
    .O(\Host/RCount<2>/XORG_3361 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/COUTUSED  (
    .I(\Host/RCount<2>/CYMUXFAST_3358 ),
    .O(\Host/Mcount_RCount_cy[3] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/FASTCARRY  (
    .I(\Host/Mcount_RCount_cy[1] ),
    .O(\Host/RCount<2>/FASTCARRY_3356 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYAND  (
    .I0(\Host/RCount<2>/CYSELG_3344 ),
    .I1(\Host/RCount<2>/CYSELF_3359 ),
    .O(\Host/RCount<2>/CYAND_3357 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYMUXFAST  (
    .IA(\Host/RCount<2>/CYMUXG2_3355 ),
    .IB(\Host/RCount<2>/FASTCARRY_3356 ),
    .SEL(\Host/RCount<2>/CYAND_3357 ),
    .O(\Host/RCount<2>/CYMUXFAST_3358 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYMUXG2  (
    .IA(\Host/RCount<2>/LOGIC_ZERO_3353 ),
    .IB(\Host/RCount<2>/CYMUXF2_3354 ),
    .SEL(\Host/RCount<2>/CYSELG_3344 ),
    .O(\Host/RCount<2>/CYMUXG2_3355 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CYSELG  (
    .I(\Host/RCount<2>/G ),
    .O(\Host/RCount<2>/CYSELG_3344 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RCount<2>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RCount<2>/CLKINV_3341 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/CEINV  (
    .I(\Host/RCount_not0001_0 ),
    .O(\Host/RCount<2>/CEINV_3340 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/LOGIC_ZERO  (
    .O(\Host/RCount<4>/LOGIC_ZERO_3413 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/DXMUX  (
    .I(\Host/RCount<4>/XORF_3441 ),
    .O(\Host/RCount<4>/DXMUX_3443 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/XORF  (
    .I0(\Host/RCount<4>/CYINIT_3440 ),
    .I1(\Host/RCount<4>/F ),
    .O(\Host/RCount<4>/XORF_3441 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYMUXF  (
    .IA(\Host/RCount<4>/LOGIC_ZERO_3413 ),
    .IB(\Host/RCount<4>/CYINIT_3440 ),
    .SEL(\Host/RCount<4>/CYSELF_3419 ),
    .O(\Host/Mcount_RCount_cy[4] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYMUXF2  (
    .IA(\Host/RCount<4>/LOGIC_ZERO_3413 ),
    .IB(\Host/RCount<4>/LOGIC_ZERO_3413 ),
    .SEL(\Host/RCount<4>/CYSELF_3419 ),
    .O(\Host/RCount<4>/CYMUXF2_3414 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYINIT  (
    .I(\Host/Mcount_RCount_cy[3] ),
    .O(\Host/RCount<4>/CYINIT_3440 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYSELF  (
    .I(\Host/RCount<4>/F ),
    .O(\Host/RCount<4>/CYSELF_3419 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/DYMUX  (
    .I(\Host/RCount<4>/XORG_3421 ),
    .O(\Host/RCount<4>/DYMUX_3423 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/XORG  (
    .I0(\Host/Mcount_RCount_cy[4] ),
    .I1(\Host/RCount<4>/G ),
    .O(\Host/RCount<4>/XORG_3421 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/FASTCARRY  (
    .I(\Host/Mcount_RCount_cy[3] ),
    .O(\Host/RCount<4>/FASTCARRY_3416 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYAND  (
    .I0(\Host/RCount<4>/CYSELG_3404 ),
    .I1(\Host/RCount<4>/CYSELF_3419 ),
    .O(\Host/RCount<4>/CYAND_3417 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYMUXFAST  (
    .IA(\Host/RCount<4>/CYMUXG2_3415 ),
    .IB(\Host/RCount<4>/FASTCARRY_3416 ),
    .SEL(\Host/RCount<4>/CYAND_3417 ),
    .O(\Host/RCount<4>/CYMUXFAST_3418 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYMUXG2  (
    .IA(\Host/RCount<4>/LOGIC_ZERO_3413 ),
    .IB(\Host/RCount<4>/CYMUXF2_3414 ),
    .SEL(\Host/RCount<4>/CYSELG_3404 ),
    .O(\Host/RCount<4>/CYMUXG2_3415 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CYSELG  (
    .I(\Host/RCount<4>/G ),
    .O(\Host/RCount<4>/CYSELG_3404 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RCount<4>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RCount<4>/CLKINV_3401 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/CEINV  (
    .I(\Host/RCount_not0001_0 ),
    .O(\Host/RCount<4>/CEINV_3400 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/LOGIC_ZERO  (
    .O(\Host/RCount<6>/LOGIC_ZERO_3493 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/DXMUX  (
    .I(\Host/RCount<6>/XORF_3494 ),
    .O(\Host/RCount<6>/DXMUX_3496 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/XORF  (
    .I0(\Host/RCount<6>/CYINIT_3492 ),
    .I1(\Host/RCount<6>/F ),
    .O(\Host/RCount<6>/XORF_3494 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/CYMUXF  (
    .IA(\Host/RCount<6>/LOGIC_ZERO_3493 ),
    .IB(\Host/RCount<6>/CYINIT_3492 ),
    .SEL(\Host/RCount<6>/CYSELF_3483 ),
    .O(\Host/Mcount_RCount_cy[6] )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/CYINIT  (
    .I(\Host/RCount<4>/CYMUXFAST_3418 ),
    .O(\Host/RCount<6>/CYINIT_3492 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/CYSELF  (
    .I(\Host/RCount<6>/F ),
    .O(\Host/RCount<6>/CYSELF_3483 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/DYMUX  (
    .I(\Host/RCount<6>/XORG_3472 ),
    .O(\Host/RCount<6>/DYMUX_3474 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/XORG  (
    .I0(\Host/Mcount_RCount_cy[6] ),
    .I1(\Host/RCount<7>_rt_3469 ),
    .O(\Host/RCount<6>/XORG_3472 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RCount<6>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RCount<6>/CLKINV_3460 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/CEINV  (
    .I(\Host/RCount_not0001_0 ),
    .O(\Host/RCount<6>/CEINV_3459 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/LOGIC_ZERO  (
    .O(\Host/WCount<0>/LOGIC_ZERO_3526 )
  );
  X_ONE #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/LOGIC_ONE  (
    .O(\Host/WCount<0>/LOGIC_ONE_3551 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/DXMUX  (
    .I(\Host/WCount<0>/XORF_3552 ),
    .O(\Host/WCount<0>/DXMUX_3554 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/XORF  (
    .I0(\Host/WCount<0>/CYINIT_3550 ),
    .I1(\Host/Mcount_WCount_lut [0]),
    .O(\Host/WCount<0>/XORF_3552 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CYMUXF  (
    .IA(\Host/WCount<0>/LOGIC_ONE_3551 ),
    .IB(\Host/WCount<0>/CYINIT_3550 ),
    .SEL(\Host/WCount<0>/CYSELF_3541 ),
    .O(\Host/Mcount_WCount_cy[0] )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CYINIT  (
    .I(\Host/WCount<0>/BXINV_3539 ),
    .O(\Host/WCount<0>/CYINIT_3550 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CYSELF  (
    .I(\Host/Mcount_WCount_lut [0]),
    .O(\Host/WCount<0>/CYSELF_3541 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/BXINV  (
    .I(1'b0),
    .O(\Host/WCount<0>/BXINV_3539 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/DYMUX  (
    .I(\Host/WCount<0>/XORG_3529 ),
    .O(\Host/WCount<0>/DYMUX_3531 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/XORG  (
    .I0(\Host/Mcount_WCount_cy[0] ),
    .I1(\Host/WCount<0>/G ),
    .O(\Host/WCount<0>/XORG_3529 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/COUTUSED  (
    .I(\Host/WCount<0>/CYMUXG_3528 ),
    .O(\Host/Mcount_WCount_cy[1] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CYMUXG  (
    .IA(\Host/WCount<0>/LOGIC_ZERO_3526 ),
    .IB(\Host/Mcount_WCount_cy[0] ),
    .SEL(\Host/WCount<0>/CYSELG_3517 ),
    .O(\Host/WCount<0>/CYMUXG_3528 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CYSELG  (
    .I(\Host/WCount<0>/G ),
    .O(\Host/WCount<0>/CYSELG_3517 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/WCount<0>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/WCount<0>/CLKINV_3514 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0001_0 ),
    .O(\Host/WCount<0>/CEINV_3513 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/LOGIC_ZERO  (
    .O(\Host/WCount<2>/LOGIC_ZERO_3584 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/DXMUX  (
    .I(\Host/WCount<2>/XORF_3612 ),
    .O(\Host/WCount<2>/DXMUX_3614 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/XORF  (
    .I0(\Host/WCount<2>/CYINIT_3611 ),
    .I1(\Host/WCount<2>/F ),
    .O(\Host/WCount<2>/XORF_3612 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYMUXF  (
    .IA(\Host/WCount<2>/LOGIC_ZERO_3584 ),
    .IB(\Host/WCount<2>/CYINIT_3611 ),
    .SEL(\Host/WCount<2>/CYSELF_3590 ),
    .O(\Host/Mcount_WCount_cy[2] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYMUXF2  (
    .IA(\Host/WCount<2>/LOGIC_ZERO_3584 ),
    .IB(\Host/WCount<2>/LOGIC_ZERO_3584 ),
    .SEL(\Host/WCount<2>/CYSELF_3590 ),
    .O(\Host/WCount<2>/CYMUXF2_3585 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYINIT  (
    .I(\Host/Mcount_WCount_cy[1] ),
    .O(\Host/WCount<2>/CYINIT_3611 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYSELF  (
    .I(\Host/WCount<2>/F ),
    .O(\Host/WCount<2>/CYSELF_3590 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/DYMUX  (
    .I(\Host/WCount<2>/XORG_3592 ),
    .O(\Host/WCount<2>/DYMUX_3594 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/XORG  (
    .I0(\Host/Mcount_WCount_cy[2] ),
    .I1(\Host/WCount<2>/G ),
    .O(\Host/WCount<2>/XORG_3592 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/COUTUSED  (
    .I(\Host/WCount<2>/CYMUXFAST_3589 ),
    .O(\Host/Mcount_WCount_cy[3] )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/FASTCARRY  (
    .I(\Host/Mcount_WCount_cy[1] ),
    .O(\Host/WCount<2>/FASTCARRY_3587 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYAND  (
    .I0(\Host/WCount<2>/CYSELG_3575 ),
    .I1(\Host/WCount<2>/CYSELF_3590 ),
    .O(\Host/WCount<2>/CYAND_3588 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYMUXFAST  (
    .IA(\Host/WCount<2>/CYMUXG2_3586 ),
    .IB(\Host/WCount<2>/FASTCARRY_3587 ),
    .SEL(\Host/WCount<2>/CYAND_3588 ),
    .O(\Host/WCount<2>/CYMUXFAST_3589 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYMUXG2  (
    .IA(\Host/WCount<2>/LOGIC_ZERO_3584 ),
    .IB(\Host/WCount<2>/CYMUXF2_3585 ),
    .SEL(\Host/WCount<2>/CYSELG_3575 ),
    .O(\Host/WCount<2>/CYMUXG2_3586 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CYSELG  (
    .I(\Host/WCount<2>/G ),
    .O(\Host/WCount<2>/CYSELG_3575 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/WCount<2>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/WCount<2>/CLKINV_3572 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0001_0 ),
    .O(\Host/WCount<2>/CEINV_3571 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/LOGIC_ZERO  (
    .O(\Host/WCount<4>/LOGIC_ZERO_3644 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/DXMUX  (
    .I(\Host/WCount<4>/XORF_3672 ),
    .O(\Host/WCount<4>/DXMUX_3674 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/XORF  (
    .I0(\Host/WCount<4>/CYINIT_3671 ),
    .I1(\Host/WCount<4>/F ),
    .O(\Host/WCount<4>/XORF_3672 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYMUXF  (
    .IA(\Host/WCount<4>/LOGIC_ZERO_3644 ),
    .IB(\Host/WCount<4>/CYINIT_3671 ),
    .SEL(\Host/WCount<4>/CYSELF_3650 ),
    .O(\Host/Mcount_WCount_cy[4] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYMUXF2  (
    .IA(\Host/WCount<4>/LOGIC_ZERO_3644 ),
    .IB(\Host/WCount<4>/LOGIC_ZERO_3644 ),
    .SEL(\Host/WCount<4>/CYSELF_3650 ),
    .O(\Host/WCount<4>/CYMUXF2_3645 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYINIT  (
    .I(\Host/Mcount_WCount_cy[3] ),
    .O(\Host/WCount<4>/CYINIT_3671 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYSELF  (
    .I(\Host/WCount<4>/F ),
    .O(\Host/WCount<4>/CYSELF_3650 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/DYMUX  (
    .I(\Host/WCount<4>/XORG_3652 ),
    .O(\Host/WCount<4>/DYMUX_3654 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/XORG  (
    .I0(\Host/Mcount_WCount_cy[4] ),
    .I1(\Host/WCount<4>/G ),
    .O(\Host/WCount<4>/XORG_3652 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/FASTCARRY  (
    .I(\Host/Mcount_WCount_cy[3] ),
    .O(\Host/WCount<4>/FASTCARRY_3647 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYAND  (
    .I0(\Host/WCount<4>/CYSELG_3635 ),
    .I1(\Host/WCount<4>/CYSELF_3650 ),
    .O(\Host/WCount<4>/CYAND_3648 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYMUXFAST  (
    .IA(\Host/WCount<4>/CYMUXG2_3646 ),
    .IB(\Host/WCount<4>/FASTCARRY_3647 ),
    .SEL(\Host/WCount<4>/CYAND_3648 ),
    .O(\Host/WCount<4>/CYMUXFAST_3649 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYMUXG2  (
    .IA(\Host/WCount<4>/LOGIC_ZERO_3644 ),
    .IB(\Host/WCount<4>/CYMUXF2_3645 ),
    .SEL(\Host/WCount<4>/CYSELG_3635 ),
    .O(\Host/WCount<4>/CYMUXG2_3646 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CYSELG  (
    .I(\Host/WCount<4>/G ),
    .O(\Host/WCount<4>/CYSELG_3635 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/WCount<4>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/WCount<4>/CLKINV_3632 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0001_0 ),
    .O(\Host/WCount<4>/CEINV_3631 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/LOGIC_ZERO  (
    .O(\Host/WCount<6>/LOGIC_ZERO_3724 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/DXMUX  (
    .I(\Host/WCount<6>/XORF_3725 ),
    .O(\Host/WCount<6>/DXMUX_3727 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/XORF  (
    .I0(\Host/WCount<6>/CYINIT_3723 ),
    .I1(\Host/WCount<6>/F ),
    .O(\Host/WCount<6>/XORF_3725 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/CYMUXF  (
    .IA(\Host/WCount<6>/LOGIC_ZERO_3724 ),
    .IB(\Host/WCount<6>/CYINIT_3723 ),
    .SEL(\Host/WCount<6>/CYSELF_3714 ),
    .O(\Host/Mcount_WCount_cy[6] )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/CYINIT  (
    .I(\Host/WCount<4>/CYMUXFAST_3649 ),
    .O(\Host/WCount<6>/CYINIT_3723 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/CYSELF  (
    .I(\Host/WCount<6>/F ),
    .O(\Host/WCount<6>/CYSELF_3714 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/DYMUX  (
    .I(\Host/WCount<6>/XORG_3703 ),
    .O(\Host/WCount<6>/DYMUX_3705 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/XORG  (
    .I0(\Host/Mcount_WCount_cy[6] ),
    .I1(\Host/WCount<7>_rt_3700 ),
    .O(\Host/WCount<6>/XORG_3703 )
  );
  X_INV #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/WCount<6>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/WCount<6>/CLKINV_3691 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0001_0 ),
    .O(\Host/WCount<6>/CEINV_3690 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/LOGIC_ZERO  (
    .O(\Scaler<0>/LOGIC_ZERO_3759 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/DXMUX  (
    .I(\Scaler<0>/XORF_3782 ),
    .O(\Scaler<0>/DXMUX_3784 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/XORF  (
    .I0(\Scaler<0>/CYINIT_3781 ),
    .I1(Mcount_Scaler_lut[0]),
    .O(\Scaler<0>/XORF_3782 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CYMUXF  (
    .IA(\Scaler<0>/LOGIC_ZERO_3759 ),
    .IB(\Scaler<0>/CYINIT_3781 ),
    .SEL(\Scaler<0>/CYSELF_3774 ),
    .O(\Mcount_Scaler_cy[0] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CYINIT  (
    .I(Scaler_and0000_inv),
    .O(\Scaler<0>/CYINIT_3781 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CYSELF  (
    .I(Mcount_Scaler_lut[0]),
    .O(\Scaler<0>/CYSELF_3774 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/DYMUX  (
    .I(\Scaler<0>/XORG_3762 ),
    .O(\Scaler<0>/DYMUX_3764 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/XORG  (
    .I0(\Mcount_Scaler_cy[0] ),
    .I1(Mcount_Scaler_lut[1]),
    .O(\Scaler<0>/XORG_3762 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/COUTUSED  (
    .I(\Scaler<0>/CYMUXG_3761 ),
    .O(\Mcount_Scaler_cy[1] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CYMUXG  (
    .IA(\Scaler<0>/LOGIC_ZERO_3759 ),
    .IB(\Mcount_Scaler_cy[0] ),
    .SEL(\Scaler<0>/CYSELG_3752 ),
    .O(\Scaler<0>/CYMUXG_3761 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CYSELG  (
    .I(Mcount_Scaler_lut[1]),
    .O(\Scaler<0>/CYSELG_3752 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<0>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<0>/CLKINV_3749 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y59" ))
  \Scaler<0>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<0>/CEINV_3748 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/LOGIC_ZERO  (
    .O(\Scaler<2>/LOGIC_ZERO_3816 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/DXMUX  (
    .I(\Scaler<2>/XORF_3842 ),
    .O(\Scaler<2>/DXMUX_3844 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/XORF  (
    .I0(\Scaler<2>/CYINIT_3841 ),
    .I1(Mcount_Scaler_lut[2]),
    .O(\Scaler<2>/XORF_3842 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYMUXF  (
    .IA(\Scaler<2>/LOGIC_ZERO_3816 ),
    .IB(\Scaler<2>/CYINIT_3841 ),
    .SEL(\Scaler<2>/CYSELF_3822 ),
    .O(\Mcount_Scaler_cy[2] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYMUXF2  (
    .IA(\Scaler<2>/LOGIC_ZERO_3816 ),
    .IB(\Scaler<2>/LOGIC_ZERO_3816 ),
    .SEL(\Scaler<2>/CYSELF_3822 ),
    .O(\Scaler<2>/CYMUXF2_3817 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYINIT  (
    .I(\Mcount_Scaler_cy[1] ),
    .O(\Scaler<2>/CYINIT_3841 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYSELF  (
    .I(Mcount_Scaler_lut[2]),
    .O(\Scaler<2>/CYSELF_3822 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/DYMUX  (
    .I(\Scaler<2>/XORG_3824 ),
    .O(\Scaler<2>/DYMUX_3826 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/XORG  (
    .I0(\Mcount_Scaler_cy[2] ),
    .I1(Mcount_Scaler_lut[3]),
    .O(\Scaler<2>/XORG_3824 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/COUTUSED  (
    .I(\Scaler<2>/CYMUXFAST_3821 ),
    .O(\Mcount_Scaler_cy[3] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[1] ),
    .O(\Scaler<2>/FASTCARRY_3819 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYAND  (
    .I0(\Scaler<2>/CYSELG_3809 ),
    .I1(\Scaler<2>/CYSELF_3822 ),
    .O(\Scaler<2>/CYAND_3820 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYMUXFAST  (
    .IA(\Scaler<2>/CYMUXG2_3818 ),
    .IB(\Scaler<2>/FASTCARRY_3819 ),
    .SEL(\Scaler<2>/CYAND_3820 ),
    .O(\Scaler<2>/CYMUXFAST_3821 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYMUXG2  (
    .IA(\Scaler<2>/LOGIC_ZERO_3816 ),
    .IB(\Scaler<2>/CYMUXF2_3817 ),
    .SEL(\Scaler<2>/CYSELG_3809 ),
    .O(\Scaler<2>/CYMUXG2_3818 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CYSELG  (
    .I(Mcount_Scaler_lut[3]),
    .O(\Scaler<2>/CYSELG_3809 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<2>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<2>/CLKINV_3806 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y60" ))
  \Scaler<2>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<2>/CEINV_3805 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/LOGIC_ZERO  (
    .O(\Scaler<4>/LOGIC_ZERO_3876 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/DXMUX  (
    .I(\Scaler<4>/XORF_3902 ),
    .O(\Scaler<4>/DXMUX_3904 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/XORF  (
    .I0(\Scaler<4>/CYINIT_3901 ),
    .I1(Mcount_Scaler_lut[4]),
    .O(\Scaler<4>/XORF_3902 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYMUXF  (
    .IA(\Scaler<4>/LOGIC_ZERO_3876 ),
    .IB(\Scaler<4>/CYINIT_3901 ),
    .SEL(\Scaler<4>/CYSELF_3882 ),
    .O(\Mcount_Scaler_cy[4] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYMUXF2  (
    .IA(\Scaler<4>/LOGIC_ZERO_3876 ),
    .IB(\Scaler<4>/LOGIC_ZERO_3876 ),
    .SEL(\Scaler<4>/CYSELF_3882 ),
    .O(\Scaler<4>/CYMUXF2_3877 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYINIT  (
    .I(\Mcount_Scaler_cy[3] ),
    .O(\Scaler<4>/CYINIT_3901 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYSELF  (
    .I(Mcount_Scaler_lut[4]),
    .O(\Scaler<4>/CYSELF_3882 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/DYMUX  (
    .I(\Scaler<4>/XORG_3884 ),
    .O(\Scaler<4>/DYMUX_3886 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/XORG  (
    .I0(\Mcount_Scaler_cy[4] ),
    .I1(Mcount_Scaler_lut[5]),
    .O(\Scaler<4>/XORG_3884 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/COUTUSED  (
    .I(\Scaler<4>/CYMUXFAST_3881 ),
    .O(\Mcount_Scaler_cy[5] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[3] ),
    .O(\Scaler<4>/FASTCARRY_3879 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYAND  (
    .I0(\Scaler<4>/CYSELG_3869 ),
    .I1(\Scaler<4>/CYSELF_3882 ),
    .O(\Scaler<4>/CYAND_3880 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYMUXFAST  (
    .IA(\Scaler<4>/CYMUXG2_3878 ),
    .IB(\Scaler<4>/FASTCARRY_3879 ),
    .SEL(\Scaler<4>/CYAND_3880 ),
    .O(\Scaler<4>/CYMUXFAST_3881 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYMUXG2  (
    .IA(\Scaler<4>/LOGIC_ZERO_3876 ),
    .IB(\Scaler<4>/CYMUXF2_3877 ),
    .SEL(\Scaler<4>/CYSELG_3869 ),
    .O(\Scaler<4>/CYMUXG2_3878 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CYSELG  (
    .I(Mcount_Scaler_lut[5]),
    .O(\Scaler<4>/CYSELG_3869 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<4>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<4>/CLKINV_3866 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y61" ))
  \Scaler<4>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<4>/CEINV_3865 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/LOGIC_ZERO  (
    .O(\Scaler<6>/LOGIC_ZERO_3936 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/DXMUX  (
    .I(\Scaler<6>/XORF_3962 ),
    .O(\Scaler<6>/DXMUX_3964 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/XORF  (
    .I0(\Scaler<6>/CYINIT_3961 ),
    .I1(Mcount_Scaler_lut[6]),
    .O(\Scaler<6>/XORF_3962 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYMUXF  (
    .IA(\Scaler<6>/LOGIC_ZERO_3936 ),
    .IB(\Scaler<6>/CYINIT_3961 ),
    .SEL(\Scaler<6>/CYSELF_3942 ),
    .O(\Mcount_Scaler_cy[6] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYMUXF2  (
    .IA(\Scaler<6>/LOGIC_ZERO_3936 ),
    .IB(\Scaler<6>/LOGIC_ZERO_3936 ),
    .SEL(\Scaler<6>/CYSELF_3942 ),
    .O(\Scaler<6>/CYMUXF2_3937 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYINIT  (
    .I(\Mcount_Scaler_cy[5] ),
    .O(\Scaler<6>/CYINIT_3961 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYSELF  (
    .I(Mcount_Scaler_lut[6]),
    .O(\Scaler<6>/CYSELF_3942 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/DYMUX  (
    .I(\Scaler<6>/XORG_3944 ),
    .O(\Scaler<6>/DYMUX_3946 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/XORG  (
    .I0(\Mcount_Scaler_cy[6] ),
    .I1(Mcount_Scaler_lut[7]),
    .O(\Scaler<6>/XORG_3944 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/COUTUSED  (
    .I(\Scaler<6>/CYMUXFAST_3941 ),
    .O(\Mcount_Scaler_cy[7] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[5] ),
    .O(\Scaler<6>/FASTCARRY_3939 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYAND  (
    .I0(\Scaler<6>/CYSELG_3929 ),
    .I1(\Scaler<6>/CYSELF_3942 ),
    .O(\Scaler<6>/CYAND_3940 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYMUXFAST  (
    .IA(\Scaler<6>/CYMUXG2_3938 ),
    .IB(\Scaler<6>/FASTCARRY_3939 ),
    .SEL(\Scaler<6>/CYAND_3940 ),
    .O(\Scaler<6>/CYMUXFAST_3941 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYMUXG2  (
    .IA(\Scaler<6>/LOGIC_ZERO_3936 ),
    .IB(\Scaler<6>/CYMUXF2_3937 ),
    .SEL(\Scaler<6>/CYSELG_3929 ),
    .O(\Scaler<6>/CYMUXG2_3938 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CYSELG  (
    .I(Mcount_Scaler_lut[7]),
    .O(\Scaler<6>/CYSELG_3929 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<6>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<6>/CLKINV_3926 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y62" ))
  \Scaler<6>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<6>/CEINV_3925 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/LOGIC_ZERO  (
    .O(\Scaler<8>/LOGIC_ZERO_3996 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/DXMUX  (
    .I(\Scaler<8>/XORF_4022 ),
    .O(\Scaler<8>/DXMUX_4024 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/XORF  (
    .I0(\Scaler<8>/CYINIT_4021 ),
    .I1(Mcount_Scaler_lut[8]),
    .O(\Scaler<8>/XORF_4022 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYMUXF  (
    .IA(\Scaler<8>/LOGIC_ZERO_3996 ),
    .IB(\Scaler<8>/CYINIT_4021 ),
    .SEL(\Scaler<8>/CYSELF_4002 ),
    .O(\Mcount_Scaler_cy[8] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYMUXF2  (
    .IA(\Scaler<8>/LOGIC_ZERO_3996 ),
    .IB(\Scaler<8>/LOGIC_ZERO_3996 ),
    .SEL(\Scaler<8>/CYSELF_4002 ),
    .O(\Scaler<8>/CYMUXF2_3997 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYINIT  (
    .I(\Mcount_Scaler_cy[7] ),
    .O(\Scaler<8>/CYINIT_4021 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYSELF  (
    .I(Mcount_Scaler_lut[8]),
    .O(\Scaler<8>/CYSELF_4002 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/DYMUX  (
    .I(\Scaler<8>/XORG_4004 ),
    .O(\Scaler<8>/DYMUX_4006 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/XORG  (
    .I0(\Mcount_Scaler_cy[8] ),
    .I1(Mcount_Scaler_lut[9]),
    .O(\Scaler<8>/XORG_4004 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/COUTUSED  (
    .I(\Scaler<8>/CYMUXFAST_4001 ),
    .O(\Mcount_Scaler_cy[9] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[7] ),
    .O(\Scaler<8>/FASTCARRY_3999 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYAND  (
    .I0(\Scaler<8>/CYSELG_3989 ),
    .I1(\Scaler<8>/CYSELF_4002 ),
    .O(\Scaler<8>/CYAND_4000 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYMUXFAST  (
    .IA(\Scaler<8>/CYMUXG2_3998 ),
    .IB(\Scaler<8>/FASTCARRY_3999 ),
    .SEL(\Scaler<8>/CYAND_4000 ),
    .O(\Scaler<8>/CYMUXFAST_4001 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYMUXG2  (
    .IA(\Scaler<8>/LOGIC_ZERO_3996 ),
    .IB(\Scaler<8>/CYMUXF2_3997 ),
    .SEL(\Scaler<8>/CYSELG_3989 ),
    .O(\Scaler<8>/CYMUXG2_3998 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CYSELG  (
    .I(Mcount_Scaler_lut[9]),
    .O(\Scaler<8>/CYSELG_3989 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<8>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<8>/CLKINV_3986 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y63" ))
  \Scaler<8>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<8>/CEINV_3985 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/LOGIC_ZERO  (
    .O(\Scaler<10>/LOGIC_ZERO_4056 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/DXMUX  (
    .I(\Scaler<10>/XORF_4082 ),
    .O(\Scaler<10>/DXMUX_4084 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/XORF  (
    .I0(\Scaler<10>/CYINIT_4081 ),
    .I1(Mcount_Scaler_lut[10]),
    .O(\Scaler<10>/XORF_4082 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYMUXF  (
    .IA(\Scaler<10>/LOGIC_ZERO_4056 ),
    .IB(\Scaler<10>/CYINIT_4081 ),
    .SEL(\Scaler<10>/CYSELF_4062 ),
    .O(\Mcount_Scaler_cy[10] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYMUXF2  (
    .IA(\Scaler<10>/LOGIC_ZERO_4056 ),
    .IB(\Scaler<10>/LOGIC_ZERO_4056 ),
    .SEL(\Scaler<10>/CYSELF_4062 ),
    .O(\Scaler<10>/CYMUXF2_4057 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYINIT  (
    .I(\Mcount_Scaler_cy[9] ),
    .O(\Scaler<10>/CYINIT_4081 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYSELF  (
    .I(Mcount_Scaler_lut[10]),
    .O(\Scaler<10>/CYSELF_4062 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/DYMUX  (
    .I(\Scaler<10>/XORG_4064 ),
    .O(\Scaler<10>/DYMUX_4066 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/XORG  (
    .I0(\Mcount_Scaler_cy[10] ),
    .I1(Mcount_Scaler_lut[11]),
    .O(\Scaler<10>/XORG_4064 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/COUTUSED  (
    .I(\Scaler<10>/CYMUXFAST_4061 ),
    .O(\Mcount_Scaler_cy[11] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[9] ),
    .O(\Scaler<10>/FASTCARRY_4059 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYAND  (
    .I0(\Scaler<10>/CYSELG_4049 ),
    .I1(\Scaler<10>/CYSELF_4062 ),
    .O(\Scaler<10>/CYAND_4060 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYMUXFAST  (
    .IA(\Scaler<10>/CYMUXG2_4058 ),
    .IB(\Scaler<10>/FASTCARRY_4059 ),
    .SEL(\Scaler<10>/CYAND_4060 ),
    .O(\Scaler<10>/CYMUXFAST_4061 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYMUXG2  (
    .IA(\Scaler<10>/LOGIC_ZERO_4056 ),
    .IB(\Scaler<10>/CYMUXF2_4057 ),
    .SEL(\Scaler<10>/CYSELG_4049 ),
    .O(\Scaler<10>/CYMUXG2_4058 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CYSELG  (
    .I(Mcount_Scaler_lut[11]),
    .O(\Scaler<10>/CYSELG_4049 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<10>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<10>/CLKINV_4046 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y64" ))
  \Scaler<10>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<10>/CEINV_4045 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/LOGIC_ZERO  (
    .O(\Scaler<12>/LOGIC_ZERO_4116 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/DXMUX  (
    .I(\Scaler<12>/XORF_4142 ),
    .O(\Scaler<12>/DXMUX_4144 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/XORF  (
    .I0(\Scaler<12>/CYINIT_4141 ),
    .I1(Mcount_Scaler_lut[12]),
    .O(\Scaler<12>/XORF_4142 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYMUXF  (
    .IA(\Scaler<12>/LOGIC_ZERO_4116 ),
    .IB(\Scaler<12>/CYINIT_4141 ),
    .SEL(\Scaler<12>/CYSELF_4122 ),
    .O(\Mcount_Scaler_cy[12] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYMUXF2  (
    .IA(\Scaler<12>/LOGIC_ZERO_4116 ),
    .IB(\Scaler<12>/LOGIC_ZERO_4116 ),
    .SEL(\Scaler<12>/CYSELF_4122 ),
    .O(\Scaler<12>/CYMUXF2_4117 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYINIT  (
    .I(\Mcount_Scaler_cy[11] ),
    .O(\Scaler<12>/CYINIT_4141 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYSELF  (
    .I(Mcount_Scaler_lut[12]),
    .O(\Scaler<12>/CYSELF_4122 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/DYMUX  (
    .I(\Scaler<12>/XORG_4124 ),
    .O(\Scaler<12>/DYMUX_4126 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/XORG  (
    .I0(\Mcount_Scaler_cy[12] ),
    .I1(Mcount_Scaler_lut[13]),
    .O(\Scaler<12>/XORG_4124 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/FASTCARRY  (
    .I(\Mcount_Scaler_cy[11] ),
    .O(\Scaler<12>/FASTCARRY_4119 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYAND  (
    .I0(\Scaler<12>/CYSELG_4109 ),
    .I1(\Scaler<12>/CYSELF_4122 ),
    .O(\Scaler<12>/CYAND_4120 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYMUXFAST  (
    .IA(\Scaler<12>/CYMUXG2_4118 ),
    .IB(\Scaler<12>/FASTCARRY_4119 ),
    .SEL(\Scaler<12>/CYAND_4120 ),
    .O(\Scaler<12>/CYMUXFAST_4121 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYMUXG2  (
    .IA(\Scaler<12>/LOGIC_ZERO_4116 ),
    .IB(\Scaler<12>/CYMUXF2_4117 ),
    .SEL(\Scaler<12>/CYSELG_4109 ),
    .O(\Scaler<12>/CYMUXG2_4118 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CYSELG  (
    .I(Mcount_Scaler_lut[13]),
    .O(\Scaler<12>/CYSELG_4109 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<12>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<12>/CLKINV_4106 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y65" ))
  \Scaler<12>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<12>/CEINV_4105 )
  );
  X_ZERO #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/LOGIC_ZERO  (
    .O(\Scaler<14>/LOGIC_ZERO_4194 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/DXMUX  (
    .I(\Scaler<14>/XORF_4195 ),
    .O(\Scaler<14>/DXMUX_4197 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/XORF  (
    .I0(\Scaler<14>/CYINIT_4193 ),
    .I1(Mcount_Scaler_lut[14]),
    .O(\Scaler<14>/XORF_4195 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/CYMUXF  (
    .IA(\Scaler<14>/LOGIC_ZERO_4194 ),
    .IB(\Scaler<14>/CYINIT_4193 ),
    .SEL(\Scaler<14>/CYSELF_4186 ),
    .O(\Mcount_Scaler_cy[14] )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/CYINIT  (
    .I(\Scaler<12>/CYMUXFAST_4121 ),
    .O(\Scaler<14>/CYINIT_4193 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/CYSELF  (
    .I(Mcount_Scaler_lut[14]),
    .O(\Scaler<14>/CYSELF_4186 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/DYMUX  (
    .I(\Scaler<14>/XORG_4175 ),
    .O(\Scaler<14>/DYMUX_4177 )
  );
  X_XOR2 #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/XORG  (
    .I0(\Mcount_Scaler_cy[14] ),
    .I1(Mcount_Scaler_lut[15]),
    .O(\Scaler<14>/XORG_4175 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Scaler<14>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Scaler<14>/CLKINV_4165 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y66" ))
  \Scaler<14>/CEINV  (
    .I(Scaler_not0001_0),
    .O(\Scaler<14>/CEINV_4164 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/F5USED  (
    .I(\Mmux__varindex0000_4_f5/F5MUX_4234 ),
    .O(Mmux__varindex0000_4_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/F5MUX  (
    .IA(Mmux__varindex0000_6_4223),
    .IB(Mmux__varindex0000_5_4232),
    .SEL(\Mmux__varindex0000_4_f5/BXINV_4226 ),
    .O(\Mmux__varindex0000_4_f5/F5MUX_4234 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/BXINV  (
    .I(LEDIndex[1]),
    .O(\Mmux__varindex0000_4_f5/BXINV_4226 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/FXUSED  (
    .I(\Mmux__varindex0000_4_f5/F6MUX_4225 ),
    .O(Mmux__varindex0000_3_f6)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/F6MUX  (
    .IA(Mmux__varindex0000_5_f5),
    .IB(Mmux__varindex0000_4_f5),
    .SEL(\Mmux__varindex0000_4_f5/BYINV_4217 ),
    .O(\Mmux__varindex0000_4_f5/F6MUX_4225 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y46" ))
  \Mmux__varindex0000_4_f5/BYINV  (
    .I(LEDIndex[2]),
    .O(\Mmux__varindex0000_4_f5/BYINV_4217 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y47" ))
  \_varindex0000/F5USED  (
    .I(\_varindex0000/F5MUX_4265 ),
    .O(Mmux__varindex0000_5_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X30Y47" ))
  \_varindex0000/F5MUX  (
    .IA(Mmux__varindex0000_7_4253),
    .IB(Mmux__varindex0000_61_4263),
    .SEL(\_varindex0000/BXINV_4257 ),
    .O(\_varindex0000/F5MUX_4265 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y47" ))
  \_varindex0000/BXINV  (
    .I(LEDIndex[1]),
    .O(\_varindex0000/BXINV_4257 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X30Y47" ))
  \_varindex0000/F6MUX  (
    .IA(Mmux__varindex0000_4_f6),
    .IB(Mmux__varindex0000_3_f6),
    .SEL(\_varindex0000/BYINV_4247 ),
    .O(\_varindex0000/F6MUX_4255 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y47" ))
  \_varindex0000/BYINV  (
    .I(LEDIndex[3]),
    .O(\_varindex0000/BYINV_4247 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/F5USED  (
    .I(\Mmux__varindex0000_5_f51/F5MUX_4295 ),
    .O(Mmux__varindex0000_5_f51)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/F5MUX  (
    .IA(Mmux__varindex0000_71_4284),
    .IB(Mmux__varindex0000_62_4293),
    .SEL(\Mmux__varindex0000_5_f51/BXINV_4287 ),
    .O(\Mmux__varindex0000_5_f51/F5MUX_4295 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/BXINV  (
    .I(LEDIndex[1]),
    .O(\Mmux__varindex0000_5_f51/BXINV_4287 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/FXUSED  (
    .I(\Mmux__varindex0000_5_f51/F6MUX_4286 ),
    .O(Mmux__varindex0000_4_f6)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/F6MUX  (
    .IA(Mmux__varindex0000_6_f5),
    .IB(Mmux__varindex0000_5_f51),
    .SEL(\Mmux__varindex0000_5_f51/BYINV_4278 ),
    .O(\Mmux__varindex0000_5_f51/F6MUX_4286 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y46" ))
  \Mmux__varindex0000_5_f51/BYINV  (
    .I(LEDIndex[2]),
    .O(\Mmux__varindex0000_5_f51/BYINV_4278 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y47" ))
  \Mmux__varindex0000_6_f5/F5USED  (
    .I(\Mmux__varindex0000_6_f5/F5MUX_4319 ),
    .O(Mmux__varindex0000_6_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X31Y47" ))
  \Mmux__varindex0000_6_f5/F5MUX  (
    .IA(Mmux__varindex0000_8_4309),
    .IB(Mmux__varindex0000_72_4317),
    .SEL(\Mmux__varindex0000_6_f5/BXINV_4311 ),
    .O(\Mmux__varindex0000_6_f5/F5MUX_4319 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y47" ))
  \Mmux__varindex0000_6_f5/BXINV  (
    .I(LEDIndex[1]),
    .O(\Mmux__varindex0000_6_f5/BXINV_4311 )
  );
  X_IPAD #(
    .LOC ( "PAD23" ))
  \PCI_Clock/PAD  (
    .PAD(PCI_Clock)
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  PCI_Clock_IBUF (
    .I(PCI_Clock),
    .O(\PCI_Clock/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD115" ))
  \CBE<0>/PAD  (
    .PAD(NlwRenamedSig_IO_CBE[0])
  );
  X_PU #(
    .LOC ( "IPAD115" ))
  \CBE<0>/PULLUP  (
    .O(NlwRenamedSig_IO_CBE[0])
  );
  X_BUF #(
    .LOC ( "IPAD115" ))
  CBE_0_IBUF (
    .I(NlwRenamedSig_IO_CBE[0]),
    .O(\CBE<0>/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD126" ))
  \CBE<1>/PAD  (
    .PAD(NlwRenamedSig_IO_CBE[1])
  );
  X_PU #(
    .LOC ( "IPAD126" ))
  \CBE<1>/PULLUP  (
    .O(NlwRenamedSig_IO_CBE[1])
  );
  X_BUF #(
    .LOC ( "IPAD126" ))
  CBE_1_IBUF (
    .I(NlwRenamedSig_IO_CBE[1]),
    .O(\CBE<1>/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD130" ))
  \CBE<2>/PAD  (
    .PAD(NlwRenamedSig_IO_CBE[2])
  );
  X_PU #(
    .LOC ( "IPAD130" ))
  \CBE<2>/PULLUP  (
    .O(NlwRenamedSig_IO_CBE[2])
  );
  X_BUF #(
    .LOC ( "IPAD130" ))
  CBE_2_IBUF (
    .I(NlwRenamedSig_IO_CBE[2]),
    .O(\CBE<2>/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD131" ))
  \CBE<3>/PAD  (
    .PAD(NlwRenamedSig_IO_CBE[3])
  );
  X_PU #(
    .LOC ( "IPAD131" ))
  \CBE<3>/PULLUP  (
    .O(NlwRenamedSig_IO_CBE[3])
  );
  X_BUF #(
    .LOC ( "IPAD131" ))
  CBE_3_IBUF (
    .I(NlwRenamedSig_IO_CBE[3]),
    .O(\CBE<3>/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD30" ))
  \SSDOut/PAD  (
    .PAD(SSDOut)
  );
  X_OBUF #(
    .LOC ( "PAD30" ))
  SSDOut_OBUF (
    .I(\SSDOut/O ),
    .O(SSDOut)
  );
  X_OPAD #(
    .LOC ( "PAD57" ))
  \USBWrite/PAD  (
    .PAD(USBWrite)
  );
  X_OBUF #(
    .LOC ( "PAD57" ))
  USBWrite_OBUF (
    .I(\USBWrite/O ),
    .O(USBWrite)
  );
  X_OPAD #(
    .LOC ( "PAD42" ))
  \SSAddr/PAD  (
    .PAD(SSAddr)
  );
  X_OBUF #(
    .LOC ( "PAD42" ))
  SSAddr_OBUF (
    .I(\SSAddr/O ),
    .O(SSAddr)
  );
  X_IPAD #(
    .LOC ( "IPAD137" ))
  \IRdy/PAD  (
    .PAD(IRdy)
  );
  X_BUF #(
    .LOC ( "IPAD137" ))
  IRdy_IBUF (
    .I(IRdy),
    .O(\IRdy/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD25" ))
  \TRdy/PAD  (
    .PAD(TRdy)
  );
  X_OBUFT #(
    .LOC ( "PAD25" ))
  TRdy_OBUFT (
    .I(\TRdy/O ),
    .CTL(\TRdy/T ),
    .O(TRdy)
  );
  X_IPAD #(
    .LOC ( "IPAD22" ))
  \PCI_Reset/PAD  (
    .PAD(PCI_Reset)
  );
  X_BUF #(
    .LOC ( "IPAD22" ))
  PCI_Reset_IBUF (
    .I(PCI_Reset),
    .O(\PCI_Reset/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD22" ))
  \PCI_Reset/IFF/IMUX  (
    .I(\PCI_Reset/INBUF ),
    .O(PCI_Reset_IBUF_2742)
  );
  X_BPAD #(
    .LOC ( "PAD47" ))
  \DData/PAD  (
    .PAD(DData)
  );
  X_OBUFT #(
    .LOC ( "PAD47" ))
  \DData_IOBUF/OBUFT  (
    .I(\DData/O ),
    .CTL(\DData/T ),
    .O(DData)
  );
  X_BUF #(
    .LOC ( "PAD47" ))
  \DData_IOBUF/IBUF  (
    .I(DData),
    .O(\DData/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD47" ))
  \DData/IFF/IMUX  (
    .I(\DData/INBUF ),
    .O(N43)
  );
  X_OPAD #(
    .LOC ( "PAD24" ))
  \DevSel/PAD  (
    .PAD(DevSel)
  );
  X_OBUFT #(
    .LOC ( "PAD24" ))
  DevSel_OBUFT (
    .I(\DevSel/O ),
    .CTL(\DevSel/T ),
    .O(DevSel)
  );
  X_IPAD #(
    .LOC ( "IPAD157" ))
  \IDSel/PAD  (
    .PAD(IDSel)
  );
  X_BUF #(
    .LOC ( "IPAD157" ))
  IDSel_IBUF (
    .I(IDSel),
    .O(\IDSel/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD157" ))
  \IDSel/IFF/IMUX  (
    .I(\IDSel/INBUF ),
    .O(IDSel_IBUF_2834)
  );
  X_OPAD #(
    .LOC ( "PAD64" ))
  \USBRead/PAD  (
    .PAD(USBRead)
  );
  X_OBUF #(
    .LOC ( "PAD64" ))
  USBRead_OBUF (
    .I(\USBRead/O ),
    .O(USBRead)
  );
  X_IPAD #(
    .LOC ( "IPAD168" ))
  \USBRxValid/PAD  (
    .PAD(USBRxValid)
  );
  X_BUF #(
    .LOC ( "IPAD168" ))
  USBRxValid_IBUF (
    .I(USBRxValid),
    .O(\USBRxValid/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD168" ))
  \USBRxValid/IFF/IMUX  (
    .I(\USBRxValid/INBUF ),
    .O(USBRxValid_IBUF_2836)
  );
  X_IPAD #(
    .LOC ( "IPAD29" ))
  \SSDIn/PAD  (
    .PAD(NlwRenamedSig_IO_SSDIn)
  );
  X_PU #(
    .LOC ( "IPAD29" ))
  \SSDIn/PULLUP  (
    .O(NlwRenamedSig_IO_SSDIn)
  );
  X_BUF #(
    .LOC ( "IPAD29" ))
  SSDIn_IBUF (
    .I(NlwRenamedSig_IO_SSDIn),
    .O(\SSDIn/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD147" ))
  \USBTxReady/PAD  (
    .PAD(USBTxReady)
  );
  X_BUF #(
    .LOC ( "IPAD147" ))
  USBTxReady_IBUF (
    .I(USBTxReady),
    .O(\USBTxReady/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD147" ))
  \USBTxReady/IFF/IMUX  (
    .I(\USBTxReady/INBUF ),
    .O(USBTxReady_IBUF_2838)
  );
  X_OPAD #(
    .LOC ( "PAD86" ))
  \LED/PAD  (
    .PAD(LED)
  );
  X_OBUF #(
    .LOC ( "PAD86" ))
  LED_OBUF (
    .I(\LED/O ),
    .O(LED)
  );
  X_IPAD #(
    .LOC ( "IPAD28" ))
  \SSAck/PAD  (
    .PAD(NlwRenamedSig_IO_SSAck)
  );
  X_PU #(
    .LOC ( "IPAD28" ))
  \SSAck/PULLUP  (
    .O(NlwRenamedSig_IO_SSAck)
  );
  X_BUF #(
    .LOC ( "IPAD28" ))
  SSAck_IBUF (
    .I(NlwRenamedSig_IO_SSAck),
    .O(\SSAck/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD28" ))
  \SSAck/IFF/IMUX  (
    .I(\SSAck/INBUF ),
    .O(SSAck_IBUF_2768)
  );
  X_OPAD #(
    .LOC ( "PAD43" ))
  \SSClock/PAD  (
    .PAD(SSClock)
  );
  X_OBUF #(
    .LOC ( "PAD43" ))
  SSClock_OBUF (
    .I(\SSClock/O ),
    .O(SSClock)
  );
  X_IPAD #(
    .LOC ( "IPAD162" ))
  \Frame/PAD  (
    .PAD(Frame)
  );
  X_BUF #(
    .LOC ( "IPAD162" ))
  Frame_IBUF (
    .I(Frame),
    .O(\Frame/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD162" ))
  \Frame/IFF/IMUX  (
    .I(\Frame/INBUF ),
    .O(Frame_IBUF_2840)
  );
  X_IPAD #(
    .LOC ( "IPAD114" ))
  \ADEx<0>/PAD  (
    .PAD(ADEx[0])
  );
  X_BUF #(
    .LOC ( "IPAD114" ))
  ADEx_0_IBUF (
    .I(ADEx[0]),
    .O(\ADEx<0>/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD114" ))
  \ADEx<0>/IFF/IMUX  (
    .I(\ADEx<0>/INBUF ),
    .O(ADEx_0_IBUF_2841)
  );
  X_IPAD #(
    .LOC ( "IPAD89" ))
  \ADEx<1>/PAD  (
    .PAD(ADEx[1])
  );
  X_BUF #(
    .LOC ( "IPAD89" ))
  ADEx_1_IBUF (
    .I(ADEx[1]),
    .O(\ADEx<1>/INBUF )
  );
  X_BUF #(
    .LOC ( "IPAD89" ))
  \ADEx<1>/IFF/IMUX  (
    .I(\ADEx<1>/INBUF ),
    .O(ADEx_1_IBUF_2842)
  );
  X_OPAD #(
    .LOC ( "PAD46" ))
  \DClock/PAD  (
    .PAD(DClock)
  );
  X_OBUF #(
    .LOC ( "PAD46" ))
  DClock_OBUF (
    .I(\DClock/O ),
    .O(DClock)
  );
  X_OPAD #(
    .LOC ( "PAD31" ))
  \SSStrobe/PAD  (
    .PAD(SSStrobe)
  );
  X_OBUF #(
    .LOC ( "PAD31" ))
  SSStrobe_OBUF (
    .I(\SSStrobe/O ),
    .O(SSStrobe)
  );
  X_OPAD #(
    .LOC ( "PAD27" ))
  \Probe/PAD  (
    .PAD(Probe)
  );
  X_OBUF #(
    .LOC ( "PAD27" ))
  Probe_OBUF (
    .I(\Probe/O ),
    .O(Probe)
  );
  X_BPAD #(
    .LOC ( "PAD75" ))
  \USBData<0>/PAD  (
    .PAD(USBData[0])
  );
  X_OBUFT #(
    .LOC ( "PAD75" ))
  \USBData_0_IOBUF/OBUFT  (
    .I(\USBData<0>/O ),
    .CTL(\USBData<0>/T ),
    .O(USBData[0])
  );
  X_BUF #(
    .LOC ( "PAD75" ))
  \USBData_0_IOBUF/IBUF  (
    .I(USBData[0]),
    .O(\USBData<0>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD74" ))
  \USBData<1>/PAD  (
    .PAD(USBData[1])
  );
  X_OBUFT #(
    .LOC ( "PAD74" ))
  \USBData_1_IOBUF/OBUFT  (
    .I(\USBData<1>/O ),
    .CTL(\USBData<1>/T ),
    .O(USBData[1])
  );
  X_BUF #(
    .LOC ( "PAD74" ))
  \USBData_1_IOBUF/IBUF  (
    .I(USBData[1]),
    .O(\USBData<1>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD72" ))
  \USBData<2>/PAD  (
    .PAD(USBData[2])
  );
  X_OBUFT #(
    .LOC ( "PAD72" ))
  \USBData_2_IOBUF/OBUFT  (
    .I(\USBData<2>/O ),
    .CTL(\USBData<2>/T ),
    .O(USBData[2])
  );
  X_BUF #(
    .LOC ( "PAD72" ))
  \USBData_2_IOBUF/IBUF  (
    .I(USBData[2]),
    .O(\USBData<2>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD70" ))
  \USBData<3>/PAD  (
    .PAD(USBData[3])
  );
  X_OBUFT #(
    .LOC ( "PAD70" ))
  \USBData_3_IOBUF/OBUFT  (
    .I(\USBData<3>/O ),
    .CTL(\USBData<3>/T ),
    .O(USBData[3])
  );
  X_BUF #(
    .LOC ( "PAD70" ))
  \USBData_3_IOBUF/IBUF  (
    .I(USBData[3]),
    .O(\USBData<3>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD69" ))
  \USBData<4>/PAD  (
    .PAD(USBData[4])
  );
  X_OBUFT #(
    .LOC ( "PAD69" ))
  \USBData_4_IOBUF/OBUFT  (
    .I(\USBData<4>/O ),
    .CTL(\USBData<4>/T ),
    .O(USBData[4])
  );
  X_BUF #(
    .LOC ( "PAD69" ))
  \USBData_4_IOBUF/IBUF  (
    .I(USBData[4]),
    .O(\USBData<4>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD20" ))
  \AD<0>/PAD  (
    .PAD(AD[0])
  );
  X_OBUFT #(
    .LOC ( "PAD20" ))
  \AD_0_IOBUF/OBUFT  (
    .I(\AD<0>/O ),
    .CTL(\AD<0>/T ),
    .O(AD[0])
  );
  X_BUF #(
    .LOC ( "PAD20" ))
  \AD_0_IOBUF/IBUF  (
    .I(AD[0]),
    .O(\AD<0>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD20" ))
  \AD<0>/IFF/IMUX  (
    .I(\AD<0>/INBUF ),
    .O(N611)
  );
  X_BPAD #(
    .LOC ( "PAD68" ))
  \USBData<5>/PAD  (
    .PAD(USBData[5])
  );
  X_OBUFT #(
    .LOC ( "PAD68" ))
  \USBData_5_IOBUF/OBUFT  (
    .I(\USBData<5>/O ),
    .CTL(\USBData<5>/T ),
    .O(USBData[5])
  );
  X_BUF #(
    .LOC ( "PAD68" ))
  \USBData_5_IOBUF/IBUF  (
    .I(USBData[5]),
    .O(\USBData<5>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD19" ))
  \AD<1>/PAD  (
    .PAD(AD[1])
  );
  X_OBUFT #(
    .LOC ( "PAD19" ))
  \AD_1_IOBUF/OBUFT  (
    .I(\AD<1>/O ),
    .CTL(\AD<1>/T ),
    .O(AD[1])
  );
  X_BUF #(
    .LOC ( "PAD19" ))
  \AD_1_IOBUF/IBUF  (
    .I(AD[1]),
    .O(\AD<1>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD19" ))
  \AD<1>/IFF/IMUX  (
    .I(\AD<1>/INBUF ),
    .O(N60)
  );
  X_BPAD #(
    .LOC ( "PAD63" ))
  \AD<10>/PAD  (
    .PAD(AD[10])
  );
  X_OBUFT #(
    .LOC ( "PAD63" ))
  \AD_10_IOBUF/OBUFT  (
    .I(\AD<10>/O ),
    .CTL(\AD<10>/T ),
    .O(AD[10])
  );
  X_BUF #(
    .LOC ( "PAD63" ))
  \AD_10_IOBUF/IBUF  (
    .I(AD[10]),
    .O(\AD<10>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD63" ))
  \AD<10>/IFF/IMUX  (
    .I(\AD<10>/INBUF ),
    .O(N511)
  );
  X_BPAD #(
    .LOC ( "PAD67" ))
  \USBData<6>/PAD  (
    .PAD(USBData[6])
  );
  X_OBUFT #(
    .LOC ( "PAD67" ))
  \USBData_6_IOBUF/OBUFT  (
    .I(\USBData<6>/O ),
    .CTL(\USBData<6>/T ),
    .O(USBData[6])
  );
  X_BUF #(
    .LOC ( "PAD67" ))
  \USBData_6_IOBUF/IBUF  (
    .I(USBData[6]),
    .O(\USBData<6>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD18" ))
  \AD<2>/PAD  (
    .PAD(AD[2])
  );
  X_OBUFT #(
    .LOC ( "PAD18" ))
  \AD_2_IOBUF/OBUFT  (
    .I(\AD<2>/O ),
    .CTL(\AD<2>/T ),
    .O(AD[2])
  );
  X_BUF #(
    .LOC ( "PAD18" ))
  \AD_2_IOBUF/IBUF  (
    .I(AD[2]),
    .O(\AD<2>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD18" ))
  \AD<2>/IFF/IMUX  (
    .I(\AD<2>/INBUF ),
    .O(N591)
  );
  X_BPAD #(
    .LOC ( "PAD62" ))
  \AD<11>/PAD  (
    .PAD(AD[11])
  );
  X_OBUFT #(
    .LOC ( "PAD62" ))
  \AD_11_IOBUF/OBUFT  (
    .I(\AD<11>/O ),
    .CTL(\AD<11>/T ),
    .O(AD[11])
  );
  X_BUF #(
    .LOC ( "PAD62" ))
  \AD_11_IOBUF/IBUF  (
    .I(AD[11]),
    .O(\AD<11>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD62" ))
  \AD<11>/IFF/IMUX  (
    .I(\AD<11>/INBUF ),
    .O(N50)
  );
  X_BPAD #(
    .LOC ( "PAD65" ))
  \USBData<7>/PAD  (
    .PAD(USBData[7])
  );
  X_OBUFT #(
    .LOC ( "PAD65" ))
  \USBData_7_IOBUF/OBUFT  (
    .I(\USBData<7>/O ),
    .CTL(\USBData<7>/T ),
    .O(USBData[7])
  );
  X_BUF #(
    .LOC ( "PAD65" ))
  \USBData_7_IOBUF/IBUF  (
    .I(USBData[7]),
    .O(\USBData<7>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD15" ))
  \AD<3>/PAD  (
    .PAD(AD[3])
  );
  X_OBUFT #(
    .LOC ( "PAD15" ))
  \AD_3_IOBUF/OBUFT  (
    .I(\AD<3>/O ),
    .CTL(\AD<3>/T ),
    .O(AD[3])
  );
  X_BUF #(
    .LOC ( "PAD15" ))
  \AD_3_IOBUF/IBUF  (
    .I(AD[3]),
    .O(\AD<3>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD60" ))
  \AD<12>/PAD  (
    .PAD(AD[12])
  );
  X_OBUFT #(
    .LOC ( "PAD60" ))
  \AD_12_IOBUF/OBUFT  (
    .I(\AD<12>/O ),
    .CTL(\AD<12>/T ),
    .O(AD[12])
  );
  X_BUF #(
    .LOC ( "PAD60" ))
  \AD_12_IOBUF/IBUF  (
    .I(AD[12]),
    .O(\AD<12>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD14" ))
  \AD<4>/PAD  (
    .PAD(AD[4])
  );
  X_OBUFT #(
    .LOC ( "PAD14" ))
  \AD_4_IOBUF/OBUFT  (
    .I(\AD<4>/O ),
    .CTL(\AD<4>/T ),
    .O(AD[4])
  );
  X_BUF #(
    .LOC ( "PAD14" ))
  \AD_4_IOBUF/IBUF  (
    .I(AD[4]),
    .O(\AD<4>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD59" ))
  \AD<13>/PAD  (
    .PAD(AD[13])
  );
  X_OBUFT #(
    .LOC ( "PAD59" ))
  \AD_13_IOBUF/OBUFT  (
    .I(\AD<13>/O ),
    .CTL(\AD<13>/T ),
    .O(AD[13])
  );
  X_BUF #(
    .LOC ( "PAD59" ))
  \AD_13_IOBUF/IBUF  (
    .I(AD[13]),
    .O(\AD<13>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD5" ))
  \AD<5>/PAD  (
    .PAD(AD[5])
  );
  X_OBUFT #(
    .LOC ( "PAD5" ))
  \AD_5_IOBUF/OBUFT  (
    .I(\AD<5>/O ),
    .CTL(\AD<5>/T ),
    .O(AD[5])
  );
  X_BUF #(
    .LOC ( "PAD5" ))
  \AD_5_IOBUF/IBUF  (
    .I(AD[5]),
    .O(\AD<5>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD5" ))
  \AD<5>/IFF/IMUX  (
    .I(\AD<5>/INBUF ),
    .O(N56)
  );
  X_BPAD #(
    .LOC ( "PAD49" ))
  \AD<14>/PAD  (
    .PAD(AD[14])
  );
  X_OBUFT #(
    .LOC ( "PAD49" ))
  \AD_14_IOBUF/OBUFT  (
    .I(\AD<14>/O ),
    .CTL(\AD<14>/T ),
    .O(AD[14])
  );
  X_BUF #(
    .LOC ( "PAD49" ))
  \AD_14_IOBUF/IBUF  (
    .I(AD[14]),
    .O(\AD<14>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD4" ))
  \AD<6>/PAD  (
    .PAD(AD[6])
  );
  X_OBUFT #(
    .LOC ( "PAD4" ))
  \AD_6_IOBUF/OBUFT  (
    .I(\AD<6>/O ),
    .CTL(\AD<6>/T ),
    .O(AD[6])
  );
  X_BUF #(
    .LOC ( "PAD4" ))
  \AD_6_IOBUF/IBUF  (
    .I(AD[6]),
    .O(\AD<6>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD48" ))
  \AD<15>/PAD  (
    .PAD(AD[15])
  );
  X_OBUFT #(
    .LOC ( "PAD48" ))
  \AD_15_IOBUF/OBUFT  (
    .I(\AD<15>/O ),
    .CTL(\AD<15>/T ),
    .O(AD[15])
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  \AD_15_IOBUF/IBUF  (
    .I(AD[15]),
    .O(\AD<15>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD2" ))
  \AD<7>/PAD  (
    .PAD(AD[7])
  );
  X_OBUFT #(
    .LOC ( "PAD2" ))
  \AD_7_IOBUF/OBUFT  (
    .I(\AD<7>/O ),
    .CTL(\AD<7>/T ),
    .O(AD[7])
  );
  X_BUF #(
    .LOC ( "PAD2" ))
  \AD_7_IOBUF/IBUF  (
    .I(AD[7]),
    .O(\AD<7>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD92" ))
  \AD<16>/PAD  (
    .PAD(AD[16])
  );
  X_OBUFT #(
    .LOC ( "PAD92" ))
  \AD_16_IOBUF/OBUFT  (
    .I(\AD<16>/O ),
    .CTL(\AD<16>/T ),
    .O(AD[16])
  );
  X_BUF #(
    .LOC ( "PAD92" ))
  \AD_16_IOBUF/IBUF  (
    .I(AD[16]),
    .O(\AD<16>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD106" ))
  \AD<8>/PAD  (
    .PAD(AD[8])
  );
  X_OBUFT #(
    .LOC ( "PAD106" ))
  \AD_8_IOBUF/OBUFT  (
    .I(\AD<8>/O ),
    .CTL(\AD<8>/T ),
    .O(AD[8])
  );
  X_BUF #(
    .LOC ( "PAD106" ))
  \AD_8_IOBUF/IBUF  (
    .I(AD[8]),
    .O(\AD<8>/INBUF )
  );
  X_BPAD #(
    .LOC ( "PAD136" ))
  \AD<17>/PAD  (
    .PAD(AD[17])
  );
  X_OBUFT #(
    .LOC ( "PAD136" ))
  \AD_17_IOBUF/OBUFT  (
    .I(\AD<17>/O ),
    .CTL(\AD<17>/T ),
    .O(AD[17])
  );
  X_BUF #(
    .LOC ( "PAD136" ))
  \AD_17_IOBUF/IBUF  (
    .I(AD[17]),
    .O(\AD<17>/INBUF )
  );
  X_BUF #(
    .LOC ( "PAD136" ))
  \AD<17>/IFF/IMUX  (
    .I(\AD<17>/INBUF ),
    .O(N44)
  );
  X_BPAD #(
    .LOC ( "PAD105" ))
  \AD<9>/PAD  (
    .PAD(AD[9])
  );
  X_OBUFT #(
    .LOC ( "PAD105" ))
  \AD_9_IOBUF/OBUFT  (
    .I(\AD<9>/O ),
    .CTL(\AD<9>/T ),
    .O(AD[9])
  );
  X_BUF #(
    .LOC ( "PAD105" ))
  \AD_9_IOBUF/IBUF  (
    .I(AD[9]),
    .O(\AD<9>/INBUF )
  );
  X_BUFGMUX #(
    .LOC ( "BUFGMUX_X1Y10" ))
  PCI_Clock_IBUF_BUFG (
    .I0(\PCI_Clock_IBUF_BUFG/I0_INV ),
    .I1(GND),
    .S(\PCI_Clock_IBUF_BUFG/S_INVNOT ),
    .O(PCI_Clock_IBUF_2741)
  );
  X_INV #(
    .LOC ( "BUFGMUX_X1Y10" ))
  \PCI_Clock_IBUF_BUFG/SINV  (
    .I(1'b1),
    .O(\PCI_Clock_IBUF_BUFG/S_INVNOT )
  );
  X_BUF #(
    .LOC ( "BUFGMUX_X1Y10" ))
  \PCI_Clock_IBUF_BUFG/I0_USED  (
    .I(PCI_Clock_IBUF1),
    .O(\PCI_Clock_IBUF_BUFG/I0_INV )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y39" ))
  \x86_Dout_6_mux00007/XUSED  (
    .I(\x86_Dout_6_mux00007/F5MUX_5109 ),
    .O(x86_Dout_6_mux00007)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X13Y39" ))
  \x86_Dout_6_mux00007/F5MUX  (
    .IA(N231),
    .IB(N232),
    .SEL(\x86_Dout_6_mux00007/BXINV_5102 ),
    .O(\x86_Dout_6_mux00007/F5MUX_5109 )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y39" ))
  \x86_Dout_6_mux00007/BXINV  (
    .I(x86_Dlast[6]),
    .O(\x86_Dout_6_mux00007/BXINV_5102 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable/DXMUX  (
    .I(\x86/BusOutEnable/F5MUX_5138 ),
    .O(\x86/BusOutEnable/DXMUX_5140 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable/F5MUX  (
    .IA(N217),
    .IB(N218),
    .SEL(\x86/BusOutEnable/BXINV_5131 ),
    .O(\x86/BusOutEnable/F5MUX_5138 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable/BXINV  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\x86/BusOutEnable/BXINV_5131 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/BusOutEnable/CLKINV_5123 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y33" ))
  \N7/XUSED  (
    .I(\N7/F5MUX_5170 ),
    .O(N7)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X28Y33" ))
  \N7/F5MUX  (
    .IA(N239),
    .IB(N240),
    .SEL(\N7/BXINV_5163 ),
    .O(\N7/F5MUX_5170 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y33" ))
  \N7/BXINV  (
    .I(\x86/AddressLatch [0]),
    .O(\N7/BXINV_5163 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y30" ))
  \x86_Dout_17_mux00003/XUSED  (
    .I(\x86_Dout_17_mux00003/F5MUX_5195 ),
    .O(x86_Dout_17_mux00003)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X25Y30" ))
  \x86_Dout_17_mux00003/F5MUX  (
    .IA(N189),
    .IB(N190),
    .SEL(\x86_Dout_17_mux00003/BXINV_5188 ),
    .O(\x86_Dout_17_mux00003/F5MUX_5195 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y30" ))
  \x86_Dout_17_mux00003/BXINV  (
    .I(\x86/AddressLatch [0]),
    .O(\x86_Dout_17_mux00003/BXINV_5188 )
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y35" ))
  \x86_Dout_1_mux00006/XUSED  (
    .I(\x86_Dout_1_mux00006/F5MUX_5220 ),
    .O(x86_Dout_1_mux00006)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X12Y35" ))
  \x86_Dout_1_mux00006/F5MUX  (
    .IA(N233),
    .IB(N234),
    .SEL(\x86_Dout_1_mux00006/BXINV_5213 ),
    .O(\x86_Dout_1_mux00006/F5MUX_5220 )
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y35" ))
  \x86_Dout_1_mux00006/BXINV  (
    .I(x86_Dlast[1]),
    .O(\x86_Dout_1_mux00006/BXINV_5213 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady/DXMUX  (
    .I(\x86/TReady/F5MUX_5249 ),
    .O(\x86/TReady/DXMUX_5251 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady/F5MUX  (
    .IA(N215),
    .IB(N216),
    .SEL(\x86/TReady/BXINV_5242 ),
    .O(\x86/TReady/F5MUX_5249 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady/BXINV  (
    .I(\x86/State_FSM_FFd2_2904 ),
    .O(\x86/TReady/BXINV_5242 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/TReady/CLKINV_5234 )
  );
  X_LUT4 #(
    .INIT ( 16'h0CCC ),
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3-In32_G  (
    .ADR0(VCC),
    .ADR1(\x86/State_FSM_FFd3_2906 ),
    .ADR2(IRdy_IBUF_2828),
    .ADR3(Frame_IBUF_2840),
    .O(N236)
  );
  X_INV #(
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3/FFX/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/State_FSM_FFd3/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X23Y37" ),
    .INIT ( 1'b0 ))
  \x86/State_FSM_FFd3  (
    .I(\x86/State_FSM_FFd3/DXMUX_5287 ),
    .CE(VCC),
    .CLK(\x86/State_FSM_FFd3/CLKINV_5269 ),
    .SET(GND),
    .RST(\x86/State_FSM_FFd3/FFX/RST ),
    .O(\x86/State_FSM_FFd3_2906 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3/DXMUX  (
    .I(\x86/State_FSM_FFd3/F5MUX_5285 ),
    .O(\x86/State_FSM_FFd3/DXMUX_5287 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3/F5MUX  (
    .IA(N235),
    .IB(N236),
    .SEL(\x86/State_FSM_FFd3/BXINV_5277 ),
    .O(\x86/State_FSM_FFd3/F5MUX_5285 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3/BXINV  (
    .I(\x86/State_FSM_FFd2_2904 ),
    .O(\x86/State_FSM_FFd3/BXINV_5277 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/State_FSM_FFd3/CLKINV_5269 )
  );
  X_LUT4 #(
    .INIT ( 16'hF1F0 ),
    .LOC ( "SLICE_X23Y37" ))
  \x86/State_FSM_FFd3-In32_F  (
    .ADR0(N162_0),
    .ADR1(Frame_IBUF_2840),
    .ADR2(\x86/State_FSM_FFd3_2906 ),
    .ADR3(\x86/LastFrame_2923 ),
    .O(N235)
  );
  X_LUT4 #(
    .INIT ( 16'hB133 ),
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock_mux000021  (
    .ADR0(DB7_Address[7]),
    .ADR1(\DB7/SClock_2839 ),
    .ADR2(DB7_Address[0]),
    .ADR3(\DB7/State_FSM_FFd5_2927 ),
    .O(\DB7/SClock_mux00002 )
  );
  X_INV #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/FFX/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/SClock/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y53" ),
    .INIT ( 1'b0 ))
  \DB7/SClock  (
    .I(\DB7/SClock/DXMUX_5325 ),
    .CE(\DB7/SClock/CEINV_5304 ),
    .CLK(\DB7/SClock/CLKINV_5305 ),
    .SET(GND),
    .RST(\DB7/SClock/FFX/RST ),
    .O(\DB7/SClock_2839 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/DXMUX  (
    .I(\DB7/SClock/F5MUX_5323 ),
    .O(\DB7/SClock/DXMUX_5325 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/F5MUX  (
    .IA(\DB7/SClock_mux000021_5314 ),
    .IB(\DB7/SClock_mux00002 ),
    .SEL(\DB7/SClock/BXINV_5316 ),
    .O(\DB7/SClock/F5MUX_5323 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/BXINV  (
    .I(x86_to_DB7_2925),
    .O(\DB7/SClock/BXINV_5316 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/SClock/CLKINV_5305 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock/CEINV  (
    .I(\DB7/SClock_not0001 ),
    .O(\DB7/SClock/CEINV_5304 )
  );
  X_LUT4 #(
    .INIT ( 16'h3333 ),
    .LOC ( "SLICE_X21Y53" ))
  \DB7/SClock_mux000022_INV_0  (
    .ADR0(VCC),
    .ADR1(\DB7/SClock_2839 ),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\DB7/SClock_mux000021_5314 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEFE ),
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount_mux0001<2>1  (
    .ADR0(\DB7/N14 ),
    .ADR1(\DB7/ShiftCount [0]),
    .ADR2(\DB7/N112_0 ),
    .ADR3(VCC),
    .O(\DB7/ShiftCount_mux0001<2>1_5358 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y52" ),
    .INIT ( 1'b0 ))
  \DB7/ShiftCount_1  (
    .I(\DB7/ShiftCount<1>/DXMUX_5362 ),
    .CE(\DB7/ShiftCount<1>/CEINV_5342 ),
    .CLK(\DB7/ShiftCount<1>/CLKINV_5343 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/ShiftCount [1])
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount<1>/DXMUX  (
    .I(\DB7/ShiftCount<1>/F5MUX_5360 ),
    .O(\DB7/ShiftCount<1>/DXMUX_5362 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount<1>/F5MUX  (
    .IA(\DB7/ShiftCount_mux0001<2>2_5350 ),
    .IB(\DB7/ShiftCount_mux0001<2>1_5358 ),
    .SEL(\DB7/ShiftCount<1>/BXINV_5352 ),
    .O(\DB7/ShiftCount<1>/F5MUX_5360 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount<1>/BXINV  (
    .I(\DB7/ShiftCount [1]),
    .O(\DB7/ShiftCount<1>/BXINV_5352 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/ShiftCount<1>/CLKINV_5343 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount<1>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/ShiftCount<1>/CEINV_5342 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEE ),
    .LOC ( "SLICE_X18Y52" ))
  \DB7/ShiftCount_mux0001<2>2  (
    .ADR0(\DB7/N14 ),
    .ADR1(\DB7/N411 ),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\DB7/ShiftCount_mux0001<2>2_5350 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y57" ))
  \N191/XUSED  (
    .I(\N191/F5MUX_5390 ),
    .O(N191)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X24Y57" ))
  \N191/F5MUX  (
    .IA(N229),
    .IB(N230),
    .SEL(\N191/BXINV_5383 ),
    .O(\N191/F5MUX_5390 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y57" ))
  \N191/BXINV  (
    .I(\DB7/AddressPhase_2827 ),
    .O(\N191/BXINV_5383 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y44" ))
  \DB7/SDO304/XUSED  (
    .I(\DB7/SDO304/F5MUX_5415 ),
    .O(\DB7/SDO304 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X33Y44" ))
  \DB7/SDO304/F5MUX  (
    .IA(N223),
    .IB(N224),
    .SEL(\DB7/SDO304/BXINV_5407 ),
    .O(\DB7/SDO304/F5MUX_5415 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y44" ))
  \DB7/SDO304/BXINV  (
    .I(\DB7/ShiftCount [2]),
    .O(\DB7/SDO304/BXINV_5407 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y47" ))
  \DB7/SDO236/XUSED  (
    .I(\DB7/SDO236/F5MUX_5440 ),
    .O(\DB7/SDO236 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X23Y47" ))
  \DB7/SDO236/F5MUX  (
    .IA(N227),
    .IB(N228),
    .SEL(\DB7/SDO236/BXINV_5433 ),
    .O(\DB7/SDO236/F5MUX_5440 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y47" ))
  \DB7/SDO236/BXINV  (
    .I(\DB7/ShiftCount [2]),
    .O(\DB7/SDO236/BXINV_5433 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y47" ))
  \DB7/SDO179/XUSED  (
    .I(\DB7/SDO179/F5MUX_5465 ),
    .O(\DB7/SDO179 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X32Y47" ))
  \DB7/SDO179/F5MUX  (
    .IA(N221),
    .IB(N222),
    .SEL(\DB7/SDO179/BXINV_5458 ),
    .O(\DB7/SDO179/F5MUX_5465 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y47" ))
  \DB7/SDO179/BXINV  (
    .I(\DB7/ShiftCount [2]),
    .O(\DB7/SDO179/BXINV_5458 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y45" ))
  \DB7/SDO357/XUSED  (
    .I(\DB7/SDO357/F5MUX_5490 ),
    .O(\DB7/SDO357 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X25Y45" ))
  \DB7/SDO357/F5MUX  (
    .IA(N225),
    .IB(N226),
    .SEL(\DB7/SDO357/BXINV_5482 ),
    .O(\DB7/SDO357/F5MUX_5490 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y45" ))
  \DB7/SDO357/BXINV  (
    .I(\DB7/ShiftCount [2]),
    .O(\DB7/SDO357/BXINV_5482 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected/DXMUX  (
    .I(\x86/Selected/F5MUX_5519 ),
    .O(\x86/Selected/DXMUX_5521 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected/F5MUX  (
    .IA(N237),
    .IB(N238),
    .SEL(\x86/Selected/BXINV_5512 ),
    .O(\x86/Selected/F5MUX_5519 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected/BXINV  (
    .I(\x86/State_FSM_FFd2_2904 ),
    .O(\x86/Selected/BXINV_5512 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/Selected/CLKINV_5504 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y55" ))
  \DB7/SDO85/XUSED  (
    .I(\DB7/SDO85/F5MUX_5551 ),
    .O(\DB7/SDO85 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X23Y55" ))
  \DB7/SDO85/F5MUX  (
    .IA(N219),
    .IB(N220),
    .SEL(\DB7/SDO85/BXINV_5543 ),
    .O(\DB7/SDO85/F5MUX_5551 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y55" ))
  \DB7/SDO85/BXINV  (
    .I(\DB7/ShiftCount [1]),
    .O(\DB7/SDO85/BXINV_5543 )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y34" ))
  \N141/XUSED  (
    .I(\N141/F5MUX_5576 ),
    .O(N141)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X13Y34" ))
  \N141/F5MUX  (
    .IA(\N141/G ),
    .IB(N188),
    .SEL(\N141/BXINV_5569 ),
    .O(\N141/F5MUX_5576 )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y34" ))
  \N141/BXINV  (
    .I(x86_Dlast[0]),
    .O(\N141/BXINV_5569 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer<5>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [2]),
    .O(\DB7/StrobeTimer<5>/DXMUX_5606 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer<5>/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<2>_SW0/O_pack_2 ),
    .O(\DB7/StrobeTimer_mux0000<2>_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<5>/CLKINV_5589 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer<5>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<5>/CEINV_5588 )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y58" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_5  (
    .I(\DB7/StrobeTimer<5>/DXMUX_5606 ),
    .CE(\DB7/StrobeTimer<5>/CEINV_5588 ),
    .CLK(\DB7/StrobeTimer<5>/CLKINV_5589 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [5])
  );
  X_LUT4 #(
    .INIT ( 16'hECCC ),
    .LOC ( "SLICE_X22Y31" ))
  ReadFromHost_not0001 (
    .ADR0(\ReadFromHost_not0001_SW0_SW0/O ),
    .ADR1(ReadFromHost_2977),
    .ADR2(x86_Hold_and0001),
    .ADR3(x86_Read_0),
    .O(ReadFromHost_not0001_5632)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y31" ))
  \ReadFromHost_not0001/YUSED  (
    .I(\ReadFromHost_not0001_SW0_SW0/O_pack_1 ),
    .O(\ReadFromHost_not0001_SW0_SW0/O )
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X22Y31" ))
  ReadFromHost_not0001_SW0_SW0 (
    .ADR0(x86_Dout_8_cmp_eq0004_0),
    .ADR1(x86_Active_2978),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(\x86/AddressLatch [0]),
    .O(\ReadFromHost_not0001_SW0_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X19Y59" ))
  \DB7/State_FSM_FFd5-In19  (
    .ADR0(\DB7/StrobeTimer [4]),
    .ADR1(\DB7/N13 ),
    .ADR2(\DB7/StrobeTimer [5]),
    .ADR3(\DB7/State_FSM_FFd5-In24_SW1/O ),
    .O(\DB7/State_FSM_FFd5-In19_5656 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y59" ))
  \DB7/State_FSM_FFd5-In19/XUSED  (
    .I(\DB7/State_FSM_FFd5-In19_5656 ),
    .O(\DB7/State_FSM_FFd5-In19_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y59" ))
  \DB7/State_FSM_FFd5-In19/YUSED  (
    .I(\DB7/State_FSM_FFd5-In24_SW1/O_pack_1 ),
    .O(\DB7/State_FSM_FFd5-In24_SW1/O )
  );
  X_LUT4 #(
    .INIT ( 16'h1133 ),
    .LOC ( "SLICE_X19Y59" ))
  \DB7/State_FSM_FFd5-In24_SW1  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(VCC),
    .ADR3(SSAck_IBUF_2768),
    .O(\DB7/State_FSM_FFd5-In24_SW1/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEC ),
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5-In45  (
    .ADR0(\DB7/State_FSM_FFd5-In31_0 ),
    .ADR1(\DB7/State_FSM_FFd5-In5_0 ),
    .ADR2(\DB7/State_FSM_FFd5-In11/O ),
    .ADR3(\DB7/State_FSM_FFd5-In19_0 ),
    .O(\DB7/State_FSM_FFd5-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y58" ),
    .INIT ( 1'b1 ))
  \DB7/State_FSM_FFd5  (
    .I(\DB7/State_FSM_FFd5/DXMUX_5687 ),
    .CE(VCC),
    .CLK(\DB7/State_FSM_FFd5/CLKINV_5670 ),
    .SET(\DB7/State_FSM_FFd5/SRINVNOT ),
    .RST(GND),
    .O(\DB7/State_FSM_FFd5_2927 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5/DXMUX  (
    .I(\DB7/State_FSM_FFd5-In ),
    .O(\DB7/State_FSM_FFd5/DXMUX_5687 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5/YUSED  (
    .I(\DB7/State_FSM_FFd5-In11/O_pack_1 ),
    .O(\DB7/State_FSM_FFd5-In11/O )
  );
  X_INV #(
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/State_FSM_FFd5/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/State_FSM_FFd5/CLKINV_5670 )
  );
  X_LUT4 #(
    .INIT ( 16'h5000 ),
    .LOC ( "SLICE_X18Y58" ))
  \DB7/State_FSM_FFd5-In11  (
    .ADR0(SSAck_IBUF_2768),
    .ADR1(VCC),
    .ADR2(\DB7/N7 ),
    .ADR3(\DB7/State_FSM_FFd1_2902 ),
    .O(\DB7/State_FSM_FFd5-In11/O_pack_1 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y33" ))
  \x86_Dout_0_mux000027/XUSED  (
    .I(x86_Dout_0_mux000027_5714),
    .O(x86_Dout_0_mux000027_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y33" ))
  \x86_Dout_0_mux000027/YUSED  (
    .I(\x86_Dout_0_mux000027_SW0/O_pack_1 ),
    .O(\x86_Dout_0_mux000027_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y35" ))
  \x86_Dout<0>/DXMUX  (
    .I(x86_Dout_0_mux0000),
    .O(\x86_Dout<0>/DXMUX_5745 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y35" ))
  \x86_Dout<0>/YUSED  (
    .I(\x86_Dout_0_mux0000128/O_pack_2 ),
    .O(\x86_Dout_0_mux0000128/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y35" ))
  \x86_Dout<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<0>/CLKINV_5730 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y35" ))
  \x86_Dout<0>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<0>/CEINV_5729 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \x86_Dout_1_mux000039/XUSED  (
    .I(x86_Dout_1_mux000039_5771),
    .O(x86_Dout_1_mux000039_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y32" ))
  \x86_Dout_1_mux000039/YUSED  (
    .I(\x86_Dout_1_mux000038/O_pack_1 ),
    .O(\x86_Dout_1_mux000038/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \x86_Dout<1>/DXMUX  (
    .I(x86_Dout_1_mux0000),
    .O(\x86_Dout<1>/DXMUX_5802 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \x86_Dout<1>/YUSED  (
    .I(\x86_Dout_1_mux000020/O_pack_2 ),
    .O(\x86_Dout_1_mux000020/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \x86_Dout<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<1>/CLKINV_5787 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y35" ))
  \x86_Dout<1>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<1>/CEINV_5786 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \x86_Dout<2>/DXMUX  (
    .I(x86_Dout_2_mux0000),
    .O(\x86_Dout<2>/DXMUX_5835 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \x86_Dout<2>/YUSED  (
    .I(\x86_Dout_2_mux000011/O_pack_2 ),
    .O(\x86_Dout_2_mux000011/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \x86_Dout<2>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<2>/CLKINV_5820 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y34" ))
  \x86_Dout<2>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<2>/CEINV_5819 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y32" ))
  \x86_Hold_mux000236/XUSED  (
    .I(x86_Hold_mux000236_5861),
    .O(x86_Hold_mux000236_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y32" ))
  \x86_Hold_mux000236/YUSED  (
    .I(\x86_Hold_mux000220/O_pack_1 ),
    .O(\x86_Hold_mux000220/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y34" ))
  \x86_Dout_3_mux000023/XUSED  (
    .I(x86_Dout_3_mux000023_5885),
    .O(x86_Dout_3_mux000023_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y34" ))
  \x86_Dout_3_mux000023/YUSED  (
    .I(\x86_Dout_3_mux000023_SW0/O_pack_1 ),
    .O(\x86_Dout_3_mux000023_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y32" ))
  \x86_Hold/DXMUX  (
    .I(x86_Hold_mux0002),
    .O(\x86_Hold/DXMUX_5918 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y32" ))
  \x86_Hold/YUSED  (
    .I(\x86_Hold_mux000281/O_pack_2 ),
    .O(\x86_Hold_mux000281/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y32" ))
  \x86_Hold/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Hold/CLKINV_5901 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y32" ))
  \x86_Hold/CEINV  (
    .I(x86_Hold_not0001),
    .O(\x86_Hold/CEINV_5900 )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y32" ),
    .INIT ( 1'b0 ))
  x86_Hold (
    .I(\x86_Hold/DXMUX_5918 ),
    .CE(\x86_Hold/CEINV_5900 ),
    .CLK(\x86_Hold/CLKINV_5901 ),
    .SET(GND),
    .RST(\x86_Hold/FFX/RSTAND_5924 ),
    .O(x86_Hold_2908)
  );
  X_INV #(
    .LOC ( "SLICE_X15Y32" ))
  \x86_Hold/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Hold/FFX/RSTAND_5924 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEFC ),
    .LOC ( "SLICE_X17Y34" ))
  x86_Dout_3_mux000043 (
    .ADR0(N11),
    .ADR1(x86_Dout_3_mux000023_0),
    .ADR2(\x86_Dout_3_mux000010/O ),
    .ADR3(x86_Dout[3]),
    .O(x86_Dout_3_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X17Y34" ),
    .INIT ( 1'b0 ))
  x86_Dout_3 (
    .I(\x86_Dout<3>/DXMUX_5954 ),
    .CE(\x86_Dout<3>/CEINV_5938 ),
    .CLK(\x86_Dout<3>/CLKINV_5939 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[3])
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y34" ))
  \x86_Dout<3>/DXMUX  (
    .I(x86_Dout_3_mux0000),
    .O(\x86_Dout<3>/DXMUX_5954 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y34" ))
  \x86_Dout<3>/YUSED  (
    .I(\x86_Dout_3_mux000010/O_pack_2 ),
    .O(\x86_Dout_3_mux000010/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y34" ))
  \x86_Dout<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<3>/CLKINV_5939 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y34" ))
  \x86_Dout<3>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<3>/CEINV_5938 )
  );
  X_LUT4 #(
    .INIT ( 16'hBA00 ),
    .LOC ( "SLICE_X17Y34" ))
  x86_Dout_3_mux000010 (
    .ADR0(x86_Dout_3_mux00000_0),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(N209_0),
    .ADR3(N16),
    .O(\x86_Dout_3_mux000010/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0E0 ),
    .LOC ( "SLICE_X18Y37" ))
  x86_Dout_4_mux000021 (
    .ADR0(x86_Dout_4_mux00004_0),
    .ADR1(x86_Dout_4_mux000011_0),
    .ADR2(N16),
    .ADR3(x86_Dout_4_mux00001_0),
    .O(x86_Dout_4_mux000021_5980)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \x86_Dout_4_mux000021/XUSED  (
    .I(x86_Dout_4_mux000021_5980),
    .O(x86_Dout_4_mux000021_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y37" ))
  \x86_Dout_4_mux000021/YUSED  (
    .I(N16_pack_1),
    .O(N16)
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X18Y37" ))
  x86_Dout_3_mux000011 (
    .ADR0(CBE_0_IBUF_2821),
    .ADR1(\x86/AddressLatch [0]),
    .ADR2(x86_Hold_and0001),
    .ADR3(\x86/AddressLatch [2]),
    .O(N16_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X18Y34" ))
  x86_Dout_4_mux000040 (
    .ADR0(N11),
    .ADR1(x86_Dout[4]),
    .ADR2(x86_Dout_4_mux000021_0),
    .ADR3(\x86_Dout_4_mux00000/O ),
    .O(x86_Dout_4_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X18Y34" ),
    .INIT ( 1'b0 ))
  x86_Dout_4 (
    .I(\x86_Dout<4>/DXMUX_6011 ),
    .CE(\x86_Dout<4>/CEINV_5995 ),
    .CLK(\x86_Dout<4>/CLKINV_5996 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[4])
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y34" ))
  \x86_Dout<4>/DXMUX  (
    .I(x86_Dout_4_mux0000),
    .O(\x86_Dout<4>/DXMUX_6011 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y34" ))
  \x86_Dout<4>/YUSED  (
    .I(\x86_Dout_4_mux00000/O_pack_2 ),
    .O(\x86_Dout_4_mux00000/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y34" ))
  \x86_Dout<4>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<4>/CLKINV_5996 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y34" ))
  \x86_Dout<4>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<4>/CEINV_5995 )
  );
  X_LUT4 #(
    .INIT ( 16'h0080 ),
    .LOC ( "SLICE_X18Y34" ))
  x86_Dout_4_mux00000 (
    .ADR0(\x86/AddressLatch [2]),
    .ADR1(\Host/RCount [4]),
    .ADR2(x86_Hold_and0001),
    .ADR3(\x86/AddressLatch [0]),
    .O(\x86_Dout_4_mux00000/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y32" ))
  \x86_Hold_not0001/YUSED  (
    .I(x86_to_DB7_and0001_pack_1),
    .O(x86_to_DB7_and0001)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y32" ))
  \x86_Dout_5_mux000017/XUSED  (
    .I(x86_Dout_5_mux000017_6061),
    .O(x86_Dout_5_mux000017_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y32" ))
  \x86_Dout_5_mux000017/YUSED  (
    .I(\x86_Dout_5_mux00006/O_pack_1 ),
    .O(\x86_Dout_5_mux00006/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y35" ))
  \x86_Dout<6>/DXMUX  (
    .I(x86_Dout_6_mux0000),
    .O(\x86_Dout<6>/DXMUX_6092 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y35" ))
  \x86_Dout<6>/YUSED  (
    .I(\x86_Dout_6_mux000021/O_pack_2 ),
    .O(\x86_Dout_6_mux000021/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y35" ))
  \x86_Dout<6>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<6>/CLKINV_6077 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y35" ))
  \x86_Dout<6>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<6>/CEINV_6076 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \x86_Dout<7>/DXMUX  (
    .I(x86_Dout_7_mux0000),
    .O(\x86_Dout<7>/DXMUX_6125 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \x86_Dout<7>/YUSED  (
    .I(\x86_Dout_7_mux000011/O_pack_2 ),
    .O(\x86_Dout_7_mux000011/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \x86_Dout<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<7>/CLKINV_6110 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y35" ))
  \x86_Dout<7>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<7>/CEINV_6109 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y30" ))
  \x86_Dout<8>/DXMUX  (
    .I(x86_Dout_8_mux0000),
    .O(\x86_Dout<8>/DXMUX_6158 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y30" ))
  \x86_Dout<8>/YUSED  (
    .I(\x86_Dout_8_mux00004/O_pack_2 ),
    .O(\x86_Dout_8_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y30" ))
  \x86_Dout<8>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<8>/CLKINV_6143 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y30" ))
  \x86_Dout<8>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<8>/CEINV_6142 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y40" ))
  \LEDRegister_and0000/XUSED  (
    .I(LEDRegister_and0000),
    .O(LEDRegister_and0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y40" ))
  \LEDRegister_and0000/YUSED  (
    .I(LEDIndex_and0003_pack_1),
    .O(LEDIndex_and0003)
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y54" ))
  \DB7/State_cmp_eq0001/XUSED  (
    .I(\DB7/State_cmp_eq0001 ),
    .O(\DB7/State_cmp_eq0001_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y54" ))
  \DB7/State_cmp_eq0001/YUSED  (
    .I(\DB7/N13_pack_1 ),
    .O(\DB7/N13 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer<7>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [0]),
    .O(\DB7/StrobeTimer<7>/DXMUX_6239 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer<7>/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<0>13/O_pack_2 ),
    .O(\DB7/StrobeTimer_mux0000<0>13/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<7>/CLKINV_6224 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer<7>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<7>/CEINV_6223 )
  );
  X_FF #(
    .LOC ( "SLICE_X20Y55" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_7  (
    .I(\DB7/StrobeTimer<7>/DXMUX_6239 ),
    .CE(\DB7/StrobeTimer<7>/CEINV_6223 ),
    .CLK(\DB7/StrobeTimer<7>/CLKINV_6224 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [7])
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X32Y31" ))
  x86_Dout_9_mux000034 (
    .ADR0(x86_Dout_10_mux000025_0),
    .ADR1(x86_Dout_9_mux000024_0),
    .ADR2(\x86_Dout_9_mux00004/O ),
    .ADR3(x86_Dout_9_mux00009_0),
    .O(x86_Dout_9_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X32Y31" ),
    .INIT ( 1'b0 ))
  x86_Dout_9 (
    .I(\x86_Dout<9>/DXMUX_6272 ),
    .CE(\x86_Dout<9>/CEINV_6256 ),
    .CLK(\x86_Dout<9>/CLKINV_6257 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[9])
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y31" ))
  \x86_Dout<9>/DXMUX  (
    .I(x86_Dout_9_mux0000),
    .O(\x86_Dout<9>/DXMUX_6272 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y31" ))
  \x86_Dout<9>/YUSED  (
    .I(\x86_Dout_9_mux00004/O_pack_2 ),
    .O(\x86_Dout_9_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y31" ))
  \x86_Dout<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<9>/CLKINV_6257 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y31" ))
  \x86_Dout<9>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<9>/CEINV_6256 )
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X32Y31" ))
  x86_Dout_9_mux00004 (
    .ADR0(N17_0),
    .ADR1(x86_Dlast[9]),
    .ADR2(N5_0),
    .ADR3(x86_Dout[9]),
    .O(\x86_Dout_9_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0EE ),
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer_mux0000<1>42  (
    .ADR0(N184_0),
    .ADR1(\DB7/StrobeTimer_mux0000<1>16_0 ),
    .ADR2(\DB7/StrobeTimer_mux0000<1>25_SW1/O ),
    .ADR3(\DB7/N16_0 ),
    .O(\DB7/StrobeTimer_mux0000 [1])
  );
  X_FF #(
    .LOC ( "SLICE_X15Y59" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_6  (
    .I(\DB7/StrobeTimer<6>/DXMUX_6305 ),
    .CE(\DB7/StrobeTimer<6>/CEINV_6288 ),
    .CLK(\DB7/StrobeTimer<6>/CLKINV_6289 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [6])
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer<6>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [1]),
    .O(\DB7/StrobeTimer<6>/DXMUX_6305 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer<6>/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<1>25_SW1/O_pack_2 ),
    .O(\DB7/StrobeTimer_mux0000<1>25_SW1/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer<6>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<6>/CLKINV_6289 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer<6>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<6>/CEINV_6288 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFA0 ),
    .LOC ( "SLICE_X15Y59" ))
  \DB7/StrobeTimer_mux0000<1>25_SW1  (
    .ADR0(\DB7/StrobeTimer_mux0000<1>8_0 ),
    .ADR1(VCC),
    .ADR2(\DB7/N411 ),
    .ADR3(\DB7/StrobeTimer [6]),
    .O(\DB7/StrobeTimer_mux0000<1>25_SW1/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEC ),
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer_mux0000<4>20  (
    .ADR0(\DB7/StrobeTimer [3]),
    .ADR1(\DB7/StrobeTimer_mux0000<4>17_0 ),
    .ADR2(\DB7/N28_0 ),
    .ADR3(\DB7/StrobeTimer_mux0000<4>5/O ),
    .O(\DB7/StrobeTimer_mux0000 [4])
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer<3>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [4]),
    .O(\DB7/StrobeTimer<3>/DXMUX_6338 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer<3>/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<4>5/O_pack_2 ),
    .O(\DB7/StrobeTimer_mux0000<4>5/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<3>/CLKINV_6323 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer<3>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<3>/CEINV_6322 )
  );
  X_LUT4 #(
    .INIT ( 16'hCCC8 ),
    .LOC ( "SLICE_X20Y58" ))
  \DB7/StrobeTimer_mux0000<4>5  (
    .ADR0(\DB7/StrobeTimer [1]),
    .ADR1(\DB7/StrobeTimer_or0000 ),
    .ADR2(\DB7/StrobeTimer [2]),
    .ADR3(\DB7/StrobeTimer [0]),
    .O(\DB7/StrobeTimer_mux0000<4>5/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y38" ))
  \x86/AddressLatch_not0001/XUSED  (
    .I(\x86/AddressLatch_not0001 ),
    .O(\x86/AddressLatch_not0001_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y38" ))
  \x86/AddressLatch_not0001/YUSED  (
    .I(\x86/IORead_and0000_pack_1 ),
    .O(\x86/IORead_and0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y32" ))
  \DataToHost_and0000/XUSED  (
    .I(DataToHost_and0000),
    .O(DataToHost_and0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y32" ))
  \DataToHost_and0000/YUSED  (
    .I(DataToHost_or0000_pack_1),
    .O(DataToHost_or0000_3080)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y34" ))
  \Host/USBDir_mux000024/XUSED  (
    .I(\Host/USBDir_mux000024_6412 ),
    .O(\Host/USBDir_mux000024_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y34" ))
  \Host/USBDir_mux000024/YUSED  (
    .I(\Host/PuttingByte_cmp_eq0000_pack_1 ),
    .O(\Host/PuttingByte_cmp_eq0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount<3>/DXMUX  (
    .I(\DB7/ShiftCount_mux0001[0] ),
    .O(\DB7/ShiftCount<3>/DXMUX_6443 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount<3>/YUSED  (
    .I(\DB7/ShiftCount_mux0001<0>26/O_pack_3 ),
    .O(\DB7/ShiftCount_mux0001<0>26/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/ShiftCount<3>/CLKINV_6428 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount<3>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/ShiftCount<3>/CEINV_6427 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir/DXMUX  (
    .I(\Host/USBDir_mux0000 ),
    .O(\Host/USBDir/DXMUX_6476 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir/YUSED  (
    .I(\Host/USBDir_mux00007/O_pack_2 ),
    .O(\Host/USBDir_mux00007/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/USBDir/CLKINV_6460 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount<2>/DXMUX  (
    .I(\DB7/ShiftCount_mux0001[1] ),
    .O(\DB7/ShiftCount<2>/DXMUX_6510 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount<2>/YUSED  (
    .I(\DB7/ShiftCount_mux0001<1>20/O_pack_2 ),
    .O(\DB7/ShiftCount_mux0001<1>20/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount<2>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/ShiftCount<2>/CLKINV_6495 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount<2>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/ShiftCount<2>/CEINV_6494 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y56" ))
  \DB7/N28/XUSED  (
    .I(\DB7/N28 ),
    .O(\DB7/N28_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y56" ))
  \DB7/N28/YUSED  (
    .I(\DB7/StrobeTimer_or0000_pack_1 ),
    .O(\DB7/StrobeTimer_or0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y32" ))
  \x86_Dout_15_mux00009/XUSED  (
    .I(x86_Dout_15_mux00009_6560),
    .O(x86_Dout_15_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y32" ))
  \x86_Dout_15_mux00009/YUSED  (
    .I(N15_pack_1),
    .O(N15)
  );
  X_LUT4 #(
    .INIT ( 16'h0080 ),
    .LOC ( "SLICE_X19Y37" ))
  \x86/ConfigData_and00002  (
    .ADR0(PCI_Reset_IBUF_2742),
    .ADR1(N51_0),
    .ADR2(\x86/IORead_and0000 ),
    .ADR3(\x86/State_cmp_ne0000 ),
    .O(\x86/ConfigData_and0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y37" ))
  \x86/ConfigData_and0000/XUSED  (
    .I(\x86/ConfigData_and0000 ),
    .O(\x86/ConfigData_and0000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y37" ))
  \x86/ConfigData_and0000/YUSED  (
    .I(\x86/State_cmp_ne0000_pack_1 ),
    .O(\x86/State_cmp_ne0000 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFA ),
    .LOC ( "SLICE_X19Y37" ))
  \x86/State_FSM_Out41  (
    .ADR0(\x86/State_FSM_FFd1_2907 ),
    .ADR1(VCC),
    .ADR2(\x86/State_FSM_FFd3_2906 ),
    .ADR3(\x86/State_FSM_FFd2_2904 ),
    .O(\x86/State_cmp_ne0000_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X26Y35" ))
  \x86/IOWrite_mux00001  (
    .ADR0(\x86/IOWrite_3029 ),
    .ADR1(\x86/State_cmp_eq0003_0 ),
    .ADR2(N59),
    .ADR3(N4_0),
    .O(\x86/IOWrite_mux0000 )
  );
  X_INV #(
    .LOC ( "SLICE_X26Y35" ))
  \x86/IOWrite/FFX/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/IOWrite/FFX/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X26Y35" ),
    .INIT ( 1'b0 ))
  \x86/IOWrite  (
    .I(\x86/IOWrite/DXMUX_6615 ),
    .CE(VCC),
    .CLK(\x86/IOWrite/CLKINV_6599 ),
    .SET(GND),
    .RST(\x86/IOWrite/FFX/RST ),
    .O(\x86/IOWrite_3029 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y35" ))
  \x86/IOWrite/DXMUX  (
    .I(\x86/IOWrite_mux0000 ),
    .O(\x86/IOWrite/DXMUX_6615 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y35" ))
  \x86/IOWrite/YUSED  (
    .I(N59_pack_2),
    .O(N59)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y35" ))
  \x86/IOWrite/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/IOWrite/CLKINV_6599 )
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X26Y35" ))
  \x86/IORead_mux000011  (
    .ADR0(\x86/IORead_and0001 ),
    .ADR1(Frame_IBUF_2840),
    .ADR2(\x86/LastFrame_2923 ),
    .ADR3(\x86/State_cmp_ne0000 ),
    .O(N59_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X16Y58" ))
  \DB7/Shifting_mux00000  (
    .ADR0(\DB7/StrobeTimer [6]),
    .ADR1(\DB7/StrobeTimer [7]),
    .ADR2(\DB7/N7 ),
    .ADR3(\DB7/State_FSM_FFd2-In21_SW0/O ),
    .O(\DB7/Shifting_mux00000_6643 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y58" ))
  \DB7/Shifting_mux00000/XUSED  (
    .I(\DB7/Shifting_mux00000_6643 ),
    .O(\DB7/Shifting_mux00000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y58" ))
  \DB7/Shifting_mux00000/YUSED  (
    .I(\DB7/State_FSM_FFd2-In21_SW0/O_pack_1 ),
    .O(\DB7/State_FSM_FFd2-In21_SW0/O )
  );
  X_LUT4 #(
    .INIT ( 16'hF3F3 ),
    .LOC ( "SLICE_X16Y58" ))
  \DB7/State_FSM_FFd2-In21_SW0  (
    .ADR0(VCC),
    .ADR1(\DB7/State_FSM_FFd3_2981 ),
    .ADR2(SSAck_IBUF_2768),
    .ADR3(VCC),
    .O(\DB7/State_FSM_FFd2-In21_SW0/O_pack_1 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y43" ))
  \x86_to_DB7_not0001/YUSED  (
    .I(\x86_to_DB7_not00011_SW0/O_pack_1 ),
    .O(\x86_to_DB7_not00011_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready/DXMUX  (
    .I(\DB7/Ready_mux0000 ),
    .O(\DB7/Ready/DXMUX_6698 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready/YUSED  (
    .I(\DB7/Ready_mux00008/O_pack_3 ),
    .O(\DB7/Ready_mux00008/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Ready/CLKINV_6682 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y44" ))
  \DB7_Dout_and0000/XUSED  (
    .I(DB7_Dout_and0000),
    .O(DB7_Dout_and0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y44" ))
  \DB7_Dout_and0000/YUSED  (
    .I(\DB7_Dout_and00001_SW0/O_pack_1 ),
    .O(\DB7_Dout_and00001_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut/DXMUX  (
    .I(\DB7/StrobeOut_mux0001 ),
    .O(\DB7/StrobeOut/DXMUX_6756 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut/YUSED  (
    .I(\DB7/StrobeOut_mux000123/O_pack_2 ),
    .O(\DB7/StrobeOut_mux000123/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeOut/CLKINV_6740 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y32" ))
  \N154/XUSED  (
    .I(N154),
    .O(N154_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y32" ))
  \N154/YUSED  (
    .I(N11_pack_1),
    .O(N11)
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y57" ))
  \N114/XUSED  (
    .I(N114),
    .O(N114_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y57" ))
  \N114/YUSED  (
    .I(\DB7/N18_pack_1 ),
    .O(\DB7/N18 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y32" ))
  \N5/XUSED  (
    .I(N5),
    .O(N5_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y32" ))
  \N5/YUSED  (
    .I(N01_pack_1),
    .O(N01)
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y34" ))
  \x86_Dout<10>/DXMUX  (
    .I(x86_Dout_10_mux0000),
    .O(\x86_Dout<10>/DXMUX_6863 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y34" ))
  \x86_Dout<10>/YUSED  (
    .I(\x86_Dout_10_mux000041/O_pack_2 ),
    .O(\x86_Dout_10_mux000041/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y34" ))
  \x86_Dout<10>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<10>/CLKINV_6848 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y34" ))
  \x86_Dout<10>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<10>/CEINV_6847 )
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X25Y31" ))
  x86_Dout_10_mux000052 (
    .ADR0(\x86/AddressLatch [3]),
    .ADR1(\x86/AddressLatch [1]),
    .ADR2(x86_Dout_8_cmp_eq0004_0),
    .ADR3(\x86_Hold_cmp_eq00011/O ),
    .O(N20)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y31" ))
  \N20/XUSED  (
    .I(N20),
    .O(N20_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y31" ))
  \N20/YUSED  (
    .I(\x86_Hold_cmp_eq00011/O_pack_1 ),
    .O(\x86_Hold_cmp_eq00011/O )
  );
  X_LUT4 #(
    .INIT ( 16'h0C0C ),
    .LOC ( "SLICE_X25Y31" ))
  x86_Hold_cmp_eq00011 (
    .ADR0(VCC),
    .ADR1(\x86/AddressLatch [0]),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(VCC),
    .O(\x86_Hold_cmp_eq00011/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X23Y36" ))
  x86_Dout_11_mux000034 (
    .ADR0(x86_Dout_10_mux000025_0),
    .ADR1(x86_Dout_11_mux000024_0),
    .ADR2(\x86_Dout_11_mux00004/O ),
    .ADR3(x86_Dout_11_mux00009_0),
    .O(x86_Dout_11_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X23Y36" ),
    .INIT ( 1'b0 ))
  x86_Dout_11 (
    .I(\x86_Dout<11>/DXMUX_6920 ),
    .CE(\x86_Dout<11>/CEINV_6904 ),
    .CLK(\x86_Dout<11>/CLKINV_6905 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[11])
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y36" ))
  \x86_Dout<11>/DXMUX  (
    .I(x86_Dout_11_mux0000),
    .O(\x86_Dout<11>/DXMUX_6920 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y36" ))
  \x86_Dout<11>/YUSED  (
    .I(\x86_Dout_11_mux00004/O_pack_2 ),
    .O(\x86_Dout_11_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y36" ))
  \x86_Dout<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<11>/CLKINV_6905 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y36" ))
  \x86_Dout<11>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<11>/CEINV_6904 )
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X23Y36" ))
  x86_Dout_11_mux00004 (
    .ADR0(x86_Dout[11]),
    .ADR1(N17_0),
    .ADR2(x86_Dlast[11]),
    .ADR3(N5_0),
    .O(\x86_Dout_11_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X33Y30" ))
  x86_Dout_12_mux000020 (
    .ADR0(N20_0),
    .ADR1(\Host/RxData [4]),
    .ADR2(\x86_Dout_12_mux00004/O ),
    .ADR3(x86_Dout_12_mux00009_0),
    .O(x86_Dout_12_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X33Y30" ),
    .INIT ( 1'b0 ))
  x86_Dout_12 (
    .I(\x86_Dout<12>/DXMUX_6953 ),
    .CE(\x86_Dout<12>/CEINV_6937 ),
    .CLK(\x86_Dout<12>/CLKINV_6938 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[12])
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y30" ))
  \x86_Dout<12>/DXMUX  (
    .I(x86_Dout_12_mux0000),
    .O(\x86_Dout<12>/DXMUX_6953 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y30" ))
  \x86_Dout<12>/YUSED  (
    .I(\x86_Dout_12_mux00004/O_pack_2 ),
    .O(\x86_Dout_12_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y30" ))
  \x86_Dout<12>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<12>/CLKINV_6938 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y30" ))
  \x86_Dout<12>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<12>/CEINV_6937 )
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X33Y30" ))
  x86_Dout_12_mux00004 (
    .ADR0(x86_Dlast[12]),
    .ADR1(N5_0),
    .ADR2(x86_Dout[12]),
    .ADR3(N17_0),
    .O(\x86_Dout_12_mux00004/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y31" ))
  \x86_Dout<13>/DXMUX  (
    .I(x86_Dout_13_mux0000),
    .O(\x86_Dout<13>/DXMUX_6986 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y31" ))
  \x86_Dout<13>/YUSED  (
    .I(\x86_Dout_13_mux00004/O_pack_2 ),
    .O(\x86_Dout_13_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y31" ))
  \x86_Dout<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<13>/CLKINV_6971 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y31" ))
  \x86_Dout<13>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<13>/CEINV_6970 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y34" ))
  \x86_Dout<14>/DXMUX  (
    .I(x86_Dout_14_mux0000),
    .O(\x86_Dout<14>/DXMUX_7019 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y34" ))
  \x86_Dout<14>/YUSED  (
    .I(\x86_Dout_14_mux00004/O_pack_2 ),
    .O(\x86_Dout_14_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y34" ))
  \x86_Dout<14>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<14>/CLKINV_7004 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y34" ))
  \x86_Dout<14>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<14>/CEINV_7003 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y37" ))
  \N203/XUSED  (
    .I(N203),
    .O(N203_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y37" ))
  \N203/YUSED  (
    .I(\x86/State_FSM_FFd2-In33_SW0/O_pack_1 ),
    .O(\x86/State_FSM_FFd2-In33_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount<0>/DXMUX  (
    .I(\DB7/ShiftCount_mux0001[3] ),
    .O(\DB7/ShiftCount<0>/DXMUX_7076 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount<0>/YUSED  (
    .I(\DB7/N14_pack_2 ),
    .O(\DB7/N14 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/ShiftCount<0>/CLKINV_7060 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount<0>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/ShiftCount<0>/CEINV_7059 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y32" ))
  \x86_Dout<15>/DXMUX  (
    .I(x86_Dout_15_mux0000),
    .O(\x86_Dout<15>/DXMUX_7109 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y32" ))
  \x86_Dout<15>/YUSED  (
    .I(\x86_Dout_15_mux00004/O_pack_2 ),
    .O(\x86_Dout_15_mux00004/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y32" ))
  \x86_Dout<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<15>/CLKINV_7094 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y32" ))
  \x86_Dout<15>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<15>/CEINV_7093 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y33" ))
  \x86_Dout<17>/DXMUX  (
    .I(x86_Dout_17_mux0000),
    .O(\x86_Dout<17>/DXMUX_7142 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y33" ))
  \x86_Dout<17>/YUSED  (
    .I(\x86_Dout_17_mux0000111_SW0/O_pack_2 ),
    .O(\x86_Dout_17_mux0000111_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y33" ))
  \x86_Dout<17>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<17>/CLKINV_7127 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y33" ))
  \x86_Dout<17>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<17>/CEINV_7126 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y57" ))
  \DB7/StrobeOut_mux00017/XUSED  (
    .I(\DB7/StrobeOut_mux00017_7168 ),
    .O(\DB7/StrobeOut_mux00017_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y57" ))
  \DB7/StrobeOut_mux00017/YUSED  (
    .I(\StateOut<0>_pack_1 ),
    .O(StateOut[0])
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X26Y32" ))
  x86_Dout_10_mux00004 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(N211_0),
    .ADR3(x86_Hold_and0001),
    .O(N17)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y32" ))
  \N17/XUSED  (
    .I(N17),
    .O(N17_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y32" ))
  \N17/YUSED  (
    .I(x86_Hold_and0001_pack_1),
    .O(x86_Hold_and0001)
  );
  X_LUT4 #(
    .INIT ( 16'h000F ),
    .LOC ( "SLICE_X26Y32" ))
  LEDIndex_and000311 (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\x86/AddressLatch [3]),
    .ADR3(\x86/AddressLatch [1]),
    .O(x86_Hold_and0001_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X29Y31" ))
  x86_Dout_14_mux00009 (
    .ADR0(\Host/WCount [6]),
    .ADR1(N22),
    .ADR2(\DB7/Accumulator [14]),
    .ADR3(N15),
    .O(x86_Dout_14_mux00009_7216)
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y31" ))
  \x86_Dout_14_mux00009/XUSED  (
    .I(x86_Dout_14_mux00009_7216),
    .O(x86_Dout_14_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y31" ))
  \x86_Dout_14_mux00009/YUSED  (
    .I(N22_pack_1),
    .O(N22)
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X29Y31" ))
  x86_Dout_10_mux000061 (
    .ADR0(\x86/AddressLatch [3]),
    .ADR1(\x86/AddressLatch [1]),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(\x86/AddressLatch [0]),
    .O(N22_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X16Y57" ))
  \DB7/StrobeTimer_mux0000<1>25_SW0  (
    .ADR0(\DB7/StrobeTimer_mux0000<1>8_0 ),
    .ADR1(\DB7/StrobeTimer [6]),
    .ADR2(\DB7/N411 ),
    .ADR3(N126_0),
    .O(N184)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y57" ))
  \N184/XUSED  (
    .I(N184),
    .O(N184_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y57" ))
  \N184/YUSED  (
    .I(\DB7/N411_pack_1 ),
    .O(\DB7/N411 )
  );
  X_LUT4 #(
    .INIT ( 16'h5040 ),
    .LOC ( "SLICE_X16Y57" ))
  \DB7/StrobeTimer_mux0000<1>21  (
    .ADR0(\DB7/ShiftCount [0]),
    .ADR1(\DB7/State_FSM_FFd2_3034 ),
    .ADR2(\DB7/SClock_2839 ),
    .ADR3(\DB7/State_FSM_FFd4_3097 ),
    .O(\DB7/N411_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEEE ),
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting_mux000018  (
    .ADR0(\DB7/Shifting_mux00000_0 ),
    .ADR1(\DB7/N14 ),
    .ADR2(\DB7/Shifting_mux000010/O ),
    .ADR3(\DB7/Shifting_3167 ),
    .O(\DB7/Shifting_mux0000 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting/DXMUX  (
    .I(\DB7/Shifting_mux0000 ),
    .O(\DB7/Shifting/DXMUX_7271 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting/YUSED  (
    .I(\DB7/Shifting_mux000010/O_pack_2 ),
    .O(\DB7/Shifting_mux000010/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Shifting/CLKINV_7255 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAEA ),
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting_mux000010  (
    .ADR0(N146_0),
    .ADR1(\DB7/ShiftCount [3]),
    .ADR2(StateOut[0]),
    .ADR3(\DB7/N18 ),
    .O(\DB7/Shifting_mux000010/O_pack_2 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y50" ))
  \LEDShift_and000020/XUSED  (
    .I(LEDShift_and000020_7299),
    .O(LEDShift_and000020_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y50" ))
  \LEDShift_and000020/YUSED  (
    .I(\Msub_LEDIndex_addsub0000_cy<1>_pack_1 ),
    .O(Msub_LEDIndex_addsub0000_cy[1])
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y31" ))
  \x86_Dout<16>/DXMUX  (
    .I(x86_Dout_16_mux0000_7327),
    .O(\x86_Dout<16>/DXMUX_7330 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y31" ))
  \x86_Dout<16>/YUSED  (
    .I(\x86_Dout_16_mux0000_SW0_SW0/O_pack_2 ),
    .O(\x86_Dout_16_mux0000_SW0_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y31" ))
  \x86_Dout<16>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<16>/CLKINV_7314 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y31" ))
  \x86_Dout<16>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<16>/CEINV_7313 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y59" ))
  \DB7/N3/XUSED  (
    .I(\DB7/N3 ),
    .O(\DB7/N3_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y59" ))
  \DB7/N3/YUSED  (
    .I(\DB7/State_FSM_FFd1-In1_SW0/O_pack_1 ),
    .O(\DB7/State_FSM_FFd1-In1_SW0/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y59" ))
  \DB7/Shifting_and0000/XUSED  (
    .I(\DB7/Shifting_and0000 ),
    .O(\DB7/Shifting_and0000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y59" ))
  \DB7/Shifting_and0000/YUSED  (
    .I(\DB7/N7_pack_1 ),
    .O(\DB7/N7 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1/DXMUX  (
    .I(\DB7/State_FSM_FFd1-In_7408 ),
    .O(\DB7/State_FSM_FFd1/DXMUX_7411 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1/YUSED  (
    .I(\DB7/State_FSM_FFd1-In_SW1/O_pack_2 ),
    .O(\DB7/State_FSM_FFd1-In_SW1/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/State_FSM_FFd1/CLKINV_7394 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd2/DXMUX  (
    .I(\DB7/State_FSM_FFd2-In ),
    .O(\DB7/State_FSM_FFd2/DXMUX_7446 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd2/YUSED  (
    .I(\DB7/State_FSM_FFd1-In21/O_pack_2 ),
    .O(\DB7/State_FSM_FFd1-In21/O )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd2/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/State_FSM_FFd2/CLKINV_7428 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y33" ))
  \Host/RxBufferFull_not0001/YUSED  (
    .I(\Host/PuttingByte_cmp_ne0000_pack_1 ),
    .O(\Host/PuttingByte_cmp_ne0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X34Y51" ),
    .INIT ( 1'b0 ))
  LEDShift (
    .I(\LEDShift/DYMUX_7496 ),
    .CE(\LEDShift/CEINV_7487 ),
    .CLK(\LEDShift/CLKINV_7488 ),
    .SET(GND),
    .RST(GND),
    .O(LEDShift_2831)
  );
  X_LUT4 #(
    .INIT ( 16'h5F5F ),
    .LOC ( "SLICE_X34Y51" ))
  DClock1 (
    .ADR0(LEDShift_2831),
    .ADR1(VCC),
    .ADR2(PCI_Clock_IBUF1),
    .ADR3(VCC),
    .O(DClock_OBUF_7507)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y51" ))
  \LEDShift/DYMUX  (
    .I(LEDShift_mux0000),
    .O(\LEDShift/DYMUX_7496 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y51" ))
  \LEDShift/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDShift/CLKINV_7488 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y51" ))
  \LEDShift/CEINV  (
    .I(LEDShift_and0000),
    .O(\LEDShift/CEINV_7487 )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y50" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_1  (
    .I(\x86/ConfigData<1>/DYMUX_7530 ),
    .CE(\x86/ConfigData<1>/CEINV_7520 ),
    .CLK(\x86/ConfigData<1>/CLKINV_7521 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [1])
  );
  X_LUT4 #(
    .INIT ( 16'hAAF0 ),
    .LOC ( "SLICE_X21Y50" ))
  \x86/Dout<1>1  (
    .ADR0(\x86/ConfigData [1]),
    .ADR1(VCC),
    .ADR2(x86_Dout[1]),
    .ADR3(\x86/ConfigRead_3183 ),
    .O(\x86/Dout [1])
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y50" ))
  \x86/ConfigData<1>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [16]),
    .O(\x86/ConfigData<1>/DYMUX_7530 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y50" ))
  \x86/ConfigData<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<1>/CLKINV_7521 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y50" ))
  \x86/ConfigData<1>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<1>/CEINV_7520 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAF0 ),
    .LOC ( "SLICE_X21Y50" ))
  \x86/ConfigData_mux0000<16>1  (
    .ADR0(N2_0),
    .ADR1(VCC),
    .ADR2(N6),
    .ADR3(\x86/ConfigData [1]),
    .O(\x86/ConfigData_mux0000 [16])
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData<3>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [14]),
    .O(\x86/ConfigData<3>/DXMUX_7576 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData<3>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [15]),
    .O(\x86/ConfigData<3>/DYMUX_7563 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<3>/CLKINV_7554 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData<3>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<3>/CEINV_7553 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData<5>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [12]),
    .O(\x86/ConfigData<5>/DXMUX_7614 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData<5>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [13]),
    .O(\x86/ConfigData<5>/DYMUX_7601 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<5>/CLKINV_7592 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData<5>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<5>/CEINV_7591 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData<7>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [10]),
    .O(\x86/ConfigData<7>/DXMUX_7652 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData<7>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [11]),
    .O(\x86/ConfigData<7>/DYMUX_7639 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<7>/CLKINV_7630 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData<7>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<7>/CEINV_7629 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/XUSED  (
    .I(\Host/PuttingByte_cmp_eq0002 ),
    .O(\Host/PuttingByte_cmp_eq0002_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/DYMUX  (
    .I(\Host/TxDone/GYMUX_7678 ),
    .O(\Host/TxDone/DYMUX_7679 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/YUSED  (
    .I(\Host/TxDone/GYMUX_7678 ),
    .O(\Host/PuttingByte_cmp_eq0001_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/GYMUX  (
    .I(\Host/PuttingByte_cmp_eq0001 ),
    .O(\Host/TxDone/GYMUX_7678 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/TxDone/CLKINV_7668 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/CEINV  (
    .I(\Host/TxDone_not0001 ),
    .O(\Host/TxDone/CEINV_7667 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData<11>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [6]),
    .O(\x86/ConfigData<11>/DXMUX_7729 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData<11>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [7]),
    .O(\x86/ConfigData<11>/DYMUX_7716 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<11>/CLKINV_7707 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData<11>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<11>/CEINV_7706 )
  );
  X_FF #(
    .LOC ( "SLICE_X39Y40" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_13  (
    .I(\x86/ConfigData<13>/DXMUX_7767 ),
    .CE(\x86/ConfigData<13>/CEINV_7744 ),
    .CLK(\x86/ConfigData<13>/CLKINV_7745 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [13])
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData<13>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [4]),
    .O(\x86/ConfigData<13>/DXMUX_7767 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData<13>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [5]),
    .O(\x86/ConfigData<13>/DYMUX_7754 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<13>/CLKINV_7745 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData<13>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<13>/CEINV_7744 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF88 ),
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData_mux0000<4>1  (
    .ADR0(\x86/ConfigData [13]),
    .ADR1(N2_0),
    .ADR2(VCC),
    .ADR3(N14),
    .O(\x86/ConfigData_mux0000 [4])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y47" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_14  (
    .I(\x86/ConfigData<15>/DYMUX_7792 ),
    .CE(\x86/ConfigData<15>/CEINV_7782 ),
    .CLK(\x86/ConfigData<15>/CLKINV_7783 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [14])
  );
  X_LUT4 #(
    .INIT ( 16'hFAF0 ),
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData_mux0000<2>1  (
    .ADR0(N2_0),
    .ADR1(VCC),
    .ADR2(N6),
    .ADR3(\x86/ConfigData [15]),
    .O(\x86/ConfigData_mux0000 [2])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y47" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_15  (
    .I(\x86/ConfigData<15>/DXMUX_7805 ),
    .CE(\x86/ConfigData<15>/CEINV_7782 ),
    .CLK(\x86/ConfigData<15>/CLKINV_7783 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [15])
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData<15>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [2]),
    .O(\x86/ConfigData<15>/DXMUX_7805 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData<15>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [3]),
    .O(\x86/ConfigData<15>/DYMUX_7792 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<15>/CLKINV_7783 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData<15>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<15>/CEINV_7782 )
  );
  X_LUT4 #(
    .INIT ( 16'hF8F8 ),
    .LOC ( "SLICE_X39Y47" ))
  \x86/ConfigData_mux0000<3>1  (
    .ADR0(N2_0),
    .ADR1(\x86/ConfigData [14]),
    .ADR2(N6),
    .ADR3(VCC),
    .O(\x86/ConfigData_mux0000 [3])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y27" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_16  (
    .I(\x86/ConfigData<17>/DYMUX_7830 ),
    .CE(\x86/ConfigData<17>/CEINV_7820 ),
    .CLK(\x86/ConfigData<17>/CLKINV_7821 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [16])
  );
  X_LUT4 #(
    .INIT ( 16'hEECC ),
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData_mux0000<0>2  (
    .ADR0(N2_0),
    .ADR1(N14),
    .ADR2(VCC),
    .ADR3(\x86/ConfigData [17]),
    .O(\x86/ConfigData_mux0000 [0])
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData<17>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [0]),
    .O(\x86/ConfigData<17>/DXMUX_7843 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData<17>/DYMUX  (
    .I(\x86/ConfigData_mux0000 [1]),
    .O(\x86/ConfigData<17>/DYMUX_7830 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData<17>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<17>/CLKINV_7821 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData<17>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<17>/CEINV_7820 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFC0 ),
    .LOC ( "SLICE_X25Y27" ))
  \x86/ConfigData_mux0000<1>1  (
    .ADR0(VCC),
    .ADR1(\x86/ConfigData [16]),
    .ADR2(N2_0),
    .ADR3(N14),
    .O(\x86/ConfigData_mux0000 [1])
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y32" ))
  \x86_Active/XUSED  (
    .I(N176),
    .O(N176_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y32" ))
  \x86_Active/DYMUX  (
    .I(x86_Active_mux0002),
    .O(\x86_Active/DYMUX_7869 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y32" ))
  \x86_Active/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Active/CLKINV_7859 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd2/DXMUX  (
    .I(\x86/State_FSM_FFd2-In ),
    .O(\x86/State_FSM_FFd2/DXMUX_7918 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd2/DYMUX  (
    .I(\x86/State_FSM_FFd1-In ),
    .O(\x86/State_FSM_FFd2/DYMUX_7904 )
  );
  X_INV #(
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd2/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/State_FSM_FFd2/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd2/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/State_FSM_FFd2/CLKINV_7894 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/XUSED  (
    .I(\Host/RxData_not0001 ),
    .O(\Host/RxData_not0001_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/DYMUX  (
    .I(\Host/RxBufferFull/GYMUX_7948 ),
    .O(\Host/RxBufferFull/DYMUX_7949 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/YUSED  (
    .I(\Host/RxBufferFull/GYMUX_7948 ),
    .O(\Host/RCount_not0001_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/GYMUX  (
    .I(\Host/RCount_not0001 ),
    .O(\Host/RxBufferFull/GYMUX_7948 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RxBufferFull/CLKINV_7940 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/CEINV  (
    .I(\Host/RxBufferFull_not0001 ),
    .O(\Host/RxBufferFull/CEINV_7939 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd4/DXMUX  (
    .I(\DB7/State_FSM_FFd4-In ),
    .O(\DB7/State_FSM_FFd4/DXMUX_7999 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd4/DYMUX  (
    .I(\DB7/State_FSM_FFd3-In_7982 ),
    .O(\DB7/State_FSM_FFd4/DYMUX_7985 )
  );
  X_INV #(
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd4/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/State_FSM_FFd4/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd4/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/State_FSM_FFd4/CLKINV_7976 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y33" ))
  \x86_Dout<5>/DYMUX  (
    .I(x86_Dout_5_mux0000),
    .O(\x86_Dout<5>/DYMUX_8022 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y33" ))
  \x86_Dout<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dout<5>/CLKINV_8013 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y33" ))
  \x86_Dout<5>/CEINV  (
    .I(x86_Dout_0_and0000_0),
    .O(\x86_Dout<5>/CEINV_8012 )
  );
  X_INV #(
    .LOC ( "SLICE_X30Y33" ))
  \WriteToHost/FFY/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\WriteToHost/FFY/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X30Y33" ),
    .INIT ( 1'b0 ))
  WriteToHost (
    .I(\WriteToHost/DYMUX_8049 ),
    .CE(\WriteToHost/CEINV_8037 ),
    .CLK(\WriteToHost/CLKINV_8038 ),
    .SET(GND),
    .RST(\WriteToHost/FFY/RST ),
    .O(WriteToHost_3084)
  );
  X_LUT4 #(
    .INIT ( 16'hB3B3 ),
    .LOC ( "SLICE_X30Y33" ))
  WriteToHost_not00011 (
    .ADR0(WriteToHost_3084),
    .ADR1(DataToHost_or0000_3080),
    .ADR2(\Host/TxDone_2997 ),
    .ADR3(VCC),
    .O(WriteToHost_not0001_pack_3)
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y33" ))
  \WriteToHost/DYMUX  (
    .I(WriteToHost_mux0000),
    .O(\WriteToHost/DYMUX_8049 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y33" ))
  \WriteToHost/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\WriteToHost/CLKINV_8038 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y33" ))
  \WriteToHost/CEINV  (
    .I(WriteToHost_not0001_pack_3),
    .O(\WriteToHost/CEINV_8037 )
  );
  X_LUT4 #(
    .INIT ( 16'h5F5F ),
    .LOC ( "SLICE_X30Y33" ))
  WriteToHost_mux00001 (
    .ADR0(WriteToHost_3084),
    .ADR1(VCC),
    .ADR2(\Host/TxDone_2997 ),
    .ADR3(VCC),
    .O(WriteToHost_mux0000)
  );
  X_LUT4 #(
    .INIT ( 16'h7FFF ),
    .LOC ( "SLICE_X38Y67" ))
  LEDOut_mux00001 (
    .ADR0(Scaler[15]),
    .ADR1(Scaler[12]),
    .ADR2(Scaler[13]),
    .ADR3(Scaler[14]),
    .O(LEDOut_mux0000)
  );
  X_INV #(
    .LOC ( "SLICE_X38Y67" ))
  \LEDOut/FFY/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\LEDOut/FFY/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X38Y67" ),
    .INIT ( 1'b0 ))
  LEDOut (
    .I(\LEDOut/DYMUX_8083 ),
    .CE(\LEDOut/CEINV_8073 ),
    .CLK(\LEDOut/CLKINV_8074 ),
    .SET(GND),
    .RST(\LEDOut/FFY/RST ),
    .O(LEDOut_2770)
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y67" ))
  \LEDOut/DYMUX  (
    .I(LEDOut_mux0000),
    .O(\LEDOut/DYMUX_8083 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y67" ))
  \LEDOut/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDOut/CLKINV_8074 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y67" ))
  \LEDOut/CEINV  (
    .I(LEDOut_not0001_9021),
    .O(\LEDOut/CEINV_8073 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer<1>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [6]),
    .O(\DB7/StrobeTimer<1>/DXMUX_8124 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer<1>/DYMUX  (
    .I(\DB7/StrobeTimer_mux0000 [7]),
    .O(\DB7/StrobeTimer<1>/DYMUX_8112 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<1>/CLKINV_8104 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer<1>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<1>/CEINV_8103 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer<4>/DXMUX  (
    .I(\DB7/StrobeTimer_mux0000 [3]),
    .O(\DB7/StrobeTimer<4>/DXMUX_8162 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer<4>/DYMUX  (
    .I(\DB7/StrobeTimer_mux0000 [5]),
    .O(\DB7/StrobeTimer<4>/DYMUX_8150 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer<4>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/StrobeTimer<4>/CLKINV_8142 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer<4>/CEINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeTimer<4>/CEINV_8141 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2/DXMUX  (
    .I(\Host/GettingByte_FSM_FFd2-In ),
    .O(\Host/GettingByte_FSM_FFd2/DXMUX_8205 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2/DYMUX  (
    .I(\Host/GettingByte_FSM_FFd1-In ),
    .O(\Host/GettingByte_FSM_FFd2/DYMUX_8190 )
  );
  X_INV #(
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/GettingByte_FSM_FFd2/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/GettingByte_FSM_FFd2/CLKINV_8181 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0002_0 ),
    .O(\Host/GettingByte_FSM_FFd2/CEINV_8180 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y36" ))
  \x86/IORead/XUSED  (
    .I(x86_Dout_0_and0000),
    .O(x86_Dout_0_and0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y36" ))
  \x86/IORead/DYMUX  (
    .I(\x86/IORead_mux0000 ),
    .O(\x86/IORead/DYMUX_8233 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y36" ))
  \x86/IORead/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/IORead/CLKINV_8224 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay<1>/DXMUX  (
    .I(\Host/DeadDelay_mux0000 [0]),
    .O(\Host/DeadDelay<1>/DXMUX_8286 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay<1>/DYMUX  (
    .I(\Host/DeadDelay_mux0000 [1]),
    .O(\Host/DeadDelay<1>/DYMUX_8271 )
  );
  X_INV #(
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay<1>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/DeadDelay<1>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/DeadDelay<1>/CLKINV_8262 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay<1>/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0002_0 ),
    .O(\Host/DeadDelay<1>/CEINV_8261 )
  );
  X_FF #(
    .LOC ( "SLICE_X35Y51" ),
    .INIT ( 1'b0 ))
  LEDIndex_0 (
    .I(\LEDIndex<1>/DYMUX_8314 ),
    .CE(\LEDIndex<1>/CEINV_8303 ),
    .CLK(\LEDIndex<1>/CLKINV_8304 ),
    .SET(GND),
    .RST(GND),
    .O(LEDIndex[0])
  );
  X_LUT4 #(
    .INIT ( 16'h99FF ),
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex_mux0000<1>1  (
    .ADR0(LEDIndex[0]),
    .ADR1(LEDIndex[1]),
    .ADR2(VCC),
    .ADR3(LEDShift_2831),
    .O(LEDIndex_mux0000[1])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y51" ),
    .INIT ( 1'b0 ))
  LEDIndex_1 (
    .I(\LEDIndex<1>/DXMUX_8327 ),
    .CE(\LEDIndex<1>/CEINV_8303 ),
    .CLK(\LEDIndex<1>/CLKINV_8304 ),
    .SET(GND),
    .RST(GND),
    .O(LEDIndex[1])
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex<1>/DXMUX  (
    .I(LEDIndex_mux0000[1]),
    .O(\LEDIndex<1>/DXMUX_8327 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex<1>/DYMUX  (
    .I(LEDIndex_mux0000[0]),
    .O(\LEDIndex<1>/DYMUX_8314 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDIndex<1>/CLKINV_8304 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex<1>/CEINV  (
    .I(LEDIndex_and0000_0),
    .O(\LEDIndex<1>/CEINV_8303 )
  );
  X_LUT4 #(
    .INIT ( 16'h55FF ),
    .LOC ( "SLICE_X35Y51" ))
  \LEDIndex_mux0000<0>1  (
    .ADR0(LEDIndex[0]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(LEDShift_2831),
    .O(LEDIndex_mux0000[0])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y50" ),
    .INIT ( 1'b0 ))
  LEDIndex_2 (
    .I(\LEDIndex<3>/DYMUX_8353 ),
    .CE(\LEDIndex<3>/CEINV_8344 ),
    .CLK(\LEDIndex<3>/CLKINV_8345 ),
    .SET(GND),
    .RST(GND),
    .O(LEDIndex[2])
  );
  X_LUT4 #(
    .INIT ( 16'hEF1F ),
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex_mux0000<3>1  (
    .ADR0(LEDIndex[2]),
    .ADR1(Msub_LEDIndex_addsub0000_cy[1]),
    .ADR2(LEDShift_2831),
    .ADR3(LEDIndex[3]),
    .O(LEDIndex_mux0000[3])
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex<3>/DXMUX  (
    .I(LEDIndex_mux0000[3]),
    .O(\LEDIndex<3>/DXMUX_8365 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex<3>/DYMUX  (
    .I(LEDIndex_mux0000[2]),
    .O(\LEDIndex<3>/DYMUX_8353 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDIndex<3>/CLKINV_8345 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex<3>/CEINV  (
    .I(LEDIndex_and0000_0),
    .O(\LEDIndex<3>/CEINV_8344 )
  );
  X_LUT4 #(
    .INIT ( 16'hBBB7 ),
    .LOC ( "SLICE_X34Y50" ))
  \LEDIndex_mux0000<2>1  (
    .ADR0(LEDIndex[2]),
    .ADR1(LEDShift_2831),
    .ADR2(LEDIndex[1]),
    .ADR3(LEDIndex[0]),
    .O(LEDIndex_mux0000[2])
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y31" ))
  \x86_Dout_0_mux0000120/XUSED  (
    .I(x86_Dout_0_mux0000120_8391),
    .O(x86_Dout_0_mux0000120_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y31" ))
  \x86_Dout_0_mux0000120/YUSED  (
    .I(x86_Dout_8_cmp_eq0004),
    .O(x86_Dout_8_cmp_eq0004_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y36" ))
  \x86_Dout_4_mux00004/XUSED  (
    .I(x86_Dout_4_mux00004_8415),
    .O(x86_Dout_4_mux00004_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y36" ))
  \x86_Dout_4_mux00004/YUSED  (
    .I(x86_Dout_0_mux00005_8408),
    .O(x86_Dout_0_mux00005_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y37" ))
  \x86_Dout_6_mux00000/XUSED  (
    .I(x86_Dout_6_mux00000_8439),
    .O(x86_Dout_6_mux00000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y37" ))
  \x86_Dout_6_mux00000/YUSED  (
    .I(x86_Dout_2_mux00000_8432),
    .O(x86_Dout_2_mux00000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y38" ))
  \x86_Dout_3_mux00000/XUSED  (
    .I(x86_Dout_3_mux00000_8463),
    .O(x86_Dout_3_mux00000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y38" ))
  \x86_Dout_3_mux00000/YUSED  (
    .I(x86_Dout_2_mux00001_8454),
    .O(x86_Dout_2_mux00001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y54" ))
  \N103/XUSED  (
    .I(N103),
    .O(N103_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y54" ))
  \N103/YUSED  (
    .I(\DB7/State_FSM_FFd5-In31_8478 ),
    .O(\DB7/State_FSM_FFd5-In31_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y54" ))
  \N178/XUSED  (
    .I(N178),
    .O(N178_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y54" ))
  \N178/YUSED  (
    .I(\DB7/N16 ),
    .O(\DB7/N16_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y32" ))
  \x86/AddressLatch<1>/DXMUX  (
    .I(N60),
    .O(\x86/AddressLatch<1>/DXMUX_8533 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y32" ))
  \x86/AddressLatch<1>/DYMUX  (
    .I(N611),
    .O(\x86/AddressLatch<1>/DYMUX_8525 )
  );
  X_INV #(
    .LOC ( "SLICE_X23Y32" ))
  \x86/AddressLatch<1>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/AddressLatch<1>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y32" ))
  \x86/AddressLatch<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/AddressLatch<1>/CLKINV_8522 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y32" ))
  \x86/AddressLatch<1>/CEINV  (
    .I(\x86/AddressLatch_not0001_0 ),
    .O(\x86/AddressLatch<1>/CEINV_8521 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y33" ))
  \x86/AddressLatch<3>/DXMUX  (
    .I(N56),
    .O(\x86/AddressLatch<3>/DXMUX_8559 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y33" ))
  \x86/AddressLatch<3>/DYMUX  (
    .I(N591),
    .O(\x86/AddressLatch<3>/DYMUX_8551 )
  );
  X_INV #(
    .LOC ( "SLICE_X24Y33" ))
  \x86/AddressLatch<3>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/AddressLatch<3>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y33" ))
  \x86/AddressLatch<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/AddressLatch<3>/CLKINV_8548 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y33" ))
  \x86/AddressLatch<3>/CEINV  (
    .I(\x86/AddressLatch_not0001_0 ),
    .O(\x86/AddressLatch<3>/CEINV_8547 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF7 ),
    .LOC ( "SLICE_X13Y35" ))
  \x86/ConfigData_and0000128_SW0  (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(IDSel_IBUF_2834),
    .ADR2(N60),
    .ADR3(N611),
    .O(N193)
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y35" ))
  \N193/XUSED  (
    .I(N193),
    .O(N193_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y35" ))
  \N193/YUSED  (
    .I(\x86/Configured_and0001 ),
    .O(\x86/Configured_and0001_0 )
  );
  X_LUT4 #(
    .INIT ( 16'h0404 ),
    .LOC ( "SLICE_X13Y35" ))
  \x86/Configured_and00011  (
    .ADR0(N60),
    .ADR1(IDSel_IBUF_2834),
    .ADR2(N611),
    .ADR3(VCC),
    .O(\x86/Configured_and0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hFBFA ),
    .LOC ( "SLICE_X21Y33" ))
  x86_Dout_0_mux0000153_SW0 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\DB7/Ready_2916 ),
    .ADR2(x86_Dout_0_mux0000120_0),
    .ADR3(x86_Dout_0_cmp_eq0001),
    .O(N156)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y33" ))
  \N156/XUSED  (
    .I(N156),
    .O(N156_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y33" ))
  \N156/YUSED  (
    .I(x86_Dout_0_cmp_eq0001_pack_1),
    .O(x86_Dout_0_cmp_eq0001)
  );
  X_LUT4 #(
    .INIT ( 16'h3000 ),
    .LOC ( "SLICE_X21Y33" ))
  x86_Dout_8_cmp_eq000411 (
    .ADR0(VCC),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_3_IBUF_2824),
    .O(x86_Dout_0_cmp_eq0001_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hA8A0 ),
    .LOC ( "SLICE_X22Y41" ))
  LEDIndex_and00001 (
    .ADR0(PCI_Reset_IBUF_2742),
    .ADR1(LEDShift_and00002),
    .ADR2(LEDShift_2831),
    .ADR3(LEDIndex_and0003),
    .O(LEDIndex_and0000)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y41" ))
  \LEDIndex_and0000/XUSED  (
    .I(LEDIndex_and0000),
    .O(LEDIndex_and0000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y41" ))
  \LEDIndex_and0000/YUSED  (
    .I(LEDShift_and00002_pack_1),
    .O(LEDShift_and00002)
  );
  X_LUT4 #(
    .INIT ( 16'h1010 ),
    .LOC ( "SLICE_X22Y41" ))
  DB7_Address_not000111 (
    .ADR0(\x86/IORead_3030 ),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(\x86/IOWrite_3029 ),
    .ADR3(VCC),
    .O(LEDShift_and00002_pack_1)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y30" ))
  \x86_Dout_11_mux00009/XUSED  (
    .I(x86_Dout_11_mux00009_8659),
    .O(x86_Dout_11_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y30" ))
  \x86_Dout_11_mux00009/YUSED  (
    .I(x86_Dout_8_mux00009_8652),
    .O(x86_Dout_8_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y57" ))
  \DB7/SDO28/XUSED  (
    .I(\DB7/SDO28_8683 ),
    .O(\DB7/SDO28_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y57" ))
  \DB7/SDO28/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<1>8_8676 ),
    .O(\DB7/StrobeTimer_mux0000<1>8_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y55" ))
  \DB7/DiagData/DYMUX  (
    .I(DB7_Address[3]),
    .O(\DB7/DiagData/DYMUX_8695 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y55" ))
  \DB7/DiagData/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/DiagData/CLKINV_8692 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y55" ))
  \DB7/DiagData/CEINV  (
    .I(\DB7/DiagData_not0001 ),
    .O(\DB7/DiagData/CEINV_8691 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y43" ))
  \LEDRegister<11>/DXMUX  (
    .I(N50),
    .O(\LEDRegister<11>/DXMUX_8718 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y43" ))
  \LEDRegister<11>/DYMUX  (
    .I(N511),
    .O(\LEDRegister<11>/DYMUX_8712 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y43" ))
  \LEDRegister<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<11>/CLKINV_8710 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y43" ))
  \LEDRegister<11>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<11>/CEINV_8709 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y39" ))
  \x86/State_cmp_eq0006/XUSED  (
    .I(\x86/State_cmp_eq0006 ),
    .O(\x86/State_cmp_eq0006_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y39" ))
  \x86/State_cmp_eq0006/YUSED  (
    .I(N57_pack_1),
    .O(N57)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y39" ))
  \N4/XUSED  (
    .I(N4),
    .O(N4_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y39" ))
  \N4/YUSED  (
    .I(N162),
    .O(N162_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y46" ))
  \LEDRegister<13>/DXMUX  (
    .I(N48),
    .O(\LEDRegister<13>/DXMUX_8786 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y46" ))
  \LEDRegister<13>/DYMUX  (
    .I(N49),
    .O(\LEDRegister<13>/DYMUX_8780 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y46" ))
  \LEDRegister<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<13>/CLKINV_8778 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y46" ))
  \LEDRegister<13>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<13>/CEINV_8777 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y45" ))
  \LEDRegister<15>/DXMUX  (
    .I(N46),
    .O(\LEDRegister<15>/DXMUX_8806 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y45" ))
  \LEDRegister<15>/DYMUX  (
    .I(N47),
    .O(\LEDRegister<15>/DYMUX_8800 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y45" ))
  \LEDRegister<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<15>/CLKINV_8798 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y45" ))
  \LEDRegister<15>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<15>/CEINV_8797 )
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y32" ))
  \N29/XUSED  (
    .I(N29),
    .O(N29_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y32" ))
  \N29/YUSED  (
    .I(x86_Hold_mux000210_8823),
    .O(x86_Hold_mux000210_0)
  );
  X_LUT4 #(
    .INIT ( 16'hF0FF ),
    .LOC ( "SLICE_X39Y58" ))
  Scaler_and0000_inv1 (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Scaler_and0000_inv)
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y58" ))
  \Scaler_and0000_inv/YUSED  (
    .I(Scaler_not0001),
    .O(Scaler_not0001_0)
  );
  X_LUT4 #(
    .INIT ( 16'hFFF0 ),
    .LOC ( "SLICE_X39Y58" ))
  Scaler_not00011 (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Scaler_not0001)
  );
  X_LUT4 #(
    .INIT ( 16'hFFEE ),
    .LOC ( "SLICE_X15Y33" ))
  x86_Dout_3_mux000011_SW1 (
    .ADR0(CBE_0_IBUF_2821),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(VCC),
    .ADR3(\x86/AddressLatch [0]),
    .O(N142)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y33" ))
  \N142/XUSED  (
    .I(N142),
    .O(N142_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y33" ))
  \N142/YUSED  (
    .I(x86_Hold_mux000269_8872),
    .O(x86_Hold_mux000269_0)
  );
  X_LUT4 #(
    .INIT ( 16'h00FD ),
    .LOC ( "SLICE_X15Y33" ))
  x86_Hold_mux000269 (
    .ADR0(x86_Dout_8_cmp_eq0000),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(\x86/AddressLatch [0]),
    .O(x86_Hold_mux000269_8872)
  );
  X_LUT4 #(
    .INIT ( 16'hC000 ),
    .LOC ( "SLICE_X14Y32" ))
  x86_Dout_5_mux000017_SW0 (
    .ADR0(VCC),
    .ADR1(\DB7/Accumulator [5]),
    .ADR2(x86_Dout_0_cmp_eq0001),
    .ADR3(\DB7/Ready_2916 ),
    .O(N108)
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y32" ))
  \N108/XUSED  (
    .I(N108),
    .O(N108_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y32" ))
  \N108/YUSED  (
    .I(x86_Dout_4_mux000011_8896),
    .O(x86_Dout_4_mux000011_0)
  );
  X_LUT4 #(
    .INIT ( 16'hA000 ),
    .LOC ( "SLICE_X14Y32" ))
  x86_Dout_4_mux000011 (
    .ADR0(\DB7/Accumulator [4]),
    .ADR1(VCC),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(x86_Dout_0_cmp_eq0001),
    .O(x86_Dout_4_mux000011_8896)
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2/DXMUX  (
    .I(\Host/PuttingByte_FSM_FFd2-In_8942 ),
    .O(\Host/PuttingByte_FSM_FFd2/DXMUX_8945 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2/DYMUX  (
    .I(\Host/PuttingByte_FSM_FFd2_3179 ),
    .O(\Host/PuttingByte_FSM_FFd2/DYMUX_8931 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2/YUSED  (
    .I(N182_pack_4),
    .O(N182)
  );
  X_INV #(
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/PuttingByte_FSM_FFd2/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/PuttingByte_FSM_FFd2/CLKINV_8921 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y54" ))
  \DB7/DiagData_not0001/YUSED  (
    .I(N152),
    .O(N152_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y31" ))
  \N97/XUSED  (
    .I(N97),
    .O(N97_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y31" ))
  \N97/YUSED  (
    .I(x86_Dout_8_cmp_eq0000_pack_1),
    .O(x86_Dout_8_cmp_eq0000)
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y67" ))
  \LEDOut_not0001/YUSED  (
    .I(N02_pack_1),
    .O(N02)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y51" ))
  \N2/XUSED  (
    .I(N2),
    .O(N2_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData<8>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [9]),
    .O(\x86/ConfigData<8>/DXMUX_9064 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData<8>/YUSED  (
    .I(N6_pack_2),
    .O(N6)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData<8>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<8>/CLKINV_9048 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData<8>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<8>/CEINV_9047 )
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y30" ))
  \x86_Dout_11_mux000024/XUSED  (
    .I(x86_Dout_11_mux000024_9090),
    .O(x86_Dout_11_mux000024_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X30Y30" ))
  \x86_Dout_11_mux000024/YUSED  (
    .I(x86_Dout_8_mux000024_9083),
    .O(x86_Dout_8_mux000024_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y31" ))
  \x86_Dout_10_mux000024/XUSED  (
    .I(x86_Dout_10_mux000024_9114),
    .O(x86_Dout_10_mux000024_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y31" ))
  \x86_Dout_10_mux000024/YUSED  (
    .I(x86_Dout_9_mux000024_9107),
    .O(x86_Dout_9_mux000024_0)
  );
  X_LUT4 #(
    .INIT ( 16'h0080 ),
    .LOC ( "SLICE_X22Y36" ))
  x86_Dout_7_mux00000 (
    .ADR0(\Host/RCount [7]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(x86_Hold_and0001),
    .ADR3(\x86/AddressLatch [0]),
    .O(x86_Dout_7_mux00000_9138)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y36" ))
  \x86_Dout_7_mux00000/XUSED  (
    .I(x86_Dout_7_mux00000_9138),
    .O(x86_Dout_7_mux00000_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y36" ))
  \x86_Dout_7_mux00000/YUSED  (
    .I(x86_Dout_10_mux000025),
    .O(x86_Dout_10_mux000025_0)
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X22Y36" ))
  x86_Dout_9_mux000025 (
    .ADR0(\x86/AddressLatch [1]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [0]),
    .ADR3(\x86/AddressLatch [3]),
    .O(x86_Dout_10_mux000025)
  );
  X_LUT4 #(
    .INIT ( 16'h3330 ),
    .LOC ( "SLICE_X17Y59" ))
  \DB7/StrobeTimer_mux0000<4>17  (
    .ADR0(VCC),
    .ADR1(\DB7/N13 ),
    .ADR2(\DB7/State_FSM_FFd3_2981 ),
    .ADR3(\DB7/State_FSM_FFd1_2902 ),
    .O(\DB7/StrobeTimer_mux0000<4>17_9162 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y59" ))
  \DB7/StrobeTimer_mux0000<4>17/XUSED  (
    .I(\DB7/StrobeTimer_mux0000<4>17_9162 ),
    .O(\DB7/StrobeTimer_mux0000<4>17_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y59" ))
  \DB7/StrobeTimer_mux0000<4>17/YUSED  (
    .I(\DB7/StrobeTimer_mux0000<1>16_9154 ),
    .O(\DB7/StrobeTimer_mux0000<1>16_0 )
  );
  X_LUT4 #(
    .INIT ( 16'h3330 ),
    .LOC ( "SLICE_X17Y59" ))
  \DB7/StrobeTimer_mux0000<1>16  (
    .ADR0(VCC),
    .ADR1(\DB7/StrobeTimer [6]),
    .ADR2(\DB7/State_FSM_FFd3_2981 ),
    .ADR3(\DB7/State_FSM_FFd1_2902 ),
    .O(\DB7/StrobeTimer_mux0000<1>16_9154 )
  );
  X_INV #(
    .LOC ( "SLICE_X23Y31" ))
  \ReadFromHost/FFY/RSTOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\ReadFromHost/FFY/RST )
  );
  X_FF #(
    .LOC ( "SLICE_X23Y31" ),
    .INIT ( 1'b0 ))
  ReadFromHost (
    .I(\ReadFromHost/DYMUX_9174 ),
    .CE(\ReadFromHost/CEINV_9170 ),
    .CLK(\ReadFromHost/CLKINV_9171 ),
    .SET(GND),
    .RST(\ReadFromHost/FFY/RST ),
    .O(ReadFromHost_2977)
  );
  X_INV #(
    .LOC ( "SLICE_X23Y31" ))
  \ReadFromHost/DYMUX  (
    .I(ReadFromHost_2977),
    .O(\ReadFromHost/DYMUX_9174 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y31" ))
  \ReadFromHost/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\ReadFromHost/CLKINV_9171 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y31" ))
  \ReadFromHost/CEINV  (
    .I(ReadFromHost_not0001_5632),
    .O(\ReadFromHost/CEINV_9170 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \DB7/Accumulator<1>/DXMUX  (
    .I(\DB7/Accumulator [0]),
    .O(\DB7/Accumulator<1>/DXMUX_9197 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \DB7/Accumulator<1>/DYMUX  (
    .I(\SSDIn/INBUF ),
    .O(\DB7/Accumulator<1>/DYMUX_9191 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \DB7/Accumulator<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<1>/CLKINV_9189 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y39" ))
  \DB7/Accumulator<1>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<1>/CEINV_9188 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y36" ))
  \DB7/Accumulator<3>/DXMUX  (
    .I(\DB7/Accumulator [2]),
    .O(\DB7/Accumulator<3>/DXMUX_9217 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y36" ))
  \DB7/Accumulator<3>/DYMUX  (
    .I(\DB7/Accumulator [1]),
    .O(\DB7/Accumulator<3>/DYMUX_9211 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y36" ))
  \DB7/Accumulator<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<3>/CLKINV_9209 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y36" ))
  \DB7/Accumulator<3>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<3>/CEINV_9208 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y40" ))
  \N26/XUSED  (
    .I(N26),
    .O(N26_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y40" ))
  \N26/YUSED  (
    .I(x86_Write),
    .O(x86_Write_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y35" ))
  \DB7/Accumulator<5>/DXMUX  (
    .I(\DB7/Accumulator [4]),
    .O(\DB7/Accumulator<5>/DXMUX_9261 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y35" ))
  \DB7/Accumulator<5>/DYMUX  (
    .I(\DB7/Accumulator [3]),
    .O(\DB7/Accumulator<5>/DYMUX_9255 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y35" ))
  \DB7/Accumulator<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<5>/CLKINV_9253 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y35" ))
  \DB7/Accumulator<5>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<5>/CEINV_9252 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \DB7/Accumulator<7>/DXMUX  (
    .I(\DB7/Accumulator [6]),
    .O(\DB7/Accumulator<7>/DXMUX_9281 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \DB7/Accumulator<7>/DYMUX  (
    .I(\DB7/Accumulator [5]),
    .O(\DB7/Accumulator<7>/DYMUX_9275 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \DB7/Accumulator<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<7>/CLKINV_9273 )
  );
  X_BUF #(
    .LOC ( "SLICE_X15Y36" ))
  \DB7/Accumulator<7>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<7>/CEINV_9272 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y35" ))
  \DB7/Accumulator<9>/DXMUX  (
    .I(\DB7/Accumulator [8]),
    .O(\DB7/Accumulator<9>/DXMUX_9301 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y35" ))
  \DB7/Accumulator<9>/DYMUX  (
    .I(\DB7/Accumulator [7]),
    .O(\DB7/Accumulator<9>/DYMUX_9295 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y35" ))
  \DB7/Accumulator<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<9>/CLKINV_9293 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y35" ))
  \DB7/Accumulator<9>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<9>/CEINV_9292 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y55" ))
  \DB7/SDO401/XUSED  (
    .I(\DB7/SDO401_9327 ),
    .O(\DB7/SDO401_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y55" ))
  \DB7/SDO401/YUSED  (
    .I(\DB7/ShiftCount_mux0001<1>25_9320 ),
    .O(\DB7/ShiftCount_mux0001<1>25_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y56" ))
  \DB7/StrobeOut_mux000116/XUSED  (
    .I(\DB7/StrobeOut_mux000116_9351 ),
    .O(\DB7/StrobeOut_mux000116_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y56" ))
  \DB7/StrobeOut_mux000116/YUSED  (
    .I(\DB7/N112 ),
    .O(\DB7/N112_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y30" ))
  \x86_Dout_10_mux00009/XUSED  (
    .I(x86_Dout_10_mux00009_9375),
    .O(x86_Dout_10_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y30" ))
  \x86_Dout_10_mux00009/YUSED  (
    .I(x86_Dout_13_mux00009_9368),
    .O(x86_Dout_13_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y31" ))
  \DataToHost<1>/DXMUX  (
    .I(N521),
    .O(\DataToHost<1>/DXMUX_9393 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y31" ))
  \DataToHost<1>/DYMUX  (
    .I(N53),
    .O(\DataToHost<1>/DYMUX_9387 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y31" ))
  \DataToHost<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DataToHost<1>/CLKINV_9385 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y31" ))
  \DataToHost<1>/CEINV  (
    .I(DataToHost_and0000_0),
    .O(\DataToHost<1>/CEINV_9384 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y31" ))
  \DataToHost<3>/DXMUX  (
    .I(N50),
    .O(\DataToHost<3>/DXMUX_9413 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y31" ))
  \DataToHost<3>/DYMUX  (
    .I(N511),
    .O(\DataToHost<3>/DYMUX_9407 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y31" ))
  \DataToHost<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DataToHost<3>/CLKINV_9405 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y31" ))
  \DataToHost<3>/CEINV  (
    .I(DataToHost_and0000_0),
    .O(\DataToHost<3>/CEINV_9404 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y30" ))
  \DataToHost<5>/DXMUX  (
    .I(N48),
    .O(\DataToHost<5>/DXMUX_9433 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y30" ))
  \DataToHost<5>/DYMUX  (
    .I(N49),
    .O(\DataToHost<5>/DYMUX_9427 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y30" ))
  \DataToHost<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DataToHost<5>/CLKINV_9425 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y30" ))
  \DataToHost<5>/CEINV  (
    .I(DataToHost_and0000_0),
    .O(\DataToHost<5>/CEINV_9424 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y32" ))
  \DataToHost<7>/DXMUX  (
    .I(N46),
    .O(\DataToHost<7>/DXMUX_9453 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y32" ))
  \DataToHost<7>/DYMUX  (
    .I(N47),
    .O(\DataToHost<7>/DYMUX_9447 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y32" ))
  \DataToHost<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DataToHost<7>/CLKINV_9445 )
  );
  X_BUF #(
    .LOC ( "SLICE_X38Y32" ))
  \DataToHost<7>/CEINV  (
    .I(DataToHost_and0000_0),
    .O(\DataToHost<7>/CEINV_9444 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y59" ))
  \DB7/State_FSM_FFd5-In5/XUSED  (
    .I(\DB7/State_FSM_FFd5-In5_9479 ),
    .O(\DB7/State_FSM_FFd5-In5_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y32" ))
  \Host/RxData<1>/DXMUX  (
    .I(\USBData<1>/INBUF ),
    .O(\Host/RxData<1>/DXMUX_9501 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y32" ))
  \Host/RxData<1>/DYMUX  (
    .I(\USBData<0>/INBUF ),
    .O(\Host/RxData<1>/DYMUX_9493 )
  );
  X_INV #(
    .LOC ( "SLICE_X39Y32" ))
  \Host/RxData<1>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RxData<1>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y32" ))
  \Host/RxData<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RxData<1>/CLKINV_9490 )
  );
  X_BUF #(
    .LOC ( "SLICE_X39Y32" ))
  \Host/RxData<1>/CEINV  (
    .I(\Host/RxData_not0001_0 ),
    .O(\Host/RxData<1>/CEINV_9489 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y31" ))
  \Host/RxData<3>/DXMUX  (
    .I(\USBData<3>/INBUF ),
    .O(\Host/RxData<3>/DXMUX_9527 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y31" ))
  \Host/RxData<3>/DYMUX  (
    .I(\USBData<2>/INBUF ),
    .O(\Host/RxData<3>/DYMUX_9519 )
  );
  X_INV #(
    .LOC ( "SLICE_X50Y31" ))
  \Host/RxData<3>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RxData<3>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y31" ))
  \Host/RxData<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RxData<3>/CLKINV_9516 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y31" ))
  \Host/RxData<3>/CEINV  (
    .I(\Host/RxData_not0001_0 ),
    .O(\Host/RxData<3>/CEINV_9515 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y30" ))
  \Host/RxData<5>/DXMUX  (
    .I(\USBData<5>/INBUF ),
    .O(\Host/RxData<5>/DXMUX_9553 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y30" ))
  \Host/RxData<5>/DYMUX  (
    .I(\USBData<4>/INBUF ),
    .O(\Host/RxData<5>/DYMUX_9545 )
  );
  X_INV #(
    .LOC ( "SLICE_X51Y30" ))
  \Host/RxData<5>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RxData<5>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y30" ))
  \Host/RxData<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RxData<5>/CLKINV_9542 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y30" ))
  \Host/RxData<5>/CEINV  (
    .I(\Host/RxData_not0001_0 ),
    .O(\Host/RxData<5>/CEINV_9541 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y32" ))
  \Host/RxData<7>/DXMUX  (
    .I(\USBData<7>/INBUF ),
    .O(\Host/RxData<7>/DXMUX_9579 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y32" ))
  \Host/RxData<7>/DYMUX  (
    .I(\USBData<6>/INBUF ),
    .O(\Host/RxData<7>/DYMUX_9571 )
  );
  X_INV #(
    .LOC ( "SLICE_X50Y32" ))
  \Host/RxData<7>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RxData<7>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y32" ))
  \Host/RxData<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/RxData<7>/CLKINV_9568 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y32" ))
  \Host/RxData<7>/CEINV  (
    .I(\Host/RxData_not0001_0 ),
    .O(\Host/RxData<7>/CEINV_9567 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y37" ))
  \x86/State_cmp_eq0000/XUSED  (
    .I(\x86/State_cmp_eq0000 ),
    .O(\x86/State_cmp_eq0000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y37" ))
  \x86/State_cmp_eq0000/YUSED  (
    .I(N211),
    .O(N211_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y55" ))
  \DB7_Address<1>/DXMUX  (
    .I(N60),
    .O(\DB7_Address<1>/DXMUX_9629 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y55" ))
  \DB7_Address<1>/DYMUX  (
    .I(N611),
    .O(\DB7_Address<1>/DYMUX_9621 )
  );
  X_INV #(
    .LOC ( "SLICE_X22Y55" ))
  \DB7_Address<1>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7_Address<1>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y55" ))
  \DB7_Address<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Address<1>/CLKINV_9618 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y55" ))
  \DB7_Address<1>/CEINV  (
    .I(DB7_Address_not0001_0),
    .O(\DB7_Address<1>/CEINV_9617 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y42" ))
  \DB7_Address<3>/DXMUX  (
    .I(N58),
    .O(\DB7_Address<3>/DXMUX_9656 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y42" ))
  \DB7_Address<3>/DYMUX  (
    .I(N591),
    .O(\DB7_Address<3>/DYMUX_9648 )
  );
  X_INV #(
    .LOC ( "SLICE_X23Y42" ))
  \DB7_Address<3>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7_Address<3>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y42" ))
  \DB7_Address<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Address<3>/CLKINV_9645 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y42" ))
  \DB7_Address<3>/CEINV  (
    .I(DB7_Address_not0001_0),
    .O(\DB7_Address<3>/CEINV_9644 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y54" ))
  \DB7_Address<5>/DXMUX  (
    .I(N56),
    .O(\DB7_Address<5>/DXMUX_9684 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y54" ))
  \DB7_Address<5>/DYMUX  (
    .I(N571),
    .O(\DB7_Address<5>/DYMUX_9675 )
  );
  X_INV #(
    .LOC ( "SLICE_X22Y54" ))
  \DB7_Address<5>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7_Address<5>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y54" ))
  \DB7_Address<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Address<5>/CLKINV_9672 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y54" ))
  \DB7_Address<5>/CEINV  (
    .I(DB7_Address_not0001_0),
    .O(\DB7_Address<5>/CEINV_9671 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y46" ))
  \DB7_Address<7>/DXMUX  (
    .I(N54),
    .O(\DB7_Address<7>/DXMUX_9711 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y46" ))
  \DB7_Address<7>/DYMUX  (
    .I(N55),
    .O(\DB7_Address<7>/DYMUX_9702 )
  );
  X_INV #(
    .LOC ( "SLICE_X23Y46" ))
  \DB7_Address<7>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7_Address<7>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y46" ))
  \DB7_Address<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Address<7>/CLKINV_9699 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y46" ))
  \DB7_Address<7>/CEINV  (
    .I(DB7_Address_not0001_0),
    .O(\DB7_Address<7>/CEINV_9698 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y36" ))
  \N51/XUSED  (
    .I(N51),
    .O(N51_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y36" ))
  \N51/YUSED  (
    .I(\x86/ConfigData_and0000128_pack_1 ),
    .O(\x86/ConfigData_and0000128_3250 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase/DXMUX  (
    .I(\DB7/AddressPhase_mux0001 ),
    .O(\DB7/AddressPhase/DXMUX_9770 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase/YUSED  (
    .I(\DB7/AddressPhase_mux000139_pack_1 ),
    .O(\DB7/AddressPhase_mux000139_3253 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/AddressPhase/CLKINV_9754 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y58" ))
  \DB7/Diagnose/DYMUX  (
    .I(DB7_Address[7]),
    .O(\DB7/Diagnose/DYMUX_9786 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y58" ))
  \DB7/Diagnose/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Diagnose/CLKINV_9783 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y58" ))
  \DB7/Diagnose/CEINV  (
    .I(\DB7/Diagnose_not0001 ),
    .O(\DB7/Diagnose/CEINV_9782 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y59" ))
  \N139/XUSED  (
    .I(N139),
    .O(N139_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y59" ))
  \N139/YUSED  (
    .I(N138),
    .O(N138_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y46" ))
  \LEDRegister<1>/DXMUX  (
    .I(N60),
    .O(\LEDRegister<1>/DXMUX_9833 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y46" ))
  \LEDRegister<1>/DYMUX  (
    .I(N611),
    .O(\LEDRegister<1>/DYMUX_9827 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y46" ))
  \LEDRegister<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<1>/CLKINV_9825 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y46" ))
  \LEDRegister<1>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<1>/CEINV_9824 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y37" ))
  \x86/FSMActive_mux0000220/XUSED  (
    .I(\x86/FSMActive_mux0000220_9859 ),
    .O(\x86/FSMActive_mux0000220_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y37" ))
  \x86/FSMActive_mux0000220/YUSED  (
    .I(\x86/FSMActive_mux0000218_pack_1 ),
    .O(\x86/FSMActive_mux0000218_3255 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y37" ))
  \x86/State_FSM_FFd2-In14/XUSED  (
    .I(\x86/State_FSM_FFd2-In14_9883 ),
    .O(\x86/State_FSM_FFd2-In14_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y37" ))
  \x86/State_FSM_FFd2-In14/YUSED  (
    .I(x86_Read),
    .O(x86_Read_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y44" ))
  \LEDRegister<3>/DXMUX  (
    .I(N58),
    .O(\LEDRegister<3>/DXMUX_9901 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y44" ))
  \LEDRegister<3>/DYMUX  (
    .I(N591),
    .O(\LEDRegister<3>/DYMUX_9895 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y44" ))
  \LEDRegister<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<3>/CLKINV_9893 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y44" ))
  \LEDRegister<3>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<3>/CEINV_9892 )
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y34" ))
  \N213/XUSED  (
    .I(N213),
    .O(N213_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X12Y34" ))
  \N213/YUSED  (
    .I(\x86/State_cmp_eq0003 ),
    .O(\x86/State_cmp_eq0003_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y45" ))
  \LEDRegister<5>/DXMUX  (
    .I(N56),
    .O(\LEDRegister<5>/DXMUX_9945 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y45" ))
  \LEDRegister<5>/DYMUX  (
    .I(N571),
    .O(\LEDRegister<5>/DYMUX_9939 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y45" ))
  \LEDRegister<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<5>/CLKINV_9937 )
  );
  X_BUF #(
    .LOC ( "SLICE_X31Y45" ))
  \LEDRegister<5>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<5>/CEINV_9936 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y56" ))
  \DB7/StrobeOut_mux00015/XUSED  (
    .I(\DB7/StrobeOut_mux00015_9971 ),
    .O(\DB7/StrobeOut_mux00015_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive/DXMUX  (
    .I(\x86/FSMActive_mux0000 ),
    .O(\x86/FSMActive/DXMUX_10002 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive/YUSED  (
    .I(N63_pack_2),
    .O(N63)
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/FSMActive/CLKINV_9986 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y47" ))
  \LEDRegister<7>/DXMUX  (
    .I(N54),
    .O(\LEDRegister<7>/DXMUX_10024 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y47" ))
  \LEDRegister<7>/DYMUX  (
    .I(N55),
    .O(\LEDRegister<7>/DYMUX_10018 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y47" ))
  \LEDRegister<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<7>/CLKINV_10016 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y47" ))
  \LEDRegister<7>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<7>/CEINV_10015 )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y33" ))
  \x86_Dout_4_mux00001/XUSED  (
    .I(x86_Dout_4_mux00001_10050),
    .O(x86_Dout_4_mux00001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y33" ))
  \x86_Dout_4_mux00001/YUSED  (
    .I(x86_Dout_0_cmp_eq0002_pack_1),
    .O(x86_Dout_0_cmp_eq0002)
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y47" ))
  \LEDRegister<9>/DXMUX  (
    .I(N521),
    .O(\LEDRegister<9>/DXMUX_10068 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y47" ))
  \LEDRegister<9>/DYMUX  (
    .I(N53),
    .O(\LEDRegister<9>/DYMUX_10062 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y47" ))
  \LEDRegister<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\LEDRegister<9>/CLKINV_10060 )
  );
  X_BUF #(
    .LOC ( "SLICE_X35Y47" ))
  \LEDRegister<9>/CEINV  (
    .I(LEDRegister_and0000_0),
    .O(\LEDRegister<9>/CEINV_10059 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y35" ))
  \DB7/Accumulator<11>/DXMUX  (
    .I(\DB7/Accumulator [10]),
    .O(\DB7/Accumulator<11>/DXMUX_10088 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y35" ))
  \DB7/Accumulator<11>/DYMUX  (
    .I(\DB7/Accumulator [9]),
    .O(\DB7/Accumulator<11>/DYMUX_10082 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y35" ))
  \DB7/Accumulator<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<11>/CLKINV_10080 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y35" ))
  \DB7/Accumulator<11>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<11>/CEINV_10079 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y36" ))
  \DB7/Accumulator<13>/DXMUX  (
    .I(\DB7/Accumulator [12]),
    .O(\DB7/Accumulator<13>/DXMUX_10108 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y36" ))
  \DB7/Accumulator<13>/DYMUX  (
    .I(\DB7/Accumulator [11]),
    .O(\DB7/Accumulator<13>/DYMUX_10102 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y36" ))
  \DB7/Accumulator<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<13>/CLKINV_10100 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y36" ))
  \DB7/Accumulator<13>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<13>/CEINV_10099 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y35" ))
  \DB7/Accumulator<15>/DXMUX  (
    .I(\DB7/Accumulator [14]),
    .O(\DB7/Accumulator<15>/DXMUX_10128 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y35" ))
  \DB7/Accumulator<15>/DYMUX  (
    .I(\DB7/Accumulator [13]),
    .O(\DB7/Accumulator<15>/DYMUX_10122 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y35" ))
  \DB7/Accumulator<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7/Accumulator<15>/CLKINV_10120 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y35" ))
  \DB7/Accumulator<15>/CEINV  (
    .I(\DB7/Accumulator_and0000_0 ),
    .O(\DB7/Accumulator<15>/CEINV_10119 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y39" ))
  \N180/XUSED  (
    .I(N180),
    .O(N180_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y39" ))
  \N180/YUSED  (
    .I(\x86/ConfigRead_mux000011_pack_1 ),
    .O(\x86/ConfigRead_mux000011_3260 )
  );
  X_BUF #(
    .LOC ( "SLICE_X13Y38" ))
  \x86_Dout_7_mux00001/XUSED  (
    .I(x86_Dout_7_mux00001_10166),
    .O(x86_Dout_7_mux00001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y30" ))
  \x86_Dout_12_mux00009/XUSED  (
    .I(x86_Dout_12_mux00009_10190),
    .O(x86_Dout_12_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y30" ))
  \x86_Dout_12_mux00009/YUSED  (
    .I(x86_Dout_9_mux00009_10183),
    .O(x86_Dout_9_mux00009_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y56" ))
  \DB7/SDO13/XUSED  (
    .I(\DB7/SDO13_10310 ),
    .O(\DB7/SDO13_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y56" ))
  \DB7/SDO13/YUSED  (
    .I(\DB7/ShiftCount_mux0001<0>8_10303 ),
    .O(\DB7/ShiftCount_mux0001<0>8_0 )
  );
  X_INV #(
    .LOC ( "SLICE_X20Y43" ))
  \x86_to_DB7/DYMUX  (
    .I(x86_to_DB7_2925),
    .O(\x86_to_DB7/DYMUX_10358 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y43" ))
  \x86_to_DB7/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_to_DB7/CLKINV_10355 )
  );
  X_BUF #(
    .LOC ( "SLICE_X20Y43" ))
  \x86_to_DB7/CEINV  (
    .I(x86_to_DB7_not0001),
    .O(\x86_to_DB7/CEINV_10354 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y59" ))
  \N31/XUSED  (
    .I(N31),
    .O(N31_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y42" ))
  \DB7_Dout<11>/DXMUX  (
    .I(N50),
    .O(\DB7_Dout<11>/DXMUX_10393 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y42" ))
  \DB7_Dout<11>/DYMUX  (
    .I(N511),
    .O(\DB7_Dout<11>/DYMUX_10387 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y42" ))
  \DB7_Dout<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<11>/CLKINV_10385 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y42" ))
  \DB7_Dout<11>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<11>/CEINV_10384 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y47" ))
  \DB7_Dout<13>/DXMUX  (
    .I(N48),
    .O(\DB7_Dout<13>/DXMUX_10413 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y47" ))
  \DB7_Dout<13>/DYMUX  (
    .I(N49),
    .O(\DB7_Dout<13>/DYMUX_10407 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y47" ))
  \DB7_Dout<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<13>/CLKINV_10405 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y47" ))
  \DB7_Dout<13>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<13>/CEINV_10404 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y47" ))
  \DB7_Dout<15>/DXMUX  (
    .I(N46),
    .O(\DB7_Dout<15>/DXMUX_10433 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y47" ))
  \DB7_Dout<15>/DYMUX  (
    .I(N47),
    .O(\DB7_Dout<15>/DYMUX_10427 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y47" ))
  \DB7_Dout<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<15>/CLKINV_10425 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y47" ))
  \DB7_Dout<15>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<15>/CEINV_10424 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead/DXMUX  (
    .I(\Host/USBRead_mux0001 ),
    .O(\Host/USBRead/DXMUX_10468 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead/YUSED  (
    .I(N19_pack_2),
    .O(N19)
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/USBRead/CLKINV_10450 )
  );
  X_BUF #(
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead/CEINV  (
    .I(\Host/PuttingByte_cmp_eq0002_0 ),
    .O(\Host/USBRead/CEINV_10449 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead/DXMUX  (
    .I(\x86/ConfigRead_mux0000 ),
    .O(\x86/ConfigRead/DXMUX_10503 )
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead/YUSED  (
    .I(N197_pack_3),
    .O(N197)
  );
  X_BUF #(
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigRead/CLKINV_10487 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y57" ))
  \N174/XUSED  (
    .I(N174),
    .O(N174_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y57" ))
  \N174/YUSED  (
    .I(\DB7/Accumulator_and0000 ),
    .O(\DB7/Accumulator_and0000_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y33" ))
  \x86_Dlast<11>/DXMUX  (
    .I(N50),
    .O(\x86_Dlast<11>/DXMUX_10554 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y33" ))
  \x86_Dlast<11>/DYMUX  (
    .I(N511),
    .O(\x86_Dlast<11>/DYMUX_10545 )
  );
  X_INV #(
    .LOC ( "SLICE_X34Y33" ))
  \x86_Dlast<11>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<11>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y33" ))
  \x86_Dlast<11>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<11>/CLKINV_10542 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y33" ))
  \x86_Dlast<11>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<11>/CEINV_10541 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y33" ))
  \x86_Dlast<13>/DXMUX  (
    .I(N48),
    .O(\x86_Dlast<13>/DXMUX_10582 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y33" ))
  \x86_Dlast<13>/DYMUX  (
    .I(N49),
    .O(\x86_Dlast<13>/DYMUX_10573 )
  );
  X_INV #(
    .LOC ( "SLICE_X51Y33" ))
  \x86_Dlast<13>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<13>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y33" ))
  \x86_Dlast<13>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<13>/CLKINV_10570 )
  );
  X_BUF #(
    .LOC ( "SLICE_X51Y33" ))
  \x86_Dlast<13>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<13>/CEINV_10569 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y33" ))
  \x86_Dlast<15>/DXMUX  (
    .I(N46),
    .O(\x86_Dlast<15>/DXMUX_10610 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y33" ))
  \x86_Dlast<15>/DYMUX  (
    .I(N47),
    .O(\x86_Dlast<15>/DYMUX_10601 )
  );
  X_INV #(
    .LOC ( "SLICE_X50Y33" ))
  \x86_Dlast<15>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<15>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y33" ))
  \x86_Dlast<15>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<15>/CLKINV_10598 )
  );
  X_BUF #(
    .LOC ( "SLICE_X50Y33" ))
  \x86_Dlast<15>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<15>/CEINV_10597 )
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y38" ))
  \N209/XUSED  (
    .I(N209),
    .O(N209_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X16Y38" ))
  \N209/YUSED  (
    .I(N2111),
    .O(N2111_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \x86/LastFrame/DYMUX  (
    .I(Frame_IBUF_2840),
    .O(\x86/LastFrame/DYMUX_10649 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y38" ))
  \x86/LastFrame/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/LastFrame/CLKINV_10646 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y32" ))
  \x86_Dlast<17>/DXMUX  (
    .I(N44),
    .O(\x86_Dlast<17>/DXMUX_10675 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y32" ))
  \x86_Dlast<17>/DYMUX  (
    .I(N45),
    .O(\x86_Dlast<17>/DYMUX_10666 )
  );
  X_INV #(
    .LOC ( "SLICE_X25Y32" ))
  \x86_Dlast<17>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<17>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y32" ))
  \x86_Dlast<17>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<17>/CLKINV_10663 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y32" ))
  \x86_Dlast<17>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<17>/CEINV_10662 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y37" ))
  \N205/XUSED  (
    .I(N205),
    .O(N205_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y37" ))
  \N205/YUSED  (
    .I(N207),
    .O(N207_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X37Y33" ))
  \x86/IORead_and000118/XUSED  (
    .I(\x86/IORead_and000118_10716 ),
    .O(\x86/IORead_and000118_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y36" ))
  \N195/XUSED  (
    .I(N195),
    .O(N195_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y36" ))
  \N195/YUSED  (
    .I(\x86/IORead_and000136_pack_1 ),
    .O(\x86/IORead_and000136_3265 )
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y38" ))
  \N199/XUSED  (
    .I(N199),
    .O(N199_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X26Y38" ))
  \N199/YUSED  (
    .I(\x86/IORead_and000161_pack_1 ),
    .O(\x86/IORead_and000161_3267 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y36" ))
  \N168/XUSED  (
    .I(N168),
    .O(N168_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y36" ))
  \N168/YUSED  (
    .I(\x86/IORead_and0001_pack_1 ),
    .O(\x86/IORead_and0001 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData<9>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [8]),
    .O(\x86/ConfigData<9>/DXMUX_10831 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData<9>/YUSED  (
    .I(N14_pack_2),
    .O(N14)
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<9>/CLKINV_10815 )
  );
  X_BUF #(
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData<9>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<9>/CEINV_10814 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData<0>/DXMUX  (
    .I(\x86/ConfigData_mux0000 [17]),
    .O(\x86/ConfigData<0>/DXMUX_10864 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData<0>/YUSED  (
    .I(N161_pack_3),
    .O(N161)
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData<0>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86/ConfigData<0>/CLKINV_10848 )
  );
  X_BUF #(
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData<0>/CEINV  (
    .I(\x86/ConfigData_and0000_0 ),
    .O(\x86/ConfigData<0>/CEINV_10847 )
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y57" ))
  \N126/XUSED  (
    .I(N126),
    .O(N126_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X19Y57" ))
  \N126/YUSED  (
    .I(N146),
    .O(N146_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y46" ))
  \DB7_Dout<1>/DXMUX  (
    .I(N60),
    .O(\DB7_Dout<1>/DXMUX_10956 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y46" ))
  \DB7_Dout<1>/DYMUX  (
    .I(N611),
    .O(\DB7_Dout<1>/DYMUX_10950 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y46" ))
  \DB7_Dout<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<1>/CLKINV_10948 )
  );
  X_BUF #(
    .LOC ( "SLICE_X25Y46" ))
  \DB7_Dout<1>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<1>/CEINV_10947 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y45" ))
  \DB7_Dout<3>/DXMUX  (
    .I(N58),
    .O(\DB7_Dout<3>/DXMUX_10976 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y45" ))
  \DB7_Dout<3>/DYMUX  (
    .I(N591),
    .O(\DB7_Dout<3>/DYMUX_10970 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y45" ))
  \DB7_Dout<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<3>/CLKINV_10968 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y45" ))
  \DB7_Dout<3>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<3>/CEINV_10967 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y44" ))
  \DB7_Dout<5>/DXMUX  (
    .I(N56),
    .O(\DB7_Dout<5>/DXMUX_10996 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y44" ))
  \DB7_Dout<5>/DYMUX  (
    .I(N571),
    .O(\DB7_Dout<5>/DYMUX_10990 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y44" ))
  \DB7_Dout<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<5>/CLKINV_10988 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y44" ))
  \DB7_Dout<5>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<5>/CEINV_10987 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y46" ))
  \DB7_Dout<7>/DXMUX  (
    .I(N54),
    .O(\DB7_Dout<7>/DXMUX_11016 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y46" ))
  \DB7_Dout<7>/DYMUX  (
    .I(N55),
    .O(\DB7_Dout<7>/DYMUX_11010 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y46" ))
  \DB7_Dout<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<7>/CLKINV_11008 )
  );
  X_BUF #(
    .LOC ( "SLICE_X24Y46" ))
  \DB7_Dout<7>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<7>/CEINV_11007 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y45" ))
  \DB7_Dout<9>/DXMUX  (
    .I(N521),
    .O(\DB7_Dout<9>/DXMUX_11060 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y45" ))
  \DB7_Dout<9>/DYMUX  (
    .I(N53),
    .O(\DB7_Dout<9>/DYMUX_11054 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y45" ))
  \DB7_Dout<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\DB7_Dout<9>/CLKINV_11052 )
  );
  X_BUF #(
    .LOC ( "SLICE_X22Y45" ))
  \DB7_Dout<9>/CEINV  (
    .I(DB7_Dout_and0000_0),
    .O(\DB7_Dout<9>/CEINV_11051 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y35" ))
  \x86_Dlast<1>/DXMUX  (
    .I(N60),
    .O(\x86_Dlast<1>/DXMUX_11097 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y35" ))
  \x86_Dlast<1>/DYMUX  (
    .I(N611),
    .O(\x86_Dlast<1>/DYMUX_11088 )
  );
  X_INV #(
    .LOC ( "SLICE_X0Y35" ))
  \x86_Dlast<1>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<1>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y35" ))
  \x86_Dlast<1>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<1>/CLKINV_11085 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y35" ))
  \x86_Dlast<1>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<1>/CEINV_11084 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \x86_Dlast<3>/DXMUX  (
    .I(N58),
    .O(\x86_Dlast<3>/DXMUX_11125 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \x86_Dlast<3>/DYMUX  (
    .I(N591),
    .O(\x86_Dlast<3>/DYMUX_11116 )
  );
  X_INV #(
    .LOC ( "SLICE_X14Y39" ))
  \x86_Dlast<3>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<3>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \x86_Dlast<3>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<3>/CLKINV_11113 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y39" ))
  \x86_Dlast<3>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<3>/CEINV_11112 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \x86_Dlast<5>/DXMUX  (
    .I(N56),
    .O(\x86_Dlast<5>/DXMUX_11151 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \x86_Dlast<5>/DYMUX  (
    .I(N571),
    .O(\x86_Dlast<5>/DYMUX_11143 )
  );
  X_INV #(
    .LOC ( "SLICE_X14Y33" ))
  \x86_Dlast<5>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<5>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \x86_Dlast<5>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<5>/CLKINV_11140 )
  );
  X_BUF #(
    .LOC ( "SLICE_X14Y33" ))
  \x86_Dlast<5>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<5>/CEINV_11139 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y38" ))
  \x86_Dlast<7>/DXMUX  (
    .I(N54),
    .O(\x86_Dlast<7>/DXMUX_11179 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y38" ))
  \x86_Dlast<7>/DYMUX  (
    .I(N55),
    .O(\x86_Dlast<7>/DYMUX_11170 )
  );
  X_INV #(
    .LOC ( "SLICE_X0Y38" ))
  \x86_Dlast<7>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<7>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y38" ))
  \x86_Dlast<7>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<7>/CLKINV_11167 )
  );
  X_BUF #(
    .LOC ( "SLICE_X0Y38" ))
  \x86_Dlast<7>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<7>/CEINV_11166 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y35" ))
  \x86_Dlast<9>/DXMUX  (
    .I(N521),
    .O(\x86_Dlast<9>/DXMUX_11206 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y35" ))
  \x86_Dlast<9>/DYMUX  (
    .I(N53),
    .O(\x86_Dlast<9>/DYMUX_11198 )
  );
  X_INV #(
    .LOC ( "SLICE_X29Y35" ))
  \x86_Dlast<9>/SRINV  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Dlast<9>/SRINVNOT )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y35" ))
  \x86_Dlast<9>/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\x86_Dlast<9>/CLKINV_11195 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y35" ))
  \x86_Dlast<9>/CEINV  (
    .I(LEDShift_and00002),
    .O(\x86_Dlast<9>/CEINV_11194 )
  );
  X_BUF #(
    .LOC ( "SLICE_X18Y59" ))
  \N144/XUSED  (
    .I(N144),
    .O(N144_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite/DXMUX  (
    .I(\Host/USBWrite_mux0000_11262 ),
    .O(\Host/USBWrite/DXMUX_11265 )
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite/YUSED  (
    .I(N8_pack_2),
    .O(N8)
  );
  X_BUF #(
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite/CLKINV  (
    .I(PCI_Clock_IBUF_2741),
    .O(\Host/USBWrite/CLKINV_11249 )
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y38" ))
  \DB7_Address_not0001/XUSED  (
    .I(DB7_Address_not0001),
    .O(DB7_Address_not0001_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X23Y38" ))
  \DB7_Address_not0001/YUSED  (
    .I(x86_to_DB7_cmp_eq0000_pack_1),
    .O(x86_to_DB7_cmp_eq0000)
  );
  X_FF #(
    .LOC ( "SLICE_X19Y33" ),
    .INIT ( 1'b0 ))
  \Host/RCount_1  (
    .I(\Host/RCount<0>/DYMUX_3300 ),
    .CE(\Host/RCount<0>/CEINV_3282 ),
    .CLK(\Host/RCount<0>/CLKINV_3283 ),
    .SET(GND),
    .RST(\Host/RCount<0>/SRINVNOT ),
    .O(\Host/RCount [1])
  );
  X_LUT4 #(
    .INIT ( 16'h5555 ),
    .LOC ( "SLICE_X19Y33" ))
  \Host/Mcount_RCount_lut<0>_INV_0  (
    .ADR0(\Host/RCount [0]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/Mcount_RCount_lut [0])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y33" ),
    .INIT ( 1'b0 ))
  \Host/RCount_0  (
    .I(\Host/RCount<0>/DXMUX_3323 ),
    .CE(\Host/RCount<0>/CEINV_3282 ),
    .CLK(\Host/RCount<0>/CLKINV_3283 ),
    .SET(GND),
    .RST(\Host/RCount<0>/SRINVNOT ),
    .O(\Host/RCount [0])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y34" ),
    .INIT ( 1'b0 ))
  \Host/RCount_3  (
    .I(\Host/RCount<2>/DYMUX_3363 ),
    .CE(\Host/RCount<2>/CEINV_3340 ),
    .CLK(\Host/RCount<2>/CLKINV_3341 ),
    .SET(GND),
    .RST(\Host/RCount<2>/SRINVNOT ),
    .O(\Host/RCount [3])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y34" ),
    .INIT ( 1'b0 ))
  \Host/RCount_2  (
    .I(\Host/RCount<2>/DXMUX_3383 ),
    .CE(\Host/RCount<2>/CEINV_3340 ),
    .CLK(\Host/RCount<2>/CLKINV_3341 ),
    .SET(GND),
    .RST(\Host/RCount<2>/SRINVNOT ),
    .O(\Host/RCount [2])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y35" ),
    .INIT ( 1'b0 ))
  \Host/RCount_5  (
    .I(\Host/RCount<4>/DYMUX_3423 ),
    .CE(\Host/RCount<4>/CEINV_3400 ),
    .CLK(\Host/RCount<4>/CLKINV_3401 ),
    .SET(GND),
    .RST(\Host/RCount<4>/SRINVNOT ),
    .O(\Host/RCount [5])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y35" ),
    .INIT ( 1'b0 ))
  \Host/RCount_4  (
    .I(\Host/RCount<4>/DXMUX_3443 ),
    .CE(\Host/RCount<4>/CEINV_3400 ),
    .CLK(\Host/RCount<4>/CLKINV_3401 ),
    .SET(GND),
    .RST(\Host/RCount<4>/SRINVNOT ),
    .O(\Host/RCount [4])
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<7>_rt  (
    .ADR0(VCC),
    .ADR1(\Host/RCount [7]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/RCount<7>_rt_3469 )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y36" ),
    .INIT ( 1'b0 ))
  \Host/RCount_7  (
    .I(\Host/RCount<6>/DYMUX_3474 ),
    .CE(\Host/RCount<6>/CEINV_3459 ),
    .CLK(\Host/RCount<6>/CLKINV_3460 ),
    .SET(GND),
    .RST(\Host/RCount<6>/SRINVNOT ),
    .O(\Host/RCount [7])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y36" ),
    .INIT ( 1'b0 ))
  \Host/RCount_6  (
    .I(\Host/RCount<6>/DXMUX_3496 ),
    .CE(\Host/RCount<6>/CEINV_3459 ),
    .CLK(\Host/RCount<6>/CLKINV_3460 ),
    .SET(GND),
    .RST(\Host/RCount<6>/SRINVNOT ),
    .O(\Host/RCount [6])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y30" ),
    .INIT ( 1'b0 ))
  \Host/WCount_1  (
    .I(\Host/WCount<0>/DYMUX_3531 ),
    .CE(\Host/WCount<0>/CEINV_3513 ),
    .CLK(\Host/WCount<0>/CLKINV_3514 ),
    .SET(GND),
    .RST(\Host/WCount<0>/SRINVNOT ),
    .O(\Host/WCount [1])
  );
  X_LUT4 #(
    .INIT ( 16'h0F0F ),
    .LOC ( "SLICE_X35Y30" ))
  \Host/Mcount_WCount_lut<0>_INV_0  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\Host/WCount [0]),
    .ADR3(VCC),
    .O(\Host/Mcount_WCount_lut [0])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y30" ),
    .INIT ( 1'b0 ))
  \Host/WCount_0  (
    .I(\Host/WCount<0>/DXMUX_3554 ),
    .CE(\Host/WCount<0>/CEINV_3513 ),
    .CLK(\Host/WCount<0>/CLKINV_3514 ),
    .SET(GND),
    .RST(\Host/WCount<0>/SRINVNOT ),
    .O(\Host/WCount [0])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y31" ),
    .INIT ( 1'b0 ))
  \Host/WCount_3  (
    .I(\Host/WCount<2>/DYMUX_3594 ),
    .CE(\Host/WCount<2>/CEINV_3571 ),
    .CLK(\Host/WCount<2>/CLKINV_3572 ),
    .SET(GND),
    .RST(\Host/WCount<2>/SRINVNOT ),
    .O(\Host/WCount [3])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y31" ),
    .INIT ( 1'b0 ))
  \Host/WCount_2  (
    .I(\Host/WCount<2>/DXMUX_3614 ),
    .CE(\Host/WCount<2>/CEINV_3571 ),
    .CLK(\Host/WCount<2>/CLKINV_3572 ),
    .SET(GND),
    .RST(\Host/WCount<2>/SRINVNOT ),
    .O(\Host/WCount [2])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y32" ),
    .INIT ( 1'b0 ))
  \Host/WCount_5  (
    .I(\Host/WCount<4>/DYMUX_3654 ),
    .CE(\Host/WCount<4>/CEINV_3631 ),
    .CLK(\Host/WCount<4>/CLKINV_3632 ),
    .SET(GND),
    .RST(\Host/WCount<4>/SRINVNOT ),
    .O(\Host/WCount [5])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y32" ),
    .INIT ( 1'b0 ))
  \Host/WCount_4  (
    .I(\Host/WCount<4>/DXMUX_3674 ),
    .CE(\Host/WCount<4>/CEINV_3631 ),
    .CLK(\Host/WCount<4>/CLKINV_3632 ),
    .SET(GND),
    .RST(\Host/WCount<4>/SRINVNOT ),
    .O(\Host/WCount [4])
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<7>_rt  (
    .ADR0(VCC),
    .ADR1(\Host/WCount [7]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/WCount<7>_rt_3700 )
  );
  X_FF #(
    .LOC ( "SLICE_X35Y33" ),
    .INIT ( 1'b0 ))
  \Host/WCount_7  (
    .I(\Host/WCount<6>/DYMUX_3705 ),
    .CE(\Host/WCount<6>/CEINV_3690 ),
    .CLK(\Host/WCount<6>/CLKINV_3691 ),
    .SET(GND),
    .RST(\Host/WCount<6>/SRINVNOT ),
    .O(\Host/WCount [7])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y33" ),
    .INIT ( 1'b0 ))
  \Host/WCount_6  (
    .I(\Host/WCount<6>/DXMUX_3727 ),
    .CE(\Host/WCount<6>/CEINV_3690 ),
    .CLK(\Host/WCount<6>/CLKINV_3691 ),
    .SET(GND),
    .RST(\Host/WCount<6>/SRINVNOT ),
    .O(\Host/WCount [6])
  );
  X_LUT4 #(
    .INIT ( 16'hC0CC ),
    .LOC ( "SLICE_X39Y59" ))
  \Mcount_Scaler_lut<1>  (
    .ADR0(VCC),
    .ADR1(Scaler[1]),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[1])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y59" ),
    .INIT ( 1'b0 ))
  Scaler_1 (
    .I(\Scaler<0>/DYMUX_3764 ),
    .CE(\Scaler<0>/CEINV_3748 ),
    .CLK(\Scaler<0>/CLKINV_3749 ),
    .SET(GND),
    .RST(\Scaler<0>/SRINVNOT ),
    .O(Scaler[1])
  );
  X_LUT4 #(
    .INIT ( 16'hA0F0 ),
    .LOC ( "SLICE_X39Y59" ))
  \Mcount_Scaler_lut<0>  (
    .ADR0(LEDOut_2770),
    .ADR1(VCC),
    .ADR2(Scaler[0]),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[0])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y59" ),
    .INIT ( 1'b0 ))
  Scaler_0 (
    .I(\Scaler<0>/DXMUX_3784 ),
    .CE(\Scaler<0>/CEINV_3748 ),
    .CLK(\Scaler<0>/CLKINV_3749 ),
    .SET(GND),
    .RST(\Scaler<0>/SRINVNOT ),
    .O(Scaler[0])
  );
  X_LUT4 #(
    .INIT ( 16'hA0AA ),
    .LOC ( "SLICE_X39Y60" ))
  \Mcount_Scaler_lut<3>  (
    .ADR0(Scaler[3]),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[3])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y60" ),
    .INIT ( 1'b0 ))
  Scaler_3 (
    .I(\Scaler<2>/DYMUX_3826 ),
    .CE(\Scaler<2>/CEINV_3805 ),
    .CLK(\Scaler<2>/CLKINV_3806 ),
    .SET(GND),
    .RST(\Scaler<2>/SRINVNOT ),
    .O(Scaler[3])
  );
  X_LUT4 #(
    .INIT ( 16'hA0F0 ),
    .LOC ( "SLICE_X39Y60" ))
  \Mcount_Scaler_lut<2>  (
    .ADR0(LEDOut_2770),
    .ADR1(VCC),
    .ADR2(Scaler[2]),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[2])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y60" ),
    .INIT ( 1'b0 ))
  Scaler_2 (
    .I(\Scaler<2>/DXMUX_3844 ),
    .CE(\Scaler<2>/CEINV_3805 ),
    .CLK(\Scaler<2>/CLKINV_3806 ),
    .SET(GND),
    .RST(\Scaler<2>/SRINVNOT ),
    .O(Scaler[2])
  );
  X_LUT4 #(
    .INIT ( 16'hBB00 ),
    .LOC ( "SLICE_X39Y61" ))
  \Mcount_Scaler_lut<5>  (
    .ADR0(LEDOut_2770),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(VCC),
    .ADR3(Scaler[5]),
    .O(Mcount_Scaler_lut[5])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y61" ),
    .INIT ( 1'b0 ))
  Scaler_5 (
    .I(\Scaler<4>/DYMUX_3886 ),
    .CE(\Scaler<4>/CEINV_3865 ),
    .CLK(\Scaler<4>/CLKINV_3866 ),
    .SET(GND),
    .RST(\Scaler<4>/SRINVNOT ),
    .O(Scaler[5])
  );
  X_LUT4 #(
    .INIT ( 16'h88CC ),
    .LOC ( "SLICE_X39Y61" ))
  \Mcount_Scaler_lut<4>  (
    .ADR0(LEDOut_2770),
    .ADR1(Scaler[4]),
    .ADR2(VCC),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[4])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y61" ),
    .INIT ( 1'b0 ))
  Scaler_4 (
    .I(\Scaler<4>/DXMUX_3904 ),
    .CE(\Scaler<4>/CEINV_3865 ),
    .CLK(\Scaler<4>/CLKINV_3866 ),
    .SET(GND),
    .RST(\Scaler<4>/SRINVNOT ),
    .O(Scaler[4])
  );
  X_LUT4 #(
    .INIT ( 16'hA0AA ),
    .LOC ( "SLICE_X39Y62" ))
  \Mcount_Scaler_lut<7>  (
    .ADR0(Scaler[7]),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[7])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y62" ),
    .INIT ( 1'b0 ))
  Scaler_7 (
    .I(\Scaler<6>/DYMUX_3946 ),
    .CE(\Scaler<6>/CEINV_3925 ),
    .CLK(\Scaler<6>/CLKINV_3926 ),
    .SET(GND),
    .RST(\Scaler<6>/SRINVNOT ),
    .O(Scaler[7])
  );
  X_LUT4 #(
    .INIT ( 16'hA0F0 ),
    .LOC ( "SLICE_X39Y62" ))
  \Mcount_Scaler_lut<6>  (
    .ADR0(LEDOut_2770),
    .ADR1(VCC),
    .ADR2(Scaler[6]),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[6])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y62" ),
    .INIT ( 1'b0 ))
  Scaler_6 (
    .I(\Scaler<6>/DXMUX_3964 ),
    .CE(\Scaler<6>/CEINV_3925 ),
    .CLK(\Scaler<6>/CLKINV_3926 ),
    .SET(GND),
    .RST(\Scaler<6>/SRINVNOT ),
    .O(Scaler[6])
  );
  X_LUT4 #(
    .INIT ( 16'hF300 ),
    .LOC ( "SLICE_X39Y63" ))
  \Mcount_Scaler_lut<9>  (
    .ADR0(VCC),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(LEDOut_2770),
    .ADR3(Scaler[9]),
    .O(Mcount_Scaler_lut[9])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y63" ),
    .INIT ( 1'b0 ))
  Scaler_9 (
    .I(\Scaler<8>/DYMUX_4006 ),
    .CE(\Scaler<8>/CEINV_3985 ),
    .CLK(\Scaler<8>/CLKINV_3986 ),
    .SET(GND),
    .RST(\Scaler<8>/SRINVNOT ),
    .O(Scaler[9])
  );
  X_LUT4 #(
    .INIT ( 16'hC0CC ),
    .LOC ( "SLICE_X39Y63" ))
  \Mcount_Scaler_lut<8>  (
    .ADR0(VCC),
    .ADR1(Scaler[8]),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[8])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y63" ),
    .INIT ( 1'b0 ))
  Scaler_8 (
    .I(\Scaler<8>/DXMUX_4024 ),
    .CE(\Scaler<8>/CEINV_3985 ),
    .CLK(\Scaler<8>/CLKINV_3986 ),
    .SET(GND),
    .RST(\Scaler<8>/SRINVNOT ),
    .O(Scaler[8])
  );
  X_LUT4 #(
    .INIT ( 16'hF300 ),
    .LOC ( "SLICE_X39Y64" ))
  \Mcount_Scaler_lut<11>  (
    .ADR0(VCC),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(LEDOut_2770),
    .ADR3(Scaler[11]),
    .O(Mcount_Scaler_lut[11])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y64" ),
    .INIT ( 1'b0 ))
  Scaler_11 (
    .I(\Scaler<10>/DYMUX_4066 ),
    .CE(\Scaler<10>/CEINV_4045 ),
    .CLK(\Scaler<10>/CLKINV_4046 ),
    .SET(GND),
    .RST(\Scaler<10>/SRINVNOT ),
    .O(Scaler[11])
  );
  X_LUT4 #(
    .INIT ( 16'hA0AA ),
    .LOC ( "SLICE_X39Y64" ))
  \Mcount_Scaler_lut<10>  (
    .ADR0(Scaler[10]),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[10])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y64" ),
    .INIT ( 1'b0 ))
  Scaler_10 (
    .I(\Scaler<10>/DXMUX_4084 ),
    .CE(\Scaler<10>/CEINV_4045 ),
    .CLK(\Scaler<10>/CLKINV_4046 ),
    .SET(GND),
    .RST(\Scaler<10>/SRINVNOT ),
    .O(Scaler[10])
  );
  X_LUT4 #(
    .INIT ( 16'hC0CC ),
    .LOC ( "SLICE_X39Y65" ))
  \Mcount_Scaler_lut<13>  (
    .ADR0(VCC),
    .ADR1(Scaler[13]),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[13])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y65" ),
    .INIT ( 1'b0 ))
  Scaler_13 (
    .I(\Scaler<12>/DYMUX_4126 ),
    .CE(\Scaler<12>/CEINV_4105 ),
    .CLK(\Scaler<12>/CLKINV_4106 ),
    .SET(GND),
    .RST(\Scaler<12>/SRINVNOT ),
    .O(Scaler[13])
  );
  X_LUT4 #(
    .INIT ( 16'hB0B0 ),
    .LOC ( "SLICE_X39Y65" ))
  \Mcount_Scaler_lut<12>  (
    .ADR0(LEDOut_2770),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(Scaler[12]),
    .ADR3(VCC),
    .O(Mcount_Scaler_lut[12])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y65" ),
    .INIT ( 1'b0 ))
  Scaler_12 (
    .I(\Scaler<12>/DXMUX_4144 ),
    .CE(\Scaler<12>/CEINV_4105 ),
    .CLK(\Scaler<12>/CLKINV_4106 ),
    .SET(GND),
    .RST(\Scaler<12>/SRINVNOT ),
    .O(Scaler[12])
  );
  X_LUT4 #(
    .INIT ( 16'hF300 ),
    .LOC ( "SLICE_X39Y66" ))
  \Mcount_Scaler_lut<15>  (
    .ADR0(VCC),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(LEDOut_2770),
    .ADR3(Scaler[15]),
    .O(Mcount_Scaler_lut[15])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y66" ),
    .INIT ( 1'b0 ))
  Scaler_15 (
    .I(\Scaler<14>/DYMUX_4177 ),
    .CE(\Scaler<14>/CEINV_4164 ),
    .CLK(\Scaler<14>/CLKINV_4165 ),
    .SET(GND),
    .RST(\Scaler<14>/SRINVNOT ),
    .O(Scaler[15])
  );
  X_LUT4 #(
    .INIT ( 16'hA0AA ),
    .LOC ( "SLICE_X39Y66" ))
  \Mcount_Scaler_lut<14>  (
    .ADR0(Scaler[14]),
    .ADR1(VCC),
    .ADR2(LEDOut_2770),
    .ADR3(SSAck_IBUF_2768),
    .O(Mcount_Scaler_lut[14])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y66" ),
    .INIT ( 1'b0 ))
  Scaler_14 (
    .I(\Scaler<14>/DXMUX_4197 ),
    .CE(\Scaler<14>/CEINV_4164 ),
    .CLK(\Scaler<14>/CLKINV_4165 ),
    .SET(GND),
    .RST(\Scaler<14>/SRINVNOT ),
    .O(Scaler[14])
  );
  X_LUT4 #(
    .INIT ( 16'hFC30 ),
    .LOC ( "SLICE_X30Y46" ))
  Mmux__varindex0000_6 (
    .ADR0(VCC),
    .ADR1(LEDIndex[0]),
    .ADR2(LEDRegister[12]),
    .ADR3(LEDRegister[13]),
    .O(Mmux__varindex0000_6_4223)
  );
  X_LUT4 #(
    .INIT ( 16'hBB88 ),
    .LOC ( "SLICE_X30Y46" ))
  Mmux__varindex0000_5 (
    .ADR0(LEDRegister[15]),
    .ADR1(LEDIndex[0]),
    .ADR2(VCC),
    .ADR3(LEDRegister[14]),
    .O(Mmux__varindex0000_5_4232)
  );
  X_LUT4 #(
    .INIT ( 16'hEE22 ),
    .LOC ( "SLICE_X30Y47" ))
  Mmux__varindex0000_7 (
    .ADR0(LEDRegister[8]),
    .ADR1(LEDIndex[0]),
    .ADR2(VCC),
    .ADR3(LEDRegister[9]),
    .O(Mmux__varindex0000_7_4253)
  );
  X_LUT4 #(
    .INIT ( 16'hF3C0 ),
    .LOC ( "SLICE_X30Y47" ))
  Mmux__varindex0000_61 (
    .ADR0(VCC),
    .ADR1(LEDIndex[0]),
    .ADR2(LEDRegister[11]),
    .ADR3(LEDRegister[10]),
    .O(Mmux__varindex0000_61_4263)
  );
  X_LUT4 #(
    .INIT ( 16'hACAC ),
    .LOC ( "SLICE_X31Y46" ))
  Mmux__varindex0000_71 (
    .ADR0(LEDRegister[5]),
    .ADR1(LEDRegister[4]),
    .ADR2(LEDIndex[0]),
    .ADR3(VCC),
    .O(Mmux__varindex0000_71_4284)
  );
  X_LUT4 #(
    .INIT ( 16'hCACA ),
    .LOC ( "SLICE_X31Y46" ))
  Mmux__varindex0000_62 (
    .ADR0(LEDRegister[6]),
    .ADR1(LEDRegister[7]),
    .ADR2(LEDIndex[0]),
    .ADR3(VCC),
    .O(Mmux__varindex0000_62_4293)
  );
  X_LUT4 #(
    .INIT ( 16'hCFC0 ),
    .LOC ( "SLICE_X31Y47" ))
  Mmux__varindex0000_8 (
    .ADR0(VCC),
    .ADR1(LEDRegister[1]),
    .ADR2(LEDIndex[0]),
    .ADR3(LEDRegister[0]),
    .O(Mmux__varindex0000_8_4309)
  );
  X_LUT4 #(
    .INIT ( 16'hCFC0 ),
    .LOC ( "SLICE_X31Y47" ))
  Mmux__varindex0000_72 (
    .ADR0(VCC),
    .ADR1(LEDRegister[3]),
    .ADR2(LEDIndex[0]),
    .ADR3(LEDRegister[2]),
    .O(Mmux__varindex0000_72_4317)
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  \PCI_Clock/IFF/IMUX  (
    .I(\PCI_Clock/INBUF ),
    .O(PCI_Clock_IBUF1)
  );
  X_BUF #(
    .LOC ( "IPAD115" ))
  \CBE<0>/IFF/IMUX  (
    .I(\CBE<0>/INBUF ),
    .O(CBE_0_IBUF_2821)
  );
  X_BUF #(
    .LOC ( "IPAD126" ))
  \CBE<1>/IFF/IMUX  (
    .I(\CBE<1>/INBUF ),
    .O(CBE_1_IBUF_2822)
  );
  X_BUF #(
    .LOC ( "IPAD130" ))
  \CBE<2>/IFF/IMUX  (
    .I(\CBE<2>/INBUF ),
    .O(CBE_2_IBUF_2823)
  );
  X_BUF #(
    .LOC ( "IPAD131" ))
  \CBE<3>/IFF/IMUX  (
    .I(\CBE<3>/INBUF ),
    .O(CBE_3_IBUF_2824)
  );
  X_BUF #(
    .LOC ( "IPAD137" ))
  \IRdy/IFF/IMUX  (
    .I(\IRdy/INBUF ),
    .O(IRdy_IBUF_2828)
  );
  X_BUF #(
    .LOC ( "PAD15" ))
  \AD<3>/IFF/IMUX  (
    .I(\AD<3>/INBUF ),
    .O(N58)
  );
  X_BUF #(
    .LOC ( "PAD60" ))
  \AD<12>/IFF/IMUX  (
    .I(\AD<12>/INBUF ),
    .O(N49)
  );
  X_BUF #(
    .LOC ( "PAD14" ))
  \AD<4>/IFF/IMUX  (
    .I(\AD<4>/INBUF ),
    .O(N571)
  );
  X_BUF #(
    .LOC ( "PAD59" ))
  \AD<13>/IFF/IMUX  (
    .I(\AD<13>/INBUF ),
    .O(N48)
  );
  X_BUF #(
    .LOC ( "PAD49" ))
  \AD<14>/IFF/IMUX  (
    .I(\AD<14>/INBUF ),
    .O(N47)
  );
  X_BUF #(
    .LOC ( "PAD4" ))
  \AD<6>/IFF/IMUX  (
    .I(\AD<6>/INBUF ),
    .O(N55)
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  \AD<15>/IFF/IMUX  (
    .I(\AD<15>/INBUF ),
    .O(N46)
  );
  X_BUF #(
    .LOC ( "PAD2" ))
  \AD<7>/IFF/IMUX  (
    .I(\AD<7>/INBUF ),
    .O(N54)
  );
  X_BUF #(
    .LOC ( "PAD92" ))
  \AD<16>/IFF/IMUX  (
    .I(\AD<16>/INBUF ),
    .O(N45)
  );
  X_BUF #(
    .LOC ( "PAD106" ))
  \AD<8>/IFF/IMUX  (
    .I(\AD<8>/INBUF ),
    .O(N53)
  );
  X_BUF #(
    .LOC ( "PAD105" ))
  \AD<9>/IFF/IMUX  (
    .I(\AD<9>/INBUF ),
    .O(N521)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X13Y39" ))
  x86_Dout_6_mux00007_F (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_1_IBUF_2822),
    .O(N231)
  );
  X_LUT4 #(
    .INIT ( 16'h8005 ),
    .LOC ( "SLICE_X13Y39" ))
  x86_Dout_6_mux00007_G (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_1_IBUF_2822),
    .O(N232)
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable_mux0000_F  (
    .ADR0(\x86/State_FSM_FFd2_2904 ),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(x86_Hold_2908),
    .ADR3(\x86/State_FSM_FFd3_2906 ),
    .O(N217)
  );
  X_LUT4 #(
    .INIT ( 16'hEF67 ),
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable_mux0000_G  (
    .ADR0(\x86/State_FSM_FFd3_2906 ),
    .ADR1(\x86/State_FSM_FFd2_2904 ),
    .ADR2(\x86/State_FSM_FFd1_2907 ),
    .ADR3(N26_0),
    .O(N218)
  );
  X_FF #(
    .LOC ( "SLICE_X22Y42" ),
    .INIT ( 1'b0 ))
  \x86/BusOutEnable  (
    .I(\x86/BusOutEnable/DXMUX_5140 ),
    .CE(VCC),
    .CLK(\x86/BusOutEnable/CLKINV_5123 ),
    .SET(GND),
    .RST(\x86/BusOutEnable/FFX/RSTAND_5145 ),
    .O(\x86/BusOutEnable_2858 )
  );
  X_INV #(
    .LOC ( "SLICE_X22Y42" ))
  \x86/BusOutEnable/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/BusOutEnable/FFX/RSTAND_5145 )
  );
  X_LUT4 #(
    .INIT ( 16'hFBFA ),
    .LOC ( "SLICE_X28Y33" ))
  x86_Dout_17_mux00001_F (
    .ADR0(\x86/AddressLatch [3]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [1]),
    .ADR3(N01),
    .O(N239)
  );
  X_LUT4 #(
    .INIT ( 16'hFFF2 ),
    .LOC ( "SLICE_X28Y33" ))
  x86_Dout_17_mux00001_G (
    .ADR0(x86_Dout_8_cmp_eq0004_0),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [3]),
    .ADR3(\x86/AddressLatch [1]),
    .O(N240)
  );
  X_LUT4 #(
    .INIT ( 16'h2000 ),
    .LOC ( "SLICE_X25Y30" ))
  x86_Dout_17_mux00003_F (
    .ADR0(\DB7/Ready_2916 ),
    .ADR1(N97_0),
    .ADR2(N43),
    .ADR3(x86_Hold_and0001),
    .O(N189)
  );
  X_LUT4 #(
    .INIT ( 16'h1000 ),
    .LOC ( "SLICE_X25Y30" ))
  x86_Dout_17_mux00003_G (
    .ADR0(\x86/AddressLatch [3]),
    .ADR1(\x86/AddressLatch [1]),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(N43),
    .O(N190)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X12Y35" ))
  x86_Dout_1_mux00006_F (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(x86_Hold_2908),
    .O(N233)
  );
  X_LUT4 #(
    .INIT ( 16'h8101 ),
    .LOC ( "SLICE_X12Y35" ))
  x86_Dout_1_mux00006_G (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(x86_Hold_2908),
    .O(N234)
  );
  X_LUT4 #(
    .INIT ( 16'hBB0A ),
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady_mux0000_F  (
    .ADR0(\x86/State_FSM_FFd3_2906 ),
    .ADR1(\x86/State_FSM_FFd1_2907 ),
    .ADR2(x86_Hold_2908),
    .ADR3(\x86/TReady_2922 ),
    .O(N215)
  );
  X_LUT4 #(
    .INIT ( 16'h3F11 ),
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady_mux0000_G  (
    .ADR0(\x86/State_FSM_FFd3_2906 ),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(Frame_IBUF_2840),
    .ADR3(\x86/TReady_2922 ),
    .O(N216)
  );
  X_FF #(
    .LOC ( "SLICE_X19Y43" ),
    .INIT ( 1'b0 ))
  \x86/TReady  (
    .I(\x86/TReady/DXMUX_5251 ),
    .CE(VCC),
    .CLK(\x86/TReady/CLKINV_5234 ),
    .SET(GND),
    .RST(\x86/TReady/FFX/RSTAND_5256 ),
    .O(\x86/TReady_2922 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y43" ))
  \x86/TReady/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/TReady/FFX/RSTAND_5256 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFA8 ),
    .LOC ( "SLICE_X24Y57" ))
  \DB7/SDO472_SW0_F  (
    .ADR0(\DB7/ShiftCount [0]),
    .ADR1(\DB7/SDO236 ),
    .ADR2(\DB7/SDO179 ),
    .ADR3(\DB7/SDO401_0 ),
    .O(N229)
  );
  X_LUT4 #(
    .INIT ( 16'hEEE4 ),
    .LOC ( "SLICE_X24Y57" ))
  \DB7/SDO472_SW0_G  (
    .ADR0(\DB7/ShiftCount [0]),
    .ADR1(\DB7/SDO85 ),
    .ADR2(\DB7/SDO13_0 ),
    .ADR3(\DB7/SDO28_0 ),
    .O(N230)
  );
  X_LUT4 #(
    .INIT ( 16'hCCAA ),
    .LOC ( "SLICE_X33Y44" ))
  \DB7/SDO304_F  (
    .ADR0(DB7_Dout[2]),
    .ADR1(DB7_Dout[10]),
    .ADR2(VCC),
    .ADR3(\DB7/ShiftCount [3]),
    .O(N223)
  );
  X_LUT4 #(
    .INIT ( 16'hACAC ),
    .LOC ( "SLICE_X33Y44" ))
  \DB7/SDO304_G  (
    .ADR0(DB7_Dout[14]),
    .ADR1(DB7_Dout[6]),
    .ADR2(\DB7/ShiftCount [3]),
    .ADR3(VCC),
    .O(N224)
  );
  X_LUT4 #(
    .INIT ( 16'h0E04 ),
    .LOC ( "SLICE_X23Y47" ))
  \DB7/SDO236_F  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(DB7_Dout[1]),
    .ADR2(\DB7/ShiftCount [1]),
    .ADR3(DB7_Dout[9]),
    .O(N227)
  );
  X_LUT4 #(
    .INIT ( 16'h0E04 ),
    .LOC ( "SLICE_X23Y47" ))
  \DB7/SDO236_G  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(DB7_Dout[5]),
    .ADR2(\DB7/ShiftCount [1]),
    .ADR3(DB7_Dout[13]),
    .O(N228)
  );
  X_LUT4 #(
    .INIT ( 16'hA088 ),
    .LOC ( "SLICE_X32Y47" ))
  \DB7/SDO179_F  (
    .ADR0(\DB7/ShiftCount [1]),
    .ADR1(DB7_Dout[3]),
    .ADR2(DB7_Dout[11]),
    .ADR3(\DB7/ShiftCount [3]),
    .O(N221)
  );
  X_LUT4 #(
    .INIT ( 16'hA280 ),
    .LOC ( "SLICE_X32Y47" ))
  \DB7/SDO179_G  (
    .ADR0(\DB7/ShiftCount [1]),
    .ADR1(\DB7/ShiftCount [3]),
    .ADR2(DB7_Dout[15]),
    .ADR3(DB7_Dout[7]),
    .O(N222)
  );
  X_LUT4 #(
    .INIT ( 16'hDD88 ),
    .LOC ( "SLICE_X25Y45" ))
  \DB7/SDO357_F  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(DB7_Dout[8]),
    .ADR2(VCC),
    .ADR3(DB7_Dout[0]),
    .O(N225)
  );
  X_LUT4 #(
    .INIT ( 16'hF5A0 ),
    .LOC ( "SLICE_X25Y45" ))
  \DB7/SDO357_G  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(VCC),
    .ADR2(DB7_Dout[12]),
    .ADR3(DB7_Dout[4]),
    .O(N226)
  );
  X_LUT4 #(
    .INIT ( 16'hCCDC ),
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected_mux0000_F  (
    .ADR0(\x86/State_FSM_FFd1_2907 ),
    .ADR1(\x86/Selected_2833 ),
    .ADR2(N63),
    .ADR3(\x86/State_FSM_FFd3_2906 ),
    .O(N237)
  );
  X_LUT4 #(
    .INIT ( 16'hC4CC ),
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected_mux0000_G  (
    .ADR0(Frame_IBUF_2840),
    .ADR1(\x86/Selected_2833 ),
    .ADR2(\x86/State_FSM_FFd1_2907 ),
    .ADR3(IRdy_IBUF_2828),
    .O(N238)
  );
  X_FF #(
    .LOC ( "SLICE_X23Y41" ),
    .INIT ( 1'b0 ))
  \x86/Selected  (
    .I(\x86/Selected/DXMUX_5521 ),
    .CE(VCC),
    .CLK(\x86/Selected/CLKINV_5504 ),
    .SET(GND),
    .RST(\x86/Selected/FFX/RSTAND_5526 ),
    .O(\x86/Selected_2833 )
  );
  X_INV #(
    .LOC ( "SLICE_X23Y41" ))
  \x86/Selected/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/Selected/FFX/RSTAND_5526 )
  );
  X_LUT4 #(
    .INIT ( 16'hAACC ),
    .LOC ( "SLICE_X23Y55" ))
  \DB7/SDO85_F  (
    .ADR0(DB7_Address[4]),
    .ADR1(DB7_Address[0]),
    .ADR2(VCC),
    .ADR3(\DB7/ShiftCount [2]),
    .O(N219)
  );
  X_LUT4 #(
    .INIT ( 16'hF0CC ),
    .LOC ( "SLICE_X23Y55" ))
  \DB7/SDO85_G  (
    .ADR0(VCC),
    .ADR1(DB7_Address[2]),
    .ADR2(DB7_Address[6]),
    .ADR3(\DB7/ShiftCount [2]),
    .O(N220)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFD ),
    .LOC ( "SLICE_X13Y34" ))
  x86_Dout_3_mux000011_SW0_G (
    .ADR0(x86_Dout_0_cmp_eq0002),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [0]),
    .ADR3(CBE_0_IBUF_2821),
    .O(N188)
  );
  X_LUT4 #(
    .INIT ( 16'h0505 ),
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer_mux0000<2>_SW0  (
    .ADR0(\DB7/StrobeTimer [4]),
    .ADR1(VCC),
    .ADR2(\DB7/N13 ),
    .ADR3(VCC),
    .O(\DB7/StrobeTimer_mux0000<2>_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hCEA0 ),
    .LOC ( "SLICE_X21Y58" ))
  \DB7/StrobeTimer_mux0000<2>  (
    .ADR0(\DB7/StrobeTimer_or0000 ),
    .ADR1(\DB7/N28_0 ),
    .ADR2(\DB7/StrobeTimer_mux0000<2>_SW0/O ),
    .ADR3(\DB7/StrobeTimer [5]),
    .O(\DB7/StrobeTimer_mux0000 [2])
  );
  X_LUT4 #(
    .INIT ( 16'h303F ),
    .LOC ( "SLICE_X18Y33" ))
  x86_Dout_0_mux000027_SW0 (
    .ADR0(VCC),
    .ADR1(\Host/RxBufferFull_2988 ),
    .ADR2(\x86/AddressLatch [0]),
    .ADR3(\Host/RCount [0]),
    .O(\x86_Dout_0_mux000027_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0004 ),
    .LOC ( "SLICE_X18Y33" ))
  x86_Dout_0_mux000027 (
    .ADR0(\x86/AddressLatch [1]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86_Dout_0_mux000027_SW0/O ),
    .ADR3(\x86/AddressLatch [3]),
    .O(x86_Dout_0_mux000027_5714)
  );
  X_LUT4 #(
    .INIT ( 16'h4070 ),
    .LOC ( "SLICE_X14Y35" ))
  x86_Dout_0_mux0000128 (
    .ADR0(N142_0),
    .ADR1(x86_Dout_0_mux00005_0),
    .ADR2(x86_Hold_and0001),
    .ADR3(N141),
    .O(\x86_Dout_0_mux0000128/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEFC ),
    .LOC ( "SLICE_X14Y35" ))
  x86_Dout_0_mux000046 (
    .ADR0(x86_Dout[0]),
    .ADR1(x86_Dout_0_mux000027_0),
    .ADR2(\x86_Dout_0_mux0000128/O ),
    .ADR3(N11),
    .O(x86_Dout_0_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X14Y35" ),
    .INIT ( 1'b0 ))
  x86_Dout_0 (
    .I(\x86_Dout<0>/DXMUX_5745 ),
    .CE(\x86_Dout<0>/CEINV_5729 ),
    .CLK(\x86_Dout<0>/CLKINV_5730 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[0])
  );
  X_LUT4 #(
    .INIT ( 16'hC480 ),
    .LOC ( "SLICE_X19Y32" ))
  x86_Dout_1_mux000038 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\Host/TxDone_2997 ),
    .ADR3(\Host/RCount [1]),
    .O(\x86_Dout_1_mux000038/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0050 ),
    .LOC ( "SLICE_X19Y32" ))
  x86_Dout_1_mux000039 (
    .ADR0(\x86/AddressLatch [3]),
    .ADR1(VCC),
    .ADR2(\x86_Dout_1_mux000038/O ),
    .ADR3(\x86/AddressLatch [1]),
    .O(x86_Dout_1_mux000039_5771)
  );
  X_LUT4 #(
    .INIT ( 16'hC0E0 ),
    .LOC ( "SLICE_X16Y35" ))
  x86_Dout_1_mux000020 (
    .ADR0(N213_0),
    .ADR1(x86_Dout_1_mux00006),
    .ADR2(N16),
    .ADR3(CBE_1_IBUF_2822),
    .O(\x86_Dout_1_mux000020/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X16Y35" ))
  x86_Dout_1_mux000059 (
    .ADR0(x86_Dout[1]),
    .ADR1(N11),
    .ADR2(\x86_Dout_1_mux000020/O ),
    .ADR3(x86_Dout_1_mux000039_0),
    .O(x86_Dout_1_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y35" ),
    .INIT ( 1'b0 ))
  x86_Dout_1 (
    .I(\x86_Dout<1>/DXMUX_5802 ),
    .CE(\x86_Dout<1>/CEINV_5786 ),
    .CLK(\x86_Dout<1>/CLKINV_5787 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[1])
  );
  X_LUT4 #(
    .INIT ( 16'hC0E0 ),
    .LOC ( "SLICE_X16Y34" ))
  x86_Dout_2_mux000011 (
    .ADR0(N207_0),
    .ADR1(x86_Dout_2_mux00001_0),
    .ADR2(N16),
    .ADR3(CBE_1_IBUF_2822),
    .O(\x86_Dout_2_mux000011/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFEA ),
    .LOC ( "SLICE_X16Y34" ))
  x86_Dout_2_mux000024 (
    .ADR0(x86_Dout_2_mux00000_0),
    .ADR1(N11),
    .ADR2(x86_Dout[2]),
    .ADR3(\x86_Dout_2_mux000011/O ),
    .O(x86_Dout_2_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y34" ),
    .INIT ( 1'b0 ))
  x86_Dout_2 (
    .I(\x86_Dout<2>/DXMUX_5835 ),
    .CE(\x86_Dout<2>/CEINV_5819 ),
    .CLK(\x86_Dout<2>/CLKINV_5820 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[2])
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X17Y32" ))
  x86_Hold_mux000220 (
    .ADR0(x86_Dout_8_cmp_eq0000),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(x86_Hold_mux000210_0),
    .ADR3(\x86/AddressLatch [0]),
    .O(\x86_Hold_mux000220/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hD580 ),
    .LOC ( "SLICE_X17Y32" ))
  x86_Hold_mux000236 (
    .ADR0(x86_Read_0),
    .ADR1(\x86_Hold_mux000220/O ),
    .ADR2(x86_Hold_and0001),
    .ADR3(x86_to_DB7_cmp_eq0000),
    .O(x86_Hold_mux000236_5861)
  );
  X_LUT4 #(
    .INIT ( 16'h330F ),
    .LOC ( "SLICE_X15Y34" ))
  x86_Dout_3_mux000023_SW0 (
    .ADR0(VCC),
    .ADR1(\DB7/Ready_2916 ),
    .ADR2(\Host/RCount [3]),
    .ADR3(\x86/AddressLatch [0]),
    .O(\x86_Dout_3_mux000023_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X15Y34" ))
  x86_Dout_3_mux000023 (
    .ADR0(\x86/AddressLatch [1]),
    .ADR1(\x86/AddressLatch [3]),
    .ADR2(\x86_Dout_3_mux000023_SW0/O ),
    .ADR3(\x86/AddressLatch [2]),
    .O(x86_Dout_3_mux000023_5885)
  );
  X_LUT4 #(
    .INIT ( 16'h8A00 ),
    .LOC ( "SLICE_X15Y32" ))
  x86_Hold_mux000281 (
    .ADR0(x86_Read_0),
    .ADR1(x86_Hold_mux000269_0),
    .ADR2(x86_Hold_and0001),
    .ADR3(x86_Hold_2908),
    .O(\x86_Hold_mux000281/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hF3F0 ),
    .LOC ( "SLICE_X15Y32" ))
  x86_Hold_mux000290 (
    .ADR0(VCC),
    .ADR1(\DB7/Ready_2916 ),
    .ADR2(\x86_Hold_mux000281/O ),
    .ADR3(x86_Hold_mux000236_0),
    .O(x86_Hold_mux0002)
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X24Y32" ))
  x86_to_DB7_and00011 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\x86/AddressLatch [1]),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(\x86/AddressLatch [3]),
    .O(x86_to_DB7_and0001_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h5444 ),
    .LOC ( "SLICE_X24Y32" ))
  x86_Hold_not00011 (
    .ADR0(IRdy_IBUF_2828),
    .ADR1(\x86/IORead_3030 ),
    .ADR2(\x86/IOWrite_3029 ),
    .ADR3(x86_to_DB7_and0001),
    .O(x86_Hold_not0001)
  );
  X_LUT4 #(
    .INIT ( 16'hC800 ),
    .LOC ( "SLICE_X21Y32" ))
  x86_Dout_5_mux00006 (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(x86_Dout_8_cmp_eq0000),
    .O(\x86_Dout_5_mux00006/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X21Y32" ))
  x86_Dout_5_mux000017 (
    .ADR0(x86_Dout_0_cmp_eq0002),
    .ADR1(x86_Dlast[5]),
    .ADR2(\x86_Dout_5_mux00006/O ),
    .ADR3(N108_0),
    .O(x86_Dout_5_mux000017_6061)
  );
  X_LUT4 #(
    .INIT ( 16'hC0E0 ),
    .LOC ( "SLICE_X18Y35" ))
  x86_Dout_6_mux000021 (
    .ADR0(N2111_0),
    .ADR1(x86_Dout_6_mux00007),
    .ADR2(N16),
    .ADR3(CBE_1_IBUF_2822),
    .O(\x86_Dout_6_mux000021/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEFA ),
    .LOC ( "SLICE_X18Y35" ))
  x86_Dout_6_mux000040 (
    .ADR0(x86_Dout_6_mux00000_0),
    .ADR1(x86_Dout[6]),
    .ADR2(\x86_Dout_6_mux000021/O ),
    .ADR3(N11),
    .O(x86_Dout_6_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X18Y35" ),
    .INIT ( 1'b0 ))
  x86_Dout_6 (
    .I(\x86_Dout<6>/DXMUX_6092 ),
    .CE(\x86_Dout<6>/CEINV_6076 ),
    .CLK(\x86_Dout<6>/CLKINV_6077 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[6])
  );
  X_LUT4 #(
    .INIT ( 16'hBA00 ),
    .LOC ( "SLICE_X17Y35" ))
  x86_Dout_7_mux000011 (
    .ADR0(x86_Dout_7_mux00001_0),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(N205_0),
    .ADR3(N16),
    .O(\x86_Dout_7_mux000011/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFEA ),
    .LOC ( "SLICE_X17Y35" ))
  x86_Dout_7_mux000024 (
    .ADR0(x86_Dout_7_mux00000_0),
    .ADR1(x86_Dout[7]),
    .ADR2(N11),
    .ADR3(\x86_Dout_7_mux000011/O ),
    .O(x86_Dout_7_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X17Y35" ),
    .INIT ( 1'b0 ))
  x86_Dout_7 (
    .I(\x86_Dout<7>/DXMUX_6125 ),
    .CE(\x86_Dout<7>/CEINV_6109 ),
    .CLK(\x86_Dout<7>/CLKINV_6110 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[7])
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X29Y30" ))
  x86_Dout_8_mux00004 (
    .ADR0(N17_0),
    .ADR1(x86_Dout[8]),
    .ADR2(x86_Dlast[8]),
    .ADR3(N5_0),
    .O(\x86_Dout_8_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X29Y30" ))
  x86_Dout_8_mux000034 (
    .ADR0(x86_Dout_8_mux000024_0),
    .ADR1(x86_Dout_10_mux000025_0),
    .ADR2(\x86_Dout_8_mux00004/O ),
    .ADR3(x86_Dout_8_mux00009_0),
    .O(x86_Dout_8_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X29Y30" ),
    .INIT ( 1'b0 ))
  x86_Dout_8 (
    .I(\x86_Dout<8>/DXMUX_6158 ),
    .CE(\x86_Dout<8>/CEINV_6142 ),
    .CLK(\x86_Dout<8>/CLKINV_6143 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[8])
  );
  X_LUT4 #(
    .INIT ( 16'h0040 ),
    .LOC ( "SLICE_X22Y40" ))
  LEDIndex_and00031 (
    .ADR0(\x86/AddressLatch [1]),
    .ADR1(\x86/AddressLatch [0]),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(\x86/AddressLatch [3]),
    .O(LEDIndex_and0003_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h4000 ),
    .LOC ( "SLICE_X22Y40" ))
  LEDRegister_and00001 (
    .ADR0(x86_Read_0),
    .ADR1(x86_Write_0),
    .ADR2(PCI_Reset_IBUF_2742),
    .ADR3(LEDIndex_and0003),
    .O(LEDRegister_and0000)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ),
    .LOC ( "SLICE_X19Y54" ))
  \DB7/StrobeTimer_mux0000<3>11  (
    .ADR0(\DB7/StrobeTimer [1]),
    .ADR1(\DB7/StrobeTimer [2]),
    .ADR2(\DB7/StrobeTimer [0]),
    .ADR3(\DB7/StrobeTimer [3]),
    .O(\DB7/N13_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X19Y54" ))
  \DB7/StrobeTimer_mux0000<0>32  (
    .ADR0(\DB7/StrobeTimer [4]),
    .ADR1(\DB7/StrobeTimer [5]),
    .ADR2(\DB7/N13 ),
    .ADR3(N103_0),
    .O(\DB7/State_cmp_eq0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hFCF8 ),
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer_mux0000<0>13  (
    .ADR0(\DB7/State_FSM_FFd1_2902 ),
    .ADR1(N178_0),
    .ADR2(\DB7/N28_0 ),
    .ADR3(\DB7/State_FSM_FFd3_2981 ),
    .O(\DB7/StrobeTimer_mux0000<0>13/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X20Y55" ))
  \DB7/StrobeTimer_mux0000<0>24  (
    .ADR0(\DB7/State_cmp_eq0001_0 ),
    .ADR1(\DB7/StrobeTimer_or0000 ),
    .ADR2(\DB7/StrobeTimer_mux0000<0>13/O ),
    .ADR3(\DB7/StrobeTimer [7]),
    .O(\DB7/StrobeTimer_mux0000 [0])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y58" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_3  (
    .I(\DB7/StrobeTimer<3>/DXMUX_6338 ),
    .CE(\DB7/StrobeTimer<3>/CEINV_6322 ),
    .CLK(\DB7/StrobeTimer<3>/CLKINV_6323 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [3])
  );
  X_LUT4 #(
    .INIT ( 16'h3030 ),
    .LOC ( "SLICE_X18Y38" ))
  \x86/ConfigData_and000021  (
    .ADR0(VCC),
    .ADR1(Frame_IBUF_2840),
    .ADR2(\x86/LastFrame_2923 ),
    .ADR3(VCC),
    .O(\x86/IORead_and0000_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X18Y38" ))
  \x86/AddressLatch_not00011  (
    .ADR0(\x86/State_FSM_FFd2_2904 ),
    .ADR1(\x86/State_FSM_FFd3_2906 ),
    .ADR2(\x86/State_FSM_FFd1_2907 ),
    .ADR3(\x86/IORead_and0000 ),
    .O(\x86/AddressLatch_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ),
    .LOC ( "SLICE_X31Y32" ))
  DataToHost_or0000 (
    .ADR0(\x86/AddressLatch [2]),
    .ADR1(\x86/AddressLatch [1]),
    .ADR2(\x86/AddressLatch [3]),
    .ADR3(N176_0),
    .O(DataToHost_or0000_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h0A0A ),
    .LOC ( "SLICE_X31Y32" ))
  DataToHost_and00001 (
    .ADR0(PCI_Reset_IBUF_2742),
    .ADR1(VCC),
    .ADR2(DataToHost_or0000_3080),
    .ADR3(VCC),
    .O(DataToHost_and0000)
  );
  X_LUT4 #(
    .INIT ( 16'h1111 ),
    .LOC ( "SLICE_X26Y34" ))
  \Host/GettingByte_FSM_Out01  (
    .ADR0(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR1(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/PuttingByte_cmp_eq0000_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hEFFF ),
    .LOC ( "SLICE_X26Y34" ))
  \Host/USBDir_mux000024  (
    .ADR0(USBTxReady_IBUF_2838),
    .ADR1(\Host/PuttingByte_cmp_ne0000 ),
    .ADR2(WriteToHost_3084),
    .ADR3(\Host/PuttingByte_cmp_eq0000 ),
    .O(\Host/USBDir_mux000024_6412 )
  );
  X_LUT4 #(
    .INIT ( 16'h8D00 ),
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount_mux0001<0>26  (
    .ADR0(\DB7/State_FSM_FFd5_2927 ),
    .ADR1(\DB7/ShiftCount_mux0001<0>8_0 ),
    .ADR2(StateOut[0]),
    .ADR3(\DB7/ShiftCount [3]),
    .O(\DB7/ShiftCount_mux0001<0>26/O_pack_3 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF09 ),
    .LOC ( "SLICE_X22Y56" ))
  \DB7/ShiftCount_mux0001<0>31  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(\DB7/N18 ),
    .ADR2(N174_0),
    .ADR3(\DB7/ShiftCount_mux0001<0>26/O ),
    .O(\DB7/ShiftCount_mux0001[0] )
  );
  X_FF #(
    .LOC ( "SLICE_X22Y56" ),
    .INIT ( 1'b0 ))
  \DB7/ShiftCount_3  (
    .I(\DB7/ShiftCount<3>/DXMUX_6443 ),
    .CE(\DB7/ShiftCount<3>/CEINV_6427 ),
    .CLK(\DB7/ShiftCount<3>/CLKINV_6428 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/ShiftCount [3])
  );
  X_LUT4 #(
    .INIT ( 16'h0002 ),
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir_mux00007  (
    .ADR0(\Host/PuttingByte_cmp_eq0000 ),
    .ADR1(\Host/RxBufferFull_2988 ),
    .ADR2(\Host/PuttingByte_cmp_ne0000 ),
    .ADR3(USBRxValid_IBUF_2836),
    .O(\Host/USBDir_mux00007/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFEFC ),
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir_mux000034  (
    .ADR0(\Host/USBDir_2847 ),
    .ADR1(\Host/USBDir_mux00007/O ),
    .ADR2(\Host/PuttingByte_cmp_eq0001_0 ),
    .ADR3(\Host/USBDir_mux000024_0 ),
    .O(\Host/USBDir_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X27Y35" ),
    .INIT ( 1'b1 ))
  \Host/USBDir  (
    .I(\Host/USBDir/DXMUX_6476 ),
    .CE(VCC),
    .CLK(\Host/USBDir/CLKINV_6460 ),
    .SET(\Host/USBDir/FFX/SET ),
    .RST(GND),
    .O(\Host/USBDir_2847 )
  );
  X_INV #(
    .LOC ( "SLICE_X27Y35" ))
  \Host/USBDir/FFX/SETOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/USBDir/FFX/SET )
  );
  X_LUT4 #(
    .INIT ( 16'hDDDC ),
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount_mux0001<1>20  (
    .ADR0(\DB7/N18 ),
    .ADR1(\DB7/N14 ),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(\DB7/State_FSM_FFd4_3097 ),
    .O(\DB7/ShiftCount_mux0001<1>20/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFA8 ),
    .LOC ( "SLICE_X21Y55" ))
  \DB7/ShiftCount_mux0001<1>33  (
    .ADR0(\DB7/ShiftCount [2]),
    .ADR1(\DB7/ShiftCount_mux0001<1>25_0 ),
    .ADR2(\DB7/N112_0 ),
    .ADR3(\DB7/ShiftCount_mux0001<1>20/O ),
    .O(\DB7/ShiftCount_mux0001[1] )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y55" ),
    .INIT ( 1'b0 ))
  \DB7/ShiftCount_2  (
    .I(\DB7/ShiftCount<2>/DXMUX_6510 ),
    .CE(\DB7/ShiftCount<2>/CEINV_6494 ),
    .CLK(\DB7/ShiftCount<2>/CLKINV_6495 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/ShiftCount [2])
  );
  X_LUT4 #(
    .INIT ( 16'hEEEE ),
    .LOC ( "SLICE_X21Y56" ))
  \DB7/StrobeTimer_or00001  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\DB7/StrobeTimer_or0000_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hEE0F ),
    .LOC ( "SLICE_X21Y56" ))
  \DB7/N281  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(\DB7/N18 ),
    .ADR2(\DB7/StrobeTimer_or0000 ),
    .ADR3(StateOut[0]),
    .O(\DB7/N28 )
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X27Y32" ))
  x86_Dout_10_mux00003 (
    .ADR0(x86_Hold_and0001),
    .ADR1(\x86/AddressLatch [0]),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(N97_0),
    .O(N15_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X27Y32" ))
  x86_Dout_15_mux00009 (
    .ADR0(\DB7/Accumulator [15]),
    .ADR1(N22),
    .ADR2(N15),
    .ADR3(\Host/WCount [7]),
    .O(x86_Dout_15_mux00009_6560)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFC ),
    .LOC ( "SLICE_X21Y43" ))
  x86_to_DB7_not00011_SW0 (
    .ADR0(VCC),
    .ADR1(x86_to_DB7_cmp_eq0000),
    .ADR2(IRdy_IBUF_2828),
    .ADR3(\x86/IORead_3030 ),
    .O(\x86_to_DB7_not00011_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F8 ),
    .LOC ( "SLICE_X21Y43" ))
  x86_to_DB7_not00011 (
    .ADR0(\x86/IOWrite_3029 ),
    .ADR1(x86_to_DB7_and0001),
    .ADR2(x86_to_DB7_2925),
    .ADR3(\x86_to_DB7_not00011_SW0/O ),
    .O(x86_to_DB7_not0001)
  );
  X_LUT4 #(
    .INIT ( 16'hFAC0 ),
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready_mux00008  (
    .ADR0(N152_0),
    .ADR1(\DB7/Shifting_and0000_0 ),
    .ADR2(\DB7/State_FSM_FFd1_2902 ),
    .ADR3(\DB7/Ready_2916 ),
    .O(\DB7/Ready_mux00008/O_pack_3 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFC8 ),
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready_mux000014  (
    .ADR0(\DB7/State_FSM_FFd1_2902 ),
    .ADR1(\DB7/State_cmp_eq0001_0 ),
    .ADR2(\DB7/State_FSM_FFd3_2981 ),
    .ADR3(\DB7/Ready_mux00008/O ),
    .O(\DB7/Ready_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X22Y34" ),
    .INIT ( 1'b1 ))
  \DB7/Ready  (
    .I(\DB7/Ready/DXMUX_6698 ),
    .CE(VCC),
    .CLK(\DB7/Ready/CLKINV_6682 ),
    .SET(\DB7/Ready/FFX/SET ),
    .RST(GND),
    .O(\DB7/Ready_2916 )
  );
  X_INV #(
    .LOC ( "SLICE_X22Y34" ))
  \DB7/Ready/FFX/SETOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/Ready/FFX/SET )
  );
  X_LUT4 #(
    .INIT ( 16'hDFDF ),
    .LOC ( "SLICE_X23Y44" ))
  DB7_Dout_and00001_SW0 (
    .ADR0(\x86/IOWrite_3029 ),
    .ADR1(x86_to_DB7_cmp_eq0000),
    .ADR2(x86_to_DB7_and0001),
    .ADR3(VCC),
    .O(\DB7_Dout_and00001_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0002 ),
    .LOC ( "SLICE_X23Y44" ))
  DB7_Dout_and00001 (
    .ADR0(PCI_Reset_IBUF_2742),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(\DB7_Dout_and00001_SW0/O ),
    .ADR3(\x86/IORead_3030 ),
    .O(DB7_Dout_and0000)
  );
  X_LUT4 #(
    .INIT ( 16'h4440 ),
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut_mux000123  (
    .ADR0(\DB7/State_cmp_eq0001_0 ),
    .ADR1(N144_0),
    .ADR2(\DB7/State_FSM_FFd1_2902 ),
    .ADR3(\DB7/State_FSM_FFd3_2981 ),
    .O(\DB7/StrobeOut_mux000123/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAEA ),
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut_mux000144  (
    .ADR0(\DB7/StrobeOut_mux00017_0 ),
    .ADR1(\DB7/StrobeOut_mux000116_0 ),
    .ADR2(\DB7/StrobeOut_2844 ),
    .ADR3(\DB7/StrobeOut_mux000123/O ),
    .O(\DB7/StrobeOut_mux0001 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y56" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeOut  (
    .I(\DB7/StrobeOut/DXMUX_6756 ),
    .CE(VCC),
    .CLK(\DB7/StrobeOut/CLKINV_6740 ),
    .SET(GND),
    .RST(\DB7/StrobeOut/FFX/RSTAND_6761 ),
    .O(\DB7/StrobeOut_2844 )
  );
  X_INV #(
    .LOC ( "SLICE_X18Y56" ))
  \DB7/StrobeOut/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/StrobeOut/FFX/RSTAND_6761 )
  );
  X_LUT4 #(
    .INIT ( 16'hFBFA ),
    .LOC ( "SLICE_X20Y32" ))
  x86_Dout_0_mux0000153 (
    .ADR0(\x86/AddressLatch [1]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [3]),
    .ADR3(N156_0),
    .O(N11_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X20Y32" ))
  x86_Dout_5_mux000046_SW0_SW0 (
    .ADR0(\Host/RCount [5]),
    .ADR1(x86_Dout[5]),
    .ADR2(N22),
    .ADR3(N11),
    .O(N154)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFB ),
    .LOC ( "SLICE_X20Y57" ))
  \DB7/ShiftCount_mux0001<1>22  (
    .ADR0(\DB7/ShiftCount [2]),
    .ADR1(\DB7/SClock_2839 ),
    .ADR2(\DB7/ShiftCount [1]),
    .ADR3(\DB7/ShiftCount [0]),
    .O(\DB7/N18_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0300 ),
    .LOC ( "SLICE_X20Y57" ))
  \DB7/State_FSM_FFd3-In_SW1  (
    .ADR0(VCC),
    .ADR1(\DB7/ShiftCount [3]),
    .ADR2(\DB7/N18 ),
    .ADR3(\DB7/State_FSM_FFd4_3097 ),
    .O(N114)
  );
  X_LUT4 #(
    .INIT ( 16'hDFEE ),
    .LOC ( "SLICE_X28Y32" ))
  x86_Dout_10_mux00001 (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(N29_0),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(CBE_2_IBUF_2823),
    .O(N01_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h1F0F ),
    .LOC ( "SLICE_X28Y32" ))
  x86_Dout_10_mux000021 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(x86_Hold_and0001),
    .ADR3(N01),
    .O(N5)
  );
  X_LUT4 #(
    .INIT ( 16'hECA0 ),
    .LOC ( "SLICE_X28Y34" ))
  x86_Dout_10_mux000041 (
    .ADR0(N5_0),
    .ADR1(N17_0),
    .ADR2(x86_Dout[10]),
    .ADR3(x86_Dlast[10]),
    .O(\x86_Dout_10_mux000041/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFEA ),
    .LOC ( "SLICE_X28Y34" ))
  x86_Dout_10_mux000034 (
    .ADR0(x86_Dout_10_mux00009_0),
    .ADR1(x86_Dout_10_mux000025_0),
    .ADR2(x86_Dout_10_mux000024_0),
    .ADR3(\x86_Dout_10_mux000041/O ),
    .O(x86_Dout_10_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X28Y34" ),
    .INIT ( 1'b0 ))
  x86_Dout_10 (
    .I(\x86_Dout<10>/DXMUX_6863 ),
    .CE(\x86_Dout<10>/CEINV_6847 ),
    .CLK(\x86_Dout<10>/CLKINV_6848 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[10])
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X28Y31" ))
  x86_Dout_13_mux00004 (
    .ADR0(N5_0),
    .ADR1(x86_Dout[13]),
    .ADR2(x86_Dlast[13]),
    .ADR3(N17_0),
    .O(\x86_Dout_13_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X28Y31" ))
  x86_Dout_13_mux000020 (
    .ADR0(\Host/RxData [5]),
    .ADR1(N20_0),
    .ADR2(\x86_Dout_13_mux00004/O ),
    .ADR3(x86_Dout_13_mux00009_0),
    .O(x86_Dout_13_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X28Y31" ),
    .INIT ( 1'b0 ))
  x86_Dout_13 (
    .I(\x86_Dout<13>/DXMUX_6986 ),
    .CE(\x86_Dout<13>/CEINV_6970 ),
    .CLK(\x86_Dout<13>/CLKINV_6971 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[13])
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X29Y34" ))
  x86_Dout_14_mux00004 (
    .ADR0(x86_Dout[14]),
    .ADR1(x86_Dlast[14]),
    .ADR2(N17_0),
    .ADR3(N5_0),
    .O(\x86_Dout_14_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X29Y34" ))
  x86_Dout_14_mux000020 (
    .ADR0(N20_0),
    .ADR1(\Host/RxData [6]),
    .ADR2(x86_Dout_14_mux00009_0),
    .ADR3(\x86_Dout_14_mux00004/O ),
    .O(x86_Dout_14_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X29Y34" ),
    .INIT ( 1'b0 ))
  x86_Dout_14 (
    .I(\x86_Dout<14>/DXMUX_7019 ),
    .CE(\x86_Dout<14>/CEINV_7003 ),
    .CLK(\x86_Dout<14>/CLKINV_7004 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[14])
  );
  X_LUT4 #(
    .INIT ( 16'h0040 ),
    .LOC ( "SLICE_X20Y37" ))
  \x86/State_FSM_FFd2-In33_SW0  (
    .ADR0(\x86/State_FSM_FFd1_2907 ),
    .ADR1(\x86/State_cmp_eq0003_0 ),
    .ADR2(\x86/IORead_and0001 ),
    .ADR3(\x86/State_FSM_FFd3_2906 ),
    .O(\x86/State_FSM_FFd2-In33_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hA0A0 ),
    .LOC ( "SLICE_X20Y37" ))
  \x86/State_FSM_FFd2-In41_SW0  (
    .ADR0(\x86/LastFrame_2923 ),
    .ADR1(VCC),
    .ADR2(\x86/State_FSM_FFd2-In33_SW0/O ),
    .ADR3(VCC),
    .O(N203)
  );
  X_LUT4 #(
    .INIT ( 16'h4400 ),
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount_mux0001<1>11  (
    .ADR0(DB7_Address[7]),
    .ADR1(x86_to_DB7_2925),
    .ADR2(VCC),
    .ADR3(\DB7/State_FSM_FFd5_2927 ),
    .O(\DB7/N14_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFEA ),
    .LOC ( "SLICE_X19Y55" ))
  \DB7/ShiftCount_mux0001<3>2  (
    .ADR0(\DB7/N411 ),
    .ADR1(\DB7/N112_0 ),
    .ADR2(\DB7/ShiftCount [0]),
    .ADR3(\DB7/N14 ),
    .O(\DB7/ShiftCount_mux0001[3] )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y55" ),
    .INIT ( 1'b0 ))
  \DB7/ShiftCount_0  (
    .I(\DB7/ShiftCount<0>/DXMUX_7076 ),
    .CE(\DB7/ShiftCount<0>/CEINV_7059 ),
    .CLK(\DB7/ShiftCount<0>/CLKINV_7060 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/ShiftCount [0])
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X29Y32" ))
  x86_Dout_15_mux00004 (
    .ADR0(x86_Dout[15]),
    .ADR1(x86_Dlast[15]),
    .ADR2(N17_0),
    .ADR3(N5_0),
    .O(\x86_Dout_15_mux00004/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X29Y32" ))
  x86_Dout_15_mux000020 (
    .ADR0(N20_0),
    .ADR1(\Host/RxData [7]),
    .ADR2(\x86_Dout_15_mux00004/O ),
    .ADR3(x86_Dout_15_mux00009_0),
    .O(x86_Dout_15_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X29Y32" ),
    .INIT ( 1'b0 ))
  x86_Dout_15 (
    .I(\x86_Dout<15>/DXMUX_7109 ),
    .CE(\x86_Dout<15>/CEINV_7093 ),
    .CLK(\x86_Dout<15>/CLKINV_7094 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[15])
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X29Y33" ))
  x86_Dout_17_mux0000111_SW0 (
    .ADR0(N20_0),
    .ADR1(\Host/TxDone_2997 ),
    .ADR2(N7),
    .ADR3(x86_Dout[17]),
    .O(\x86_Dout_17_mux0000111_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFF8 ),
    .LOC ( "SLICE_X29Y33" ))
  x86_Dout_17_mux000017 (
    .ADR0(N17_0),
    .ADR1(x86_Dlast[17]),
    .ADR2(x86_Dout_17_mux00003),
    .ADR3(\x86_Dout_17_mux0000111_SW0/O ),
    .O(x86_Dout_17_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X29Y33" ),
    .INIT ( 1'b0 ))
  x86_Dout_17 (
    .I(\x86_Dout<17>/DXMUX_7142 ),
    .CE(\x86_Dout<17>/CEINV_7126 ),
    .CLK(\x86_Dout<17>/CLKINV_7127 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[17])
  );
  X_LUT4 #(
    .INIT ( 16'hFAFA ),
    .LOC ( "SLICE_X21Y57" ))
  \DB7/State_or00011  (
    .ADR0(\DB7/State_FSM_FFd4_3097 ),
    .ADR1(VCC),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(VCC),
    .O(\StateOut<0>_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF02 ),
    .LOC ( "SLICE_X21Y57" ))
  \DB7/StrobeOut_mux00017  (
    .ADR0(StateOut[0]),
    .ADR1(\DB7/N18 ),
    .ADR2(\DB7/ShiftCount [3]),
    .ADR3(\DB7/StrobeOut_mux00015_0 ),
    .O(\DB7/StrobeOut_mux00017_7168 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y57" ),
    .INIT ( 1'b0 ))
  \DB7/Shifting  (
    .I(\DB7/Shifting/DXMUX_7271 ),
    .CE(VCC),
    .CLK(\DB7/Shifting/CLKINV_7255 ),
    .SET(GND),
    .RST(\DB7/Shifting/FFX/RSTAND_7276 ),
    .O(\DB7/Shifting_3167 )
  );
  X_INV #(
    .LOC ( "SLICE_X18Y57" ))
  \DB7/Shifting/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/Shifting/FFX/RSTAND_7276 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEE ),
    .LOC ( "SLICE_X35Y50" ))
  \Msub_LEDIndex_addsub0000_cy<1>11  (
    .ADR0(LEDIndex[0]),
    .ADR1(LEDIndex[1]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Msub_LEDIndex_addsub0000_cy<1>_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0004 ),
    .LOC ( "SLICE_X35Y50" ))
  LEDShift_and000020 (
    .ADR0(LEDIndex[3]),
    .ADR1(LEDShift_2831),
    .ADR2(Msub_LEDIndex_addsub0000_cy[1]),
    .ADR3(LEDIndex[2]),
    .O(LEDShift_and000020_7299)
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X27Y31" ))
  x86_Dout_16_mux0000_SW0_SW0 (
    .ADR0(\Host/RxBufferFull_2988 ),
    .ADR1(x86_Dlast[16]),
    .ADR2(N17_0),
    .ADR3(N20_0),
    .O(\x86_Dout_16_mux0000_SW0_SW0/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF88 ),
    .LOC ( "SLICE_X27Y31" ))
  x86_Dout_16_mux0000 (
    .ADR0(x86_Dout[16]),
    .ADR1(N7),
    .ADR2(VCC),
    .ADR3(\x86_Dout_16_mux0000_SW0_SW0/O ),
    .O(x86_Dout_16_mux0000_7327)
  );
  X_FF #(
    .LOC ( "SLICE_X27Y31" ),
    .INIT ( 1'b0 ))
  x86_Dout_16 (
    .I(\x86_Dout<16>/DXMUX_7330 ),
    .CE(\x86_Dout<16>/CEINV_7313 ),
    .CLK(\x86_Dout<16>/CLKINV_7314 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[16])
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X25Y59" ))
  \DB7/State_FSM_FFd1-In1_SW0  (
    .ADR0(\DB7/StrobeTimer [5]),
    .ADR1(\DB7/StrobeTimer [3]),
    .ADR2(\DB7/StrobeTimer [4]),
    .ADR3(\DB7/StrobeTimer [2]),
    .O(\DB7/State_FSM_FFd1-In1_SW0/O_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ),
    .LOC ( "SLICE_X25Y59" ))
  \DB7/State_FSM_FFd1-In1  (
    .ADR0(\DB7/StrobeTimer [7]),
    .ADR1(\DB7/StrobeTimer [6]),
    .ADR2(SSAck_IBUF_2768),
    .ADR3(\DB7/State_FSM_FFd1-In1_SW0/O ),
    .O(\DB7/N3 )
  );
  X_LUT4 #(
    .INIT ( 16'h7FFF ),
    .LOC ( "SLICE_X20Y59" ))
  \DB7/State_FSM_FFd2-In11  (
    .ADR0(\DB7/StrobeTimer [5]),
    .ADR1(\DB7/StrobeTimer [3]),
    .ADR2(\DB7/StrobeTimer [2]),
    .ADR3(\DB7/StrobeTimer [4]),
    .O(\DB7/N7_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X20Y59" ))
  \DB7/State_FSM_FFd2-In21  (
    .ADR0(\DB7/StrobeTimer [7]),
    .ADR1(SSAck_IBUF_2768),
    .ADR2(\DB7/N7 ),
    .ADR3(\DB7/StrobeTimer [6]),
    .O(\DB7/Shifting_and0000 )
  );
  X_LUT4 #(
    .INIT ( 16'h0044 ),
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1-In_SW1  (
    .ADR0(\DB7/N18 ),
    .ADR1(\DB7/State_FSM_FFd2_3034 ),
    .ADR2(VCC),
    .ADR3(\DB7/ShiftCount [3]),
    .O(\DB7/State_FSM_FFd1-In_SW1/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F8 ),
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1-In  (
    .ADR0(\DB7/State_FSM_FFd1_2902 ),
    .ADR1(\DB7/N3_0 ),
    .ADR2(\DB7/State_FSM_FFd1-In_SW1/O ),
    .ADR3(\DB7/State_cmp_eq0001_0 ),
    .O(\DB7/State_FSM_FFd1-In_7408 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y53" ),
    .INIT ( 1'b0 ))
  \DB7/State_FSM_FFd1  (
    .I(\DB7/State_FSM_FFd1/DXMUX_7411 ),
    .CE(VCC),
    .CLK(\DB7/State_FSM_FFd1/CLKINV_7394 ),
    .SET(GND),
    .RST(\DB7/State_FSM_FFd1/FFX/RSTAND_7416 ),
    .O(\DB7/State_FSM_FFd1_2902 )
  );
  X_INV #(
    .LOC ( "SLICE_X18Y53" ))
  \DB7/State_FSM_FFd1/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/State_FSM_FFd1/FFX/RSTAND_7416 )
  );
  X_LUT4 #(
    .INIT ( 16'h0033 ),
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd1-In21  (
    .ADR0(VCC),
    .ADR1(\DB7/N18 ),
    .ADR2(VCC),
    .ADR3(\DB7/ShiftCount [3]),
    .O(\DB7/State_FSM_FFd1-In21/O_pack_2 )
  );
  X_LUT4 #(
    .INIT ( 16'hCE0A ),
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd2-In3  (
    .ADR0(\DB7/State_FSM_FFd2_3034 ),
    .ADR1(\DB7/State_FSM_FFd3_2981 ),
    .ADR2(\DB7/State_FSM_FFd1-In21/O ),
    .ADR3(\DB7/Shifting_and0000_0 ),
    .O(\DB7/State_FSM_FFd2-In )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y52" ),
    .INIT ( 1'b0 ))
  \DB7/State_FSM_FFd2  (
    .I(\DB7/State_FSM_FFd2/DXMUX_7446 ),
    .CE(VCC),
    .CLK(\DB7/State_FSM_FFd2/CLKINV_7428 ),
    .SET(GND),
    .RST(\DB7/State_FSM_FFd2/FFX/RSTAND_7451 ),
    .O(\DB7/State_FSM_FFd2_3034 )
  );
  X_INV #(
    .LOC ( "SLICE_X21Y52" ))
  \DB7/State_FSM_FFd2/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/State_FSM_FFd2/FFX/RSTAND_7451 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAFA ),
    .LOC ( "SLICE_X27Y33" ))
  \Host/PuttingByte_FSM_Out11  (
    .ADR0(\Host/PuttingByte_FSM_FFd1_3180 ),
    .ADR1(VCC),
    .ADR2(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR3(VCC),
    .O(\Host/PuttingByte_cmp_ne0000_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hAAEA ),
    .LOC ( "SLICE_X27Y33" ))
  \Host/RxBufferFull_not00011  (
    .ADR0(ReadFromHost_2977),
    .ADR1(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR2(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR3(\Host/PuttingByte_cmp_ne0000 ),
    .O(\Host/RxBufferFull_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFEF ),
    .LOC ( "SLICE_X34Y51" ))
  LEDShift_mux00001 (
    .ADR0(LEDIndex[2]),
    .ADR1(Msub_LEDIndex_addsub0000_cy[1]),
    .ADR2(LEDShift_2831),
    .ADR3(LEDIndex[3]),
    .O(LEDShift_mux0000)
  );
  X_LUT4 #(
    .INIT ( 16'hFAF0 ),
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData_mux0000<15>1  (
    .ADR0(\x86/ConfigData [2]),
    .ADR1(VCC),
    .ADR2(N6),
    .ADR3(N2_0),
    .O(\x86/ConfigData_mux0000 [15])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y51" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_2  (
    .I(\x86/ConfigData<3>/DYMUX_7563 ),
    .CE(\x86/ConfigData<3>/CEINV_7553 ),
    .CLK(\x86/ConfigData<3>/CLKINV_7554 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [2])
  );
  X_LUT4 #(
    .INIT ( 16'hFAF0 ),
    .LOC ( "SLICE_X19Y51" ))
  \x86/ConfigData_mux0000<14>3  (
    .ADR0(N2_0),
    .ADR1(VCC),
    .ADR2(N6),
    .ADR3(\x86/ConfigData [3]),
    .O(\x86/ConfigData_mux0000 [14])
  );
  X_FF #(
    .LOC ( "SLICE_X19Y51" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_3  (
    .I(\x86/ConfigData<3>/DXMUX_7576 ),
    .CE(\x86/ConfigData<3>/CEINV_7553 ),
    .CLK(\x86/ConfigData<3>/CLKINV_7554 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [3])
  );
  X_LUT4 #(
    .INIT ( 16'hEAEA ),
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData_mux0000<13>1  (
    .ADR0(N14),
    .ADR1(\x86/ConfigData [4]),
    .ADR2(N2_0),
    .ADR3(VCC),
    .O(\x86/ConfigData_mux0000 [13])
  );
  X_FF #(
    .LOC ( "SLICE_X21Y44" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_4  (
    .I(\x86/ConfigData<5>/DYMUX_7601 ),
    .CE(\x86/ConfigData<5>/CEINV_7591 ),
    .CLK(\x86/ConfigData<5>/CLKINV_7592 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [4])
  );
  X_LUT4 #(
    .INIT ( 16'hECEC ),
    .LOC ( "SLICE_X21Y44" ))
  \x86/ConfigData_mux0000<12>1  (
    .ADR0(\x86/ConfigData [5]),
    .ADR1(N14),
    .ADR2(N2_0),
    .ADR3(VCC),
    .O(\x86/ConfigData_mux0000 [12])
  );
  X_FF #(
    .LOC ( "SLICE_X21Y44" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_5  (
    .I(\x86/ConfigData<5>/DXMUX_7614 ),
    .CE(\x86/ConfigData<5>/CEINV_7591 ),
    .CLK(\x86/ConfigData<5>/CLKINV_7592 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [5])
  );
  X_LUT4 #(
    .INIT ( 16'hECEC ),
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData_mux0000<11>1  (
    .ADR0(N2_0),
    .ADR1(N14),
    .ADR2(\x86/ConfigData [6]),
    .ADR3(VCC),
    .O(\x86/ConfigData_mux0000 [11])
  );
  X_FF #(
    .LOC ( "SLICE_X21Y45" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_6  (
    .I(\x86/ConfigData<7>/DYMUX_7639 ),
    .CE(\x86/ConfigData<7>/CEINV_7629 ),
    .CLK(\x86/ConfigData<7>/CLKINV_7630 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [6])
  );
  X_LUT4 #(
    .INIT ( 16'hEAEA ),
    .LOC ( "SLICE_X21Y45" ))
  \x86/ConfigData_mux0000<10>1  (
    .ADR0(N14),
    .ADR1(\x86/ConfigData [7]),
    .ADR2(N2_0),
    .ADR3(VCC),
    .O(\x86/ConfigData_mux0000 [10])
  );
  X_FF #(
    .LOC ( "SLICE_X21Y45" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_7  (
    .I(\x86/ConfigData<7>/DXMUX_7652 ),
    .CE(\x86/ConfigData<7>/CEINV_7629 ),
    .CLK(\x86/ConfigData<7>/CLKINV_7630 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [7])
  );
  X_LUT4 #(
    .INIT ( 16'hA0A0 ),
    .LOC ( "SLICE_X27Y30" ))
  \Host/PuttingByte_FSM_Out01  (
    .ADR0(\Host/PuttingByte_FSM_FFd1_3180 ),
    .ADR1(VCC),
    .ADR2(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR3(VCC),
    .O(\Host/PuttingByte_cmp_eq0001 )
  );
  X_FF #(
    .LOC ( "SLICE_X27Y30" ),
    .INIT ( 1'b0 ))
  \Host/TxDone  (
    .I(\Host/TxDone/DYMUX_7679 ),
    .CE(\Host/TxDone/CEINV_7667 ),
    .CLK(\Host/TxDone/CLKINV_7668 ),
    .SET(GND),
    .RST(\Host/TxDone/FFY/RSTAND_7685 ),
    .O(\Host/TxDone_2997 )
  );
  X_INV #(
    .LOC ( "SLICE_X27Y30" ))
  \Host/TxDone/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/TxDone/FFY/RSTAND_7685 )
  );
  X_LUT4 #(
    .INIT ( 16'h0505 ),
    .LOC ( "SLICE_X27Y30" ))
  \Host/PuttingByte_FSM_Out21  (
    .ADR0(\Host/PuttingByte_FSM_FFd1_3180 ),
    .ADR1(VCC),
    .ADR2(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR3(VCC),
    .O(\Host/PuttingByte_cmp_eq0002 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFA0 ),
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData_mux0000<7>1  (
    .ADR0(N2_0),
    .ADR1(VCC),
    .ADR2(\x86/ConfigData [10]),
    .ADR3(N14),
    .O(\x86/ConfigData_mux0000 [7])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y44" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_10  (
    .I(\x86/ConfigData<11>/DYMUX_7716 ),
    .CE(\x86/ConfigData<11>/CEINV_7706 ),
    .CLK(\x86/ConfigData<11>/CLKINV_7707 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [10])
  );
  X_LUT4 #(
    .INIT ( 16'hFF88 ),
    .LOC ( "SLICE_X24Y44" ))
  \x86/ConfigData_mux0000<6>1  (
    .ADR0(N2_0),
    .ADR1(\x86/ConfigData [11]),
    .ADR2(VCC),
    .ADR3(N14),
    .O(\x86/ConfigData_mux0000 [6])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y44" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_11  (
    .I(\x86/ConfigData<11>/DXMUX_7729 ),
    .CE(\x86/ConfigData<11>/CEINV_7706 ),
    .CLK(\x86/ConfigData<11>/CLKINV_7707 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [11])
  );
  X_LUT4 #(
    .INIT ( 16'hFAF0 ),
    .LOC ( "SLICE_X39Y40" ))
  \x86/ConfigData_mux0000<5>1  (
    .ADR0(N2_0),
    .ADR1(VCC),
    .ADR2(N6),
    .ADR3(\x86/ConfigData [12]),
    .O(\x86/ConfigData_mux0000 [5])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y40" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_12  (
    .I(\x86/ConfigData<13>/DYMUX_7754 ),
    .CE(\x86/ConfigData<13>/CEINV_7744 ),
    .CLK(\x86/ConfigData<13>/CLKINV_7745 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [12])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y27" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_17  (
    .I(\x86/ConfigData<17>/DXMUX_7843 ),
    .CE(\x86/ConfigData<17>/CEINV_7820 ),
    .CLK(\x86/ConfigData<17>/CLKINV_7821 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [17])
  );
  X_LUT4 #(
    .INIT ( 16'h0E0E ),
    .LOC ( "SLICE_X30Y32" ))
  x86_Active_mux00021 (
    .ADR0(\x86/IORead_3030 ),
    .ADR1(\x86/IOWrite_3029 ),
    .ADR2(IRdy_IBUF_2828),
    .ADR3(VCC),
    .O(x86_Active_mux0002)
  );
  X_FF #(
    .LOC ( "SLICE_X30Y32" ),
    .INIT ( 1'b0 ))
  x86_Active (
    .I(\x86_Active/DYMUX_7869 ),
    .CE(VCC),
    .CLK(\x86_Active/CLKINV_7859 ),
    .SET(GND),
    .RST(\x86_Active/FFY/RSTAND_7874 ),
    .O(x86_Active_2978)
  );
  X_INV #(
    .LOC ( "SLICE_X30Y32" ))
  \x86_Active/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_Active/FFY/RSTAND_7874 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFBF ),
    .LOC ( "SLICE_X30Y32" ))
  DataToHost_or0000_SW0 (
    .ADR0(\x86/IORead_3030 ),
    .ADR1(\x86/AddressLatch [0]),
    .ADR2(\x86/IOWrite_3029 ),
    .ADR3(IRdy_IBUF_2828),
    .O(N176)
  );
  X_LUT4 #(
    .INIT ( 16'h8800 ),
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd1-In1  (
    .ADR0(Frame_IBUF_2840),
    .ADR1(\x86/State_FSM_FFd2_2904 ),
    .ADR2(VCC),
    .ADR3(IRdy_IBUF_2828),
    .O(\x86/State_FSM_FFd1-In )
  );
  X_FF #(
    .LOC ( "SLICE_X20Y35" ),
    .INIT ( 1'b0 ))
  \x86/State_FSM_FFd1  (
    .I(\x86/State_FSM_FFd2/DYMUX_7904 ),
    .CE(VCC),
    .CLK(\x86/State_FSM_FFd2/CLKINV_7894 ),
    .SET(GND),
    .RST(\x86/State_FSM_FFd2/SRINVNOT ),
    .O(\x86/State_FSM_FFd1_2907 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF54 ),
    .LOC ( "SLICE_X20Y35" ))
  \x86/State_FSM_FFd2-In41  (
    .ADR0(Frame_IBUF_2840),
    .ADR1(N203_0),
    .ADR2(\x86/State_FSM_FFd2_2904 ),
    .ADR3(\x86/State_FSM_FFd2-In14_0 ),
    .O(\x86/State_FSM_FFd2-In )
  );
  X_FF #(
    .LOC ( "SLICE_X20Y35" ),
    .INIT ( 1'b0 ))
  \x86/State_FSM_FFd2  (
    .I(\x86/State_FSM_FFd2/DXMUX_7918 ),
    .CE(VCC),
    .CLK(\x86/State_FSM_FFd2/CLKINV_7894 ),
    .SET(GND),
    .RST(\x86/State_FSM_FFd2/SRINVNOT ),
    .O(\x86/State_FSM_FFd2_2904 )
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X26Y33" ))
  \Host/RCount_not00011  (
    .ADR0(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR1(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR2(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR3(\Host/PuttingByte_FSM_FFd1_3180 ),
    .O(\Host/RCount_not0001 )
  );
  X_FF #(
    .LOC ( "SLICE_X26Y33" ),
    .INIT ( 1'b0 ))
  \Host/RxBufferFull  (
    .I(\Host/RxBufferFull/DYMUX_7949 ),
    .CE(\Host/RxBufferFull/CEINV_7939 ),
    .CLK(\Host/RxBufferFull/CLKINV_7940 ),
    .SET(GND),
    .RST(\Host/RxBufferFull/FFY/RSTAND_7955 ),
    .O(\Host/RxBufferFull_2988 )
  );
  X_INV #(
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxBufferFull/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/RxBufferFull/FFY/RSTAND_7955 )
  );
  X_LUT4 #(
    .INIT ( 16'h0002 ),
    .LOC ( "SLICE_X26Y33" ))
  \Host/RxData_not00011  (
    .ADR0(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR1(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR2(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR3(\Host/PuttingByte_FSM_FFd1_3180 ),
    .O(\Host/RxData_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hAEAA ),
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd3-In  (
    .ADR0(N114_0),
    .ADR1(\DB7/N3_0 ),
    .ADR2(\DB7/State_cmp_eq0001_0 ),
    .ADR3(\DB7/State_FSM_FFd3_2981 ),
    .O(\DB7/State_FSM_FFd3-In_7982 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y55" ),
    .INIT ( 1'b0 ))
  \DB7/State_FSM_FFd3  (
    .I(\DB7/State_FSM_FFd4/DYMUX_7985 ),
    .CE(VCC),
    .CLK(\DB7/State_FSM_FFd4/CLKINV_7976 ),
    .SET(GND),
    .RST(\DB7/State_FSM_FFd4/SRINVNOT ),
    .O(\DB7/State_FSM_FFd3_2981 )
  );
  X_LUT4 #(
    .INIT ( 16'hEEEA ),
    .LOC ( "SLICE_X18Y55" ))
  \DB7/State_FSM_FFd4-In1  (
    .ADR0(\DB7/N14 ),
    .ADR1(\DB7/State_FSM_FFd4_3097 ),
    .ADR2(\DB7/N18 ),
    .ADR3(\DB7/ShiftCount [3]),
    .O(\DB7/State_FSM_FFd4-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y55" ),
    .INIT ( 1'b0 ))
  \DB7/State_FSM_FFd4  (
    .I(\DB7/State_FSM_FFd4/DXMUX_7999 ),
    .CE(VCC),
    .CLK(\DB7/State_FSM_FFd4/CLKINV_7976 ),
    .SET(GND),
    .RST(\DB7/State_FSM_FFd4/SRINVNOT ),
    .O(\DB7/State_FSM_FFd4_3097 )
  );
  X_LUT4 #(
    .INIT ( 16'hFAAA ),
    .LOC ( "SLICE_X20Y33" ))
  x86_Dout_5_mux000046 (
    .ADR0(N154_0),
    .ADR1(VCC),
    .ADR2(N16),
    .ADR3(x86_Dout_5_mux000017_0),
    .O(x86_Dout_5_mux0000)
  );
  X_FF #(
    .LOC ( "SLICE_X20Y33" ),
    .INIT ( 1'b0 ))
  x86_Dout_5 (
    .I(\x86_Dout<5>/DYMUX_8022 ),
    .CE(\x86_Dout<5>/CEINV_8012 ),
    .CLK(\x86_Dout<5>/CLKINV_8013 ),
    .SET(GND),
    .RST(GND),
    .O(x86_Dout[5])
  );
  X_LUT4 #(
    .INIT ( 16'hFE54 ),
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer_mux0000<7>1  (
    .ADR0(\DB7/StrobeTimer [0]),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(\DB7/State_FSM_FFd3_2981 ),
    .ADR3(\DB7/N28_0 ),
    .O(\DB7/StrobeTimer_mux0000 [7])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y53" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_0  (
    .I(\DB7/StrobeTimer<1>/DYMUX_8112 ),
    .CE(\DB7/StrobeTimer<1>/CEINV_8103 ),
    .CLK(\DB7/StrobeTimer<1>/CLKINV_8104 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [0])
  );
  X_LUT4 #(
    .INIT ( 16'hF844 ),
    .LOC ( "SLICE_X20Y53" ))
  \DB7/StrobeTimer_mux0000<6>1  (
    .ADR0(\DB7/StrobeTimer [0]),
    .ADR1(\DB7/StrobeTimer_or0000 ),
    .ADR2(\DB7/N28_0 ),
    .ADR3(\DB7/StrobeTimer [1]),
    .O(\DB7/StrobeTimer_mux0000 [6])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y53" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_1  (
    .I(\DB7/StrobeTimer<1>/DXMUX_8124 ),
    .CE(\DB7/StrobeTimer<1>/CEINV_8103 ),
    .CLK(\DB7/StrobeTimer<1>/CLKINV_8104 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [1])
  );
  X_LUT4 #(
    .INIT ( 16'hF488 ),
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer_mux0000<5>  (
    .ADR0(N31_0),
    .ADR1(\DB7/StrobeTimer_or0000 ),
    .ADR2(\DB7/N28_0 ),
    .ADR3(\DB7/StrobeTimer [2]),
    .O(\DB7/StrobeTimer_mux0000 [5])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y56" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_2  (
    .I(\DB7/StrobeTimer<4>/DYMUX_8150 ),
    .CE(\DB7/StrobeTimer<4>/CEINV_8141 ),
    .CLK(\DB7/StrobeTimer<4>/CLKINV_8142 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [2])
  );
  X_LUT4 #(
    .INIT ( 16'hF844 ),
    .LOC ( "SLICE_X20Y56" ))
  \DB7/StrobeTimer_mux0000<3>2  (
    .ADR0(\DB7/N13 ),
    .ADR1(\DB7/StrobeTimer_or0000 ),
    .ADR2(\DB7/N28_0 ),
    .ADR3(\DB7/StrobeTimer [4]),
    .O(\DB7/StrobeTimer_mux0000 [3])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y56" ),
    .INIT ( 1'b0 ))
  \DB7/StrobeTimer_4  (
    .I(\DB7/StrobeTimer<4>/DXMUX_8162 ),
    .CE(\DB7/StrobeTimer<4>/CEINV_8141 ),
    .CLK(\DB7/StrobeTimer<4>/CLKINV_8142 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/StrobeTimer [4])
  );
  X_LUT4 #(
    .INIT ( 16'hDCFC ),
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd1-In1  (
    .ADR0(\Host/DeadDelay [0]),
    .ADR1(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR2(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR3(\Host/DeadDelay [1]),
    .O(\Host/GettingByte_FSM_FFd1-In )
  );
  X_FF #(
    .LOC ( "SLICE_X26Y37" ),
    .INIT ( 1'b0 ))
  \Host/GettingByte_FSM_FFd1  (
    .I(\Host/GettingByte_FSM_FFd2/DYMUX_8190 ),
    .CE(\Host/GettingByte_FSM_FFd2/CEINV_8180 ),
    .CLK(\Host/GettingByte_FSM_FFd2/CLKINV_8181 ),
    .SET(GND),
    .RST(\Host/GettingByte_FSM_FFd2/SRINVNOT ),
    .O(\Host/GettingByte_FSM_FFd1_3087 )
  );
  X_LUT4 #(
    .INIT ( 16'h4445 ),
    .LOC ( "SLICE_X26Y37" ))
  \Host/GettingByte_FSM_FFd2-In1  (
    .ADR0(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR1(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR2(\Host/RxBufferFull_2988 ),
    .ADR3(USBRxValid_IBUF_2836),
    .O(\Host/GettingByte_FSM_FFd2-In )
  );
  X_FF #(
    .LOC ( "SLICE_X26Y37" ),
    .INIT ( 1'b0 ))
  \Host/GettingByte_FSM_FFd2  (
    .I(\Host/GettingByte_FSM_FFd2/DXMUX_8205 ),
    .CE(\Host/GettingByte_FSM_FFd2/CEINV_8180 ),
    .CLK(\Host/GettingByte_FSM_FFd2/CLKINV_8181 ),
    .SET(GND),
    .RST(\Host/GettingByte_FSM_FFd2/SRINVNOT ),
    .O(\Host/GettingByte_FSM_FFd2_3086 )
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X25Y36" ))
  \x86/IORead_mux00001  (
    .ADR0(N4_0),
    .ADR1(\x86/State_cmp_eq0000_0 ),
    .ADR2(N59),
    .ADR3(\x86/IORead_3030 ),
    .O(\x86/IORead_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X25Y36" ),
    .INIT ( 1'b0 ))
  \x86/IORead  (
    .I(\x86/IORead/DYMUX_8233 ),
    .CE(VCC),
    .CLK(\x86/IORead/CLKINV_8224 ),
    .SET(GND),
    .RST(\x86/IORead/FFY/RSTAND_8238 ),
    .O(\x86/IORead_3030 )
  );
  X_INV #(
    .LOC ( "SLICE_X25Y36" ))
  \x86/IORead/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/IORead/FFY/RSTAND_8238 )
  );
  X_LUT4 #(
    .INIT ( 16'h4400 ),
    .LOC ( "SLICE_X25Y36" ))
  x86_Dout_0_and00001 (
    .ADR0(IRdy_IBUF_2828),
    .ADR1(\x86/IORead_3030 ),
    .ADR2(VCC),
    .ADR3(PCI_Reset_IBUF_2742),
    .O(x86_Dout_0_and0000)
  );
  X_LUT4 #(
    .INIT ( 16'h3B0C ),
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay_mux0000<1>1  (
    .ADR0(\Host/DeadDelay [1]),
    .ADR1(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR2(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR3(\Host/DeadDelay [0]),
    .O(\Host/DeadDelay_mux0000 [1])
  );
  X_FF #(
    .LOC ( "SLICE_X27Y36" ),
    .INIT ( 1'b0 ))
  \Host/DeadDelay_0  (
    .I(\Host/DeadDelay<1>/DYMUX_8271 ),
    .CE(\Host/DeadDelay<1>/CEINV_8261 ),
    .CLK(\Host/DeadDelay<1>/CLKINV_8262 ),
    .SET(GND),
    .RST(\Host/DeadDelay<1>/SRINVNOT ),
    .O(\Host/DeadDelay [0])
  );
  X_LUT4 #(
    .INIT ( 16'h2E2A ),
    .LOC ( "SLICE_X27Y36" ))
  \Host/DeadDelay_mux0000<0>1  (
    .ADR0(\Host/DeadDelay [1]),
    .ADR1(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR2(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR3(\Host/DeadDelay [0]),
    .O(\Host/DeadDelay_mux0000 [0])
  );
  X_FF #(
    .LOC ( "SLICE_X27Y36" ),
    .INIT ( 1'b0 ))
  \Host/DeadDelay_1  (
    .I(\Host/DeadDelay<1>/DXMUX_8286 ),
    .CE(\Host/DeadDelay<1>/CEINV_8261 ),
    .CLK(\Host/DeadDelay<1>/CLKINV_8262 ),
    .SET(GND),
    .RST(\Host/DeadDelay<1>/SRINVNOT ),
    .O(\Host/DeadDelay [1])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y50" ),
    .INIT ( 1'b0 ))
  LEDIndex_3 (
    .I(\LEDIndex<3>/DXMUX_8365 ),
    .CE(\LEDIndex<3>/CEINV_8344 ),
    .CLK(\LEDIndex<3>/CLKINV_8345 ),
    .SET(GND),
    .RST(GND),
    .O(LEDIndex[3])
  );
  X_LUT4 #(
    .INIT ( 16'h4000 ),
    .LOC ( "SLICE_X21Y31" ))
  x86_Dout_8_cmp_eq00041 (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(CBE_0_IBUF_2821),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_3_IBUF_2824),
    .O(x86_Dout_8_cmp_eq0004)
  );
  X_LUT4 #(
    .INIT ( 16'hCFFE ),
    .LOC ( "SLICE_X21Y31" ))
  x86_Dout_0_mux0000120 (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(CBE_0_IBUF_2821),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_3_IBUF_2824),
    .O(x86_Dout_0_mux0000120_8391)
  );
  X_LUT4 #(
    .INIT ( 16'hC800 ),
    .LOC ( "SLICE_X18Y36" ))
  x86_Dout_0_mux00005 (
    .ADR0(\DB7/Accumulator [0]),
    .ADR1(\DB7/Ready_2916 ),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(x86_Dout_8_cmp_eq0000),
    .O(x86_Dout_0_mux00005_8408)
  );
  X_LUT4 #(
    .INIT ( 16'hE000 ),
    .LOC ( "SLICE_X18Y36" ))
  x86_Dout_4_mux00004 (
    .ADR0(\DB7/State_FSM_FFd2_3034 ),
    .ADR1(\DB7/State_FSM_FFd4_3097 ),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(x86_Dout_8_cmp_eq0000),
    .O(x86_Dout_4_mux00004_8415)
  );
  X_LUT4 #(
    .INIT ( 16'h0800 ),
    .LOC ( "SLICE_X17Y37" ))
  x86_Dout_2_mux00000 (
    .ADR0(\Host/RCount [2]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\x86/AddressLatch [0]),
    .ADR3(x86_Hold_and0001),
    .O(x86_Dout_2_mux00000_8432)
  );
  X_LUT4 #(
    .INIT ( 16'h4000 ),
    .LOC ( "SLICE_X17Y37" ))
  x86_Dout_6_mux00000 (
    .ADR0(\x86/AddressLatch [0]),
    .ADR1(\x86/AddressLatch [2]),
    .ADR2(\Host/RCount [6]),
    .ADR3(x86_Hold_and0001),
    .O(x86_Dout_6_mux00000_8439)
  );
  X_LUT4 #(
    .INIT ( 16'hAA00 ),
    .LOC ( "SLICE_X15Y38" ))
  x86_Dout_2_mux00001 (
    .ADR0(x86_Dlast[2]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(x86_Dout_0_cmp_eq0002),
    .O(x86_Dout_2_mux00001_8454)
  );
  X_LUT4 #(
    .INIT ( 16'hCC00 ),
    .LOC ( "SLICE_X15Y38" ))
  x86_Dout_3_mux00000 (
    .ADR0(VCC),
    .ADR1(x86_Dout_0_cmp_eq0002),
    .ADR2(VCC),
    .ADR3(x86_Dlast[3]),
    .O(x86_Dout_3_mux00000_8463)
  );
  X_LUT4 #(
    .INIT ( 16'h0055 ),
    .LOC ( "SLICE_X18Y54" ))
  \DB7/State_FSM_FFd5-In31  (
    .ADR0(\DB7/StrobeTimer [7]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\DB7/StrobeTimer [6]),
    .O(\DB7/State_FSM_FFd5-In31_8478 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFAA ),
    .LOC ( "SLICE_X18Y54" ))
  \DB7/State_FSM_FFd5-In24_SW0  (
    .ADR0(\DB7/StrobeTimer [7]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\DB7/StrobeTimer [6]),
    .O(N103)
  );
  X_LUT4 #(
    .INIT ( 16'hFFEE ),
    .LOC ( "SLICE_X21Y54" ))
  \DB7/State_FSM_FFd5-In24  (
    .ADR0(\DB7/StrobeTimer [5]),
    .ADR1(\DB7/N13 ),
    .ADR2(VCC),
    .ADR3(\DB7/StrobeTimer [4]),
    .O(\DB7/N16 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ),
    .LOC ( "SLICE_X21Y54" ))
  \DB7/StrobeTimer_mux0000<0>13_SW0  (
    .ADR0(\DB7/StrobeTimer [5]),
    .ADR1(\DB7/StrobeTimer [4]),
    .ADR2(\DB7/StrobeTimer [6]),
    .ADR3(\DB7/N13 ),
    .O(N178)
  );
  X_FF #(
    .LOC ( "SLICE_X23Y32" ),
    .INIT ( 1'b1 ))
  \x86/AddressLatch_0  (
    .I(\x86/AddressLatch<1>/DYMUX_8525 ),
    .CE(\x86/AddressLatch<1>/CEINV_8521 ),
    .CLK(\x86/AddressLatch<1>/CLKINV_8522 ),
    .SET(\x86/AddressLatch<1>/SRINVNOT ),
    .RST(GND),
    .O(\x86/AddressLatch [0])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y32" ),
    .INIT ( 1'b1 ))
  \x86/AddressLatch_1  (
    .I(\x86/AddressLatch<1>/DXMUX_8533 ),
    .CE(\x86/AddressLatch<1>/CEINV_8521 ),
    .CLK(\x86/AddressLatch<1>/CLKINV_8522 ),
    .SET(\x86/AddressLatch<1>/SRINVNOT ),
    .RST(GND),
    .O(\x86/AddressLatch [1])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y33" ),
    .INIT ( 1'b1 ))
  \x86/AddressLatch_2  (
    .I(\x86/AddressLatch<3>/DYMUX_8551 ),
    .CE(\x86/AddressLatch<3>/CEINV_8547 ),
    .CLK(\x86/AddressLatch<3>/CLKINV_8548 ),
    .SET(\x86/AddressLatch<3>/SRINVNOT ),
    .RST(GND),
    .O(\x86/AddressLatch [2])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y33" ),
    .INIT ( 1'b1 ))
  \x86/AddressLatch_3  (
    .I(\x86/AddressLatch<3>/DXMUX_8559 ),
    .CE(\x86/AddressLatch<3>/CEINV_8547 ),
    .CLK(\x86/AddressLatch<3>/CLKINV_8548 ),
    .SET(\x86/AddressLatch<3>/SRINVNOT ),
    .RST(GND),
    .O(\x86/AddressLatch [3])
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X26Y30" ))
  x86_Dout_8_mux00009 (
    .ADR0(N22),
    .ADR1(\Host/WCount [0]),
    .ADR2(N15),
    .ADR3(\DB7/Accumulator [8]),
    .O(x86_Dout_8_mux00009_8652)
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X26Y30" ))
  x86_Dout_11_mux00009 (
    .ADR0(N22),
    .ADR1(\DB7/Accumulator [11]),
    .ADR2(N15),
    .ADR3(\Host/WCount [3]),
    .O(x86_Dout_11_mux00009_8659)
  );
  X_LUT4 #(
    .INIT ( 16'h0011 ),
    .LOC ( "SLICE_X22Y57" ))
  \DB7/StrobeTimer_mux0000<1>8  (
    .ADR0(\DB7/ShiftCount [3]),
    .ADR1(\DB7/ShiftCount [2]),
    .ADR2(VCC),
    .ADR3(\DB7/ShiftCount [1]),
    .O(\DB7/StrobeTimer_mux0000<1>8_8676 )
  );
  X_LUT4 #(
    .INIT ( 16'h00B8 ),
    .LOC ( "SLICE_X22Y57" ))
  \DB7/SDO28  (
    .ADR0(DB7_Address[5]),
    .ADR1(\DB7/ShiftCount [2]),
    .ADR2(DB7_Address[1]),
    .ADR3(\DB7/ShiftCount [1]),
    .O(\DB7/SDO28_8683 )
  );
  X_FF #(
    .LOC ( "SLICE_X24Y55" ),
    .INIT ( 1'b0 ))
  \DB7/DiagData  (
    .I(\DB7/DiagData/DYMUX_8695 ),
    .CE(\DB7/DiagData/CEINV_8691 ),
    .CLK(\DB7/DiagData/CLKINV_8692 ),
    .SET(GND),
    .RST(\DB7/DiagData/FFY/RSTAND_8701 ),
    .O(\DB7/DiagData_3227 )
  );
  X_INV #(
    .LOC ( "SLICE_X24Y55" ))
  \DB7/DiagData/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/DiagData/FFY/RSTAND_8701 )
  );
  X_FF #(
    .LOC ( "SLICE_X30Y43" ),
    .INIT ( 1'b0 ))
  LEDRegister_10 (
    .I(\LEDRegister<11>/DYMUX_8712 ),
    .CE(\LEDRegister<11>/CEINV_8709 ),
    .CLK(\LEDRegister<11>/CLKINV_8710 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[10])
  );
  X_FF #(
    .LOC ( "SLICE_X30Y43" ),
    .INIT ( 1'b0 ))
  LEDRegister_11 (
    .I(\LEDRegister<11>/DXMUX_8718 ),
    .CE(\LEDRegister<11>/CEINV_8709 ),
    .CLK(\LEDRegister<11>/CLKINV_8710 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[11])
  );
  X_LUT4 #(
    .INIT ( 16'h0003 ),
    .LOC ( "SLICE_X25Y39" ))
  \x86/State_cmp_eq000211  (
    .ADR0(VCC),
    .ADR1(N511),
    .ADR2(N54),
    .ADR3(N55),
    .O(N57_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h0300 ),
    .LOC ( "SLICE_X25Y39" ))
  \x86/State_cmp_eq00061  (
    .ADR0(VCC),
    .ADR1(N521),
    .ADR2(N53),
    .ADR3(N57),
    .O(\x86/State_cmp_eq0006 )
  );
  X_LUT4 #(
    .INIT ( 16'hABBB ),
    .LOC ( "SLICE_X22Y39" ))
  \x86/State_FSM_FFd3-In23_SW0  (
    .ADR0(\x86/State_FSM_FFd1_2907 ),
    .ADR1(N51_0),
    .ADR2(\x86/State_cmp_eq0000_0 ),
    .ADR3(\x86/IORead_and0001 ),
    .O(N162)
  );
  X_LUT4 #(
    .INIT ( 16'hEEFF ),
    .LOC ( "SLICE_X22Y39" ))
  \x86/ConfigRead_mux000011  (
    .ADR0(\x86/State_FSM_FFd3_2906 ),
    .ADR1(\x86/State_FSM_FFd2_2904 ),
    .ADR2(VCC),
    .ADR3(\x86/State_FSM_FFd1_2907 ),
    .O(N4)
  );
  X_FF #(
    .LOC ( "SLICE_X27Y46" ),
    .INIT ( 1'b0 ))
  LEDRegister_12 (
    .I(\LEDRegister<13>/DYMUX_8780 ),
    .CE(\LEDRegister<13>/CEINV_8777 ),
    .CLK(\LEDRegister<13>/CLKINV_8778 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[12])
  );
  X_FF #(
    .LOC ( "SLICE_X27Y46" ),
    .INIT ( 1'b0 ))
  LEDRegister_13 (
    .I(\LEDRegister<13>/DXMUX_8786 ),
    .CE(\LEDRegister<13>/CEINV_8777 ),
    .CLK(\LEDRegister<13>/CLKINV_8778 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[13])
  );
  X_FF #(
    .LOC ( "SLICE_X30Y45" ),
    .INIT ( 1'b0 ))
  LEDRegister_14 (
    .I(\LEDRegister<15>/DYMUX_8800 ),
    .CE(\LEDRegister<15>/CEINV_8797 ),
    .CLK(\LEDRegister<15>/CLKINV_8798 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[14])
  );
  X_FF #(
    .LOC ( "SLICE_X30Y45" ),
    .INIT ( 1'b0 ))
  LEDRegister_15 (
    .I(\LEDRegister<15>/DXMUX_8806 ),
    .CE(\LEDRegister<15>/CEINV_8797 ),
    .CLK(\LEDRegister<15>/CLKINV_8798 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[15])
  );
  X_LUT4 #(
    .INIT ( 16'h0303 ),
    .LOC ( "SLICE_X12Y32" ))
  x86_Hold_mux000210 (
    .ADR0(VCC),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(VCC),
    .O(x86_Hold_mux000210_8823)
  );
  X_LUT4 #(
    .INIT ( 16'hFCFC ),
    .LOC ( "SLICE_X12Y32" ))
  x86_Dout_10_mux00001_SW0 (
    .ADR0(VCC),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(VCC),
    .O(N29)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFD ),
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2-In_SW0_SW0  (
    .ADR0(WriteToHost_3084),
    .ADR1(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR2(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR3(USBTxReady_IBUF_2838),
    .O(N182_pack_4)
  );
  X_FF #(
    .LOC ( "SLICE_X27Y34" ),
    .INIT ( 1'b0 ))
  \Host/PuttingByte_FSM_FFd1  (
    .I(\Host/PuttingByte_FSM_FFd2/DYMUX_8931 ),
    .CE(VCC),
    .CLK(\Host/PuttingByte_FSM_FFd2/CLKINV_8921 ),
    .SET(GND),
    .RST(\Host/PuttingByte_FSM_FFd2/SRINVNOT ),
    .O(\Host/PuttingByte_FSM_FFd1_3180 )
  );
  X_LUT4 #(
    .INIT ( 16'h00CE ),
    .LOC ( "SLICE_X27Y34" ))
  \Host/PuttingByte_FSM_FFd2-In  (
    .ADR0(N19),
    .ADR1(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR2(N182),
    .ADR3(\Host/PuttingByte_FSM_FFd1_3180 ),
    .O(\Host/PuttingByte_FSM_FFd2-In_8942 )
  );
  X_FF #(
    .LOC ( "SLICE_X27Y34" ),
    .INIT ( 1'b0 ))
  \Host/PuttingByte_FSM_FFd2  (
    .I(\Host/PuttingByte_FSM_FFd2/DXMUX_8945 ),
    .CE(VCC),
    .CLK(\Host/PuttingByte_FSM_FFd2/CLKINV_8921 ),
    .SET(GND),
    .RST(\Host/PuttingByte_FSM_FFd2/SRINVNOT ),
    .O(\Host/PuttingByte_FSM_FFd2_3179 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFDF ),
    .LOC ( "SLICE_X24Y54" ))
  \DB7/Ready_mux00006_SW0_SW0  (
    .ADR0(\DB7/State_FSM_FFd5_2927 ),
    .ADR1(\DB7/State_FSM_FFd3_2981 ),
    .ADR2(x86_to_DB7_2925),
    .ADR3(DB7_Address[7]),
    .O(N152)
  );
  X_LUT4 #(
    .INIT ( 16'hA000 ),
    .LOC ( "SLICE_X24Y54" ))
  \DB7/DiagData_not00011  (
    .ADR0(x86_to_DB7_2925),
    .ADR1(VCC),
    .ADR2(\DB7/State_FSM_FFd5_2927 ),
    .ADR3(DB7_Address[7]),
    .O(\DB7/DiagData_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'h8888 ),
    .LOC ( "SLICE_X26Y31" ))
  x86_Dout_8_cmp_eq0004111 (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(x86_Dout_8_cmp_eq0000_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hFFFD ),
    .LOC ( "SLICE_X26Y31" ))
  x86_Dout_10_mux00003_SW0_SW0 (
    .ADR0(x86_Dout_8_cmp_eq0000),
    .ADR1(CBE_1_IBUF_2822),
    .ADR2(\x86/AddressLatch [2]),
    .ADR3(CBE_0_IBUF_2821),
    .O(N97)
  );
  X_LUT4 #(
    .INIT ( 16'hAA00 ),
    .LOC ( "SLICE_X39Y67" ))
  LEDOut_not0001_SW0 (
    .ADR0(Scaler[14]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(Scaler[15]),
    .O(N02_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hEAAA ),
    .LOC ( "SLICE_X39Y67" ))
  LEDOut_not0001 (
    .ADR0(SSAck_IBUF_2768),
    .ADR1(Scaler[13]),
    .ADR2(Scaler[12]),
    .ADR3(N02),
    .O(LEDOut_not0001_9021)
  );
  X_LUT4 #(
    .INIT ( 16'hBFAA ),
    .LOC ( "SLICE_X22Y51" ))
  \x86/ConfigData_mux0000<14>11  (
    .ADR0(N571),
    .ADR1(N591),
    .ADR2(N58),
    .ADR3(N56),
    .O(N2)
  );
  X_LUT4 #(
    .INIT ( 16'h2011 ),
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData_mux0000<14>21  (
    .ADR0(N591),
    .ADR1(N571),
    .ADR2(N58),
    .ADR3(N56),
    .O(N6_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hFFC0 ),
    .LOC ( "SLICE_X22Y46" ))
  \x86/ConfigData_mux0000<9>1  (
    .ADR0(VCC),
    .ADR1(\x86/ConfigData [8]),
    .ADR2(N2_0),
    .ADR3(N6),
    .O(\x86/ConfigData_mux0000 [9])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y46" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_8  (
    .I(\x86/ConfigData<8>/DXMUX_9064 ),
    .CE(\x86/ConfigData<8>/CEINV_9047 ),
    .CLK(\x86/ConfigData<8>/CLKINV_9048 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [8])
  );
  X_LUT4 #(
    .INIT ( 16'hE4CC ),
    .LOC ( "SLICE_X30Y30" ))
  x86_Dout_8_mux000024 (
    .ADR0(x86_Dout_0_cmp_eq0001),
    .ADR1(\Host/RxData [0]),
    .ADR2(\Host/RxBufferFull_2988 ),
    .ADR3(CBE_0_IBUF_2821),
    .O(x86_Dout_8_mux000024_9083)
  );
  X_LUT4 #(
    .INIT ( 16'hEC4C ),
    .LOC ( "SLICE_X30Y30" ))
  x86_Dout_11_mux000024 (
    .ADR0(x86_Dout_0_cmp_eq0001),
    .ADR1(\Host/RxData [3]),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(N43),
    .O(x86_Dout_11_mux000024_9090)
  );
  X_LUT4 #(
    .INIT ( 16'hCAAA ),
    .LOC ( "SLICE_X33Y31" ))
  x86_Dout_9_mux000024 (
    .ADR0(\Host/RxData [1]),
    .ADR1(\Host/TxDone_2997 ),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(x86_Dout_0_cmp_eq0001),
    .O(x86_Dout_9_mux000024_9107)
  );
  X_LUT4 #(
    .INIT ( 16'hB8F0 ),
    .LOC ( "SLICE_X33Y31" ))
  x86_Dout_10_mux000024 (
    .ADR0(\DB7/Ready_2916 ),
    .ADR1(CBE_0_IBUF_2821),
    .ADR2(\Host/RxData [2]),
    .ADR3(x86_Dout_0_cmp_eq0001),
    .O(x86_Dout_10_mux000024_9114)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y39" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_0  (
    .I(\DB7/Accumulator<1>/DYMUX_9191 ),
    .CE(\DB7/Accumulator<1>/CEINV_9188 ),
    .CLK(\DB7/Accumulator<1>/CLKINV_9189 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [0])
  );
  X_FF #(
    .LOC ( "SLICE_X16Y39" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_1  (
    .I(\DB7/Accumulator<1>/DXMUX_9197 ),
    .CE(\DB7/Accumulator<1>/CEINV_9188 ),
    .CLK(\DB7/Accumulator<1>/CLKINV_9189 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [1])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_2  (
    .I(\DB7/Accumulator<3>/DYMUX_9211 ),
    .CE(\DB7/Accumulator<3>/CEINV_9208 ),
    .CLK(\DB7/Accumulator<3>/CLKINV_9209 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [2])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_3  (
    .I(\DB7/Accumulator<3>/DXMUX_9217 ),
    .CE(\DB7/Accumulator<3>/CEINV_9208 ),
    .CLK(\DB7/Accumulator<3>/CLKINV_9209 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [3])
  );
  X_LUT4 #(
    .INIT ( 16'h0C0C ),
    .LOC ( "SLICE_X23Y40" ))
  \x86/WriteReq1  (
    .ADR0(VCC),
    .ADR1(\x86/IOWrite_3029 ),
    .ADR2(IRdy_IBUF_2828),
    .ADR3(VCC),
    .O(x86_Write)
  );
  X_LUT4 #(
    .INIT ( 16'h5F5F ),
    .LOC ( "SLICE_X23Y40" ))
  \x86/TReady_mux000011  (
    .ADR0(Frame_IBUF_2840),
    .ADR1(VCC),
    .ADR2(IRdy_IBUF_2828),
    .ADR3(VCC),
    .O(N26)
  );
  X_FF #(
    .LOC ( "SLICE_X15Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_4  (
    .I(\DB7/Accumulator<5>/DYMUX_9255 ),
    .CE(\DB7/Accumulator<5>/CEINV_9252 ),
    .CLK(\DB7/Accumulator<5>/CLKINV_9253 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [4])
  );
  X_FF #(
    .LOC ( "SLICE_X15Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_5  (
    .I(\DB7/Accumulator<5>/DXMUX_9261 ),
    .CE(\DB7/Accumulator<5>/CEINV_9252 ),
    .CLK(\DB7/Accumulator<5>/CLKINV_9253 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [5])
  );
  X_FF #(
    .LOC ( "SLICE_X15Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_6  (
    .I(\DB7/Accumulator<7>/DYMUX_9275 ),
    .CE(\DB7/Accumulator<7>/CEINV_9272 ),
    .CLK(\DB7/Accumulator<7>/CLKINV_9273 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [6])
  );
  X_FF #(
    .LOC ( "SLICE_X15Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_7  (
    .I(\DB7/Accumulator<7>/DXMUX_9281 ),
    .CE(\DB7/Accumulator<7>/CEINV_9272 ),
    .CLK(\DB7/Accumulator<7>/CLKINV_9273 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [7])
  );
  X_FF #(
    .LOC ( "SLICE_X31Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_8  (
    .I(\DB7/Accumulator<9>/DYMUX_9295 ),
    .CE(\DB7/Accumulator<9>/CEINV_9292 ),
    .CLK(\DB7/Accumulator<9>/CLKINV_9293 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [8])
  );
  X_FF #(
    .LOC ( "SLICE_X31Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_9  (
    .I(\DB7/Accumulator<9>/DXMUX_9301 ),
    .CE(\DB7/Accumulator<9>/CEINV_9292 ),
    .CLK(\DB7/Accumulator<9>/CLKINV_9293 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [9])
  );
  X_LUT4 #(
    .INIT ( 16'hEEEE ),
    .LOC ( "SLICE_X25Y55" ))
  \DB7/ShiftCount_mux0001<1>25  (
    .ADR0(\DB7/ShiftCount [1]),
    .ADR1(\DB7/ShiftCount [0]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\DB7/ShiftCount_mux0001<1>25_9320 )
  );
  X_LUT4 #(
    .INIT ( 16'h3210 ),
    .LOC ( "SLICE_X25Y55" ))
  \DB7/SDO401  (
    .ADR0(\DB7/ShiftCount [1]),
    .ADR1(\DB7/ShiftCount [0]),
    .ADR2(\DB7/SDO357 ),
    .ADR3(\DB7/SDO304 ),
    .O(\DB7/SDO401_9327 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF37 ),
    .LOC ( "SLICE_X17Y56" ))
  \DB7/ShiftCount_mux0001<3>11  (
    .ADR0(\DB7/State_FSM_FFd4_3097 ),
    .ADR1(\DB7/SClock_2839 ),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(\DB7/State_FSM_FFd5_2927 ),
    .O(\DB7/N112 )
  );
  X_LUT4 #(
    .INIT ( 16'hFDFC ),
    .LOC ( "SLICE_X17Y56" ))
  \DB7/StrobeOut_mux000116  (
    .ADR0(x86_to_DB7_2925),
    .ADR1(\DB7/State_FSM_FFd2_3034 ),
    .ADR2(\DB7/State_FSM_FFd4_3097 ),
    .ADR3(\DB7/State_FSM_FFd5_2927 ),
    .O(\DB7/StrobeOut_mux000116_9351 )
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X28Y30" ))
  x86_Dout_13_mux00009 (
    .ADR0(N22),
    .ADR1(\Host/WCount [5]),
    .ADR2(N15),
    .ADR3(\DB7/Accumulator [13]),
    .O(x86_Dout_13_mux00009_9368)
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X28Y30" ))
  x86_Dout_10_mux00009 (
    .ADR0(N22),
    .ADR1(\Host/WCount [2]),
    .ADR2(N15),
    .ADR3(\DB7/Accumulator [10]),
    .O(x86_Dout_10_mux00009_9375)
  );
  X_FF #(
    .LOC ( "SLICE_X34Y31" ),
    .INIT ( 1'b0 ))
  DataToHost_0 (
    .I(\DataToHost<1>/DYMUX_9387 ),
    .CE(\DataToHost<1>/CEINV_9384 ),
    .CLK(\DataToHost<1>/CLKINV_9385 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[0])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y31" ),
    .INIT ( 1'b0 ))
  DataToHost_1 (
    .I(\DataToHost<1>/DXMUX_9393 ),
    .CE(\DataToHost<1>/CEINV_9384 ),
    .CLK(\DataToHost<1>/CLKINV_9385 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[1])
  );
  X_FF #(
    .LOC ( "SLICE_X38Y31" ),
    .INIT ( 1'b0 ))
  DataToHost_2 (
    .I(\DataToHost<3>/DYMUX_9407 ),
    .CE(\DataToHost<3>/CEINV_9404 ),
    .CLK(\DataToHost<3>/CLKINV_9405 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[2])
  );
  X_FF #(
    .LOC ( "SLICE_X38Y31" ),
    .INIT ( 1'b0 ))
  DataToHost_3 (
    .I(\DataToHost<3>/DXMUX_9413 ),
    .CE(\DataToHost<3>/CEINV_9404 ),
    .CLK(\DataToHost<3>/CLKINV_9405 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[3])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y30" ),
    .INIT ( 1'b0 ))
  DataToHost_4 (
    .I(\DataToHost<5>/DYMUX_9427 ),
    .CE(\DataToHost<5>/CEINV_9424 ),
    .CLK(\DataToHost<5>/CLKINV_9425 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[4])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y30" ),
    .INIT ( 1'b0 ))
  DataToHost_5 (
    .I(\DataToHost<5>/DXMUX_9433 ),
    .CE(\DataToHost<5>/CEINV_9424 ),
    .CLK(\DataToHost<5>/CLKINV_9425 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[5])
  );
  X_FF #(
    .LOC ( "SLICE_X38Y32" ),
    .INIT ( 1'b0 ))
  DataToHost_6 (
    .I(\DataToHost<7>/DYMUX_9447 ),
    .CE(\DataToHost<7>/CEINV_9444 ),
    .CLK(\DataToHost<7>/CLKINV_9445 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[6])
  );
  X_FF #(
    .LOC ( "SLICE_X38Y32" ),
    .INIT ( 1'b0 ))
  DataToHost_7 (
    .I(\DataToHost<7>/DXMUX_9453 ),
    .CE(\DataToHost<7>/CEINV_9444 ),
    .CLK(\DataToHost<7>/CLKINV_9445 ),
    .SET(GND),
    .RST(GND),
    .O(DataToHost[7])
  );
  X_LUT4 #(
    .INIT ( 16'hF000 ),
    .LOC ( "SLICE_X22Y59" ))
  \DB7/Diagnose_not00011  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\DB7/State_FSM_FFd5_2927 ),
    .ADR3(x86_to_DB7_2925),
    .O(\DB7/Diagnose_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'hAA0A ),
    .LOC ( "SLICE_X22Y59" ))
  \DB7/State_FSM_FFd5-In5  (
    .ADR0(\DB7/State_FSM_FFd5_2927 ),
    .ADR1(VCC),
    .ADR2(x86_to_DB7_2925),
    .ADR3(DB7_Address[7]),
    .O(\DB7/State_FSM_FFd5-In5_9479 )
  );
  X_FF #(
    .LOC ( "SLICE_X39Y32" ),
    .INIT ( 1'b1 ))
  \Host/RxData_0  (
    .I(\Host/RxData<1>/DYMUX_9493 ),
    .CE(\Host/RxData<1>/CEINV_9489 ),
    .CLK(\Host/RxData<1>/CLKINV_9490 ),
    .SET(\Host/RxData<1>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [0])
  );
  X_FF #(
    .LOC ( "SLICE_X39Y32" ),
    .INIT ( 1'b1 ))
  \Host/RxData_1  (
    .I(\Host/RxData<1>/DXMUX_9501 ),
    .CE(\Host/RxData<1>/CEINV_9489 ),
    .CLK(\Host/RxData<1>/CLKINV_9490 ),
    .SET(\Host/RxData<1>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [1])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y31" ),
    .INIT ( 1'b1 ))
  \Host/RxData_2  (
    .I(\Host/RxData<3>/DYMUX_9519 ),
    .CE(\Host/RxData<3>/CEINV_9515 ),
    .CLK(\Host/RxData<3>/CLKINV_9516 ),
    .SET(\Host/RxData<3>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [2])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y31" ),
    .INIT ( 1'b1 ))
  \Host/RxData_3  (
    .I(\Host/RxData<3>/DXMUX_9527 ),
    .CE(\Host/RxData<3>/CEINV_9515 ),
    .CLK(\Host/RxData<3>/CLKINV_9516 ),
    .SET(\Host/RxData<3>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [3])
  );
  X_FF #(
    .LOC ( "SLICE_X51Y30" ),
    .INIT ( 1'b1 ))
  \Host/RxData_4  (
    .I(\Host/RxData<5>/DYMUX_9545 ),
    .CE(\Host/RxData<5>/CEINV_9541 ),
    .CLK(\Host/RxData<5>/CLKINV_9542 ),
    .SET(\Host/RxData<5>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [4])
  );
  X_FF #(
    .LOC ( "SLICE_X51Y30" ),
    .INIT ( 1'b1 ))
  \Host/RxData_5  (
    .I(\Host/RxData<5>/DXMUX_9553 ),
    .CE(\Host/RxData<5>/CEINV_9541 ),
    .CLK(\Host/RxData<5>/CLKINV_9542 ),
    .SET(\Host/RxData<5>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [5])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y32" ),
    .INIT ( 1'b1 ))
  \Host/RxData_6  (
    .I(\Host/RxData<7>/DYMUX_9571 ),
    .CE(\Host/RxData<7>/CEINV_9567 ),
    .CLK(\Host/RxData<7>/CLKINV_9568 ),
    .SET(\Host/RxData<7>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [6])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y32" ),
    .INIT ( 1'b1 ))
  \Host/RxData_7  (
    .I(\Host/RxData<7>/DXMUX_9579 ),
    .CE(\Host/RxData<7>/CEINV_9567 ),
    .CLK(\Host/RxData<7>/CLKINV_9568 ),
    .SET(\Host/RxData<7>/SRINVNOT ),
    .RST(GND),
    .O(\Host/RxData [7])
  );
  X_LUT4 #(
    .INIT ( 16'hFFFE ),
    .LOC ( "SLICE_X24Y37" ))
  x86_Dout_10_mux00004_SW0 (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(CBE_3_IBUF_2824),
    .O(N211)
  );
  X_LUT4 #(
    .INIT ( 16'h0002 ),
    .LOC ( "SLICE_X24Y37" ))
  \x86/State_cmp_eq00001  (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(CBE_3_IBUF_2824),
    .O(\x86/State_cmp_eq0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X22Y55" ),
    .INIT ( 1'b1 ))
  DB7_Address_0 (
    .I(\DB7_Address<1>/DYMUX_9621 ),
    .CE(\DB7_Address<1>/CEINV_9617 ),
    .CLK(\DB7_Address<1>/CLKINV_9618 ),
    .SET(\DB7_Address<1>/SRINVNOT ),
    .RST(GND),
    .O(DB7_Address[0])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y55" ),
    .INIT ( 1'b0 ))
  DB7_Address_1 (
    .I(\DB7_Address<1>/DXMUX_9629 ),
    .CE(\DB7_Address<1>/CEINV_9617 ),
    .CLK(\DB7_Address<1>/CLKINV_9618 ),
    .SET(GND),
    .RST(\DB7_Address<1>/SRINVNOT ),
    .O(DB7_Address[1])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y42" ),
    .INIT ( 1'b1 ))
  DB7_Address_2 (
    .I(\DB7_Address<3>/DYMUX_9648 ),
    .CE(\DB7_Address<3>/CEINV_9644 ),
    .CLK(\DB7_Address<3>/CLKINV_9645 ),
    .SET(\DB7_Address<3>/SRINVNOT ),
    .RST(GND),
    .O(DB7_Address[2])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y42" ),
    .INIT ( 1'b0 ))
  DB7_Address_3 (
    .I(\DB7_Address<3>/DXMUX_9656 ),
    .CE(\DB7_Address<3>/CEINV_9644 ),
    .CLK(\DB7_Address<3>/CLKINV_9645 ),
    .SET(GND),
    .RST(\DB7_Address<3>/SRINVNOT ),
    .O(DB7_Address[3])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y54" ),
    .INIT ( 1'b0 ))
  DB7_Address_4 (
    .I(\DB7_Address<5>/DYMUX_9675 ),
    .CE(\DB7_Address<5>/CEINV_9671 ),
    .CLK(\DB7_Address<5>/CLKINV_9672 ),
    .SET(GND),
    .RST(\DB7_Address<5>/SRINVNOT ),
    .O(DB7_Address[4])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y54" ),
    .INIT ( 1'b1 ))
  DB7_Address_5 (
    .I(\DB7_Address<5>/DXMUX_9684 ),
    .CE(\DB7_Address<5>/CEINV_9671 ),
    .CLK(\DB7_Address<5>/CLKINV_9672 ),
    .SET(\DB7_Address<5>/SRINVNOT ),
    .RST(GND),
    .O(DB7_Address[5])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y46" ),
    .INIT ( 1'b0 ))
  DB7_Address_6 (
    .I(\DB7_Address<7>/DYMUX_9702 ),
    .CE(\DB7_Address<7>/CEINV_9698 ),
    .CLK(\DB7_Address<7>/CLKINV_9699 ),
    .SET(GND),
    .RST(\DB7_Address<7>/SRINVNOT ),
    .O(DB7_Address[6])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y46" ),
    .INIT ( 1'b1 ))
  DB7_Address_7 (
    .I(\DB7_Address<7>/DXMUX_9711 ),
    .CE(\DB7_Address<7>/CEINV_9698 ),
    .CLK(\DB7_Address<7>/CLKINV_9699 ),
    .SET(\DB7_Address<7>/SRINVNOT ),
    .RST(GND),
    .O(DB7_Address[7])
  );
  X_LUT4 #(
    .INIT ( 16'h0100 ),
    .LOC ( "SLICE_X21Y36" ))
  \x86/ConfigData_and0000128  (
    .ADR0(CBE_2_IBUF_2823),
    .ADR1(N193_0),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(CBE_1_IBUF_2822),
    .O(\x86/ConfigData_and0000128_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h1000 ),
    .LOC ( "SLICE_X21Y36" ))
  \x86/ConfigData_and0000134  (
    .ADR0(N53),
    .ADR1(N521),
    .ADR2(\x86/ConfigData_and0000128_3250 ),
    .ADR3(N57),
    .O(N51)
  );
  X_LUT4 #(
    .INIT ( 16'h8088 ),
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase_mux000139  (
    .ADR0(\DB7/State_FSM_FFd5_2927 ),
    .ADR1(x86_to_DB7_2925),
    .ADR2(DB7_Address[1]),
    .ADR3(DB7_Address[7]),
    .O(\DB7/AddressPhase_mux000139_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFFE4 ),
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase_mux000141  (
    .ADR0(\DB7/Shifting_and0000_0 ),
    .ADR1(N138_0),
    .ADR2(N139_0),
    .ADR3(\DB7/AddressPhase_mux000139_3253 ),
    .O(\DB7/AddressPhase_mux0001 )
  );
  X_FF #(
    .LOC ( "SLICE_X20Y52" ),
    .INIT ( 1'b0 ))
  \DB7/AddressPhase  (
    .I(\DB7/AddressPhase/DXMUX_9770 ),
    .CE(VCC),
    .CLK(\DB7/AddressPhase/CLKINV_9754 ),
    .SET(GND),
    .RST(\DB7/AddressPhase/FFX/RSTAND_9775 ),
    .O(\DB7/AddressPhase_2827 )
  );
  X_INV #(
    .LOC ( "SLICE_X20Y52" ))
  \DB7/AddressPhase/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/AddressPhase/FFX/RSTAND_9775 )
  );
  X_FF #(
    .LOC ( "SLICE_X27Y58" ),
    .INIT ( 1'b0 ))
  \DB7/Diagnose  (
    .I(\DB7/Diagnose/DYMUX_9786 ),
    .CE(\DB7/Diagnose/CEINV_9782 ),
    .CLK(\DB7/Diagnose/CLKINV_9783 ),
    .SET(GND),
    .RST(\DB7/Diagnose/FFY/RSTAND_9792 ),
    .O(\DB7/Diagnose_3254 )
  );
  X_INV #(
    .LOC ( "SLICE_X27Y58" ))
  \DB7/Diagnose/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\DB7/Diagnose/FFY/RSTAND_9792 )
  );
  X_LUT4 #(
    .INIT ( 16'hBF00 ),
    .LOC ( "SLICE_X21Y59" ))
  \DB7/AddressPhase_mux000122_SW0  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(x86_to_DB7_2925),
    .ADR2(\DB7/State_FSM_FFd5_2927 ),
    .ADR3(\DB7/AddressPhase_2827 ),
    .O(N138)
  );
  X_LUT4 #(
    .INIT ( 16'h3500 ),
    .LOC ( "SLICE_X21Y59" ))
  \DB7/AddressPhase_mux000122_SW1  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(x86_to_DB7_2925),
    .ADR2(\DB7/State_FSM_FFd5_2927 ),
    .ADR3(\DB7/AddressPhase_2827 ),
    .O(N139)
  );
  X_FF #(
    .LOC ( "SLICE_X26Y46" ),
    .INIT ( 1'b0 ))
  LEDRegister_0 (
    .I(\LEDRegister<1>/DYMUX_9827 ),
    .CE(\LEDRegister<1>/CEINV_9824 ),
    .CLK(\LEDRegister<1>/CLKINV_9825 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[0])
  );
  X_FF #(
    .LOC ( "SLICE_X26Y46" ),
    .INIT ( 1'b0 ))
  LEDRegister_1 (
    .I(\LEDRegister<1>/DXMUX_9833 ),
    .CE(\LEDRegister<1>/CEINV_9824 ),
    .CLK(\LEDRegister<1>/CLKINV_9825 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[1])
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X21Y37" ))
  \x86/FSMActive_mux0000218  (
    .ADR0(N53),
    .ADR1(N521),
    .ADR2(CBE_3_IBUF_2824),
    .ADR3(CBE_0_IBUF_2821),
    .O(\x86/FSMActive_mux0000218_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hC000 ),
    .LOC ( "SLICE_X21Y37" ))
  \x86/FSMActive_mux0000220  (
    .ADR0(VCC),
    .ADR1(N57),
    .ADR2(\x86/Configured_and0001_0 ),
    .ADR3(\x86/FSMActive_mux0000218_3255 ),
    .O(\x86/FSMActive_mux0000220_9859 )
  );
  X_LUT4 #(
    .INIT ( 16'h2222 ),
    .LOC ( "SLICE_X22Y37" ))
  \x86/ReadReq1  (
    .ADR0(\x86/IORead_3030 ),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(x86_Read)
  );
  X_LUT4 #(
    .INIT ( 16'h2232 ),
    .LOC ( "SLICE_X22Y37" ))
  \x86/State_FSM_FFd2-In14  (
    .ADR0(\x86/State_FSM_FFd2_2904 ),
    .ADR1(IRdy_IBUF_2828),
    .ADR2(\x86/State_FSM_FFd3_2906 ),
    .ADR3(x86_Hold_2908),
    .O(\x86/State_FSM_FFd2-In14_9883 )
  );
  X_FF #(
    .LOC ( "SLICE_X31Y44" ),
    .INIT ( 1'b0 ))
  LEDRegister_2 (
    .I(\LEDRegister<3>/DYMUX_9895 ),
    .CE(\LEDRegister<3>/CEINV_9892 ),
    .CLK(\LEDRegister<3>/CLKINV_9893 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[2])
  );
  X_FF #(
    .LOC ( "SLICE_X31Y44" ),
    .INIT ( 1'b0 ))
  LEDRegister_3 (
    .I(\LEDRegister<3>/DXMUX_9901 ),
    .CE(\LEDRegister<3>/CEINV_9892 ),
    .CLK(\LEDRegister<3>/CLKINV_9893 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[3])
  );
  X_LUT4 #(
    .INIT ( 16'h0020 ),
    .LOC ( "SLICE_X12Y34" ))
  \x86/State_cmp_eq00031  (
    .ADR0(CBE_0_IBUF_2821),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(CBE_3_IBUF_2824),
    .O(\x86/State_cmp_eq0003 )
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X12Y34" ))
  x86_Dout_1_mux000020_SW0 (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(\DB7/Accumulator [1]),
    .O(N213)
  );
  X_FF #(
    .LOC ( "SLICE_X31Y45" ),
    .INIT ( 1'b0 ))
  LEDRegister_4 (
    .I(\LEDRegister<5>/DYMUX_9939 ),
    .CE(\LEDRegister<5>/CEINV_9936 ),
    .CLK(\LEDRegister<5>/CLKINV_9937 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[4])
  );
  X_FF #(
    .LOC ( "SLICE_X31Y45" ),
    .INIT ( 1'b0 ))
  LEDRegister_5 (
    .I(\LEDRegister<5>/DXMUX_9945 ),
    .CE(\LEDRegister<5>/CEINV_9936 ),
    .CLK(\LEDRegister<5>/CLKINV_9937 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[5])
  );
  X_LUT4 #(
    .INIT ( 16'hF8F0 ),
    .LOC ( "SLICE_X19Y56" ))
  \DB7/SClock_not00011  (
    .ADR0(DB7_Address[7]),
    .ADR1(\DB7/State_FSM_FFd5_2927 ),
    .ADR2(\DB7/Shifting_3167 ),
    .ADR3(x86_to_DB7_2925),
    .O(\DB7/SClock_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X19Y56" ))
  \DB7/StrobeOut_mux00015  (
    .ADR0(DB7_Address[7]),
    .ADR1(DB7_Address[2]),
    .ADR2(\DB7/State_FSM_FFd5_2927 ),
    .ADR3(x86_to_DB7_2925),
    .O(\DB7/StrobeOut_mux00015_9971 )
  );
  X_LUT4 #(
    .INIT ( 16'h0004 ),
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive_mux0000247  (
    .ADR0(Frame_IBUF_2840),
    .ADR1(\x86/LastFrame_2923 ),
    .ADR2(N168_0),
    .ADR3(CBE_2_IBUF_2823),
    .O(N63_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'h7370 ),
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive_mux00001  (
    .ADR0(\x86/State_FSM_FFd1_2907 ),
    .ADR1(\x86/State_cmp_ne0000 ),
    .ADR2(\x86/FSMActive_2830 ),
    .ADR3(N63),
    .O(\x86/FSMActive_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X22Y38" ),
    .INIT ( 1'b0 ))
  \x86/FSMActive  (
    .I(\x86/FSMActive/DXMUX_10002 ),
    .CE(VCC),
    .CLK(\x86/FSMActive/CLKINV_9986 ),
    .SET(GND),
    .RST(\x86/FSMActive/FFX/RSTAND_10007 ),
    .O(\x86/FSMActive_2830 )
  );
  X_INV #(
    .LOC ( "SLICE_X22Y38" ))
  \x86/FSMActive/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/FSMActive/FFX/RSTAND_10007 )
  );
  X_FF #(
    .LOC ( "SLICE_X29Y47" ),
    .INIT ( 1'b0 ))
  LEDRegister_6 (
    .I(\LEDRegister<7>/DYMUX_10018 ),
    .CE(\LEDRegister<7>/CEINV_10015 ),
    .CLK(\LEDRegister<7>/CLKINV_10016 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[6])
  );
  X_FF #(
    .LOC ( "SLICE_X29Y47" ),
    .INIT ( 1'b0 ))
  LEDRegister_7 (
    .I(\LEDRegister<7>/DXMUX_10024 ),
    .CE(\LEDRegister<7>/CEINV_10015 ),
    .CLK(\LEDRegister<7>/CLKINV_10016 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[7])
  );
  X_LUT4 #(
    .INIT ( 16'h0005 ),
    .LOC ( "SLICE_X13Y33" ))
  x86_Dout_0_cmp_eq00021 (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(VCC),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_3_IBUF_2824),
    .O(x86_Dout_0_cmp_eq0002_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hCC00 ),
    .LOC ( "SLICE_X13Y33" ))
  x86_Dout_4_mux00001 (
    .ADR0(VCC),
    .ADR1(x86_Dlast[4]),
    .ADR2(VCC),
    .ADR3(x86_Dout_0_cmp_eq0002),
    .O(x86_Dout_4_mux00001_10050)
  );
  X_FF #(
    .LOC ( "SLICE_X35Y47" ),
    .INIT ( 1'b0 ))
  LEDRegister_8 (
    .I(\LEDRegister<9>/DYMUX_10062 ),
    .CE(\LEDRegister<9>/CEINV_10059 ),
    .CLK(\LEDRegister<9>/CLKINV_10060 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[8])
  );
  X_FF #(
    .LOC ( "SLICE_X35Y47" ),
    .INIT ( 1'b0 ))
  LEDRegister_9 (
    .I(\LEDRegister<9>/DXMUX_10068 ),
    .CE(\LEDRegister<9>/CEINV_10059 ),
    .CLK(\LEDRegister<9>/CLKINV_10060 ),
    .SET(GND),
    .RST(GND),
    .O(LEDRegister[9])
  );
  X_FF #(
    .LOC ( "SLICE_X32Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_10  (
    .I(\DB7/Accumulator<11>/DYMUX_10082 ),
    .CE(\DB7/Accumulator<11>/CEINV_10079 ),
    .CLK(\DB7/Accumulator<11>/CLKINV_10080 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [10])
  );
  X_FF #(
    .LOC ( "SLICE_X32Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_11  (
    .I(\DB7/Accumulator<11>/DXMUX_10088 ),
    .CE(\DB7/Accumulator<11>/CEINV_10079 ),
    .CLK(\DB7/Accumulator<11>/CLKINV_10080 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [11])
  );
  X_FF #(
    .LOC ( "SLICE_X32Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_12  (
    .I(\DB7/Accumulator<13>/DYMUX_10102 ),
    .CE(\DB7/Accumulator<13>/CEINV_10099 ),
    .CLK(\DB7/Accumulator<13>/CLKINV_10100 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [12])
  );
  X_FF #(
    .LOC ( "SLICE_X32Y36" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_13  (
    .I(\DB7/Accumulator<13>/DXMUX_10108 ),
    .CE(\DB7/Accumulator<13>/CEINV_10099 ),
    .CLK(\DB7/Accumulator<13>/CLKINV_10100 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [13])
  );
  X_FF #(
    .LOC ( "SLICE_X33Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_14  (
    .I(\DB7/Accumulator<15>/DYMUX_10122 ),
    .CE(\DB7/Accumulator<15>/CEINV_10119 ),
    .CLK(\DB7/Accumulator<15>/CLKINV_10120 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [14])
  );
  X_FF #(
    .LOC ( "SLICE_X33Y35" ),
    .INIT ( 1'b0 ))
  \DB7/Accumulator_15  (
    .I(\DB7/Accumulator<15>/DXMUX_10128 ),
    .CE(\DB7/Accumulator<15>/CEINV_10119 ),
    .CLK(\DB7/Accumulator<15>/CLKINV_10120 ),
    .SET(GND),
    .RST(GND),
    .O(\DB7/Accumulator [15])
  );
  X_LUT4 #(
    .INIT ( 16'h0008 ),
    .LOC ( "SLICE_X20Y39" ))
  \x86/ConfigRead_mux0000111  (
    .ADR0(CBE_1_IBUF_2822),
    .ADR1(CBE_3_IBUF_2824),
    .ADR2(CBE_0_IBUF_2821),
    .ADR3(CBE_2_IBUF_2823),
    .O(\x86/ConfigRead_mux000011_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFF7F ),
    .LOC ( "SLICE_X20Y39" ))
  \x86/ConfigRead_mux000021_SW0  (
    .ADR0(\x86/Configured_and0001_0 ),
    .ADR1(\x86/State_cmp_eq0006_0 ),
    .ADR2(\x86/ConfigRead_mux000011_3260 ),
    .ADR3(Frame_IBUF_2840),
    .O(N180)
  );
  X_LUT4 #(
    .INIT ( 16'hCC00 ),
    .LOC ( "SLICE_X13Y38" ))
  x86_Dout_7_mux00001 (
    .ADR0(VCC),
    .ADR1(x86_Dlast[7]),
    .ADR2(VCC),
    .ADR3(x86_Dout_0_cmp_eq0002),
    .O(x86_Dout_7_mux00001_10166)
  );
  X_LUT4 #(
    .INIT ( 16'hF888 ),
    .LOC ( "SLICE_X32Y30" ))
  x86_Dout_9_mux00009 (
    .ADR0(N22),
    .ADR1(\Host/WCount [1]),
    .ADR2(N15),
    .ADR3(\DB7/Accumulator [9]),
    .O(x86_Dout_9_mux00009_10183)
  );
  X_LUT4 #(
    .INIT ( 16'hEAC0 ),
    .LOC ( "SLICE_X32Y30" ))
  x86_Dout_12_mux00009 (
    .ADR0(\Host/WCount [4]),
    .ADR1(\DB7/Accumulator [12]),
    .ADR2(N15),
    .ADR3(N22),
    .O(x86_Dout_12_mux00009_10190)
  );
  X_LUT4 #(
    .INIT ( 16'hD8D8 ),
    .LOC ( "SLICE_X25Y44" ))
  \x86/Dout<10>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(\x86/ConfigData [10]),
    .ADR2(x86_Dout[10]),
    .ADR3(VCC),
    .O(\x86/Dout [10])
  );
  X_LUT4 #(
    .INIT ( 16'hE4E4 ),
    .LOC ( "SLICE_X25Y44" ))
  \x86/Dout<6>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(x86_Dout[6]),
    .ADR2(\x86/ConfigData [6]),
    .ADR3(VCC),
    .O(\x86/Dout [6])
  );
  X_LUT4 #(
    .INIT ( 16'hCCAA ),
    .LOC ( "SLICE_X24Y45" ))
  \x86/Dout<11>1  (
    .ADR0(x86_Dout[11]),
    .ADR1(\x86/ConfigData [11]),
    .ADR2(VCC),
    .ADR3(\x86/ConfigRead_3183 ),
    .O(\x86/Dout [11])
  );
  X_LUT4 #(
    .INIT ( 16'hF0CC ),
    .LOC ( "SLICE_X24Y45" ))
  \x86/Dout<7>1  (
    .ADR0(VCC),
    .ADR1(x86_Dout[7]),
    .ADR2(\x86/ConfigData [7]),
    .ADR3(\x86/ConfigRead_3183 ),
    .O(\x86/Dout [7])
  );
  X_LUT4 #(
    .INIT ( 16'hCFC0 ),
    .LOC ( "SLICE_X51Y40" ))
  \x86/Dout<12>1  (
    .ADR0(VCC),
    .ADR1(\x86/ConfigData [12]),
    .ADR2(\x86/ConfigRead_3183 ),
    .ADR3(x86_Dout[12]),
    .O(\x86/Dout [12])
  );
  X_LUT4 #(
    .INIT ( 16'hAAF0 ),
    .LOC ( "SLICE_X51Y40" ))
  \x86/Dout<13>1  (
    .ADR0(\x86/ConfigData [13]),
    .ADR1(VCC),
    .ADR2(x86_Dout[13]),
    .ADR3(\x86/ConfigRead_3183 ),
    .O(\x86/Dout [13])
  );
  X_LUT4 #(
    .INIT ( 16'hCACA ),
    .LOC ( "SLICE_X49Y46" ))
  \x86/Dout<14>1  (
    .ADR0(x86_Dout[14]),
    .ADR1(\x86/ConfigData [14]),
    .ADR2(\x86/ConfigRead_3183 ),
    .ADR3(VCC),
    .O(\x86/Dout [14])
  );
  X_LUT4 #(
    .INIT ( 16'hDD88 ),
    .LOC ( "SLICE_X49Y46" ))
  \x86/Dout<15>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(\x86/ConfigData [15]),
    .ADR2(VCC),
    .ADR3(x86_Dout[15]),
    .O(\x86/Dout [15])
  );
  X_LUT4 #(
    .INIT ( 16'hBBBB ),
    .LOC ( "SLICE_X25Y56" ))
  \DB7/ShiftCount_mux0001<0>8  (
    .ADR0(DB7_Address[7]),
    .ADR1(x86_to_DB7_2925),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\DB7/ShiftCount_mux0001<0>8_10303 )
  );
  X_LUT4 #(
    .INIT ( 16'hA0C0 ),
    .LOC ( "SLICE_X25Y56" ))
  \DB7/SDO13  (
    .ADR0(DB7_Address[7]),
    .ADR1(DB7_Address[3]),
    .ADR2(\DB7/ShiftCount [1]),
    .ADR3(\DB7/ShiftCount [2]),
    .O(\DB7/SDO13_10310 )
  );
  X_LUT4 #(
    .INIT ( 16'hCCFF ),
    .LOC ( "SLICE_X19Y44" ))
  \x86/TRDY_or00001  (
    .ADR0(VCC),
    .ADR1(x86_Hold_2908),
    .ADR2(VCC),
    .ADR3(\x86/TReady_2922 ),
    .O(\x86/TRDY_or0000 )
  );
  X_LUT4 #(
    .INIT ( 16'hF0AA ),
    .LOC ( "SLICE_X24Y26" ))
  \x86/Dout<16>1  (
    .ADR0(x86_Dout[16]),
    .ADR1(VCC),
    .ADR2(\x86/ConfigData [16]),
    .ADR3(\x86/ConfigRead_3183 ),
    .O(\x86/Dout [16])
  );
  X_LUT4 #(
    .INIT ( 16'hACAC ),
    .LOC ( "SLICE_X24Y26" ))
  \x86/Dout<17>1  (
    .ADR0(\x86/ConfigData [17]),
    .ADR1(x86_Dout[17]),
    .ADR2(\x86/ConfigRead_3183 ),
    .ADR3(VCC),
    .O(\x86/Dout [17])
  );
  X_FF #(
    .LOC ( "SLICE_X20Y43" ),
    .INIT ( 1'b0 ))
  x86_to_DB7 (
    .I(\x86_to_DB7/DYMUX_10358 ),
    .CE(\x86_to_DB7/CEINV_10354 ),
    .CLK(\x86_to_DB7/CLKINV_10355 ),
    .SET(GND),
    .RST(\x86_to_DB7/FFY/RSTAND_10364 ),
    .O(x86_to_DB7_2925)
  );
  X_INV #(
    .LOC ( "SLICE_X20Y43" ))
  \x86_to_DB7/FFY/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86_to_DB7/FFY/RSTAND_10364 )
  );
  X_LUT4 #(
    .INIT ( 16'h0033 ),
    .LOC ( "SLICE_X23Y59" ))
  \DB7/StrobeTimer_mux0000<5>_SW0  (
    .ADR0(VCC),
    .ADR1(\DB7/StrobeTimer [0]),
    .ADR2(VCC),
    .ADR3(\DB7/StrobeTimer [1]),
    .O(N31)
  );
  X_FF #(
    .LOC ( "SLICE_X25Y42" ),
    .INIT ( 1'b0 ))
  DB7_Dout_10 (
    .I(\DB7_Dout<11>/DYMUX_10387 ),
    .CE(\DB7_Dout<11>/CEINV_10384 ),
    .CLK(\DB7_Dout<11>/CLKINV_10385 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[10])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y42" ),
    .INIT ( 1'b0 ))
  DB7_Dout_11 (
    .I(\DB7_Dout<11>/DXMUX_10393 ),
    .CE(\DB7_Dout<11>/CEINV_10384 ),
    .CLK(\DB7_Dout<11>/CLKINV_10385 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[11])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y47" ),
    .INIT ( 1'b0 ))
  DB7_Dout_12 (
    .I(\DB7_Dout<13>/DYMUX_10407 ),
    .CE(\DB7_Dout<13>/CEINV_10404 ),
    .CLK(\DB7_Dout<13>/CLKINV_10405 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[12])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y47" ),
    .INIT ( 1'b0 ))
  DB7_Dout_13 (
    .I(\DB7_Dout<13>/DXMUX_10413 ),
    .CE(\DB7_Dout<13>/CEINV_10404 ),
    .CLK(\DB7_Dout<13>/CLKINV_10405 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[13])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y47" ),
    .INIT ( 1'b0 ))
  DB7_Dout_14 (
    .I(\DB7_Dout<15>/DYMUX_10427 ),
    .CE(\DB7_Dout<15>/CEINV_10424 ),
    .CLK(\DB7_Dout<15>/CLKINV_10425 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[14])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y47" ),
    .INIT ( 1'b0 ))
  DB7_Dout_15 (
    .I(\DB7_Dout<15>/DXMUX_10433 ),
    .CE(\DB7_Dout<15>/CEINV_10424 ),
    .CLK(\DB7_Dout<15>/CLKINV_10425 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[15])
  );
  X_LUT4 #(
    .INIT ( 16'hFFCC ),
    .LOC ( "SLICE_X27Y37" ))
  \Host/PuttingByte_FSM_FFd2-In11  (
    .ADR0(VCC),
    .ADR1(\Host/RxBufferFull_2988 ),
    .ADR2(VCC),
    .ADR3(USBRxValid_IBUF_2836),
    .O(N19_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hEDE8 ),
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead_mux00011  (
    .ADR0(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR1(\Host/USBRead_2835 ),
    .ADR2(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR3(N19),
    .O(\Host/USBRead_mux0001 )
  );
  X_FF #(
    .LOC ( "SLICE_X27Y37" ),
    .INIT ( 1'b1 ))
  \Host/USBRead  (
    .I(\Host/USBRead/DXMUX_10468 ),
    .CE(\Host/USBRead/CEINV_10449 ),
    .CLK(\Host/USBRead/CLKINV_10450 ),
    .SET(\Host/USBRead/FFX/SET ),
    .RST(GND),
    .O(\Host/USBRead_2835 )
  );
  X_INV #(
    .LOC ( "SLICE_X27Y37" ))
  \Host/USBRead/FFX/SETOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/USBRead/FFX/SET )
  );
  X_LUT4 #(
    .INIT ( 16'h2322 ),
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead_mux000048_SW0  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(\x86/State_FSM_FFd1_2907 ),
    .ADR2(N180_0),
    .ADR3(\x86/LastFrame_2923 ),
    .O(N197_pack_3)
  );
  X_LUT4 #(
    .INIT ( 16'hCDC8 ),
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead_mux000048  (
    .ADR0(\x86/State_FSM_FFd2_2904 ),
    .ADR1(\x86/ConfigRead_3183 ),
    .ADR2(\x86/State_FSM_FFd3_2906 ),
    .ADR3(N197),
    .O(\x86/ConfigRead_mux0000 )
  );
  X_FF #(
    .LOC ( "SLICE_X21Y39" ),
    .INIT ( 1'b0 ))
  \x86/ConfigRead  (
    .I(\x86/ConfigRead/DXMUX_10503 ),
    .CE(VCC),
    .CLK(\x86/ConfigRead/CLKINV_10487 ),
    .SET(GND),
    .RST(\x86/ConfigRead/FFX/RSTAND_10508 ),
    .O(\x86/ConfigRead_3183 )
  );
  X_INV #(
    .LOC ( "SLICE_X21Y39" ))
  \x86/ConfigRead/FFX/RSTAND  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/ConfigRead/FFX/RSTAND_10508 )
  );
  X_LUT4 #(
    .INIT ( 16'h00A0 ),
    .LOC ( "SLICE_X23Y57" ))
  \DB7/Accumulator_and00001  (
    .ADR0(PCI_Reset_IBUF_2742),
    .ADR1(VCC),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(\DB7/SClock_2839 ),
    .O(\DB7/Accumulator_and0000 )
  );
  X_LUT4 #(
    .INIT ( 16'h0505 ),
    .LOC ( "SLICE_X23Y57" ))
  \DB7/ShiftCount_mux0001<0>31_SW0  (
    .ADR0(\DB7/State_FSM_FFd2_3034 ),
    .ADR1(VCC),
    .ADR2(\DB7/State_FSM_FFd4_3097 ),
    .ADR3(VCC),
    .O(N174)
  );
  X_FF #(
    .LOC ( "SLICE_X34Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_10 (
    .I(\x86_Dlast<11>/DYMUX_10545 ),
    .CE(\x86_Dlast<11>/CEINV_10541 ),
    .CLK(\x86_Dlast<11>/CLKINV_10542 ),
    .SET(GND),
    .RST(\x86_Dlast<11>/SRINVNOT ),
    .O(x86_Dlast[10])
  );
  X_FF #(
    .LOC ( "SLICE_X34Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_11 (
    .I(\x86_Dlast<11>/DXMUX_10554 ),
    .CE(\x86_Dlast<11>/CEINV_10541 ),
    .CLK(\x86_Dlast<11>/CLKINV_10542 ),
    .SET(GND),
    .RST(\x86_Dlast<11>/SRINVNOT ),
    .O(x86_Dlast[11])
  );
  X_FF #(
    .LOC ( "SLICE_X51Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_12 (
    .I(\x86_Dlast<13>/DYMUX_10573 ),
    .CE(\x86_Dlast<13>/CEINV_10569 ),
    .CLK(\x86_Dlast<13>/CLKINV_10570 ),
    .SET(GND),
    .RST(\x86_Dlast<13>/SRINVNOT ),
    .O(x86_Dlast[12])
  );
  X_FF #(
    .LOC ( "SLICE_X51Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_13 (
    .I(\x86_Dlast<13>/DXMUX_10582 ),
    .CE(\x86_Dlast<13>/CEINV_10569 ),
    .CLK(\x86_Dlast<13>/CLKINV_10570 ),
    .SET(GND),
    .RST(\x86_Dlast<13>/SRINVNOT ),
    .O(x86_Dlast[13])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_14 (
    .I(\x86_Dlast<15>/DYMUX_10601 ),
    .CE(\x86_Dlast<15>/CEINV_10597 ),
    .CLK(\x86_Dlast<15>/CLKINV_10598 ),
    .SET(GND),
    .RST(\x86_Dlast<15>/SRINVNOT ),
    .O(x86_Dlast[14])
  );
  X_FF #(
    .LOC ( "SLICE_X50Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_15 (
    .I(\x86_Dlast<15>/DXMUX_10610 ),
    .CE(\x86_Dlast<15>/CEINV_10597 ),
    .CLK(\x86_Dlast<15>/CLKINV_10598 ),
    .SET(GND),
    .RST(\x86_Dlast<15>/SRINVNOT ),
    .O(x86_Dlast[15])
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X16Y38" ))
  x86_Dout_6_mux000021_SW0 (
    .ADR0(\DB7/Ready_2916 ),
    .ADR1(CBE_2_IBUF_2823),
    .ADR2(CBE_3_IBUF_2824),
    .ADR3(\DB7/Accumulator [6]),
    .O(N2111)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X16Y38" ))
  x86_Dout_3_mux000010_SW0 (
    .ADR0(\DB7/Ready_2916 ),
    .ADR1(\DB7/Accumulator [3]),
    .ADR2(CBE_3_IBUF_2824),
    .ADR3(CBE_2_IBUF_2823),
    .O(N209)
  );
  X_FF #(
    .LOC ( "SLICE_X19Y38" ),
    .INIT ( 1'b1 ))
  \x86/LastFrame  (
    .I(\x86/LastFrame/DYMUX_10649 ),
    .CE(VCC),
    .CLK(\x86/LastFrame/CLKINV_10646 ),
    .SET(\x86/LastFrame/FFY/SET ),
    .RST(GND),
    .O(\x86/LastFrame_2923 )
  );
  X_INV #(
    .LOC ( "SLICE_X19Y38" ))
  \x86/LastFrame/FFY/SETOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\x86/LastFrame/FFY/SET )
  );
  X_FF #(
    .LOC ( "SLICE_X25Y32" ),
    .INIT ( 1'b0 ))
  x86_Dlast_16 (
    .I(\x86_Dlast<17>/DYMUX_10666 ),
    .CE(\x86_Dlast<17>/CEINV_10662 ),
    .CLK(\x86_Dlast<17>/CLKINV_10663 ),
    .SET(GND),
    .RST(\x86_Dlast<17>/SRINVNOT ),
    .O(x86_Dlast[16])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y32" ),
    .INIT ( 1'b0 ))
  x86_Dlast_17 (
    .I(\x86_Dlast<17>/DXMUX_10675 ),
    .CE(\x86_Dlast<17>/CEINV_10662 ),
    .CLK(\x86_Dlast<17>/CLKINV_10663 ),
    .SET(GND),
    .RST(\x86_Dlast<17>/SRINVNOT ),
    .O(x86_Dlast[17])
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X14Y37" ))
  x86_Dout_2_mux000011_SW0 (
    .ADR0(CBE_2_IBUF_2823),
    .ADR1(CBE_3_IBUF_2824),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(\DB7/Accumulator [2]),
    .O(N207)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X14Y37" ))
  x86_Dout_7_mux000011_SW0 (
    .ADR0(CBE_2_IBUF_2823),
    .ADR1(\DB7/Accumulator [7]),
    .ADR2(\DB7/Ready_2916 ),
    .ADR3(CBE_3_IBUF_2824),
    .O(N205)
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X37Y33" ))
  \x86/IORead_and000118  (
    .ADR0(N50),
    .ADR1(N45),
    .ADR2(N521),
    .ADR3(N46),
    .O(\x86/IORead_and000118_10716 )
  );
  X_LUT4 #(
    .INIT ( 16'h0003 ),
    .LOC ( "SLICE_X28Y36" ))
  \x86/IORead_and000136  (
    .ADR0(VCC),
    .ADR1(ADEx_0_IBUF_2841),
    .ADR2(IDSel_IBUF_2834),
    .ADR3(ADEx_1_IBUF_2842),
    .O(\x86/IORead_and000136_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hDFFF ),
    .LOC ( "SLICE_X28Y36" ))
  \x86/IORead_and000161_SW0  (
    .ADR0(N571),
    .ADR1(N56),
    .ADR2(N58),
    .ADR3(\x86/IORead_and000136_3265 ),
    .O(N195)
  );
  X_LUT4 #(
    .INIT ( 16'h0004 ),
    .LOC ( "SLICE_X26Y38" ))
  \x86/IORead_and000161  (
    .ADR0(N195_0),
    .ADR1(N53),
    .ADR2(N49),
    .ADR3(N44),
    .O(\x86/IORead_and000161_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'hFBFF ),
    .LOC ( "SLICE_X26Y38" ))
  \x86/IORead_and000176_SW0  (
    .ADR0(N55),
    .ADR1(\x86/IORead_and000118_0 ),
    .ADR2(N54),
    .ADR3(\x86/IORead_and000161_3267 ),
    .O(N199)
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X24Y36" ))
  \x86/IORead_and000176  (
    .ADR0(N47),
    .ADR1(N199_0),
    .ADR2(N511),
    .ADR3(N48),
    .O(\x86/IORead_and0001_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h2F3F ),
    .LOC ( "SLICE_X24Y36" ))
  \x86/FSMActive_mux0000243_SW0  (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(\x86/FSMActive_mux0000220_0 ),
    .ADR2(CBE_1_IBUF_2822),
    .ADR3(\x86/IORead_and0001 ),
    .O(N168)
  );
  X_LUT4 #(
    .INIT ( 16'hB3B3 ),
    .LOC ( "SLICE_X26Y36" ))
  \Host/TxDone_not00011  (
    .ADR0(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR1(WriteToHost_3084),
    .ADR2(\Host/PuttingByte_FSM_FFd1_3180 ),
    .ADR3(VCC),
    .O(\Host/TxDone_not0001 )
  );
  X_LUT4 #(
    .INIT ( 16'h0010 ),
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData_mux0000<0>11  (
    .ADR0(N571),
    .ADR1(N591),
    .ADR2(N58),
    .ADR3(N56),
    .O(N14_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'hFCF0 ),
    .LOC ( "SLICE_X28Y35" ))
  \x86/ConfigData_mux0000<8>1  (
    .ADR0(VCC),
    .ADR1(N2_0),
    .ADR2(N14),
    .ADR3(\x86/ConfigData [9]),
    .O(\x86/ConfigData_mux0000 [8])
  );
  X_FF #(
    .LOC ( "SLICE_X28Y35" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_9  (
    .I(\x86/ConfigData<9>/DXMUX_10831 ),
    .CE(\x86/ConfigData<9>/CEINV_10814 ),
    .CLK(\x86/ConfigData<9>/CLKINV_10815 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [9])
  );
  X_LUT4 #(
    .INIT ( 16'h23AC ),
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData_mux0000<17>_SW0  (
    .ADR0(\x86/ConfigData [0]),
    .ADR1(N591),
    .ADR2(N56),
    .ADR3(N58),
    .O(N161_pack_3)
  );
  X_LUT4 #(
    .INIT ( 16'hAAF0 ),
    .LOC ( "SLICE_X17Y52" ))
  \x86/ConfigData_mux0000<17>  (
    .ADR0(\x86/ConfigData [0]),
    .ADR1(VCC),
    .ADR2(N161),
    .ADR3(N571),
    .O(\x86/ConfigData_mux0000 [17])
  );
  X_FF #(
    .LOC ( "SLICE_X17Y52" ),
    .INIT ( 1'b0 ))
  \x86/ConfigData_0  (
    .I(\x86/ConfigData<0>/DXMUX_10864 ),
    .CE(\x86/ConfigData<0>/CEINV_10847 ),
    .CLK(\x86/ConfigData<0>/CLKINV_10848 ),
    .SET(GND),
    .RST(GND),
    .O(\x86/ConfigData [0])
  );
  X_LUT4 #(
    .INIT ( 16'hFFEE ),
    .LOC ( "SLICE_X19Y57" ))
  \DB7/Shifting_mux000010_SW0  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(\DB7/State_FSM_FFd1_2902 ),
    .ADR2(VCC),
    .ADR3(\DB7/State_FSM_FFd5_2927 ),
    .O(N146)
  );
  X_LUT4 #(
    .INIT ( 16'hFCFD ),
    .LOC ( "SLICE_X19Y57" ))
  \DB7/StrobeTimer_mux0000<1>41_SW0  (
    .ADR0(\DB7/State_FSM_FFd3_2981 ),
    .ADR1(\DB7/State_FSM_FFd4_3097 ),
    .ADR2(\DB7/State_FSM_FFd2_3034 ),
    .ADR3(\DB7/State_FSM_FFd1_2902 ),
    .O(N126)
  );
  X_LUT4 #(
    .INIT ( 16'hF5A0 ),
    .LOC ( "SLICE_X18Y50" ))
  \x86/Dout<0>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(VCC),
    .ADR2(\x86/ConfigData [0]),
    .ADR3(x86_Dout[0]),
    .O(\x86/Dout [0])
  );
  X_LUT4 #(
    .INIT ( 16'hACAC ),
    .LOC ( "SLICE_X18Y50" ))
  \x86/Dout<3>1  (
    .ADR0(\x86/ConfigData [3]),
    .ADR1(x86_Dout[3]),
    .ADR2(\x86/ConfigRead_3183 ),
    .ADR3(VCC),
    .O(\x86/Dout [3])
  );
  X_LUT4 #(
    .INIT ( 16'hB8B8 ),
    .LOC ( "SLICE_X19Y50" ))
  \x86/Dout<2>1  (
    .ADR0(\x86/ConfigData [2]),
    .ADR1(\x86/ConfigRead_3183 ),
    .ADR2(x86_Dout[2]),
    .ADR3(VCC),
    .O(\x86/Dout [2])
  );
  X_LUT4 #(
    .INIT ( 16'hF3C0 ),
    .LOC ( "SLICE_X19Y50" ))
  \x86/Dout<4>1  (
    .ADR0(VCC),
    .ADR1(\x86/ConfigRead_3183 ),
    .ADR2(\x86/ConfigData [4]),
    .ADR3(x86_Dout[4]),
    .O(\x86/Dout [4])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y46" ),
    .INIT ( 1'b0 ))
  DB7_Dout_0 (
    .I(\DB7_Dout<1>/DYMUX_10950 ),
    .CE(\DB7_Dout<1>/CEINV_10947 ),
    .CLK(\DB7_Dout<1>/CLKINV_10948 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[0])
  );
  X_FF #(
    .LOC ( "SLICE_X25Y46" ),
    .INIT ( 1'b0 ))
  DB7_Dout_1 (
    .I(\DB7_Dout<1>/DXMUX_10956 ),
    .CE(\DB7_Dout<1>/CEINV_10947 ),
    .CLK(\DB7_Dout<1>/CLKINV_10948 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[1])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y45" ),
    .INIT ( 1'b0 ))
  DB7_Dout_2 (
    .I(\DB7_Dout<3>/DYMUX_10970 ),
    .CE(\DB7_Dout<3>/CEINV_10967 ),
    .CLK(\DB7_Dout<3>/CLKINV_10968 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[2])
  );
  X_FF #(
    .LOC ( "SLICE_X23Y45" ),
    .INIT ( 1'b0 ))
  DB7_Dout_3 (
    .I(\DB7_Dout<3>/DXMUX_10976 ),
    .CE(\DB7_Dout<3>/CEINV_10967 ),
    .CLK(\DB7_Dout<3>/CLKINV_10968 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[3])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y44" ),
    .INIT ( 1'b0 ))
  DB7_Dout_4 (
    .I(\DB7_Dout<5>/DYMUX_10990 ),
    .CE(\DB7_Dout<5>/CEINV_10987 ),
    .CLK(\DB7_Dout<5>/CLKINV_10988 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[4])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y44" ),
    .INIT ( 1'b0 ))
  DB7_Dout_5 (
    .I(\DB7_Dout<5>/DXMUX_10996 ),
    .CE(\DB7_Dout<5>/CEINV_10987 ),
    .CLK(\DB7_Dout<5>/CLKINV_10988 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[5])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y46" ),
    .INIT ( 1'b0 ))
  DB7_Dout_6 (
    .I(\DB7_Dout<7>/DYMUX_11010 ),
    .CE(\DB7_Dout<7>/CEINV_11007 ),
    .CLK(\DB7_Dout<7>/CLKINV_11008 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[6])
  );
  X_FF #(
    .LOC ( "SLICE_X24Y46" ),
    .INIT ( 1'b0 ))
  DB7_Dout_7 (
    .I(\DB7_Dout<7>/DXMUX_11016 ),
    .CE(\DB7_Dout<7>/CEINV_11007 ),
    .CLK(\DB7_Dout<7>/CLKINV_11008 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[7])
  );
  X_LUT4 #(
    .INIT ( 16'hEE44 ),
    .LOC ( "SLICE_X20Y45" ))
  \x86/Dout<5>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(x86_Dout[5]),
    .ADR2(VCC),
    .ADR3(\x86/ConfigData [5]),
    .O(\x86/Dout [5])
  );
  X_LUT4 #(
    .INIT ( 16'hF5A0 ),
    .LOC ( "SLICE_X20Y45" ))
  \x86/Dout<8>1  (
    .ADR0(\x86/ConfigRead_3183 ),
    .ADR1(VCC),
    .ADR2(\x86/ConfigData [8]),
    .ADR3(x86_Dout[8]),
    .O(\x86/Dout [8])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y45" ),
    .INIT ( 1'b0 ))
  DB7_Dout_8 (
    .I(\DB7_Dout<9>/DYMUX_11054 ),
    .CE(\DB7_Dout<9>/CEINV_11051 ),
    .CLK(\DB7_Dout<9>/CLKINV_11052 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[8])
  );
  X_FF #(
    .LOC ( "SLICE_X22Y45" ),
    .INIT ( 1'b0 ))
  DB7_Dout_9 (
    .I(\DB7_Dout<9>/DXMUX_11060 ),
    .CE(\DB7_Dout<9>/CEINV_11051 ),
    .CLK(\DB7_Dout<9>/CLKINV_11052 ),
    .SET(GND),
    .RST(GND),
    .O(DB7_Dout[9])
  );
  X_LUT4 #(
    .INIT ( 16'hEE22 ),
    .LOC ( "SLICE_X29Y36" ))
  \x86/Dout<9>1  (
    .ADR0(x86_Dout[9]),
    .ADR1(\x86/ConfigRead_3183 ),
    .ADR2(VCC),
    .ADR3(\x86/ConfigData [9]),
    .O(\x86/Dout [9])
  );
  X_FF #(
    .LOC ( "SLICE_X0Y35" ),
    .INIT ( 1'b0 ))
  x86_Dlast_0 (
    .I(\x86_Dlast<1>/DYMUX_11088 ),
    .CE(\x86_Dlast<1>/CEINV_11084 ),
    .CLK(\x86_Dlast<1>/CLKINV_11085 ),
    .SET(GND),
    .RST(\x86_Dlast<1>/SRINVNOT ),
    .O(x86_Dlast[0])
  );
  X_FF #(
    .LOC ( "SLICE_X0Y35" ),
    .INIT ( 1'b0 ))
  x86_Dlast_1 (
    .I(\x86_Dlast<1>/DXMUX_11097 ),
    .CE(\x86_Dlast<1>/CEINV_11084 ),
    .CLK(\x86_Dlast<1>/CLKINV_11085 ),
    .SET(GND),
    .RST(\x86_Dlast<1>/SRINVNOT ),
    .O(x86_Dlast[1])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y39" ),
    .INIT ( 1'b0 ))
  x86_Dlast_2 (
    .I(\x86_Dlast<3>/DYMUX_11116 ),
    .CE(\x86_Dlast<3>/CEINV_11112 ),
    .CLK(\x86_Dlast<3>/CLKINV_11113 ),
    .SET(GND),
    .RST(\x86_Dlast<3>/SRINVNOT ),
    .O(x86_Dlast[2])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y39" ),
    .INIT ( 1'b1 ))
  x86_Dlast_3 (
    .I(\x86_Dlast<3>/DXMUX_11125 ),
    .CE(\x86_Dlast<3>/CEINV_11112 ),
    .CLK(\x86_Dlast<3>/CLKINV_11113 ),
    .SET(\x86_Dlast<3>/SRINVNOT ),
    .RST(GND),
    .O(x86_Dlast[3])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y33" ),
    .INIT ( 1'b1 ))
  x86_Dlast_4 (
    .I(\x86_Dlast<5>/DYMUX_11143 ),
    .CE(\x86_Dlast<5>/CEINV_11139 ),
    .CLK(\x86_Dlast<5>/CLKINV_11140 ),
    .SET(\x86_Dlast<5>/SRINVNOT ),
    .RST(GND),
    .O(x86_Dlast[4])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y33" ),
    .INIT ( 1'b0 ))
  x86_Dlast_5 (
    .I(\x86_Dlast<5>/DXMUX_11151 ),
    .CE(\x86_Dlast<5>/CEINV_11139 ),
    .CLK(\x86_Dlast<5>/CLKINV_11140 ),
    .SET(GND),
    .RST(\x86_Dlast<5>/SRINVNOT ),
    .O(x86_Dlast[5])
  );
  X_FF #(
    .LOC ( "SLICE_X0Y38" ),
    .INIT ( 1'b0 ))
  x86_Dlast_6 (
    .I(\x86_Dlast<7>/DYMUX_11170 ),
    .CE(\x86_Dlast<7>/CEINV_11166 ),
    .CLK(\x86_Dlast<7>/CLKINV_11167 ),
    .SET(GND),
    .RST(\x86_Dlast<7>/SRINVNOT ),
    .O(x86_Dlast[6])
  );
  X_FF #(
    .LOC ( "SLICE_X0Y38" ),
    .INIT ( 1'b0 ))
  x86_Dlast_7 (
    .I(\x86_Dlast<7>/DXMUX_11179 ),
    .CE(\x86_Dlast<7>/CEINV_11166 ),
    .CLK(\x86_Dlast<7>/CLKINV_11167 ),
    .SET(GND),
    .RST(\x86_Dlast<7>/SRINVNOT ),
    .O(x86_Dlast[7])
  );
  X_FF #(
    .LOC ( "SLICE_X29Y35" ),
    .INIT ( 1'b1 ))
  x86_Dlast_8 (
    .I(\x86_Dlast<9>/DYMUX_11198 ),
    .CE(\x86_Dlast<9>/CEINV_11194 ),
    .CLK(\x86_Dlast<9>/CLKINV_11195 ),
    .SET(\x86_Dlast<9>/SRINVNOT ),
    .RST(GND),
    .O(x86_Dlast[8])
  );
  X_FF #(
    .LOC ( "SLICE_X29Y35" ),
    .INIT ( 1'b1 ))
  x86_Dlast_9 (
    .I(\x86_Dlast<9>/DXMUX_11206 ),
    .CE(\x86_Dlast<9>/CEINV_11194 ),
    .CLK(\x86_Dlast<9>/CLKINV_11195 ),
    .SET(\x86_Dlast<9>/SRINVNOT ),
    .RST(GND),
    .O(x86_Dlast[9])
  );
  X_LUT4 #(
    .INIT ( 16'hC888 ),
    .LOC ( "SLICE_X35Y49" ))
  LEDShift_and000033 (
    .ADR0(LEDShift_and000020_0),
    .ADR1(PCI_Reset_IBUF_2742),
    .ADR2(LEDIndex_and0003),
    .ADR3(LEDShift_and00002),
    .O(LEDShift_and0000)
  );
  X_LUT4 #(
    .INIT ( 16'hFFEF ),
    .LOC ( "SLICE_X18Y59" ))
  \DB7/StrobeOut_mux000123_SW0  (
    .ADR0(SSAck_IBUF_2768),
    .ADR1(\DB7/StrobeTimer [7]),
    .ADR2(\DB7/N7 ),
    .ADR3(\DB7/StrobeTimer [6]),
    .O(N144)
  );
  X_LUT4 #(
    .INIT ( 16'h0302 ),
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite_mux0000_SW0  (
    .ADR0(\Host/RxBufferFull_2988 ),
    .ADR1(\Host/GettingByte_FSM_FFd2_3086 ),
    .ADR2(\Host/GettingByte_FSM_FFd1_3087 ),
    .ADR3(USBRxValid_IBUF_2836),
    .O(N8_pack_2)
  );
  X_LUT4 #(
    .INIT ( 16'h8F8E ),
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite_mux0000  (
    .ADR0(\Host/USBWrite_2826 ),
    .ADR1(\Host/PuttingByte_FSM_FFd1_3180 ),
    .ADR2(\Host/PuttingByte_FSM_FFd2_3179 ),
    .ADR3(N8),
    .O(\Host/USBWrite_mux0000_11262 )
  );
  X_FF #(
    .LOC ( "SLICE_X29Y37" ),
    .INIT ( 1'b1 ))
  \Host/USBWrite  (
    .I(\Host/USBWrite/DXMUX_11265 ),
    .CE(VCC),
    .CLK(\Host/USBWrite/CLKINV_11249 ),
    .SET(\Host/USBWrite/FFX/SET ),
    .RST(GND),
    .O(\Host/USBWrite_2826 )
  );
  X_INV #(
    .LOC ( "SLICE_X29Y37" ))
  \Host/USBWrite/FFX/SETOR  (
    .I(PCI_Reset_IBUF_2742),
    .O(\Host/USBWrite/FFX/SET )
  );
  X_LUT4 #(
    .INIT ( 16'hD8D8 ),
    .LOC ( "SLICE_X35Y58" ))
  \DB7/SDO472  (
    .ADR0(\DB7/Diagnose_3254 ),
    .ADR1(\DB7/DiagData_3227 ),
    .ADR2(N191),
    .ADR3(VCC),
    .O(SSDOut_OBUF_11280)
  );
  X_LUT4 #(
    .INIT ( 16'h2000 ),
    .LOC ( "SLICE_X23Y38" ))
  x86_to_DB7_cmp_eq00001 (
    .ADR0(CBE_3_IBUF_2824),
    .ADR1(CBE_0_IBUF_2821),
    .ADR2(CBE_2_IBUF_2823),
    .ADR3(CBE_1_IBUF_2822),
    .O(x86_to_DB7_cmp_eq0000_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X23Y38" ))
  DB7_Address_not00011 (
    .ADR0(\DB7/Ready_2916 ),
    .ADR1(x86_to_DB7_cmp_eq0000),
    .ADR2(x86_to_DB7_and0001),
    .ADR3(LEDShift_and00002),
    .O(DB7_Address_not0001)
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X19Y33" ))
  \Host/RCount<0>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\Host/RCount [1]),
    .O(\Host/RCount<0>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hAAAA ),
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/F/X_LUT4  (
    .ADR0(\Host/RCount [2]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/RCount<2>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F0 ),
    .LOC ( "SLICE_X19Y34" ))
  \Host/RCount<2>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\Host/RCount [3]),
    .ADR3(VCC),
    .O(\Host/RCount<2>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\Host/RCount [4]),
    .O(\Host/RCount<4>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X19Y35" ))
  \Host/RCount<4>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(\Host/RCount [5]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/RCount<4>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X19Y36" ))
  \Host/RCount<6>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\Host/RCount [6]),
    .O(\Host/RCount<6>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hCCCC ),
    .LOC ( "SLICE_X35Y30" ))
  \Host/WCount<0>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(\Host/WCount [1]),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/WCount<0>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hAAAA ),
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/F/X_LUT4  (
    .ADR0(\Host/WCount [2]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/WCount<2>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X35Y31" ))
  \Host/WCount<2>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\Host/WCount [3]),
    .O(\Host/WCount<2>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hAAAA ),
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/F/X_LUT4  (
    .ADR0(\Host/WCount [4]),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Host/WCount<4>/F )
  );
  X_LUT4 #(
    .INIT ( 16'hF0F0 ),
    .LOC ( "SLICE_X35Y32" ))
  \Host/WCount<4>/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(\Host/WCount [5]),
    .ADR3(VCC),
    .O(\Host/WCount<4>/G )
  );
  X_LUT4 #(
    .INIT ( 16'hFF00 ),
    .LOC ( "SLICE_X35Y33" ))
  \Host/WCount<6>/F/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(\Host/WCount [6]),
    .O(\Host/WCount<6>/F )
  );
  X_BUF #(
    .LOC ( "PAD30" ))
  \SSDOut/OUTPUT/OFF/OMUX  (
    .I(SSDOut_OBUF_11280),
    .O(\SSDOut/O )
  );
  X_BUF #(
    .LOC ( "PAD57" ))
  \USBWrite/OUTPUT/OFF/OMUX  (
    .I(\Host/USBWrite_2826 ),
    .O(\USBWrite/O )
  );
  X_BUF #(
    .LOC ( "PAD42" ))
  \SSAddr/OUTPUT/OFF/OMUX  (
    .I(\DB7/AddressPhase_2827 ),
    .O(\SSAddr/O )
  );
  X_INV #(
    .LOC ( "PAD25" ))
  \TRdy/OUTPUT/TFF/TMUX  (
    .I(\x86/FSMActive_2830 ),
    .O(\TRdy/T )
  );
  X_BUF #(
    .LOC ( "PAD25" ))
  \TRdy/OUTPUT/OFF/OMUX  (
    .I(\x86/TRDY_or0000 ),
    .O(\TRdy/O )
  );
  X_INV #(
    .LOC ( "PAD47" ))
  \DData/OUTPUT/TFF/TMUX  (
    .I(LEDShift_2831),
    .O(\DData/T )
  );
  X_BUF #(
    .LOC ( "PAD47" ))
  \DData/OUTPUT/OFF/OMUX  (
    .I(\_varindex0000/F6MUX_4255 ),
    .O(\DData/O )
  );
  X_INV #(
    .LOC ( "PAD24" ))
  \DevSel/OUTPUT/TFF/TMUX  (
    .I(\x86/FSMActive_2830 ),
    .O(\DevSel/T )
  );
  X_INV #(
    .LOC ( "PAD24" ))
  \DevSel/OUTPUT/OFF/OMUX  (
    .I(\x86/Selected_2833 ),
    .O(\DevSel/O )
  );
  X_BUF #(
    .LOC ( "PAD64" ))
  \USBRead/OUTPUT/OFF/OMUX  (
    .I(\Host/USBRead_2835 ),
    .O(\USBRead/O )
  );
  X_INV #(
    .LOC ( "PAD86" ))
  \LED/OUTPUT/OFF/OMUX  (
    .I(LEDOut_2770),
    .O(\LED/O )
  );
  X_BUF #(
    .LOC ( "PAD43" ))
  \SSClock/OUTPUT/OFF/OMUX  (
    .I(\DB7/SClock_2839 ),
    .O(\SSClock/O )
  );
  X_BUF #(
    .LOC ( "PAD46" ))
  \DClock/OUTPUT/OFF/OMUX  (
    .I(DClock_OBUF_7507),
    .O(\DClock/O )
  );
  X_BUF #(
    .LOC ( "PAD31" ))
  \SSStrobe/OUTPUT/OFF/OMUX  (
    .I(\DB7/StrobeOut_2844 ),
    .O(\SSStrobe/O )
  );
  X_BUF #(
    .LOC ( "PAD27" ))
  \Probe/OUTPUT/OFF/OMUX  (
    .I(\Host/RxData [0]),
    .O(\Probe/O )
  );
  X_BUF #(
    .LOC ( "PAD75" ))
  \USBData<0>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<0>/T )
  );
  X_BUF #(
    .LOC ( "PAD75" ))
  \USBData<0>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[0]),
    .O(\USBData<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD74" ))
  \USBData<1>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<1>/T )
  );
  X_BUF #(
    .LOC ( "PAD74" ))
  \USBData<1>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[1]),
    .O(\USBData<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD72" ))
  \USBData<2>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<2>/T )
  );
  X_BUF #(
    .LOC ( "PAD72" ))
  \USBData<2>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[2]),
    .O(\USBData<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD70" ))
  \USBData<3>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<3>/T )
  );
  X_BUF #(
    .LOC ( "PAD70" ))
  \USBData<3>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[3]),
    .O(\USBData<3>/O )
  );
  X_BUF #(
    .LOC ( "PAD69" ))
  \USBData<4>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<4>/T )
  );
  X_BUF #(
    .LOC ( "PAD69" ))
  \USBData<4>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[4]),
    .O(\USBData<4>/O )
  );
  X_INV #(
    .LOC ( "PAD20" ))
  \AD<0>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<0>/T )
  );
  X_BUF #(
    .LOC ( "PAD20" ))
  \AD<0>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [0]),
    .O(\AD<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD68" ))
  \USBData<5>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<5>/T )
  );
  X_BUF #(
    .LOC ( "PAD68" ))
  \USBData<5>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[5]),
    .O(\USBData<5>/O )
  );
  X_INV #(
    .LOC ( "PAD19" ))
  \AD<1>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<1>/T )
  );
  X_BUF #(
    .LOC ( "PAD19" ))
  \AD<1>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [1]),
    .O(\AD<1>/O )
  );
  X_INV #(
    .LOC ( "PAD63" ))
  \AD<10>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<10>/T )
  );
  X_BUF #(
    .LOC ( "PAD63" ))
  \AD<10>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [10]),
    .O(\AD<10>/O )
  );
  X_BUF #(
    .LOC ( "PAD67" ))
  \USBData<6>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<6>/T )
  );
  X_BUF #(
    .LOC ( "PAD67" ))
  \USBData<6>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[6]),
    .O(\USBData<6>/O )
  );
  X_INV #(
    .LOC ( "PAD18" ))
  \AD<2>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<2>/T )
  );
  X_BUF #(
    .LOC ( "PAD18" ))
  \AD<2>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [2]),
    .O(\AD<2>/O )
  );
  X_INV #(
    .LOC ( "PAD62" ))
  \AD<11>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<11>/T )
  );
  X_BUF #(
    .LOC ( "PAD62" ))
  \AD<11>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [11]),
    .O(\AD<11>/O )
  );
  X_BUF #(
    .LOC ( "PAD65" ))
  \USBData<7>/OUTPUT/TFF/TMUX  (
    .I(\Host/USBDir_2847 ),
    .O(\USBData<7>/T )
  );
  X_BUF #(
    .LOC ( "PAD65" ))
  \USBData<7>/OUTPUT/OFF/OMUX  (
    .I(DataToHost[7]),
    .O(\USBData<7>/O )
  );
  X_INV #(
    .LOC ( "PAD15" ))
  \AD<3>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<3>/T )
  );
  X_BUF #(
    .LOC ( "PAD15" ))
  \AD<3>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [3]),
    .O(\AD<3>/O )
  );
  X_INV #(
    .LOC ( "PAD60" ))
  \AD<12>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<12>/T )
  );
  X_BUF #(
    .LOC ( "PAD60" ))
  \AD<12>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [12]),
    .O(\AD<12>/O )
  );
  X_INV #(
    .LOC ( "PAD14" ))
  \AD<4>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<4>/T )
  );
  X_BUF #(
    .LOC ( "PAD14" ))
  \AD<4>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [4]),
    .O(\AD<4>/O )
  );
  X_INV #(
    .LOC ( "PAD59" ))
  \AD<13>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<13>/T )
  );
  X_BUF #(
    .LOC ( "PAD59" ))
  \AD<13>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [13]),
    .O(\AD<13>/O )
  );
  X_INV #(
    .LOC ( "PAD5" ))
  \AD<5>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<5>/T )
  );
  X_BUF #(
    .LOC ( "PAD5" ))
  \AD<5>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [5]),
    .O(\AD<5>/O )
  );
  X_INV #(
    .LOC ( "PAD49" ))
  \AD<14>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<14>/T )
  );
  X_BUF #(
    .LOC ( "PAD49" ))
  \AD<14>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [14]),
    .O(\AD<14>/O )
  );
  X_INV #(
    .LOC ( "PAD4" ))
  \AD<6>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<6>/T )
  );
  X_BUF #(
    .LOC ( "PAD4" ))
  \AD<6>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [6]),
    .O(\AD<6>/O )
  );
  X_INV #(
    .LOC ( "PAD48" ))
  \AD<15>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<15>/T )
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  \AD<15>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [15]),
    .O(\AD<15>/O )
  );
  X_INV #(
    .LOC ( "PAD2" ))
  \AD<7>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<7>/T )
  );
  X_BUF #(
    .LOC ( "PAD2" ))
  \AD<7>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [7]),
    .O(\AD<7>/O )
  );
  X_INV #(
    .LOC ( "PAD92" ))
  \AD<16>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<16>/T )
  );
  X_BUF #(
    .LOC ( "PAD92" ))
  \AD<16>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [16]),
    .O(\AD<16>/O )
  );
  X_INV #(
    .LOC ( "PAD106" ))
  \AD<8>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<8>/T )
  );
  X_BUF #(
    .LOC ( "PAD106" ))
  \AD<8>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [8]),
    .O(\AD<8>/O )
  );
  X_INV #(
    .LOC ( "PAD136" ))
  \AD<17>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<17>/T )
  );
  X_BUF #(
    .LOC ( "PAD136" ))
  \AD<17>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [17]),
    .O(\AD<17>/O )
  );
  X_INV #(
    .LOC ( "PAD105" ))
  \AD<9>/OUTPUT/TFF/TMUX  (
    .I(\x86/BusOutEnable_2858 ),
    .O(\AD<9>/T )
  );
  X_BUF #(
    .LOC ( "PAD105" ))
  \AD<9>/OUTPUT/OFF/OMUX  (
    .I(\x86/Dout [9]),
    .O(\AD<9>/O )
  );
  X_LUT4 #(
    .INIT ( 16'hFFFF ),
    .LOC ( "SLICE_X13Y34" ))
  \N141/G/X_LUT4  (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\N141/G )
  );
  X_ZERO   NlwBlock_DC7_PCI_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_DC7_PCI_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

