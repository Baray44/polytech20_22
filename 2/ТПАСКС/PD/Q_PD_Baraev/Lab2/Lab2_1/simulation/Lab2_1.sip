set_global_assignment -entity "Lab2_1" -library "lib_Lab2_1" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Lab2_1" -library "lib_Lab2_1" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "Lab2_1" -library "lib_Lab2_1" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Lab2_1" -name SPD_FILE [file join $::quartus(sip_path) "../Lab2_1.spd"]
set_global_assignment -library "lib_Lab2_1" -name MISC_FILE [file join $::quartus(sip_path) "../../Lab2_1.qsys"]

set_global_assignment -library "lib_Lab2_1" -name MISC_FILE [file join $::quartus(sip_path) "Lab2_1.v"]
set_global_assignment -library "lib_Lab2_1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_Lab2_1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/MyST_source.sv"]
set_global_assignment -library "lib_Lab2_1" -name MISC_FILE [file join $::quartus(sip_path) "submodules/MyST_sink.sv"]
