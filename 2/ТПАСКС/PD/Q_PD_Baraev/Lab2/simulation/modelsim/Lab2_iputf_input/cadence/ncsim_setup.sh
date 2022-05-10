

ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/altera_avalon_sc_fifo.v" -work sc_fifo_0     -cdslib <<sc_fifo_0>>    
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/MyST_source.sv"          -work MyST_source_0 -cdslib <<MyST_source_0>>
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/MyST_sink.sv"            -work MyST_sink_0   -cdslib <<MyST_sink_0>>  
ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/Lab2_1.v"                                                                        
