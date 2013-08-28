(* 	Version record 	- 	MCC Forth *)	string version " 5.41 - August 2013   " version (version) !

(*
2013-08-12	5.41 ~ Forth in, inw and ind redefined to use PCI_in/w/d
2013-08-02	5.40 + USB capable : Fixes to USBPut: call PCI_in to deal with PCI parity error +FTH-PKT DB6 comms light write was interfering with USB port write
2013-05-16	5.39 # DC7-INT::OneStep Old phase not rounded correctly when using Rounding = cl=0, resulting in new phase never being sent when stepping backwards.
2013-04-22	5.38 # CheckVerticalRange reporting fixed - does not throw [Index] error in TwoSpeedMove
2013-03-20	5.37 # POSITIONS.FTH: Correction to 'shutdown' to set PositionsValid? bit POSITION_FILE_EXISTS.
2012-08-16	5.36 + XYZV1.2 and USD1.0_12Volt for ICR upgrade
2012-08-13	5.35 # Forth-7.exe : DC7-INT.ASM::Dwell - Backlash compensation now done at VStart
2012-06-05	5.34 # RezeroLS to NOT return error if rezero on power-up.
2012-05-29	5.33 # Correction to SaveAdjustData to save Bearing Pillar data.
2012-04-17	5.32 ~ RezeroLS returns errors. Expects FP V3.04.250 or later. Definition of hedgehog moved to this file, to avoid bricking if hardware.fth fails to load.
2012-04-04	5.31 + Forth-7.exe : Full 255 bytes per packet data output packet.
2012-03-30	5.30	+ Improved efficiency of Update to update motor positions with fewer transactions. Requires improved FP.MCCControl.ExecuteMCCInstruction
2012-03-14	5.29	+ Many improvements: TEST.lights,  DUMPHARD.dbdump, .xyvdump, .usddump, DC7? + all dump functions label themselves. NoMove for testing.
2012-02-22	5.28	# University of Exeter problem: USD-CFG.FTH USD.SetProperties corrected to NOT overwrite channel map. ~ DBdump for automatic dumping of MCC data
2012-01-23	5.27	~ V axis vertical offset now read from V value, not duplicated from Z value.
2012-01-19	5.26	~ All MCC7 XYZV accelerations reduced to X=700, Y=700. Forth.exe.formInputPacket ignores Win7 PNP $F8 discovery character.
2011-12-08	5.25 # USDMOVES.FTH USDs.RezeroLS reports zero position to Front Panel following position reset. TEST.FTH corrected for frceate _CAL.DAT error.
2011-12-01	5.24 ~ FindIndexPositions no longer rezeroes non-opto axes. Reduced XYZV Y and X accelerations in XYZ-CFG as a result of belt testing.
2011-11-29	5.23 ~ All XYZV start speeds reduced to 10.0mm/s and MCC6 accelerations to 500mm/s/s. BackOff distance reduced to 1 cycle.
2011-11-09	5.22 ~ finit called in <quit> in attempt to cure F7 problems on Marc Deller/NHRF machines. #MoveToStop leaves stack clean
2011-11-07	5.21 ~ XYZ-CFG.FTH : XYZV speeds reduced to 150.0, 110.0, 100.0, 100.0. XY accelerations down 800->700mm/s
2011-11-04	5.20 ~ TestAxes corrected to ignore AxisOffsets stored in ADJUST.DAT from old C-FORTH rezero technique.
2011-10-11	5.19 + doglegs command. TestAxes does angles in XY. XY accelerations increased to 700mm/s for MCC6 systems. Speed optimizations for limit switch reading on MCC7. 
2011-10-06	5.18 ~ Reverted to dogleg moves for plateloader due to wobble seen - mechanical resonance for large x/y ratio moves. Increased accelerations in XYZ-CFG
2011-09-13	5.17 # Forth.exe : Logic error fixed in DC7-ACT.proportional_move - StepsToDo was not being incremented for StartTime=0  ie v. small moves
2011-09-08	5.16 # Forth.exe :Corrections to acceleration algorithm and PhaseOffset in Get/SetPosition and MoveTo for slow MCCs
2011-07-06	5.15 # Forth.exe :Corrections to stepping calculations for very small distances. SyringeMove now reports sweep movements.
2011-06-30	5.14 # XYZMOVES.RezeroPLOnFly modified for FTH7 opto indexing mechanism. Stores distance to move rather than absolute target position
2011-06-28	5.13 # Forth.exe.ACT-DB7. Intercepted all div0 errors caused by small moves.
2011-06-27	5.12 # ACT-DB7. Fixed weird noise heard at Scripps caused by div0 error in proportional mov acceleration calculations
2011-06-15	5.11 # USDs.RezeroLS stack cleanup.
2011-06-13	5.10 # DC7/DB7 support with parity checking workaraound. Counter introduced into CTRL.ASM PCI_ind to prevent infinite loop reading PCI in absence of valid DC7
2011-05-21	5.09 ~ Timebase set to 0.0001. Small MCC7 changes.
2011-03-18	5.08 ~ XYZ-CFG: X & Y axes speeds and accelerations reduced for smoothness. DUMPHARD: mno 1- Motor correction
2011-03-11	5.07 # Timer interrupt corrected to keep time. USD-CFG USD2 MaxSpeed lowered to 6mm/s
2011-03-02	5.06 ~ RezeroV redefined to do nothing for Nanos, # FindIndexPositions
2011-03-01	5.05 + Universal TEST.FTH for XYZV and Nano
2011-02-28	5.04 + lenz, endz, strchrz, str-, startswithn, strstrn, match*, getwild. ~ Vastly improved vlist etc with wildcards. 
2011-01-15	5.03 + USD-MOVES.FTH, XYZ-MOVES.FTH, POSITION.FTH  - separating basic USD and PlateLoader functions from MOVES, STEPPER
2010-12-07	5.02 + MCC-CFG.FTH, USD-CFG.FTH, XYZ-CFG.FTH  - new hardware format
2010-09-22	5.01 # Corrections to deceleration on STOP, and proportional move.
2010-09-08	5.00 + FORTH-7.EXE : Constant timebase stepping, with acceleration etc.; USD1.0/2.0/2.1 with LS syringe rezeroing, DC7/DB7 support.

2010-08-09	Version 04.40	// # FTH-ALU.ASM.make_digit Lcase/Ucase algorithm corrected
2010-08-07	Version 04.39	// + Syringe LS Rezero - initially in own file USD-LS.FTH. MOVES.FTH correction in MoveToStop. Was leaving mno on stack. + >bit 2^ etc in c-forth
2010-07-29	Version 04.38	// ~ ROMFORTH.ASM: DB6 detection by polling status ports $321/29/31 after write of 0 to motor port, for  READY bit transition.
2010-06-30	Version 04.37	// -  Version records pre Version 3.00 removed.
2010-05-13	Version 04.36	// + Stepper.ldump for identifying large offset seen at Scripps.							See 4.17
2010-03-28	Version 04.35	//  Run-in : BallScrew and LeadScrew definitions. TEST.FTH Backlash testing of ballscrew.			USD. unique to 4.3x
2010-03-15	Version 04.34	// + More file functions : GetCurDrv, GetCurDir, GetCurrentFolder. TypeFile and SendFile. dir overhauled.		Unique to 4.3x
2010-01-29	Version 04.33	// ~ Improvement to _fip to clear RSDump data for ONLY the axes to be checked.				See 4.15
2009-12-31	Version 04.32	// ~ Improvements to SaveMotorPositions + _spv in C-FORTH, SetPositionsValid redefined in STEPPER.FTH.	See 4.14
2009-12-04	Version 04.31	// + TEST.FTH jog function greatly improved.									See 4.13
2009-12-04	Version 04.30	//  FTH-FILE.ASM : subsumed most file handling from FILES.FTH; STEPPER.FTH : PositionsValid? logic changed and POSITIONS.DAT now deleted on first move.

Version 24 above

2011-03-19	4.22 + Function stacking display 
2011-02-09	4.21 + inPCI macro to handle PCI parity checking.
2010-11-25	4.20 # Corrections to format and lprint
2010-11-02	4.19	# GetCurrent + DB6 write data checking


Bifurcation V.24

2010-08-19	4.18 + Run-in was setting accelerationTime to 8. Removed..
2010-05-13	4.17 + Stepper.ldump for identifying large offset seen at Scripps.
2010-02-16	4.16	# Fix to fredate in FTH-FILES.ASM.
2010-01-29	4.15	~ Improvement to _fip to clear RSDump data for ONLY the axes to be checked.
2009-12-31	4.14	~ Improvements to SaveMotorPositions + _spv in C-FORTH, SetPositionsValid redefined in STEPPER.FTH
2009-12-04	4.13	+ TEST.FTH jog function greatly improved.
2009-12-04	4.12	+ FTH-FILE.ASM : subsumed most file handling from FILES.FTH; STEPPER.FTH : PositionsValid? logic changed and POSITIONS.DAT now deleted on first move.

2009-11-24	4.11	+ MOVES.FTH: TestAxes - automatically determines maximum plateloader motor speeds. +P command returned for AxisCalibrate.+Test.fth. +CalibrateX/Y/Z/V
2009-09-22	4.10 # @AxisLengthoffset bug - incorrectly returning -1 index for V axis in case of Nano. rezeroLS improved. ltof bug fixed.
2009-09-15	4.09 + Single point Z axis correction, correcting of obsolete ADJUST.DAT files, conversion of FindIndexPositions to all fp, + SetZCorrection for Transferdrop
2009-07-13	4.08 + Polynomial table correction.
2008-04-23	4.07 ~ rsdump reporting improved. +RezeroDump alias
2008-02-08	4.06 ~ CreepToOpto speeds halved for Nano.
2008-01-15	4.05 ~ Version numbering realigned, to disentagle V.22. RezeroWU speed cut to 2/3 for vertical axes. See 3.50
2007-12-06	4.04 ~ MOVES.FindIndexPositions and rezeroLS greatly improved to prevent bad choice of IndexPosition resulting in zero jumping.  See V.22 3.49 
2007-10-31	4.03 # Correction to STEPPER.ZVGotoEx for MustMoveZ/V calculation for Raise=TRUE case.
2007-10-22	4.02 + STEPPER.ZVGotoEx for correct raising of tips out of wells where array has specified SlowVzUp
2007-10-03	4.01 ~ STEPPER, MOVES Changes to SyringeRezero to backoff further, and to WindUp/Backoff speeds and distances. 46 actuate replaced by amAXIS actuate.
2007-06-25	4.00 ~ MOVES.TransferDrop does NOT move to target well if protein dispensing suppressed. Tip In/Out feedback during TransferDrop for air tracking.

Bifurcation V.23

2008-01-15	3.50 ~ RezeroWU speed cut to 19 mm/s for vertical axes as a result of Cambridge XYZV rezeroing behaviour.
2007-12-06	3.49 ~ MOVES.FindIndexPositions and rezeroLS greatly improved to prevent bad choice of IndexPosition resulting in zero jumping.
2007-05-07	3.48 ~ MOVES.TransferDrop speeded up
2007-04-19	3.47 + MOVES.TransferDrop SetTDRinseCount=1, SetTDDipCount=1 for better hygeine.
2006-12-07	3.46 + Programmable stepping current tables.
2006-11-30	3.45 # Speed set to full for rezeroLS
2006-11-30	3.44 ~ RezeroX/Y order reversed for RezeroPLOnFly
2006-11-06	3.43 + OryxNano definition
2006-11-06	3.42 # RezeroPLOnFly : Pending steps cleared.
2006-10-11	3.41 # FindIndexPositions : Correction to bit scanning loop.
2006-10-10	3.40 + FindIndexPositions rewritten for Nano, rezeroWU MoveToStop speeded up.
2006-05-12	3.39 + Actuate mode amXXX constants defined, nudgemm slowed down
2006-04-25	3.38 ~ Rezero return speed limited to 10 mm/s max for better ZV rezeroing without optos. 
2006-04-11	3.37 ~ Improvements to autorezero in Home
2006-04-10	3.36 + SetTransferDischargeDistance, redefinition of SetTransferDischargeVolume for V.19, and use of _TDmm to replace _TDV
2006-04-10	3.35 # TransferDrop - multiple drop was suppressing air loading as well as dTipClear. This affects all users since 2006-01-16. Also ROPU?->_ROPU?
2006-04-07	3.34 - # Rezero reprogrammed to properly take account of power down. Home reprogrammed to do rezero if powered down.
2006-04-06	3.33 + SetSyringeSpeed, SetSyringeSpeeds for easier setting of flow rates.
2006-03-17	3.32 ~ OilDrop now uses real syringe flow rate in mm/s
2006-01-17	3.31 ~ TransferDrop : tip returned to original x,y when  out of reservoir - mysterious backlash correcting of +0.3, +0.2 removed
2006-01-16	3.30 ~ TransferDrop : TipClear not used when protein channel=-1 ie multiple dispense, rinse offset corrected.
2005-12-14	3.29 + MOVES.FTH pitch<0? corrected to use M_PITCH->
2005-12-09	3.28 + MOVES.FTH SetTransferVz to control rate of raising tip out of reservoir in TransferDrop
2005-12-07	3.27 ~ ROMFORTH.ASM:CheckBoards caters for motherboards from Ed Hing not returning 0 where expected in port map
2005-11-29 	3.26 + ROMFORTH.FTH:CheckBoards allows missing board [1] for Oryx4
2005-10-05	3.25 ~ SyringeChannel changed to 8 BYTE array for Oryx8. 
2005-10-05	3.24 + STEPPER.FTH:Syringes.Fast, Syringes.SetSpeedFactor etc
2005-08-26	3.23 ~ FORTH.date/time corrected. STEPPER.Oryx6 definition corrected. + FORTH.bcd>,UniqueName and UniqueFileName
2005-07-29	3.22 + Oryx4, Oryx6, Oryx8 definitions
2005-05-25	3.21 + Cobra structure for MOVES.FTH and STEPPER.FTH applied, + XYZVGotoEx
2005-04-08	3.20 + UsePositionCorrection, {, } and <interpolate>. fmax and fmin rewritten, f< moved into C-FORTH
2005-04-01	3.19 ~ STEPPER: +<RaiseTo> +<f<> MOVES.FTH: suppression of dispense in TransferDrop
2005-01-24	3.18 ~ MOVES.FTH: doStir adjusted to use eCheck, so STOP button works
2004-12-20	3.17 ~ MOVES.FTH: typo corrected in TransferDrop XY backlash compensation
2004-11-30	3.16 ~ FORTH.FTH: obsolete lnumber, fnumber removed. dump enhanced to repeat on ..
2004-11-30	3.15 ~ FTH-SYS.ASM:<reboot> corrected wrong order of pushing
2004-11-22	3.14 ~ FILES.FTH enhanced, directory functions copied and corrected from FORTH.FTH
2004-11-18	3.13 + MOVES.FTH::Backlash compensation for rezeroing vertical axes
2004-11-12	3.12 + MOVES.FTH::XYBackLash, A4BackLash
2004-11-10	3.11 + Brake on STOP/LIMIT_SWITCH in 1/2 acceleration distance.
2004-10-27	3.10 + MOVES.FTH::TransferDrop - DischargeVolume expelled with air. 0.05ul extra dispensed with drop
2004-10-15	3.09 ~ FindIndexPositions fixed for new NominalOptoPosition mechanism.
2004-10-14	3.08 + CONTROL.ASM: More clever opto switch sampling for non-Schmidt Z+V.FindIndexPositions altered to accomodate Z+V. Old stepper command 'z' removed. + X, Y, Z, V defined as 0, 1, 2, 3 for logical axis reference.
2004-10-08	3.07 + Optoswitch capability on Z+V axes. WORD NominalIndexPositions replaced by FLOAT NominalOptoPositions
2004-10-04	3.06 ~ MOVES::TransferDrop no longer raises Z arm at end of drop dispense
2004-09-22	3.05 + SetTransferDischargeVolume; TransferDrop modified to PDSS algorithm using _TDV; + 2constant redefined in FTH-COMP.ASM because ['], [pfa] operators failing due to <builds does>
2004-09-06	3.04 + PrintString replaces FORTHMmess_out. + Vocabulary linkage errors reported to Front Panel
2004-09-03	3.03 + FORTH.FTH Snap, Snap. etc.
2004-08-24	3.02 + FTH-SYS.ASM::MemSnap, Snap, DSnap for memory image comparisons.
2004-08-10	3.01 ~ MOVES::TransferDrop to accept dAir v. dBack. Needs WASP v.2.3.2.12
2004-07-27	3.00 : Version 2.99 with Cobra .fth file set

2004-07-27	2.99   ~ bug in searching null vocabulary <objects> fixed + <virtual> declaration to allow future references, instead of late find
2004-07-07	2.98 + DebugLog, DebugMode ~ diagnostic oversight in not stepping 4th motor fixed
2004-07-02	2.97 ~ acceleration/deceleration algorithms made symmetrical cube root
2004-06-28	2.96 + microstepping with selectable resolution
2004-07-02	2.95 ~  TransferDrop - extra 0.05 ul air added to expel remains of drop
2004-05-18	2.94 +  dSweep, SetSweep incorporated in Transfer + SyringeMove
2004-05-05	2.93 +  GetMaxSpeed, GetCurrentSpeed for correct priming of Syringe.ocx in FP
2004-02-21	2.92 +	Digital filter reintroduced for opto switches. /5V gave problems due to motor switching noise/
2003-12-09	2.91 ~	Timing and logic of step_int/ScanDB6 to prevent glitches; rough running on motors and prevalence of crash.
2003-12-07	2.90 +	Segment load checking with LoadSegment
2003-11-26	2.89 ~ download altered to report CRC and count.
2003-10-22	2.88 ~ FPMATHS::atof altered to always accept '.' and ',' as point
2003-09-24	2.87 ~ pointer definition corrected - causing problems with RezeroPLOnFly
2003-09-17	2.86 + ssdump reintroduced
2003-08-26	2.85 + TIMING.ASM::Set_Current_Speed FTH-STEP.ASM::SetCurrentSpeed/SetMaxSpeed
2003-07-25	2.84 ~ FORTH::dr. negative numbers/stack drop + FORTH::pointer for indexing predefined arrays + STEPPER::RezeroPLOnFly for recovering from power down
2003-05-19	2.83 ~ ACT-DB5.ASM changed to provide quadratic deceleration in T domain, + bug fix on short moves
2003-03-25	2.82 + motor positions and adjustment data stored in MCC. New findindexpositions command. Hardware.fth now specifies motor ranges and NominalIndexPositionX/Y.
2003-01-25	2.81 + new segmentation model, file loading
2003-01-14	2.80 + error checking on structure words/line number tracking + select/case statement + format
2003-02-16	2.76 ~ ZVGoto, Home to suppress V moves in case of IMPAX
2003-01-02	2.75 + information dumped to stepping_status array about failing DB6 polling
2002-12-27	2.74 + new method of polling READY bit on DB6 boards, to prevent/diagnose PCI hang.
2002-12-13	2.73 + NAK response added in FTH-COM + <rand>, random simulation of comms errors.
2002-11-03	2.72   ~ AxisGoto LOGICAL/PHYSICAL parameter tested correctly. C-Forth.exe can mask ustepping positions.
2002-10-10	2.71   ~ Debugged and running for Cambridge and Helsinki
2002-09-23	2.70 + new command operation technique. Moves are done in MCC, not Windows. Actuate. continuously reports positions.+ SetLength, SetCurrent -> Win/Forth interface is now f.p. logical, not steps
2002-05-23	2.63   ~ Actuate does 1/2 and 1/4 stepping with DB6; Stepper::DB5, DB6.0->1/2 stepping a la DB5, DB6.4->1/4 stepping
2002-05-01	2.62   ~ Stepper::AxisActuate. no longer performs abort on actuate error.
2002-04-26	2.61 + set_pitch now uses standardized 1/2 step pitches and CardType
2002-04-10	2.60 + DB6 stepping interrupt for 1/4 stepping. to calculate internal electronic pitch.
2002-03-06	2.58 ~ prevent writing bit 7 = 1 in $307 - was causing LS port to be output => bad LS readings.+ IndexPosition + BeltDrive?
2002-01-15	2.57 + Stop actuate on limit switch change for belt drive
2001-11-21	2.56 ~ msDelay -> correct exit condition in timer reading loop, originally causing hang.
2001-10-12	2.55 + TIMING.ASM::ISA_BusDelay to prevent hanging when reading 8253 timer too frequently
2001-06-12	2.54   ~ redefinition of <xAxis, .. vAxis> as array access instead of constants.
2001-06-06	2.53   + <off> to cut motor power
2001-05-31	2.52 + NUL added at end of <version> string for FORTHmess_out compatibility
2001-04-05	2.51 + PulseGenerator for regulating feedback
2001-03-26	2.50 + XYGoto, ArmGoto etc with feedback
2001-01-05	2.41 + Nudge + SetPositions
2000-12-01	2.40 ~ Correction to <ms> timer, changes to .FTH files that use <ms>
2000-10-23	2.38 + TransferDrop in Moves.fth, alterations to Stepper.fth
2000-08-15	2.37 + <fsettime> and <fredate> in FORTH.FTH for correct dating in download
2000-08-11	2.36 + deceleration inACT-DB5.ASM + <decelerationRate>, <decelerationCount>
2000-07-12	2.35 ~ oil allows variable volume and radius
2000-06-20	2.34 + OilDrop for faster microbatch oil dropping.
2000-06-02	2.33 + initialPeriodFactor for acceleration
2000-05-25	2.32 + Acceleration made the default actuate mode, inhibited with NO_ACCELERATION
2000-05-23	2.31 + Acceleration with actuate by slewing 8253
2000-04-26	2.30 + HARDWARE.FTH for hardware settings of syringes including backlash
2000-04-06	2.29 + shutDown { nmotors - } sets specified number of motors to phase0
2000-03-13	2.28 ~ oversight in phase0 - no clear of pending steps when already on phase0
2000-03-13	2.27 + <motorPower> for releasing motors during recalibration
2000-03-09	2.26 ~ further correction to phase0 for -ve pitch - 7 steps max
2000-01-21	2.25 ~ pitch comparison corrected in phase0 - sdword ptr for x<0
2000-01-10	2.24 ~ corrected phase0 for -ve pitch
1999-07-16	2.23 + hedgehog protection
1999-06-29	2.22 + setSeparator for decimal character= ',' etc.
1999-06-27	2.21 - Error found in FTH-STEP.ASM - stepTo did not clear data stack
1999-06-24	2.20 - FnStart, FnShow, FnBump and FnEnd debugging markers
1999-04-21	2.14 - Use of CONCURRENT corrected; waitForCompletion inserted in sensible places
1999-04-07	2.13 - getSpeed fixed not to use motor 1 pitch
1999-03-12	2.12 - Better RESET response - RACK takes priority over current outPacket
1998-12-03	2.11 - ftol fixed for f<1.5; 0< gives TRUE=-1
1998-11-10	2.10	- Release version for Finland
1998-11-01	2.01	- First version which maintains version records via this file
*)
: hedgehog version count type ;
