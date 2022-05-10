

ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0              -cdslib <<error_adapter_0>>             
ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter            -cdslib <<avalon_st_adapter>>           
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                      -cdslib <<rsp_mux>>                     
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work rsp_mux                      -cdslib <<rsp_mux>>                     
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                    -cdslib <<rsp_demux>>                   
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                      -cdslib <<cmd_mux>>                     
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work cmd_mux                      -cdslib <<cmd_mux>>                     
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                    -cdslib <<cmd_demux>>                   
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router_001.sv"                        -work router_001                   -cdslib <<router_001>>                  
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router.sv"                            -work router                       -cdslib <<router>>                      
ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                         -work my_slave_0_s0_agent_rsp_fifo -cdslib <<my_slave_0_s0_agent_rsp_fifo>>
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_agent.sv"                                    -work my_slave_0_s0_agent          -cdslib <<my_slave_0_s0_agent>>         
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_burst_uncompressor.sv"                             -work my_slave_0_s0_agent          -cdslib <<my_slave_0_s0_agent>>         
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_agent.sv"                                   -work my_master_0_m0_agent         -cdslib <<my_master_0_m0_agent>>        
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_translator.sv"                               -work my_slave_0_s0_translator     -cdslib <<my_slave_0_s0_translator>>    
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_translator.sv"                              -work my_master_0_m0_translator    -cdslib <<my_master_0_m0_translator>>   
ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0.v"                                    -work mm_interconnect_0            -cdslib <<mm_interconnect_0>>           
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_slave.sv"                                                     -work my_slave_0                   -cdslib <<my_slave_0>>                  
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_master.sv"                                                    -work my_master_0                  -cdslib <<my_master_0>>                 
ncvlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_Dslave.sv"                                                    -work my_Dslave_0                  -cdslib <<my_Dslave_0>>                 
ncvlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/Lab4_sys.v"                                                                                                                                            
