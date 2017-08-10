set_attribute lib_search_path /pkg/AMS414/liberty/ac18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {ac18_CORELIB_WC.lib}

read_hdl ../sar5.v

set design sar5
elaborate

read_sdc ./sar5.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1 -lo LOGIC0 sar5

write -mapped > sar5_synth.v
write_sdc > sar5_synth.sdc

report timing > sar5_synth_timing.rpt	
report area   > sar5_synth_area.rpt
report gates  > sar5_synth_gates.rpt	
report power > sar5_synth_power.rpt

