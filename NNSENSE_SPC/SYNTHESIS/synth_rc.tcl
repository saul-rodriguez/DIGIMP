set_attribute lib_search_path /pkg/AMS414/liberty/ac18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {ac18_CORELIB_WC.lib}

read_hdl ../nnspc.v

set design nnspc
elaborate

read_sdc ./nnspc.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1 -lo LOGIC0 nnspc

write -mapped > nnspc_synth.v
write_sdc > nnspc_synth.sdc

report timing > nnspc_synth_timing.rpt	
report area   > nnspc_synth_area.rpt
report gates  > nnspc_synth_gates.rpt	
report power > nnspc_synth_power.rpt

