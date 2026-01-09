# For some reason you have to restart innovus each new "read_db"
#1. cd into the specific partition
cd ../phy/db/part/

#Silago_bot
#Silago_bot_left_corner
#Silago_bot_right_corner
#Silago_top
#Silago_top_left_corner
#Silago_top_right_corner

#3. read the parition
read_db ./Silago_bot.enc.dat/

#4. place
place_design
#5. ccopt
#ccopt_design
#set_propagated_clock [all_clocks]
#6. route
route_design

#7. write the partition db
write_db ./Silago_bot.enc.dat/pnr/
#8. write ilm
write_ilm ./Silago_bot.enc.dat

#go back to exe.
cd ~/IL2225_project/SiLagoNN/exe

