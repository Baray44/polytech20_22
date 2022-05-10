transcript on
if ![file isdirectory Lab2_iputf_libs] {
	file mkdir Lab2_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib Lab2_iputf_libs/sc_fifo_0
vmap sc_fifo_0 ./Lab2_iputf_libs/sc_fifo_0
vlib Lab2_iputf_libs/MyST_source_0
vmap MyST_source_0 ./Lab2_iputf_libs/MyST_source_0
vlib Lab2_iputf_libs/MyST_sink_0
vmap MyST_sink_0 ./Lab2_iputf_libs/MyST_sink_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog     "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/altera_avalon_sc_fifo.v" -work sc_fifo_0    
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/MyST_source.sv"          -work MyST_source_0
vlog -sv "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/submodules/MyST_sink.sv"            -work MyST_sink_0  
vlog     "C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_1/simulation/Lab2_1.v"                                              

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab2 {C:/Intel_trn/Baraev/Q_PD/Lab2/Lab2_top.sv}

vlog -sv -work work +incdir+C:/Intel_trn/Baraev/Q_PD/Lab2 {C:/Intel_trn/Baraev/Q_PD/Lab2/tb_Lab2_top.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L sc_fifo_0 -L MyST_source_0 -L MyST_sink_0 -voptargs="+acc"  tb_Lab2_top

add wave *
view structure
view signals
run -all
