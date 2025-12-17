By running report_area on one silego tile(at 10ns), we got a total Silego cell area of 22145.976277 um² (see area_silego.txt)
We want a density utilization of 70%
So we can deduce the width and the height for a Silego design blocks
22145,98   ÷   0,7 = 31 637,11 um²
√( 31637,11 ) = 178um
We have 2 row of 8 silego blocks so we can deduce the size of drra_wrapper for the floorplanning.

We can see on the screeshot result that we still have a lot of space that is not use. In particular we can reduce the margin (or/and increase size of ring) and maybe also reduce width and height of silago block at 160 or 170um.
