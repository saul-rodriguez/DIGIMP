set_attribute lib_search_path /pkg/AMS414/liberty/ac18_1.8V
set_attribute hdl_search_path {.}
set_attribute information_level 7
set_attribute library {ac18_CORELIB_WC.lib}

read_hdl ../cur_dec.v

set design cur_dec
elaborate

read_sdc ./cur_dec.sdc

synthesize -to_mapped

insert_tiehilo_cells -hi LOGIC1 -lo LOGIC0 cur_dec

write -mapped > cur_dec_synth.v
write_sdc > cur_dec_synth.sdc

report timing > cur_dec_synth_timing.rpt	
report area   > cur_dec_synth_area.rpt
report gates  > cur_dec_synth_gates.rpt	
report power > cur_dec_synth_power.rpt

