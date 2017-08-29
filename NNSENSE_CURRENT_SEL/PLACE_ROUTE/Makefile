help:
	echo "Options"
	echo "    reset........delete all"
	echo "    cleanin .....clear rundir_innovus"
	echo "    cleanvo......clear rundir_voltus"

reset:
	\rm -rf VERILOG CONFIG CONSTRAINTS DEF FINALDATA REPORTS SCRIPTS rundir_innovus rundir_voltus cds.lib SNW OADB 

cleanin:
	mv rundir_innovus/enc.tcl inenc.tcl
	mv rundir_innovus/cds.lib incds.lib
	\rm -rf rundir_innovus
	mkdir rundir_innovus
	mv inenc.tcl rundir_innovus/enc.tcl
	mv incds.lib rundir_innovus/cds.lib

cleanvo:
	mv rundir_voltus/.ssvrc vsssvr
	mv rundir_voltus/cds.lib vscds.lib
	\rm -rf rundir_voltus/*
	mv vscds.lib rundir_voltus/cds.lib
	mv vsssvr rundir_voltus/.ssvrc

