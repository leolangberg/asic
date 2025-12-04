Warning: Unable to resolve reference 'data_selector_0' in 'Silago_top_left_corner'. (LINK-5)
Warning: Unable to resolve reference 'bus_selector_0' in 'Silago_top_left_corner'. (LINK-5)
Warning: Unable to resolve reference 'silego_0' in 'Silago_top_left_corner'. (LINK-5)
Warning: Unable to resolve reference 'addr_assign_0' in 'Silago_bot_left_corner'. (LINK-5)
Warning: Unable to resolve reference 'silego_15' in 'Silago_bot_left_corner'. (LINK-5)
Warning: Unable to resolve reference 'data_selector_1' in 'Silago_top_right_corner'. (LINK-5)
Warning: Unable to resolve reference 'bus_selector_1' in 'Silago_top_right_corner'. (LINK-5)
Warning: Unable to resolve reference 'addr_assign_2' in 'Silago_top_right_corner'. (LINK-5)
Warning: Unable to resolve reference 'silego_2' in 'Silago_top_right_corner'. (LINK-5)
Warning: Unable to resolve reference 'addr_assign_1' in 'Silago_bot_right_corner'. (LINK-5)
Warning: Unable to resolve reference 'silego_1' in 'Silago_bot_right_corner'. (LINK-5)
Information: Updating design information... (UID-85)
Warning: Design 'drra_wrapper' contains 2 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
 
****************************************
Report : constraint
Design : drra_wrapper
Version: V-2023.12-SP4
Date   : Thu Dec  4 15:16:53 2025
****************************************


                                                   Weighted
    Group (max_delay/setup)      Cost     Weight     Cost
    -----------------------------------------------------
    clk                          0.00      1.00      0.00
    default                      0.00      1.00      0.00
    -----------------------------------------------------
    max_delay/setup                                  0.00

                              Total Neg  Critical
    Group (critical_range)      Slack    Endpoints   Cost
    -----------------------------------------------------
    clk                          0.00         0      0.00
    default                      0.00         0      0.00
    -----------------------------------------------------
    critical_range                                   0.00

                                                   Weighted
    Group (min_delay/hold)       Cost     Weight     Cost
    -----------------------------------------------------
    clk (no fix_hold)            0.00      1.00      0.00
    default                      0.00      1.00      0.00
    -----------------------------------------------------
    min_delay/hold                                   0.00


    Constraint                                       Cost
    -----------------------------------------------------
    min_capacitance                                321.46 (VIOLATED)
    max_transition                                   0.00 (MET)
    max_capacitance                                  0.00 (MET)
    max_delay/setup                                  0.00 (MET)
    sequential_clock_pulse_width                     0.00 (MET)
    critical_range                                   0.00 (MET)


1
