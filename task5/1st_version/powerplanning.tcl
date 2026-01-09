add_rings -nets {VDD VSS} -type core_rings -follow core -layer {top JB bottom JB left LB right LB} -width {top 5 bottom 5 left 5 right 5} -spacing {top 2 bottom 2 left 2 right 2} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none

add_stripes -nets {VDD VSS} -layer LB -direction vertical -width 5 -spacing 2 -set_to_set_distance 50 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit LB -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit LB -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none

