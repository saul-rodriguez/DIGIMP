set_attribute lib_search_path /pkg/AMS411/liberty/h18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {h18_CORELIB_HV_WC.lib}

read_hdl ../vin_spc.v

elaborate

read_sdc vin_spc.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1_HV -lo LOGIC0_HV vin_spc

write -mapped > vin_spc_synth.v
write_sdc > vin_spc_synth.sdc

report timing > vin_spc_synth_timing.rpt	
report area   > vin_spc_synth_area.rpt
report gates  > vin_spc_synth_gates.rpt	
report power  > vin_spc_synth_power.rpt





