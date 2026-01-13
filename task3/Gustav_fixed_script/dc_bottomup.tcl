################################################################################
# Design Compiler bottom-up logic synthesis script
################################################################################
#
# This script is meant to be executed with the following directory structure
#
# project_top_folder
# |
# |- db: store output data like mapped designs or physical files like GDSII
# |
# |- phy: physical synthesis material (scripts, pins, etc)
# |
# |- rtl: contains rtl code for the design, it should also contain a
# |       hierarchy.txt file with the all the files that compose the design
# |
# |- syn: logic synthesis material (this script, SDC constraints, etc)
# |
# |- sim: simulation stuff like waveforms, reports, coverage etc.
# |
# |- tb: testbenches for the rtl code
# |
# |- exe: the directory where it should be executed. This keeps all the temp files
#         created by DC in that directory
#
#
# The standard way of executing the is from the project_top_folder
# with the following command
#
# $ dc_shell -f ../syn/dc_flat.tcl
################################################################################


#EXECUTE N PASSES. DECIDE ON A REASONABLE N.
#proc nth_pass {n} {
	#Hint: Write constraints for some reasonably big modules. E.g: divider_pipe and silego.
	
	#Hint: Compile only the unique tiles
	
#}


remove_design -all

# load synopsys config
source ../syn/synopsys_dc.setup

set hierarchy_files [split [read [open ../rtl/dware_hierarchy_verilog.txt r]] "\n"]
    foreach filename [lrange ${hierarchy_files} 0 end-1] {
        puts "${filename}"
    	analyze -format verilog -lib WORK "../rtl/${filename}"
    }



set hierarchy_files [split [read [open ../rtl/drra_wrapper_hierarchy.txt r]] "\n"]
    foreach filename [lrange ${hierarchy_files} 0 end-1] {
        puts "${filename}"
    	analyze -format VHDL -lib WORK "../rtl/${filename}"
    }



proc nth_pass {n} {
    set prev_n [expr {$n - 1}]

    #analyze -format vhdl -lib WORK {"../rtl/types_and_constants.vhd"}
    #use constrain Silego_top_left/right?

    #Compile Silago_top_left_corner
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_top_left_corner.vhd"}
    elaborate Silago_top_left_corner
    current_design Silago_top_left_corner
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
        source ../syn/db/Silago_top_left_corner_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_top_left_corner
    write_script > ../syn/db/Silago_top_left_corner_${n}.wscr

    #Compile Silago_top
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_top.vhd"}
    elaborate Silago_top
    current_design Silago_top
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
        source ../syn/db/Silago_top_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_top
    write_script > ../syn/db/Silago_top_${n}.wscr

    #Compile Silago_top_right_corner
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_top_right_corner.vhd"}
    elaborate Silago_top_right_corner
    current_design Silago_top_right_corner
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
      source ../syn/db/Silago_top_right_corner_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_top_right_corner
    write_script > ../syn/db/Silago_top_right_corner_${n}.wscr

    #Compile Silago_bot_left_corner
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_bot_left_corner.vhd"}
    elaborate Silago_bot_left_corner
    current_design Silago_bot_left_corner
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
        source ../syn/db/Silago_bot_left_corner_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_bot_left_corner
    write_script > ../syn/db/Silago_bot_left_corner_${n}.wscr

    #Compile Silago_bot
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_bot.vhd"}
    elaborate Silago_bot
    current_design Silago_bot
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
        source ../syn/db/Silago_bot_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_bot
    write_script > ../syn/db/Silago_bot_${n}.wscr

    #Compile Silago_bot_right_corner
    analyze -format vhdl -lib WORK {"../rtl/mtrf/Silago_bot_right_corner.vhd"}
    elaborate Silago_bot_right_corner
    current_design Silago_bot_right_corner
    link
    uniquify
    source ../syn/constraints.sdc
    if  {$n > 1} {
        source ../syn/db/Silago_bot_right_corner_${prev_n}.wscr
    }
    compile
    characterize -constraint Silago_bot_right_corner
    write_script > ../syn/db/Silago_bot_right_corner_${n}.wscr

    #compile drra_wrapper (toplevel)
    analyze -format vhdl -lib WORK {"../rtl/mtrf/drra_wrapper.vhd"}
    elaborate drra_wrapper
    current_design drra_wrapper
    link
    source ../syn/constraints.sdc
    dont_touch Silago_top_left_corner true
    dont_touch Silago_top true
    dont_touch Silago_top_right_corner true
    dont_touch Silago_bot_left_corner true
    dont_touch Silago_bot true
    dont_touch Silago_bot_right_corner true
    compile

    #check if the constraints are met
    
}


nth_pass 1
report_constraint > ../syn/rpt/constraint1.txt
report_area > ../syn/rpt/area1.txt
report_power > ../syn/rpt/power1.txt
report_timing > ../syn/rpt/timing1.txt
#nth_pass 2
#report_constraint > ../syn/rpt/constraint2.txt
#report_area > ../syn/rpt/area2.txt
#report_power > ../syn/rpt/power2.txt
#report_timing > ../syn/rpt/timing2.txt
#nth_pass 3
#report_constraint > ../syn/rpt/constraint3.txt
#report_area > ../syn/rpt/area3.txt
#report_power > ../syn/rpt/power3.txt
#report_timing > ../syn/rpt/timing3.txt
#nth_pass 4
#current_design drra_wrapper
#report_constraint > ../syn/rpt/constraint4.txt
#report_area > ../syn/rpt/area4.txt
#report_power > ../syn/rpt/power4.txt
#report_timing > ../syn/rpt/timing4.txt

check_design > ../syn/rpt/final_check_design.txt
write_file -format verilog -hier -output ../syn/db/drra_wrapper.v








