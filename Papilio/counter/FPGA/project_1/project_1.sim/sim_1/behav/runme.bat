@echo off


rem  PlanAhead(TM)
rem  runme.bat: a PlanAhead-generated ISim simulation Script
rem  Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.


set PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM;/work/installs/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/bin/lin64;/work/installs/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/lib/lin64;/work/installs/Xilinx/14.7/ISE_DS/PlanAhead/bin;%PATH%

set XILINX_PLANAHEAD=/work/installs/Xilinx/14.7/ISE_DS/PlanAhead

fuse -intstyle pa -incremental -L work -L unisims_ver -L unimacro_ver -L xilinxcorelib_ver -L secureip -o counter_tb.exe --prj /home/saul/Projects/digital/DIGIMP/Papilio/counter/FPGA/project_1/project_1.sim/sim_1/behav/counter_tb.prj -top work.counter_tb -top work.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
