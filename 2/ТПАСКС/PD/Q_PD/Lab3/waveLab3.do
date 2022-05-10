onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 20 Exported
add wave -noupdate /tb_Lab3_top/clk
add wave -noupdate /tb_Lab3_top/reset
add wave -noupdate -radix hexadecimal /tb_Lab3_top/ledA
add wave -noupdate -radix hexadecimal /tb_Lab3_top/ledB
add wave -noupdate -divider -height 20 Master
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_master_0/avm_m0_address
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_master_0/avm_m0_write
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_master_0/avm_m0_writedata
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_master_0/avm_m0_waitrequest
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_master_0/fsm_MM
add wave -noupdate -divider -height 20 {slave 8bit}
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slave_0/avs_s0_writedata
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slave_0/avs_s0_write
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slave_0/avs_s0_waitrequest
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slave_0/coe_s0_Dout
add wave -noupdate -divider -height 20 slave_WS
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slavews_0/avs_s0_writedata
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slavews_0/avs_s0_write
add wave -noupdate /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slavews_0/avs_s0_waitrequest
add wave -noupdate -radix hexadecimal /tb_Lab3_top/Lab3_top_inst/Lab3_1_inst/my_slavews_0/coe_s0_Dout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1202440 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 433
configure wave -valuecolwidth 67
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {1303539 ps}
