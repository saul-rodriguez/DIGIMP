set_attribute lib_search_path /pkg/AMS411/liberty/h18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {h18_CORELIB_HV_WC.lib}

read_hdl ../spc2.v

elaborate

read_sdc spc2.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1_HV -lo LOGIC0_HV spc2

write -mapped > spc2_synth.v
write_sdc > spc2_synth.sdc

report timing > spc2_synth_timing.rpt	
report area   > spc2_synth_area.rpt
report gates  > spc2_synth_gates.rpt	
report power  > spc2_synth_power.rpt





