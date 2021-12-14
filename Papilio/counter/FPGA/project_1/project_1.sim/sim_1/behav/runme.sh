#!/bin/sh
# 
# PlanAhead(TM)
# runme.sh: PlanAhead-generated Script for launching ISim application
# Copyright 1986-1999, 2001-2013 Xilinx, Inc. All Rights Reserved.
# 
if [ -z "$PATH" ]; then
  PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM:/work/installs/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/bin/lin64
else
  PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM:/work/installs/Xilinx/14.7/ISE_DS/EDK/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/bin/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/bin/lin64:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=$XILINX/lib/$PLATFORM:/work/installs/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/lib/lin64
else
  LD_LIBRARY_PATH=$XILINX/lib/$PLATFORM:/work/installs/Xilinx/14.7/ISE_DS/EDK/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/ISE/lib/lin64:/work/installs/Xilinx/14.7/ISE_DS/common/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

#
# Setup env for Xilinx simulation libraries
#
XILINX_PLANAHEAD=/work/installs/Xilinx/14.7/ISE_DS/PlanAhead
export XILINX_PLANAHEAD
ExecStep()
{
   "$@"
   RETVAL=$?
   if [ $RETVAL -ne 0 ]
   then
       exit $RETVAL
   fi
}


ExecStep fuse -intstyle pa -incremental -L work -L unisims_ver -L unimacro_ver -L xilinxcorelib_ver -L secureip -o counter_tb.exe --prj /home/saul/Projects/digital/DIGIMP/Papilio/counter/FPGA/project_1/project_1.sim/sim_1/behav/counter_tb.prj -top work.counter_tb -top work.glbl
