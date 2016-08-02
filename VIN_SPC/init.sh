
# File "init.sh"
# Cadence initialization file for AMS CMOS 0.18um
# Author: Saul Rodriguez
# date: 2015-11-25

###########################
# Set path to AMS C18 PDK #
###########################
export AMS_DIR=/pkg/AMS411
export PATH=$PATH:$AMS_DIR/cds/bin:$AMS_DIR/programs/bin

################################
# Set path to Cadence Virtuoso #
################################ 
export CDSDIR=/pkg/Cadence/installs/IC615
export PATH=$PATH:$CDSDIR/tools/bin:$CDSDIR/tools/dfII/bin
export CDS_AUTO_64BIT=ALL
# These lines will enable some modgen options (6.1.5)
export CDS_XL_DUMMY_BA_FLOW=true
export MG_ENABLE_PTOT=true

## CDS_Netlisting_Mode
## Interpretion of CDF properties during netlisting
export CDS_Netlisting_Mode="Analog"

##################################
# Set path to MMSIM (simulators) #
##################################
export MMSIM_HOME=/pkg/Cadence/installs/MMSIM141
export PATH=$PATH:$MMSIM_HOME/tools/bin
export CDS_AHDLCMI_ENABLE=NO

############################
# Set ASSURA DRC/LVS tools #
############################
export ASSURAHOME=/pkg/Cadence/installs/ASSURA41
export PATH=$PATH:$ASSURAHOME/tools/bin:$ASSURAHOME/tools/assura/bin
export ASSURA_AUTO_64BIT=ALL

################################
# Set QRC Parasitic Extraction #
################################
export QRC_HOME=/pkg/Cadence/installs/EXT142
export PATH=$PATH:$QRC_HOME/tools/bin
export QRC_ENABLE_EXTRACTION="t"

######################
# Set INCISIVE tools #
######################
export IUSDIR=/pkg/Cadence/installs/INCISIVE142
export PATH=$PATH:$IUSDIR/tools/bin/64bit:$IUSDIR/tools/bin

export CDS_BIND_TMP_DD=true

##########################################
# ENCOUNTER DIGITAL IMPLEMENTATION (EDI) #
##########################################
export EDIHOME=/pkg/Cadence/installs/EDI142
export PATH=$PATH:$EDIHOME/tools/bin/64bit:$EDIHOME/tools/bin
export CDS_ENABLE_EXP_PCELL=TRUE

###################
# RC RTL Compiler #
###################
export RTL_HOME=/pkg/Cadence/installs/RC142
export PATH=$PATH:$RTL_HOME/tools.lnx86/bin

#############################
# CALIBRE PHYS VERIFICATION #
#############################
export MGC_HOME=/pkg/calibre_2012/ixl_cal_2012.4_16.11
#export MGC_HOME=/pkg/calibre_2015/aoi_cal_2015.4_16.11
#export OA_PLUGIN_PATH=${MGC_HOME}/shared/pkgs/icv/tools/queryskl
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$MGC_HOME/shared/pkgs/icv/tools/calibre_client/lib/64



# Set license file location for Cadence software
export LM_LICENSE_FILE=@lic1.ict.kth.se

#Start Cadence tools

echo Cadence Environemnt initalization for AMS C18/H18 completed 
echo to create a C18/a18 project or run virtuoso
echo uncomment one of the lines in the script start_ams.sh and run it  




