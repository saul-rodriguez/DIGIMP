set_attribute lib_search_path /pkg/AMS411/liberty/h18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {h18_CORELIB_HV_WC.lib}

read_hdl ../FreqDiv64.v

elaborate

read_sdc FreqDiv64.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1_HV -lo LOGIC0_HV FreqDiv64

write -mapped > FreqDiv64_synth.v
write_sdc > FreqDiv64_synth.sdc

report timing > FreqDiv64_synth_timing.rpt	
report area   > FreqDiv64_synth_area.rpt
report gates  > FreqDiv64_synth_gates.rpt	
report power  > FreqDiv64_synth_power.rpt



