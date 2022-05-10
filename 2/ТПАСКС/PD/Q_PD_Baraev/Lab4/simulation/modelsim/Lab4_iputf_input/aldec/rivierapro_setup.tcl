

vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0             
vlog -v2k5 "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter           
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                     
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work rsp_mux                     
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                   
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                     
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work cmd_mux                     
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                   
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router_001.sv"                        -work router_001                  
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router.sv"                            -work router                      
vlog -v2k5 "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                         -work my_slave_0_s0_agent_rsp_fifo
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_agent.sv"                                    -work my_slave_0_s0_agent         
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_burst_uncompressor.sv"                             -work my_slave_0_s0_agent         
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_agent.sv"                                   -work my_master_0_m0_agent        
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_translator.sv"                               -work my_slave_0_s0_translator    
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_translator.sv"                              -work my_master_0_m0_translator   
vlog -v2k5 "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0.v"                                    -work mm_interconnect_0           
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_slave.sv"                                                     -work my_slave_0                  
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_master.sv"                                                    -work my_master_0                 
vlog       "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_Dslave.sv"                                                    -work my_Dslave_0                 
vlog -v2k5 "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/Lab4_sys.v"                                                                                                   
