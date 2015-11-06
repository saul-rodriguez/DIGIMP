create_library_set -name libs_typ\
   -timing\
    [list /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_TYP.lib]
create_library_set -name libs_min\
   -timing\
    [list /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_BC.lib]
create_library_set -name libs_max\
   -timing\
    [list /pkg/AMS411/liberty/h18_1.8V/h18_CORELIB_HV_WC.lib]
create_rc_corner -name ams_rc_corner_typ\
   -cap_table /pkg/AMS411/cds/HK_H18/LEF/h18a6/h18a6.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file /pkg/AMS411/assura/h18a6/h18a6/QRC/qrcTechFile
create_delay_corner -name corner_typ\
   -library_set libs_typ\
   -opcond_library h18_CORELIB_HV_TYP\
   -opcond typical\
   -rc_corner ams_rc_corner_typ
create_delay_corner -name corner_min\
   -library_set libs_min\
   -opcond_library h18_CORELIB_HV_BC\
   -opcond best\
   -rc_corner ams_rc_corner_typ
create_delay_corner -name corner_max\
   -library_set libs_max\
   -opcond_library h18_CORELIB_HV_WC\
   -opcond worst\
   -rc_corner ams_rc_corner_typ
create_constraint_mode -name func\
   -sdc_files\
    [list CONSTRAINTS/FreqDiv_func.sdc]
create_constraint_mode -name test\
   -sdc_files\
    [list CONSTRAINTS/FreqDiv_test.sdc]
create_analysis_view -name func_max -constraint_mode func -delay_corner corner_max
create_analysis_view -name test_max -constraint_mode test -delay_corner corner_max
create_analysis_view -name func_typ -constraint_mode func -delay_corner corner_typ
create_analysis_view -name test_typ -constraint_mode test -delay_corner corner_typ
create_analysis_view -name func_min -constraint_mode func -delay_corner corner_min
create_analysis_view -name test_min -constraint_mode test -delay_corner corner_min
set_analysis_view -setup [list func_max test_max] -hold [list func_min test_min]
