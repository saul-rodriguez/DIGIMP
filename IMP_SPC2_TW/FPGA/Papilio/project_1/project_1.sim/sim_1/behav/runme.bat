@echo off


rem  PlanAhead(TM)
rem  runme.bat: a PlanAhead-generated ISim simulation Script
rem  Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.


set PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM;/pkg/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/pkg/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/pkg/Xilinx/14.7/ISE_DS/common/bin/lin64;/pkg/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/pkg/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/pkg/Xilinx/14.7/ISE_DS/common/lib/lin64;/pkg/Xilinx/14.7/ISE_DS/PlanAhead/bin;%PATH%

set XILINX_PLANAHEAD=/pkg/Xilinx/14.7/ISE_DS/PlanAhead

fuse -intstyle pa -incremental -L work -L unisims_ver -L unimacro_ver -L xilinxcorelib_ver -L secureip -o spc2_pap_tb.exe --prj /home/saul/projects/digital/DIGIMP/IMP_SPC2_TW/FPGA/Papilio/project_1/project_1.sim/sim_1/behav/spc2_pap_tb.prj -top work.spc2_pap_tb -top work.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
