#1. cd into the specific partition
cd ../phy/db/part/Silago_bot_left_corner.enc.dat/

#Silago_bot
#Silago_bot_left_corner
#Silago_bot_right_corner
#Silago_top
#Silago_top_left_corner
#Silago_top_right_corner

#3. read the parition
read_db .

#4. place
place_design
#5. ccopt
ccopt_design
#6. route
route_design

#7. write the partition db
write_db ./pnr/
#8. write ilm
write_ilm

#go back to exe.
cd ~/IL2225_project/SiLagoNN/exe

