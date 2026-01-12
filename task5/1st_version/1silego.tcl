remove_design -all

# load synopsys config
source ../syn/synopsys_dc.setup

set hierarchy_files [split [read [open ../rtl/silego_hierarchy.txt r]] "\n"]
    foreach filename [lrange ${hierarchy_files} 0 end-1] {
        puts "${filename}"
    	analyze -format VHDL -lib WORK "../rtl/${filename}"
    }

elaborate silego
link
source ../syn/constraints.sdc;
compile -map_effort medium

report_area > area.txt
