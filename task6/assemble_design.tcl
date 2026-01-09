#1. read the top place-and-routed top partition
read_db ../phy/db/part/drra_wrapper.enc.dat/pnr
#2. assemble the design from the constituent place and routed partitions
assemble_design -block_dir ../phy/db/part/silago_top_left_corner.enc.dat/pnr -encounter_format
assemble_design -block_dir ../phy/db/part/silago_top.enc.dat/pnr -encounter_format
assemble_design -block_dir ../phy/db/part/silago_top_right_corner.enc.dat/pnr -encounter_format
assemble_design -block_dir ../phy/db/part/silago_bot_left_corner.enc.dat/pnr -encounter_format
assemble_design -block_dir ../phy/db/part/silago_bot.enc.dat/pnr -encounter_format
assemble_design -block_dir ../phy/db/part/silago_bot_right_corner.enc.dat/pnr -encounter_format
