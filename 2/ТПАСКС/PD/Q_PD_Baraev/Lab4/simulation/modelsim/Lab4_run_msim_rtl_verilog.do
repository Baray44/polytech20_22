transcript on
if ![file isdirectory Lab4_iputf_libs] {
	file mkdir Lab4_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib Lab4_iputf_libs/error_adapter_0
vmap error_adapter_0 ./Lab4_iputf_libs/error_adapter_0
vlib Lab4_iputf_libs/avalon_st_adapter
vmap avalon_st_adapter ./Lab4_iputf_libs/avalon_st_adapter
vlib Lab4_iputf_libs/rsp_mux
vmap rsp_mux ./Lab4_iputf_libs/rsp_mux
vlib Lab4_iputf_libs/rsp_demux
vmap rsp_demux ./Lab4_iputf_libs/rsp_demux
vlib Lab4_iputf_libs/cmd_mux
vmap cmd_mux ./Lab4_iputf_libs/cmd_mux
vlib Lab4_iputf_libs/cmd_demux
vmap cmd_demux ./Lab4_iputf_libs/cmd_demux
vlib Lab4_iputf_libs/router_001
vmap router_001 ./Lab4_iputf_libs/router_001
vlib Lab4_iputf_libs/router
vmap router ./Lab4_iputf_libs/router
vlib Lab4_iputf_libs/my_slave_0_s0_agent_rsp_fifo
vmap my_slave_0_s0_agent_rsp_fifo ./Lab4_iputf_libs/my_slave_0_s0_agent_rsp_fifo
vlib Lab4_iputf_libs/my_slave_0_s0_agent
vmap my_slave_0_s0_agent ./Lab4_iputf_libs/my_slave_0_s0_agent
vlib Lab4_iputf_libs/my_master_0_m0_agent
vmap my_master_0_m0_agent ./Lab4_iputf_libs/my_master_0_m0_agent
vlib Lab4_iputf_libs/my_slave_0_s0_translator
vmap my_slave_0_s0_translator ./Lab4_iputf_libs/my_slave_0_s0_translator
vlib Lab4_iputf_libs/my_master_0_m0_translator
vmap my_master_0_m0_translator ./Lab4_iputf_libs/my_master_0_m0_translator
vlib Lab4_iputf_libs/mm_interconnect_0
vmap mm_interconnect_0 ./Lab4_iputf_libs/mm_interconnect_0
vlib Lab4_iputf_libs/my_slave_0
vmap my_slave_0 ./Lab4_iputf_libs/my_slave_0
vlib Lab4_iputf_libs/my_master_0
vmap my_master_0 ./Lab4_iputf_libs/my_master_0
vlib Lab4_iputf_libs/my_Dslave_0
vmap my_Dslave_0 ./Lab4_iputf_libs/my_Dslave_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work error_adapter_0             
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_avalon_st_adapter.v"                  -work avalon_st_adapter           
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_mux.sv"                           -work rsp_mux                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work rsp_mux                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_rsp_demux.sv"                         -work rsp_demux                   
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_mux.sv"                           -work cmd_mux                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_arbitrator.sv"                                     -work cmd_mux                     
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_cmd_demux.sv"                         -work cmd_demux                   
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router_001.sv"                        -work router_001                  
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0_router.sv"                            -work router                      
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_avalon_sc_fifo.v"                                         -work my_slave_0_s0_agent_rsp_fifo
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_agent.sv"                                    -work my_slave_0_s0_agent         
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_burst_uncompressor.sv"                             -work my_slave_0_s0_agent         
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_agent.sv"                                   -work my_master_0_m0_agent        
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_slave_translator.sv"                               -work my_slave_0_s0_translator    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/altera_merlin_master_translator.sv"                              -work my_master_0_m0_translator   
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/Lab4_sys_mm_interconnect_0.v"                                    -work mm_interconnect_0           
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_slave.sv"                                                     -work my_slave_0                  
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_master.sv"                                                    -work my_master_0                 
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/submodules/my_Dslave.sv"                                                    -work my_Dslave_0                 
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys/simulation/Lab4_sys.v"                                                                                                   

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab4 {C:/Intel_trn/Baraev/Q_PD/Lab4/Lab4_sys_top.sv}

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab4 {C:/Intel_trn/Baraev/Q_PD/Lab4/tb_Lab4_sys_top.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L error_adapter_0 -L avalon_st_adapter -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L my_slave_0_s0_agent_rsp_fifo -L my_slave_0_s0_agent -L my_master_0_m0_agent -L my_slave_0_s0_translator -L my_master_0_m0_translator -L mm_interconnect_0 -L my_slave_0 -L my_master_0 -L my_Dslave_0 -voptargs="+acc"  tb_Lab4_sys_top

add wave *
view structure
view signals
run -all
