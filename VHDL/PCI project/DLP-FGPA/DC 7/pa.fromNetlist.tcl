
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name DC7_PCI -dir "C:/Make/V.25/DC7/DC7_PCI/planAhead_run_1" -part xc3s250etq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Make/V.25/DC7/DC7_PCI/DC7_PCI.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Make/V.25/DC7/DC7_PCI} }
set_param project.paUcfFile  "DB7.ucf"
add_files "DB7.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
