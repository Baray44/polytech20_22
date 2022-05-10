transcript on
if ![file isdirectory Lab3_iputf_libs] {
	file mkdir Lab3_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib Lab3_iputf_libs/error_adapter_0
vmap error_adapter_0 ./Lab3_iputf_libs/error_adapter_0
vlib Lab3_iputf_libs/avalon_st_adapter_001
vmap avalon_st_adapter_001 ./Lab3_iputf_libs/avalon_st_adapter_001
vlib Lab3_iputf_libs/avalon_st_adapter
vmap avalon_st_adapter ./Lab3_iputf_libs/avalon_st_adapter
vlib Lab3_iputf_libs/my_slave_0_s0_rsp_width_adapter
vmap my_slave_0_s0_rsp_width_adapter ./Lab3_iputf_libs/my_slave_0_s0_rsp_width_adapter
vlib Lab3_iputf_libs/rsp_mux
vmap rsp_mux ./Lab3_iputf_libs/rsp_mux
vlib Lab3_iputf_libs/rsp_demux
vmap rsp_demux ./Lab3_iputf_libs/rsp_demux
vlib Lab3_iputf_libs/cmd_mux
vmap cmd_mux ./Lab3_iputf_libs/cmd_mux
vlib Lab3_iputf_libs/cmd_demux
vmap cmd_demux ./Lab3_iputf_libs/cmd_demux
vlib Lab3_iputf_libs/my_slave_0_s0_burst_adapter
vmap my_slave_0_s0_burst_adapter ./Lab3_iputf_libs/my_slave_0_s0_burst_adapter
vlib Lab3_iputf_libs/router_002
vmap router_002 ./Lab3_iputf_libs/router_002
vlib Lab3_iputf_libs/router_001
vmap router_001 ./Lab3_iputf_libs/router_001
vlib Lab3_iputf_libs/router
vmap router ./Lab3_iputf_libs/router
vlib Lab3_iputf_libs/my_slave_0_s0_agent_rsp_fifo
vmap my_slave_0_s0_agent_rsp_fifo ./Lab3_iputf_libs/my_slave_0_s0_agent_rsp_fifo
vlib Lab3_iputf_libs/my_slave_0_s0_agent
vmap my_slave_0_s0_agent ./Lab3_iputf_libs/my_slave_0_s0_agent
vlib Lab3_iputf_libs/my_master_0_m0_agent
vmap my_master_0_m0_agent ./Lab3_iputf_libs/my_master_0_m0_agent
vlib Lab3_iputf_libs/my_slave_0_s0_translator
vmap my_slave_0_s0_translator ./Lab3_iputf_libs/my_slave_0_s0_translator
vlib Lab3_iputf_libs/my_master_0_m0_translator
vmap my_master_0_m0_translator ./Lab3_iputf_libs/my_master_0_m0_translator
vlib Lab3_iputf_libs/mm_interconnect_0
vmap mm_interconnect_0 ./Lab3_iputf_libs/mm_interconnect_0
vlib Lab3_iputf_libs/my_slave_0
vmap my_slave_0 ./Lab3_iputf_libs/my_slave_0
vlib Lab3_iputf_libs/my_slaveWS_0
vmap my_slaveWS_0 ./Lab3_iputf_libs/my_slaveWS_0
vlib Lab3_iputf_libs/my_master_0
vmap my_master_0 ./Lab3_iputf_libs/my_master_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv" -work error_adapter_0                
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"     -work error_adapter_0                
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter_001.v"                  -work avalon_st_adapter_001          
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_avalon_st_adapter.v"                      -work avalon_st_adapter              
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_width_adapter.sv"                                    -work my_slave_0_s0_rsp_width_adapter
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_address_alignment.sv"                                -work my_slave_0_s0_rsp_width_adapter
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_uncompressor.sv"                               -work my_slave_0_s0_rsp_width_adapter
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_rsp_mux.sv"                               -work rsp_mux                        
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_arbitrator.sv"                                       -work rsp_mux                        
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_rsp_demux.sv"                             -work rsp_demux                      
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_cmd_mux.sv"                               -work cmd_mux                        
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_arbitrator.sv"                                       -work cmd_mux                        
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_cmd_demux.sv"                             -work cmd_demux                      
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_uncmpr.sv"                             -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_13_1.sv"                               -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_adapter_new.sv"                                -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_incr_burst_converter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_wrap_burst_converter.sv"                                    -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_default_burst_converter.sv"                                 -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_address_alignment.sv"                                -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_st_pipeline_stage.sv"                                -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_st_pipeline_base.v"                                  -work my_slave_0_s0_burst_adapter    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router_002.sv"                            -work router_002                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router_001.sv"                            -work router_001                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0_router.sv"                                -work router                         
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_avalon_sc_fifo.v"                                           -work my_slave_0_s0_agent_rsp_fifo   
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_slave_agent.sv"                                      -work my_slave_0_s0_agent            
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_burst_uncompressor.sv"                               -work my_slave_0_s0_agent            
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_master_agent.sv"                                     -work my_master_0_m0_agent           
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_slave_translator.sv"                                 -work my_slave_0_s0_translator       
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/altera_merlin_master_translator.sv"                                -work my_master_0_m0_translator      
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/Lab3_1_mm_interconnect_0.v"                                        -work mm_interconnect_0              
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_slave.sv"                                                       -work my_slave_0                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_slaveWS.sv"                                                     -work my_slaveWS_0                   
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/submodules/my_master.sv"                                                      -work my_master_0                    
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_1/simulation/Lab3_1.v"                                                                                                          

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab3 {C:/Intel_trn/Baraev/Q_PD/Lab3/Lab3_top.sv}

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab3 {C:/Intel_trn/Baraev/Q_PD/Lab3/tb_Lab3_top.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L error_adapter_0 -L avalon_st_adapter_001 -L avalon_st_adapter -L my_slave_0_s0_rsp_width_adapter -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L my_slave_0_s0_burst_adapter -L router_002 -L router_001 -L router -L my_slave_0_s0_agent_rsp_fifo -L my_slave_0_s0_agent -L my_master_0_m0_agent -L my_slave_0_s0_translator -L my_master_0_m0_translator -L mm_interconnect_0 -L my_slave_0 -L my_slaveWS_0 -L my_master_0 -voptargs="+acc"  tb_Lab3_top

add wave *
view structure
view signals
run -all
