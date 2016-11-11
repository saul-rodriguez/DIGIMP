@echo off


rem  PlanAhead(TM)
rem  runme.bat: a PlanAhead-generated ISim simulation Script
rem  Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.


set PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM;/pkg/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/pkg/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/pkg/Xilinx/14.7/ISE_DS/common/bin/lin64;/pkg/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/pkg/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/pkg/Xilinx/14.7/ISE_DS/common/lib/lin64;/pkg/Xilinx/14.7/ISE_DS/PlanAhead/bin;%PATH%

set XILINX_PLANAHEAD=/pkg/Xilinx/14.7/ISE_DS/PlanAhead

fuse -intstyle pa -incremental -L work -L simprims_ver -L unisims_ver -L secureip -o I2C_f_tb.exe --prj /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.sim/sim_1/impl/timing/I2C_f_tb.prj -top work.I2C_f_tb -top work.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
