set margin 100
set tile_w 180
set tile_h 180
set core_w [expr {8*$tile_w}]
set core_h [expr {2*$tile_h}]

#4. create floorplan area
create_floorplan \
  -site SC8T_104CPP_CMOS22FDX \
  -core_size $core_w $core_h \
  $margin $margin $margin $margin \
  -no_snap_to_grid

# 2x8 grid with 
# TOP_LEFT 6x TOP TOP_RIGHT
# ======================================================
set x1 [expr {double($margin + $tile_w * 0)}]
set y1 [expr {double($margin)}]
set x2 [expr {double($x1 + $tile_w)}]
set y2 [expr {double($y1 + $tile_h)}]
set cell Silago_top_l_corner_inst_0_0
puts $cell
create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]

for {set i 1} {$i < 7} {incr i} {
   	set x1 [expr {double($margin + $tile_w * $i)}]
	set y1 [expr {double($margin)}]
	set x2 [expr {double($x1 + $tile_w)}]
	set y2 [expr {double($y1 + $tile_h)}]
	set cell [lindex ${partition_hinst_list} $i]
	puts $cell
	create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]
}
set x1 [expr {double($margin + $tile_w * 7)}]
set y1 [expr {double($margin)}]
set x2 [expr {double($x1 + $tile_w)}]
set y2 [expr {double($y1 + $tile_h)}]
set cell Silago_top_r_corner_inst_7_0
puts $cell
create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]

# BOT_LEFT 6x BOT BOT_RIGHT
# ===========================================================
set x1 [expr {double($margin + $tile_w * 0)}]
set y1 [expr {double($margin + $tile_h)}]
set x2 [expr {double($x1 + $tile_w)}]
set y2 [expr {double($y1 + $tile_h)}]
set cell Silago_bot_l_corner_inst_0_1
puts $cell
create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]

for {set i 1} {$i < 7} {incr i} {
	set x1 [expr {double($margin + $tile_w * $i)}]
	set y1 [expr {double($margin + $tile_h)}]
	set x2 [expr {double($x1 + $tile_w)}]
	set y2 [expr {double($y1 + $tile_h)}]
	set cell [lindex ${partition_hinst_list} [expr {$i + 8}]]
	puts $cell
	create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]

}
set x1 [expr {double($margin + $tile_w * 7)}]
set y1 [expr {double($margin + $tile_h)}]
set x2 [expr {double($x1 + $tile_w)}]
set y2 [expr {double($y1 + $tile_h)}]
set cell Silago_bot_r_corner_inst_7_1
puts $cell
create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]
