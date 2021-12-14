set_attribute lib_search_path /pkg/AMS411/liberty/h18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {h18_CORELIB_HV_WC.lib}

read_hdl ../DacCtrl.v

elaborate

read_sdc DacCtrl.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1_HV -lo LOGIC0_HV DacCtrl

write -mapped > DacCtrl_synth.v
write_sdc > DacCtrl_synth.sdc

report timing > DacCtrl_synth_timing.rpt	
report area   > DacCtrl_synth_area.rpt
report gates  > DacCtrl_synth_gates.rpt	
report power  > DacCtrl_synth_power.rpt



