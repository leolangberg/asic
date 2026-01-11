#1. set margin
set margin 100
#2. set width for Silago design blocks
set tile_w 180
set core_w [expr {8*$tile_w}]
#3. set height for Silago design blocks
set tile_h 180
set core_h [expr {2*$tile_h}]
#4. create floorplan area
#set_io_flow_flag 0
create_floorplan \
  -site SC8T_104CPP_CMOS22FDX \
  -core_size $core_w $core_h \
  $margin $margin $margin $margin \
  -no_snap_to_grid

