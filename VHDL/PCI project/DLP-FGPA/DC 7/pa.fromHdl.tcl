
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name DC7_PCI -dir "C:/Make/V.25/DC7/DC7_PCI/planAhead_run_1" -part xc3s250etq144-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top DC7_PCI $srcset
set_param project.paUcfFile  "DB7.ucf"
set hdlfile [add_files [list {USBPort.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SSI.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {PCI.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {DC7_PCI.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
add_files "DB7.ucf" -fileset [get_property constrset [current_run]]
add_files -norecurse { {C:/Make/V.25/DC7/DC7_PCI} }
open_rtl_design -part xc3s250etq144-4
