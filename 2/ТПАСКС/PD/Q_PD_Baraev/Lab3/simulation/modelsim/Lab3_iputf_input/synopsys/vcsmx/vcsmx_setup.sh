

vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                
vlogan +v2k           "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_001.v"                  -work avalon_st_adapter_001          
vlogan +v2k           "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter              
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_width_adapter.sv"                                    -work my_slave_0_s0_rsp_width_adapter
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_address_alignment.sv"                                -work my_slave_0_s0_rsp_width_adapter
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_uncompressor.sv"                               -work my_slave_0_s0_rsp_width_adapter
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                        
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_arbitrator.sv"                                       -work rsp_mux                        
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                      
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                        
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_arbitrator.sv"                                       -work cmd_mux                        
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                      
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                             -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                               -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_incr_burst_converter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_wrap_burst_converter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_default_burst_converter.sv"                                 -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_address_alignment.sv"                                -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_st_pipeline_base.v"                                  -work my_slave_0_s0_burst_adapter    
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router_002.sv"                            -work router_002                     
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router_001.sv"                            -work router_001                     
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router.sv"                                -work router                         
vlogan +v2k           "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_sc_fifo.v"                                           -work my_slave_0_s0_agent_rsp_fifo   
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_slave_agent.sv"                                      -work my_slave_0_s0_agent            
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_uncompressor.sv"                               -work my_slave_0_s0_agent            
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_master_agent.sv"                                     -work my_master_0_m0_agent           
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_slave_translator.sv"                                 -work my_slave_0_s0_translator       
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_master_translator.sv"                                -work my_master_0_m0_translator      
vlogan +v2k           "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0.v"                                        -work mm_interconnect_0              
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_slave.sv"                                                       -work my_slave_0                     
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_slaveWS.sv"                                                     -work my_slaveWS_0                   
vlogan +v2k -sverilog "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_master.sv"                                                      -work my_master_0                    
vlogan +v2k           "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/Lab3_1.v"                                                                                                          
