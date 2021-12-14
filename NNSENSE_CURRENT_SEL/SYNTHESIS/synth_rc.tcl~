set_attribute lib_search_path /pkg/AMS414/liberty/ac18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {ac18_CORELIB_WC.lib}

read_hdl ../fet_dec.v

set design fet_dec
elaborate

read_sdc ./fet_dec.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1 -lo LOGIC0 fet_dec

write -mapped > fet_dec_synth.v
write_sdc > fet_dec_synth.sdc

report timing > fet_dec_synth_timing.rpt	
report area   > fet_dec_synth_area.rpt
report gates  > fet_dec_synth_gates.rpt	
report power > fet_dec_synth_power.rpt

