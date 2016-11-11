////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: I2C_f_tb_time_impl.v
// /___/   /\     Timestamp: Fri Nov 11 13:57:03 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog -sdf_path . -insert_pp_buffers true -sdf_anno true -pcf /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.runs/impl_1/top.pcf /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.runs/impl_1/top_routed.ncd /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.sim/sim_1/impl/timing/I2C_f_tb_time_impl.v 
// Device	: 6slx9tqg144-2 (PRODUCTION 1.23 2013-10-13)
// Input file	: /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.runs/impl_1/top_routed.ncd
// Output file	: /home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.sim/sim_1/impl/timing/I2C_f_tb_time_impl.v
// # of Modules	: 1
// Design Name	: top
// Xilinx        : /pkg/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module top (
  DIR_UP, DIR_DOWN, ARDUINO_RESET, LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, SW0, SW1, SW2, SW3
);
  input DIR_UP;
  input DIR_DOWN;
  output ARDUINO_RESET;
  output LED0;
  output LED1;
  output LED2;
  output LED3;
  output LED4;
  output LED5;
  output LED6;
  output LED7;
  input SW0;
  output SW1;
  input SW2;
  input SW3;
  wire SW2_IBUF_0;
  wire SW2_IBUF_BUFG_892;
  wire SW0_IBUF_0;
  wire SW0_IBUF_BUFG_894;
  wire \my_I2C/stop_detect_895 ;
  wire \my_I2C/input_shift_3_LDC_896 ;
  wire \my_I2C/input_shift_3_C_3_897 ;
  wire \my_I2C/input_shift_3_P_3_898 ;
  wire \my_I2C/_n0177_inv ;
  wire \my_I2C/state[2]_GND_4_o_equal_20_o ;
  wire \my_I2C/RSTN_inv ;
  wire \my_I2C/input_shift_4_LDC_906 ;
  wire \my_I2C/input_shift_4_C_4_907 ;
  wire \my_I2C/input_shift_4_P_4_908 ;
  wire \my_I2C/ack_bit_start_detect_OR_6_o_0 ;
  wire \my_I2C/ack_bit ;
  wire \my_I2C/master_ack_913 ;
  wire \my_I2C/state_FSM_FFd1_917 ;
  wire \my_I2C/start_detect_918 ;
  wire \my_I2C/state_FSM_FFd3_919 ;
  wire \my_I2C/state_FSM_FFd2_920 ;
  wire \my_I2C/bit_counter[3]_PWR_3_o_equal_2_o ;
  wire \my_I2C/state[2]_state[2]_OR_31_o1 ;
  wire \my_I2C/RST_input_shift[7]_AND_17_o ;
  wire \my_I2C/input_shift_5 ;
  wire \my_I2C/ack_bit1_925 ;
  wire \my_I2C/RST_input_shift[7]_AND_25_o ;
  wire \my_I2C/input_shift_0_LDC_927 ;
  wire \my_I2C/input_shift_0_P_0_928 ;
  wire \my_I2C/input_shift_0_C_0_929 ;
  wire \my_I2C/input_shift_1 ;
  wire LED5_OBUF_931;
  wire DIR_UP_IBUF_0;
  wire DIR_DOWN_IBUF_0;
  wire \my_I2C/input_shift_5_LDC_937 ;
  wire \my_I2C/RST_input_shift[7]_AND_18_o ;
  wire LED6_OBUF_940;
  wire \my_I2C/input_shift_5_C_5_944 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[5] ;
  wire \my_I2C/input_shift_5_P_5_946 ;
  wire \my_I2C/input_shift_4 ;
  wire \my_I2C/input_shift_2_P_2_948 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[2] ;
  wire \my_I2C/RST_input_shift[7]_AND_23_o ;
  wire LED7_OBUF_951;
  wire \my_I2C/input_shift_7 ;
  wire \my_I2C/N24 ;
  wire \my_I2C/N36 ;
  wire \my_I2C/lsb_bit ;
  wire \my_I2C/N34 ;
  wire \my_I2C/N32 ;
  wire SDA_out;
  wire \my_I2C/RST_input_shift[7]_AND_19_o ;
  wire \my_I2C/RST_input_shift[7]_AND_27_o ;
  wire \my_I2C/_n0197_inv ;
  wire \my_I2C/RST_input_shift[7]_AND_15_o ;
  wire \my_I2C/input_shift_6_LDC_971 ;
  wire \my_I2C/RST_input_shift[7]_AND_16_o ;
  wire \my_I2C/input_shift_0 ;
  wire \my_I2C/input_shift_1_LDC_974 ;
  wire \my_I2C/input_shift_1_P_1_975 ;
  wire \my_I2C/input_shift_1_C_1_976 ;
  wire \my_I2C/input_shift_2 ;
  wire \my_I2C/input_shift_2_LDC_978 ;
  wire \my_I2C/input_shift_2_C_2_979 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[0] ;
  wire \my_I2C/RST_input_shift[7]_AND_28_o ;
  wire \my_I2C/input_shift_6_C_6_982 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[6] ;
  wire \my_I2C/input_shift_3 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[3] ;
  wire \my_I2C/RST_input_shift[7]_AND_21_o ;
  wire \my_I2C/_n0181_inv1 ;
  wire \my_I2C/N2 ;
  wire \my_I2C/Madd_index_pointer[7]_GND_4_o_add_20_OUT_cy[5] ;
  wire \my_I2C/input_shift_6 ;
  wire \my_I2C/input_shift_6_P_6_994 ;
  wire \my_I2C/input_shift_7_LDC_995 ;
  wire \my_I2C/input_shift_7_P_7_996 ;
  wire \my_I2C/input_shift_7_C_7_997 ;
  wire \my_I2C/RST_input_shift[7]_AND_13_o ;
  wire \my_I2C/RST_input_shift[7]_AND_14_o ;
  wire \my_I2C/start_rst_0 ;
  wire \my_I2C/_n0181_inv ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[1] ;
  wire \my_I2C/RST_input_shift[7]_AND_26_o ;
  wire \my_I2C/start_resetter_1009 ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[7] ;
  wire \my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[4] ;
  wire \my_I2C/RST_input_shift[7]_AND_24_o ;
  wire \my_I2C/RST_input_shift[7]_AND_20_o ;
  wire \my_I2C/_n0185_inv ;
  wire \my_I2C/RST_input_shift[7]_AND_22_o ;
  wire \my_I2C/stop_rst ;
  wire \my_I2C/stop_resetter_1028 ;
  wire LED0_OBUF_1030;
  wire \my_I2C/_n0189_inv ;
  wire \my_I2C/_n0193_inv ;
  wire LED1_OBUF_1039;
  wire LED2_OBUF_1040;
  wire LED3_OBUF_1041;
  wire LED4_OBUF_1042;
  wire \my_I2C/N16 ;
  wire \my_I2C/N14 ;
  wire \my_I2C/N12 ;
  wire \my_I2C/N10 ;
  wire \my_I2C/N20 ;
  wire \my_I2C/N18 ;
  wire \my_I2C/N8 ;
  wire \my_I2C/N22 ;
  wire \my_I2C/N33 ;
  wire \my_I2C/N26 ;
  wire \my_I2C/N38 ;
  wire DIR_DOWN_IBUF_7;
  wire SW0_IBUF_10;
  wire SW2_IBUF_16;
  wire \ProtoComp48.IINV.OUT ;
  wire \my_I2C/RSTN_inv_non_inverted ;
  wire DIR_UP_IBUF_39;
  wire \aux3[3]/INV_my_I2C/reg_02_3CLK ;
  wire \aux3[3]/INV_my_I2C/reg_02_2CLK ;
  wire \aux3[3]/INV_my_I2C/reg_02_1CLK ;
  wire \aux3[3]/INV_my_I2C/reg_02_0CLK ;
  wire \my_I2C/reg_03[3]/INV_my_I2C/reg_03_3CLK ;
  wire \my_I2C/reg_03[3]/INV_my_I2C/reg_03_2CLK ;
  wire \my_I2C/reg_03[3]/INV_my_I2C/reg_03_1CLK ;
  wire \my_I2C/reg_03[3]/INV_my_I2C/reg_03_0CLK ;
  wire \aux1[3]/INV_my_I2C/reg_00_3CLK ;
  wire \my_I2C/reg_03[7]/INV_my_I2C/reg_03_7CLK ;
  wire \my_I2C/reg_03[7]/INV_my_I2C/reg_03_6CLK ;
  wire \my_I2C/reg_03[7]/INV_my_I2C/reg_03_5CLK ;
  wire \my_I2C/reg_03[7]/INV_my_I2C/reg_03_4CLK ;
  wire \aux2[7]/INV_my_I2C/reg_01_7CLK ;
  wire \aux2[7]/INV_my_I2C/reg_01_6CLK ;
  wire \aux2[7]/INV_my_I2C/reg_01_5CLK ;
  wire \aux2[7]/INV_my_I2C/reg_01_4CLK ;
  wire \aux3[7]/INV_my_I2C/reg_02_7CLK ;
  wire \aux3[7]/INV_my_I2C/reg_02_6CLK ;
  wire \aux3[7]/INV_my_I2C/reg_02_5CLK ;
  wire \aux3[7]/INV_my_I2C/reg_02_4CLK ;
  wire \my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_1CLK ;
  wire \my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_0CLK ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[0] ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[1] ;
  wire \my_I2C/output_shift[4]/INV_my_I2C/output_shift_4CLK ;
  wire \my_I2C/output_shift[4]/INV_my_I2C/output_shift_3CLK ;
  wire \my_I2C/output_shift[3]_pack_5 ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[3] ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[4] ;
  wire \my_I2C/output_shift[6]/INV_my_I2C/output_shift_6CLK ;
  wire \my_I2C/output_shift[6]/INV_my_I2C/output_shift_5CLK ;
  wire \my_I2C/output_shift[5]_pack_5 ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[5] ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[6] ;
  wire \my_I2C/ack_bit_start_detect_OR_6_o ;
  wire \aux1[7]/INV_my_I2C/reg_00_7CLK ;
  wire \aux1[7]/INV_my_I2C/reg_00_6CLK ;
  wire \aux1[7]/INV_my_I2C/reg_00_5CLK ;
  wire \aux1[7]/INV_my_I2C/reg_00_4CLK ;
  wire \my_I2C/output_shift[2]/INV_my_I2C/output_shift_2CLK ;
  wire \my_I2C/output_shift[2]/INV_my_I2C/output_shift_1CLK ;
  wire \my_I2C/output_shift[1]_pack_5 ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[1] ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[2] ;
  wire \my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_3CLK ;
  wire \my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_2CLK ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[2] ;
  wire \my_I2C/N52 ;
  wire \my_I2C/N51 ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[3] ;
  wire \aux2[3]/INV_my_I2C/reg_01_3CLK ;
  wire \aux2[3]/INV_my_I2C/reg_01_2CLK ;
  wire \aux2[3]/INV_my_I2C/reg_01_1CLK ;
  wire \aux2[3]/INV_my_I2C/reg_01_0CLK ;
  wire \my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_4CLK ;
  wire \my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_5CLK ;
  wire \my_I2C/N49 ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[4] ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[5] ;
  wire \my_I2C/N50 ;
  wire \my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_7CLK ;
  wire \my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_6CLK ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[6] ;
  wire \my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[7] ;
  wire \my_I2C/output_shift[7]/INV_my_I2C/output_shift_7CLK ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[7] ;
  wire \my_I2C/output_shift[0]/INV_my_I2C/output_shift_0CLK ;
  wire \my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[0] ;
  wire \aux1[2]/INV_my_I2C/reg_00_2CLK ;
  wire \aux1[2]/INV_my_I2C/reg_00_1CLK ;
  wire \aux1[2]/INV_my_I2C/reg_00_0CLK ;
  wire \SDA_out/INV_my_I2C/output_controlCLK ;
  wire \my_I2C/PWR_3_o_PWR_3_o_MUX_29_o ;
  wire \my_I2C/start_rst ;
  wire \my_I2C/start_detect/INV_my_I2C/start_detectCLK ;
  wire \my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_3CLK ;
  wire \my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_2CLK ;
  wire \my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_1CLK ;
  wire \my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_0CLK ;
  wire \my_I2C/bit_counter[1]_pack_6 ;
  wire \my_I2C/bit_counter[3]_PWR_3_o_equal_2_o_pack_8 ;
  wire \my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd3CLK ;
  wire \my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd2CLK ;
  wire \my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd1CLK ;
  wire \my_I2C/state_FSM_FFd1-In ;
  wire \my_I2C/state_FSM_FFd2-In ;
  wire \my_I2C/state_FSM_FFd3-In ;
  wire \my_I2C/SDA_INV_11_o ;
  wire \NlwBufferSignal_SW2_IBUF_BUFG/IN ;
  wire \NlwBufferSignal_SW0_IBUF_BUFG/IN ;
  wire \NlwBufferSignal_SW1_OBUFT/I ;
  wire \NlwBufferSignal_LED0_OBUF/I ;
  wire \NlwBufferSignal_LED1_OBUF/I ;
  wire \NlwBufferSignal_LED2_OBUF/I ;
  wire \NlwBufferSignal_LED3_OBUF/I ;
  wire \NlwBufferSignal_LED4_OBUF/I ;
  wire \NlwBufferSignal_LED5_OBUF/I ;
  wire \NlwBufferSignal_LED6_OBUF/I ;
  wire \NlwBufferSignal_LED7_OBUF/I ;
  wire \NlwBufferSignal_my_I2C/reg_02_3/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_3/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_2/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_2/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_1/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_1/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_0/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_0/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_3/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_3/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_2/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_2/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_1/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_1/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_0/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_0/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_1_C_1/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_1_C_1/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_3/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_3/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_4_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_7/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_7/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_6/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_6/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_5/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_03_5/IN ;
  wire \NlwBufferSignal_my_I2C/reg_03_4/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_7/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_7/IN ;
  wire \NlwBufferSignal_my_I2C/reg_01_6/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_6/IN ;
  wire \NlwBufferSignal_my_I2C/reg_01_5/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_5/IN ;
  wire \NlwBufferSignal_my_I2C/reg_01_4/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_4/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_7/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_7/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_6/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_6/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_5/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_5/IN ;
  wire \NlwBufferSignal_my_I2C/reg_02_4/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_02_4/IN ;
  wire \NlwBufferSignal_my_I2C/index_pointer_1/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_0/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_1_P_1/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_4/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_3/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_7_P_7/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_7_P_7/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_6_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_6/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_5/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_7/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_7/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_6/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_6/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_5/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_5/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_4/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_4/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_2_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_2_C_2/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_2/CLK ;
  wire \NlwBufferSignal_my_I2C/output_shift_1/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_3/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_2/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_3/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_2/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_2/IN ;
  wire \NlwBufferSignal_my_I2C/reg_01_1/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_1/IN ;
  wire \NlwBufferSignal_my_I2C/reg_01_0/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_01_0/IN ;
  wire \NlwBufferSignal_my_I2C/index_pointer_4/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_5/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_7/CLK ;
  wire \NlwBufferSignal_my_I2C/index_pointer_6/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_6_P_6/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_6_P_6/IN ;
  wire \NlwBufferSignal_my_I2C/output_shift_7/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_2_P_2/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_2_P_2/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_3_P_3/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_3_P_3/IN ;
  wire \NlwBufferSignal_my_I2C/output_shift_0/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_3_C_3/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_3_C_3/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_2/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_2/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_1/CLK ;
  wire \NlwBufferSignal_my_I2C/reg_00_1/IN ;
  wire \NlwBufferSignal_my_I2C/reg_00_0/CLK ;
  wire \NlwBufferSignal_my_I2C/output_control/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_6_C_6/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_0_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_0_C_0/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_0_C_0/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_3_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/stop_detect/CLK ;
  wire \NlwBufferSignal_my_I2C/stop_detect/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_1_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_0_P_0/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_0_P_0/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_5_LDC/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_5_C_5/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_5_C_5/IN ;
  wire \NlwBufferSignal_my_I2C/start_detect/CLK ;
  wire \NlwBufferSignal_my_I2C/start_detect/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_5_P_5/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_4_C_4/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_4_C_4/IN ;
  wire \NlwBufferSignal_my_I2C/bit_counter_3/CLK ;
  wire \NlwBufferSignal_my_I2C/bit_counter_2/CLK ;
  wire \NlwBufferSignal_my_I2C/bit_counter_1/CLK ;
  wire \NlwBufferSignal_my_I2C/bit_counter_0/CLK ;
  wire \NlwBufferSignal_my_I2C/stop_resetter/CLK ;
  wire \NlwBufferSignal_my_I2C/stop_resetter/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_4_P_4/CLK ;
  wire \NlwBufferSignal_my_I2C/input_shift_4_P_4/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_7_C_7/CLK ;
  wire \NlwBufferSignal_my_I2C/state_FSM_FFd3/CLK ;
  wire \NlwBufferSignal_my_I2C/state_FSM_FFd2/CLK ;
  wire \NlwBufferSignal_my_I2C/state_FSM_FFd1/CLK ;
  wire \NlwBufferSignal_my_I2C/master_ack/CLK ;
  wire \NlwBufferSignal_my_I2C/start_resetter/CLK ;
  wire \NlwBufferSignal_my_I2C/start_resetter/IN ;
  wire \NlwBufferSignal_my_I2C/input_shift_7_LDC/CLK ;
  wire GND;
  wire VCC;
  wire [7 : 0] \my_I2C/index_pointer ;
  wire [3 : 0] \my_I2C/bit_counter ;
  wire [7 : 0] aux1;
  wire [7 : 0] aux3;
  wire [7 : 0] aux2;
  wire [7 : 0] \my_I2C/output_shift ;
  wire [7 : 0] \my_I2C/reg_03 ;
  wire [3 : 0] \my_I2C/Result ;
  initial $sdf_annotate("/home/saul/projects/digital/DIGIMP/I2c/fpga/i2c_v1/i2c_v1.sim/sim_1/impl/timing/I2C_f_tb_time_impl.sdf");
  X_CKBUF #(
    .LOC ( "BUFGMUX_X2Y3" ))
  SW2_IBUF_BUFG (
    .I(\NlwBufferSignal_SW2_IBUF_BUFG/IN ),
    .O(SW2_IBUF_BUFG_892)
  );
  X_CKBUF #(
    .LOC ( "BUFGMUX_X2Y2" ))
  SW0_IBUF_BUFG (
    .I(\NlwBufferSignal_SW0_IBUF_BUFG/IN ),
    .O(SW0_IBUF_BUFG_894)
  );
  X_OPAD #(
    .LOC ( "PAD6" ))
  ARDUINO_RESET_7 (
    .PAD(ARDUINO_RESET)
  );
  X_OBUF #(
    .LOC ( "PAD6" ))
  ARDUINO_RESET_OBUF (
    .I(1'b0),
    .O(ARDUINO_RESET)
  );
  X_IPAD #(
    .LOC ( "PAD22" ))
  DIR_DOWN_11 (
    .PAD(DIR_DOWN)
  );
  X_BUF #(
    .LOC ( "PAD22" ))
  DIR_DOWN_IBUF (
    .O(DIR_DOWN_IBUF_7),
    .I(DIR_DOWN)
  );
  X_BUF #(
    .LOC ( "PAD22" ))
  \ProtoComp46.IMUX  (
    .I(DIR_DOWN_IBUF_7),
    .O(DIR_DOWN_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD40" ))
  SW0_15 (
    .PAD(SW0)
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  SW0_IBUF (
    .O(SW0_IBUF_10),
    .I(SW0)
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  \ProtoComp46.IMUX.1  (
    .I(SW0_IBUF_10),
    .O(SW0_IBUF_0)
  );
  X_OPAD #(
    .LOC ( "PAD39" ))
  SW1_18 (
    .PAD(SW1)
  );
  X_OBUFT #(
    .LOC ( "PAD39" ))
  SW1_OBUFT (
    .I(\NlwBufferSignal_SW1_OBUFT/I ),
    .O(SW1),
    .CTL(SDA_out)
  );
  X_IPAD #(
    .LOC ( "PAD38" ))
  SW2_22 (
    .PAD(SW2)
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  SW2_IBUF (
    .O(SW2_IBUF_16),
    .I(SW2)
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  \ProtoComp46.IMUX.2  (
    .I(SW2_IBUF_16),
    .O(SW2_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD37" ))
  SW3_27 (
    .PAD(SW3)
  );
  X_BUF #(
    .LOC ( "PAD37" ))
  SW3_IBUF (
    .O(\my_I2C/RSTN_inv_non_inverted ),
    .I(SW3)
  );
  X_BUF #(
    .LOC ( "PAD37" ))
  \ProtoComp48.IMUX  (
    .I(\ProtoComp48.IINV.OUT ),
    .O(\my_I2C/RSTN_inv )
  );
  X_INV #(
    .LOC ( "PAD37" ))
  \ProtoComp48.IINV  (
    .I(\my_I2C/RSTN_inv_non_inverted ),
    .O(\ProtoComp48.IINV.OUT )
  );
  X_OPAD #(
    .LOC ( "PAD120" ))
  LED0_30 (
    .PAD(LED0)
  );
  X_OBUF #(
    .LOC ( "PAD120" ))
  LED0_OBUF (
    .I(\NlwBufferSignal_LED0_OBUF/I ),
    .O(LED0)
  );
  X_OPAD #(
    .LOC ( "PAD122" ))
  LED1_33 (
    .PAD(LED1)
  );
  X_OBUF #(
    .LOC ( "PAD122" ))
  LED1_OBUF (
    .I(\NlwBufferSignal_LED1_OBUF/I ),
    .O(LED1)
  );
  X_OPAD #(
    .LOC ( "PAD134" ))
  LED2_36 (
    .PAD(LED2)
  );
  X_OBUF #(
    .LOC ( "PAD134" ))
  LED2_OBUF (
    .I(\NlwBufferSignal_LED2_OBUF/I ),
    .O(LED2)
  );
  X_OPAD #(
    .LOC ( "PAD35" ))
  LED3_39 (
    .PAD(LED3)
  );
  X_OBUF #(
    .LOC ( "PAD35" ))
  LED3_OBUF (
    .I(\NlwBufferSignal_LED3_OBUF/I ),
    .O(LED3)
  );
  X_OPAD #(
    .LOC ( "PAD28" ))
  LED4_42 (
    .PAD(LED4)
  );
  X_OBUF #(
    .LOC ( "PAD28" ))
  LED4_OBUF (
    .I(\NlwBufferSignal_LED4_OBUF/I ),
    .O(LED4)
  );
  X_OPAD #(
    .LOC ( "PAD27" ))
  LED5_45 (
    .PAD(LED5)
  );
  X_OBUF #(
    .LOC ( "PAD27" ))
  LED5_OBUF (
    .I(\NlwBufferSignal_LED5_OBUF/I ),
    .O(LED5)
  );
  X_OPAD #(
    .LOC ( "PAD26" ))
  LED6_48 (
    .PAD(LED6)
  );
  X_OBUF #(
    .LOC ( "PAD26" ))
  LED6_OBUF (
    .I(\NlwBufferSignal_LED6_OBUF/I ),
    .O(LED6)
  );
  X_OPAD #(
    .LOC ( "PAD25" ))
  LED7_51 (
    .PAD(LED7)
  );
  X_OBUF #(
    .LOC ( "PAD25" ))
  LED7_OBUF (
    .I(\NlwBufferSignal_LED7_OBUF/I ),
    .O(LED7)
  );
  X_IPAD #(
    .LOC ( "PAD23" ))
  DIR_UP_55 (
    .PAD(DIR_UP)
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  DIR_UP_IBUF (
    .O(DIR_UP_IBUF_39),
    .I(DIR_UP)
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  \ProtoComp46.IMUX.3  (
    .I(DIR_UP_IBUF_39),
    .O(DIR_UP_IBUF_0)
  );
  X_INV   \INV_my_I2C/reg_02_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[3]/INV_my_I2C/reg_02_3CLK )
  );
  X_INV   \INV_my_I2C/reg_02_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[3]/INV_my_I2C/reg_02_2CLK )
  );
  X_INV   \INV_my_I2C/reg_02_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[3]/INV_my_I2C/reg_02_1CLK )
  );
  X_INV   \INV_my_I2C/reg_02_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[3]/INV_my_I2C/reg_02_0CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_3  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_3/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_3/IN ),
    .O(aux3[3]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_2  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_2/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_2/IN ),
    .O(aux3[2]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_1  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_1/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_1/IN ),
    .O(aux3[1]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_0  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_0/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_0/IN ),
    .O(aux3[0]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_INV   \INV_my_I2C/reg_03_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_3CLK )
  );
  X_INV   \INV_my_I2C/reg_03_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_2CLK )
  );
  X_INV   \INV_my_I2C/reg_03_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_1CLK )
  );
  X_INV   \INV_my_I2C/reg_03_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_0CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_3  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_3/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_3/IN ),
    .O(\my_I2C/reg_03 [3]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_2  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_2/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_2/IN ),
    .O(\my_I2C/reg_03 [2]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_1  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_1/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_1/IN ),
    .O(\my_I2C/reg_03 [1]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_0  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_0/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_0/IN ),
    .O(\my_I2C/reg_03 [0]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y45" ),
    .INIT ( 64'hCCCCCCCCFA50FA50 ))
  Mmux_LED011 (
    .ADR4(1'b1),
    .ADR5(DIR_UP_IBUF_0),
    .ADR2(aux1[0]),
    .ADR0(DIR_DOWN_IBUF_0),
    .ADR3(aux3[0]),
    .ADR1(aux2[0]),
    .O(LED0_OBUF_1030)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_1_C_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_1_C_1/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_1_C_1/IN ),
    .O(\my_I2C/input_shift_1_C_1_976 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_26_o ),
    .SET(GND)
  );
  X_INV   \INV_my_I2C/reg_00_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[3]/INV_my_I2C/reg_00_3CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_3  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_3/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_3/IN ),
    .O(aux1[3]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y47" ),
    .INIT ( 64'hF0F0F0F0AAAACCCC ))
  Mmux_LED311 (
    .ADR3(1'b1),
    .ADR5(DIR_UP_IBUF_0),
    .ADR1(aux1[3]),
    .ADR4(DIR_DOWN_IBUF_0),
    .ADR0(aux3[3]),
    .ADR2(aux2[3]),
    .O(LED3_OBUF_1041)
  );
  X_LATCHE #(
    .LOC ( "SLICE_X12Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_4_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_4_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_4_LDC_906 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_20_o ),
    .SET(GND)
  );
  X_INV   \INV_my_I2C/reg_03_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_7CLK )
  );
  X_INV   \INV_my_I2C/reg_03_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_6CLK )
  );
  X_INV   \INV_my_I2C/reg_03_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_5CLK )
  );
  X_INV   \INV_my_I2C/reg_03_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_4CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_7  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_7/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_7/IN ),
    .O(\my_I2C/reg_03 [7]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_6  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_6/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_6/IN ),
    .O(\my_I2C/reg_03 [6]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_5  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_5/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_03_5/IN ),
    .O(\my_I2C/reg_03 [5]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_03_4  (
    .CE(\my_I2C/_n0193_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_03_4/CLK ),
    .I(\my_I2C/input_shift_4 ),
    .O(\my_I2C/reg_03 [4]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y49" ),
    .INIT ( 64'hFC30FC30FC30FC30 ))
  \my_I2C/input_shift_41  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .ADR1(\my_I2C/input_shift_4_LDC_906 ),
    .ADR3(\my_I2C/input_shift_4_P_4_908 ),
    .ADR2(\my_I2C/input_shift_4_C_4_907 ),
    .O(\my_I2C/input_shift_4 )
  );
  X_INV   \INV_my_I2C/reg_01_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[7]/INV_my_I2C/reg_01_7CLK )
  );
  X_INV   \INV_my_I2C/reg_01_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[7]/INV_my_I2C/reg_01_6CLK )
  );
  X_INV   \INV_my_I2C/reg_01_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[7]/INV_my_I2C/reg_01_5CLK )
  );
  X_INV   \INV_my_I2C/reg_01_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[7]/INV_my_I2C/reg_01_4CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_7  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_7/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_7/IN ),
    .O(aux2[7]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_6  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_6/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_6/IN ),
    .O(aux2[6]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_5  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_5/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_5/IN ),
    .O(aux2[5]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_4  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_4/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_4/IN ),
    .O(aux2[4]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_INV   \INV_my_I2C/reg_02_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[7]/INV_my_I2C/reg_02_7CLK )
  );
  X_INV   \INV_my_I2C/reg_02_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[7]/INV_my_I2C/reg_02_6CLK )
  );
  X_INV   \INV_my_I2C/reg_02_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[7]/INV_my_I2C/reg_02_5CLK )
  );
  X_INV   \INV_my_I2C/reg_02_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux3[7]/INV_my_I2C/reg_02_4CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_7  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_7/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_7/IN ),
    .O(aux3[7]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 64'hFFFCFF3000FC0030 ))
  Mmux_LED411 (
    .ADR0(1'b1),
    .ADR3(DIR_UP_IBUF_0),
    .ADR2(aux1[4]),
    .ADR1(DIR_DOWN_IBUF_0),
    .ADR4(aux3[4]),
    .ADR5(aux2[4]),
    .O(LED4_OBUF_1042)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_6  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_6/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_6/IN ),
    .O(aux3[6]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_5  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_5/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_5/IN ),
    .O(aux3[5]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 64'hCCCCCCCCFAFA0A0A ))
  Mmux_LED711 (
    .ADR3(1'b1),
    .ADR5(DIR_UP_IBUF_0),
    .ADR0(aux1[7]),
    .ADR2(DIR_DOWN_IBUF_0),
    .ADR4(aux3[7]),
    .ADR1(aux2[7]),
    .O(LED7_OBUF_951)
  );
  X_FF #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_02_4  (
    .CE(\my_I2C/_n0189_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_02_4/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_02_4/IN ),
    .O(aux3[4]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X12Y51" ),
    .INIT ( 64'hFECEFECE32023202 ))
  Mmux_LED611 (
    .ADR4(1'b1),
    .ADR1(DIR_UP_IBUF_0),
    .ADR0(aux1[6]),
    .ADR2(DIR_DOWN_IBUF_0),
    .ADR3(aux3[6]),
    .ADR5(aux2[6]),
    .O(LED6_OBUF_940)
  );
  X_INV   \INV_my_I2C/index_pointer_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_1CLK )
  );
  X_INV   \INV_my_I2C/index_pointer_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_0CLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 64'hFFFF0F0FF0F00000 ))
  \my_I2C/input_shift_11  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR2(\my_I2C/input_shift_1_LDC_974 ),
    .ADR4(\my_I2C/input_shift_1_P_1_975 ),
    .ADR5(\my_I2C/input_shift_1_C_1_976 ),
    .O(\my_I2C/input_shift_1 )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_1  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_1/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[1] ),
    .O(\my_I2C/index_pointer [1]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 64'h0323303203013010 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT21  (
    .ADR1(\my_I2C/stop_detect_895 ),
    .ADR0(\my_I2C/state_FSM_FFd3_919 ),
    .ADR3(\my_I2C/state_FSM_FFd2_920 ),
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR2(\my_I2C/index_pointer [0]),
    .ADR5(\my_I2C/input_shift_1 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[1] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  \my_I2C/state_state[2]_GND_4_o_equal_20_o1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR5(1'b1),
    .ADR3(1'b1),
    .ADR2(\my_I2C/state_FSM_FFd3_919 ),
    .ADR4(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/state[2]_GND_4_o_equal_20_o )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_0  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_0/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[0] ),
    .O(\my_I2C/index_pointer [0]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y44" ),
    .INIT ( 64'h2323003320200033 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT11  (
    .ADR1(\my_I2C/stop_detect_895 ),
    .ADR4(\my_I2C/state[2]_GND_4_o_equal_20_o ),
    .ADR2(\my_I2C/input_shift_0_LDC_927 ),
    .ADR3(\my_I2C/index_pointer [0]),
    .ADR0(\my_I2C/input_shift_0_P_0_928 ),
    .ADR5(\my_I2C/input_shift_0_C_0_929 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[0] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y45" ),
    .INIT ( 64'h4000000000000000 ))
  \my_I2C/_n0189_inv1  (
    .ADR0(\my_I2C/index_pointer [0]),
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR5(\my_I2C/_n0181_inv1 ),
    .ADR3(\my_I2C/ack_bit ),
    .ADR1(\my_I2C/state_FSM_FFd3_919 ),
    .ADR2(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/_n0189_inv )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y46" ),
    .INIT ( 64'hCC00CC00C4C48080 ))
  \my_I2C/RST_input_shift[7]_AND_25_o1  (
    .ADR0(\my_I2C/input_shift_0_LDC_927 ),
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR2(\my_I2C/input_shift_0_P_0_928 ),
    .ADR4(\my_I2C/input_shift_0_C_0_929 ),
    .ADR3(\my_I2C/input_shift_1 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_25_o )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y46" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_1_P_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_1_P_1/CLK ),
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[1] ),
    .O(\my_I2C/input_shift_1_P_1_975 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_25_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y46" ),
    .INIT ( 64'hF5F5A0A0FF00FF00 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT21  (
    .ADR1(1'b1),
    .ADR0(\my_I2C/input_shift_1_LDC_974 ),
    .ADR4(\my_I2C/input_shift_1_C_1_976 ),
    .ADR2(\my_I2C/input_shift_1_P_1_975 ),
    .ADR3(\my_I2C/input_shift_0 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[1] )
  );
  X_INV   \INV_my_I2C/output_shift_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[4]/INV_my_I2C/output_shift_4CLK )
  );
  X_INV   \INV_my_I2C/output_shift_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[4]/INV_my_I2C/output_shift_3CLK )
  );
  X_BUF   \my_I2C/output_shift[4]/my_I2C/output_shift[4]_CMUX_Delay  (
    .I(\my_I2C/output_shift[3]_pack_5 ),
    .O(\my_I2C/output_shift [3])
  );
  X_FF #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_4  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_4/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[4] ),
    .O(\my_I2C/output_shift [4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 64'hFA0AFA0AFA0AFA0A ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT5  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(\my_I2C/lsb_bit ),
    .ADR3(\my_I2C/N14 ),
    .ADR0(\my_I2C/output_shift [3]),
    .ADR5(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[4] )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 32'hCFCFC0C0 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT4  (
    .ADR1(\my_I2C/N16 ),
    .ADR4(\my_I2C/output_shift [2]),
    .ADR2(\my_I2C/lsb_bit ),
    .ADR3(1'b1),
    .ADR0(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[3] )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_3  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_3/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[3] ),
    .O(\my_I2C/output_shift[3]_pack_5 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 64'hBBFCBB3088FC8830 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT5_SW0  (
    .ADR3(\my_I2C/index_pointer [1]),
    .ADR1(\my_I2C/index_pointer [0]),
    .ADR5(aux3[4]),
    .ADR0(\my_I2C/reg_03 [4]),
    .ADR4(aux2[4]),
    .ADR2(aux1[4]),
    .O(\my_I2C/N14 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y47" ),
    .INIT ( 64'hBFB3BCB08F838C80 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT4_SW0  (
    .ADR1(\my_I2C/index_pointer [1]),
    .ADR2(\my_I2C/index_pointer [0]),
    .ADR3(aux3[3]),
    .ADR0(\my_I2C/reg_03 [3]),
    .ADR5(aux2[3]),
    .ADR4(aux1[3]),
    .O(\my_I2C/N16 )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y48" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_7_P_7  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_7_P_7/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_7_P_7/IN ),
    .O(\my_I2C/input_shift_7_P_7_996 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_13_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y48" ),
    .INIT ( 64'hC0C0C0C0CC884400 ))
  \my_I2C/RST_input_shift[7]_AND_13_o1  (
    .ADR0(\my_I2C/input_shift_6_LDC_971 ),
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_6_P_6_994 ),
    .ADR3(\my_I2C/input_shift_6_C_6_982 ),
    .ADR2(\my_I2C/input_shift_7 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_13_o )
  );
  X_LATCHE #(
    .LOC ( "SLICE_X13Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_6_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_6_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_6_LDC_971 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_16_o ),
    .SET(GND)
  );
  X_INV   \INV_my_I2C/output_shift_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[6]/INV_my_I2C/output_shift_6CLK )
  );
  X_INV   \INV_my_I2C/output_shift_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[6]/INV_my_I2C/output_shift_5CLK )
  );
  X_BUF   \my_I2C/output_shift[6]/my_I2C/output_shift[6]_DMUX_Delay  (
    .I(\my_I2C/ack_bit_start_detect_OR_6_o ),
    .O(\my_I2C/ack_bit_start_detect_OR_6_o_0 )
  );
  X_BUF   \my_I2C/output_shift[6]/my_I2C/output_shift[6]_CMUX_Delay  (
    .I(\my_I2C/output_shift[5]_pack_5 ),
    .O(\my_I2C/output_shift [5])
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 64'h1000000010000000 ))
  \my_I2C/lsb_bit1  (
    .ADR0(\my_I2C/start_detect_918 ),
    .ADR1(\my_I2C/bit_counter [3]),
    .ADR4(\my_I2C/bit_counter [2]),
    .ADR2(\my_I2C/bit_counter [1]),
    .ADR3(\my_I2C/bit_counter [0]),
    .ADR5(1'b1),
    .O(\my_I2C/lsb_bit )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 32'hAAAAAAAE ))
  \my_I2C/ack_bit_start_detect_OR_6_o1  (
    .ADR0(\my_I2C/start_detect_918 ),
    .ADR1(\my_I2C/bit_counter [3]),
    .ADR4(\my_I2C/bit_counter [2]),
    .ADR2(\my_I2C/bit_counter [1]),
    .ADR3(\my_I2C/bit_counter [0]),
    .O(\my_I2C/ack_bit_start_detect_OR_6_o )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_6  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_6/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[6] ),
    .O(\my_I2C/output_shift [6]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 64'hFF00F0F0FF00F0F0 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT7  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(\my_I2C/lsb_bit ),
    .ADR3(\my_I2C/N10 ),
    .ADR2(\my_I2C/output_shift [5]),
    .ADR5(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[6] )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 32'hCCCCAAAA ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT6  (
    .ADR1(\my_I2C/N12 ),
    .ADR0(\my_I2C/output_shift [4]),
    .ADR4(\my_I2C/lsb_bit ),
    .ADR3(1'b1),
    .ADR2(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[5] )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_5  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_5/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[5] ),
    .O(\my_I2C/output_shift[5]_pack_5 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 64'hFA50EEEEFA504444 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT7_SW0  (
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/index_pointer [0]),
    .ADR2(aux3[6]),
    .ADR3(\my_I2C/reg_03 [6]),
    .ADR5(aux2[6]),
    .ADR1(aux1[6]),
    .O(\my_I2C/N10 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y50" ),
    .INIT ( 64'hCCFFCC00F0AAF0AA ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT6_SW0  (
    .ADR3(\my_I2C/index_pointer [1]),
    .ADR5(\my_I2C/index_pointer [0]),
    .ADR2(aux3[5]),
    .ADR1(\my_I2C/reg_03 [5]),
    .ADR4(aux2[5]),
    .ADR0(aux1[5]),
    .O(\my_I2C/N12 )
  );
  X_INV   \INV_my_I2C/reg_00_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[7]/INV_my_I2C/reg_00_7CLK )
  );
  X_INV   \INV_my_I2C/reg_00_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[7]/INV_my_I2C/reg_00_6CLK )
  );
  X_INV   \INV_my_I2C/reg_00_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[7]/INV_my_I2C/reg_00_5CLK )
  );
  X_INV   \INV_my_I2C/reg_00_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[7]/INV_my_I2C/reg_00_4CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X13Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_7  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_7/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_7/IN ),
    .O(aux1[7]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X13Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_6  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_6/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_6/IN ),
    .O(aux1[6]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X13Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_5  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_5/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_5/IN ),
    .O(aux1[5]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X13Y51" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_4  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_4/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_4/IN ),
    .O(aux1[4]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X13Y51" ),
    .INIT ( 64'hCCCCCCCCFAFA0A0A ))
  Mmux_LED511 (
    .ADR3(1'b1),
    .ADR5(DIR_UP_IBUF_0),
    .ADR0(aux1[5]),
    .ADR2(DIR_DOWN_IBUF_0),
    .ADR4(aux3[5]),
    .ADR1(aux2[5]),
    .O(LED5_OBUF_931)
  );
  X_LATCHE #(
    .LOC ( "SLICE_X14Y42" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_2_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_2_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_2_LDC_978 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_24_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y42" ),
    .INIT ( 64'hAAAAAAAAFFCC3300 ))
  Mmux_LED111 (
    .ADR2(1'b1),
    .ADR5(DIR_UP_IBUF_0),
    .ADR3(aux1[1]),
    .ADR1(DIR_DOWN_IBUF_0),
    .ADR4(aux3[1]),
    .ADR0(aux2[1]),
    .O(LED1_OBUF_1039)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y43" ),
    .INIT ( 64'h0022AA220A0A0A0A ))
  \my_I2C/RST_input_shift[7]_AND_24_o1  (
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR1(\my_I2C/input_shift_2_C_2_979 ),
    .ADR4(\my_I2C/input_shift_2_P_2_948 ),
    .ADR3(\my_I2C/input_shift_2_LDC_978 ),
    .ADR2(\my_I2C/input_shift_1 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_24_o )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y43" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_2_C_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_2_C_2/CLK ),
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[2] ),
    .O(\my_I2C/input_shift_2_C_2_979 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_24_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y43" ),
    .INIT ( 64'hFFCC3300F0F0F0F0 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT31  (
    .ADR0(1'b1),
    .ADR1(\my_I2C/input_shift_2_LDC_978 ),
    .ADR4(\my_I2C/input_shift_2_P_2_948 ),
    .ADR3(\my_I2C/input_shift_2_C_2_979 ),
    .ADR2(\my_I2C/input_shift_1 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[2] )
  );
  X_INV   \INV_my_I2C/output_shift_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[2]/INV_my_I2C/output_shift_2CLK )
  );
  X_INV   \INV_my_I2C/output_shift_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[2]/INV_my_I2C/output_shift_1CLK )
  );
  X_BUF   \my_I2C/output_shift[2]/my_I2C/output_shift[2]_CMUX_Delay  (
    .I(\my_I2C/output_shift[1]_pack_5 ),
    .O(\my_I2C/output_shift [1])
  );
  X_FF #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_2  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_2/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[2] ),
    .O(\my_I2C/output_shift [2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 64'hFC30FC30FC30FC30 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT3  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR1(\my_I2C/lsb_bit ),
    .ADR3(\my_I2C/N18 ),
    .ADR2(\my_I2C/output_shift [1]),
    .ADR5(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[2] )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 32'hBBBB8888 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT2  (
    .ADR0(\my_I2C/N20 ),
    .ADR4(\my_I2C/output_shift [0]),
    .ADR1(\my_I2C/lsb_bit ),
    .ADR3(1'b1),
    .ADR2(1'b1),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[1] )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_1  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_1/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[1] ),
    .O(\my_I2C/output_shift[1]_pack_5 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 64'hFE5EAE0EF454A404 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT3_SW0  (
    .ADR2(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/index_pointer [0]),
    .ADR4(aux3[2]),
    .ADR3(\my_I2C/reg_03 [2]),
    .ADR5(aux2[2]),
    .ADR1(aux1[2]),
    .O(\my_I2C/N18 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y44" ),
    .INIT ( 64'hFACF0ACFFAC00AC0 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT2_SW0  (
    .ADR2(\my_I2C/index_pointer [1]),
    .ADR3(\my_I2C/index_pointer [0]),
    .ADR1(aux3[1]),
    .ADR4(\my_I2C/reg_03 [1]),
    .ADR0(aux2[1]),
    .ADR5(aux1[1]),
    .O(\my_I2C/N20 )
  );
  X_INV   \INV_my_I2C/index_pointer_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_3CLK )
  );
  X_INV   \INV_my_I2C/index_pointer_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_2CLK )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X14Y45" ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT4  (
    .IA(\my_I2C/N51 ),
    .IB(\my_I2C/N52 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[3] ),
    .SEL(\my_I2C/state[2]_GND_4_o_equal_20_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 64'h000000003CCCCCCC ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT4_F  (
    .ADR0(1'b1),
    .ADR5(\my_I2C/stop_detect_895 ),
    .ADR1(\my_I2C/index_pointer [3]),
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR2(\my_I2C/index_pointer [0]),
    .ADR3(\my_I2C/index_pointer [2]),
    .O(\my_I2C/N51 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_3  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_3/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[3] ),
    .O(\my_I2C/index_pointer [3]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 64'h0F0A0F0A05000500 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT4_G  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(\my_I2C/stop_detect_895 ),
    .ADR0(\my_I2C/input_shift_3_LDC_896 ),
    .ADR3(\my_I2C/input_shift_3_C_3_897 ),
    .ADR5(\my_I2C/input_shift_3_P_3_898 ),
    .O(\my_I2C/N52 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_2  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_2/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[2] ),
    .O(\my_I2C/index_pointer [2]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 64'h00000000A3AFACA0 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT31  (
    .ADR5(\my_I2C/stop_detect_895 ),
    .ADR2(\my_I2C/state[2]_GND_4_o_equal_20_o ),
    .ADR1(\my_I2C/index_pointer [0]),
    .ADR4(\my_I2C/index_pointer [2]),
    .ADR3(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/input_shift_2 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[2] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y45" ),
    .INIT ( 64'hFFFF00FFFF000000 ))
  \my_I2C/input_shift_21  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\my_I2C/input_shift_2_LDC_978 ),
    .ADR4(\my_I2C/input_shift_2_P_2_948 ),
    .ADR5(\my_I2C/input_shift_2_C_2_979 ),
    .O(\my_I2C/input_shift_2 )
  );
  X_INV   \INV_my_I2C/reg_01_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[3]/INV_my_I2C/reg_01_3CLK )
  );
  X_INV   \INV_my_I2C/reg_01_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[3]/INV_my_I2C/reg_01_2CLK )
  );
  X_INV   \INV_my_I2C/reg_01_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[3]/INV_my_I2C/reg_01_1CLK )
  );
  X_INV   \INV_my_I2C/reg_01_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux2[3]/INV_my_I2C/reg_01_0CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_3  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_3/CLK ),
    .I(\my_I2C/input_shift_3 ),
    .O(aux2[3]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 64'hFFF0FFF000F000F0 ))
  \my_I2C/input_shift_31  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(\my_I2C/input_shift_3_LDC_896 ),
    .ADR5(\my_I2C/input_shift_3_P_3_898 ),
    .ADR2(\my_I2C/input_shift_3_C_3_897 ),
    .O(\my_I2C/input_shift_3 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_2  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_2/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_2/IN ),
    .O(aux2[2]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 64'hFDFF75FFFFFFFFFF ))
  \my_I2C/address_detect_SW2  (
    .ADR1(\my_I2C/input_shift_2_LDC_978 ),
    .ADR0(\my_I2C/state_FSM_FFd1_917 ),
    .ADR2(\my_I2C/input_shift_2_C_2_979 ),
    .ADR4(\my_I2C/input_shift_2_P_2_948 ),
    .ADR5(\my_I2C/input_shift_1 ),
    .ADR3(\my_I2C/input_shift_3 ),
    .O(\my_I2C/N36 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_1  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_1/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_1/IN ),
    .O(aux2[1]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_01_0  (
    .CE(\my_I2C/_n0185_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_01_0/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_01_0/IN ),
    .O(aux2[0]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y46" ),
    .INIT ( 64'h3F3FFFFFFFFFFFFF ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT6_SW0  (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR5(\my_I2C/index_pointer [3]),
    .ADR4(\my_I2C/index_pointer [2]),
    .ADR1(\my_I2C/index_pointer [1]),
    .ADR2(\my_I2C/index_pointer [0]),
    .O(\my_I2C/N2 )
  );
  X_INV   \INV_my_I2C/index_pointer_4CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_4CLK )
  );
  X_INV   \INV_my_I2C/index_pointer_5CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_5CLK )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X14Y47" ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT5  (
    .IA(\my_I2C/N49 ),
    .IB(\my_I2C/N50 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[4] ),
    .SEL(\my_I2C/state[2]_GND_4_o_equal_20_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 64'h1444444444444444 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT5_F  (
    .ADR0(\my_I2C/stop_detect_895 ),
    .ADR1(\my_I2C/index_pointer [4]),
    .ADR5(\my_I2C/index_pointer [2]),
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR2(\my_I2C/index_pointer [0]),
    .ADR3(\my_I2C/index_pointer [3]),
    .O(\my_I2C/N49 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_4  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_4/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[4] ),
    .O(\my_I2C/index_pointer [4]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 64'h0000FA0A0000FA0A ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT5_G  (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR4(\my_I2C/stop_detect_895 ),
    .ADR2(\my_I2C/input_shift_4_LDC_906 ),
    .ADR0(\my_I2C/input_shift_4_C_4_907 ),
    .ADR3(\my_I2C/input_shift_4_P_4_908 ),
    .O(\my_I2C/N50 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_5  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_5/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[5] ),
    .O(\my_I2C/index_pointer [5]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 64'h00FF009A0000009A ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT6  (
    .ADR3(\my_I2C/stop_detect_895 ),
    .ADR4(\my_I2C/state[2]_GND_4_o_equal_20_o ),
    .ADR1(\my_I2C/N2 ),
    .ADR0(\my_I2C/index_pointer [5]),
    .ADR2(\my_I2C/index_pointer [4]),
    .ADR5(\my_I2C/input_shift_5 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[5] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y47" ),
    .INIT ( 64'hFFFF00FFFF000000 ))
  \my_I2C/input_shift_51  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\my_I2C/input_shift_5_LDC_937 ),
    .ADR4(\my_I2C/input_shift_5_P_5_946 ),
    .ADR5(\my_I2C/input_shift_5_C_5_944 ),
    .O(\my_I2C/input_shift_5 )
  );
  X_INV   \INV_my_I2C/index_pointer_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_7CLK )
  );
  X_INV   \INV_my_I2C/index_pointer_6CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_6CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_7  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_7/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[7] ),
    .O(\my_I2C/index_pointer [7]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 64'h3133010332300200 ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT81  (
    .ADR1(\my_I2C/stop_detect_895 ),
    .ADR2(\my_I2C/state[2]_GND_4_o_equal_20_o ),
    .ADR3(\my_I2C/Madd_index_pointer[7]_GND_4_o_add_20_OUT_cy[5] ),
    .ADR5(\my_I2C/index_pointer [7]),
    .ADR0(\my_I2C/index_pointer [6]),
    .ADR4(\my_I2C/input_shift_7 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[7] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 64'hFF00FFFFFF000000 ))
  \my_I2C/input_shift_71  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(\my_I2C/input_shift_7_LDC_995 ),
    .ADR3(\my_I2C/input_shift_7_P_7_996 ),
    .ADR5(\my_I2C/input_shift_7_C_7_997 ),
    .O(\my_I2C/input_shift_7 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 64'hFF00FF00CCCCCCCC ))
  \my_I2C/input_shift_61  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR5(\my_I2C/input_shift_6_LDC_971 ),
    .ADR3(\my_I2C/input_shift_6_P_6_994 ),
    .ADR1(\my_I2C/input_shift_6_C_6_982 ),
    .O(\my_I2C/input_shift_6 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/index_pointer_6  (
    .CE(\my_I2C/_n0177_inv ),
    .CLK(\NlwBufferSignal_my_I2C/index_pointer_6/CLK ),
    .I(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[6] ),
    .O(\my_I2C/index_pointer [6]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y48" ),
    .INIT ( 64'h070302030D0C080C ))
  \my_I2C/Mmux_index_pointer[7]_GND_4_o_mux_23_OUT71  (
    .ADR2(\my_I2C/stop_detect_895 ),
    .ADR3(\my_I2C/state_FSM_FFd3_919 ),
    .ADR0(\my_I2C/state_FSM_FFd2_920 ),
    .ADR5(\my_I2C/index_pointer [6]),
    .ADR1(\my_I2C/Madd_index_pointer[7]_GND_4_o_add_20_OUT_cy[5] ),
    .ADR4(\my_I2C/input_shift_6 ),
    .O(\my_I2C/index_pointer[7]_GND_4_o_mux_23_OUT[6] )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y49" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_6_P_6  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_6_P_6/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_6_P_6/IN ),
    .O(\my_I2C/input_shift_6_P_6_994 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_15_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y49" ),
    .INIT ( 64'hCC00CC00C8C84040 ))
  \my_I2C/RST_input_shift[7]_AND_15_o1  (
    .ADR0(\my_I2C/input_shift_5_LDC_937 ),
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_5_P_5_946 ),
    .ADR2(\my_I2C/input_shift_5_C_5_944 ),
    .ADR3(\my_I2C/input_shift_6 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_15_o )
  );
  X_INV   \INV_my_I2C/output_shift_7CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[7]/INV_my_I2C/output_shift_7CLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y50" ),
    .INIT ( 64'hFFFFFFFFFFFF0C0F ))
  \my_I2C/Mmux_PWR_3_o_PWR_3_o_MUX_29_o11_SW0_SW2  (
    .ADR0(1'b1),
    .ADR2(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o ),
    .ADR3(\my_I2C/state_FSM_FFd2_920 ),
    .ADR1(\my_I2C/state_FSM_FFd3_919 ),
    .ADR4(\my_I2C/output_shift [7]),
    .ADR5(\my_I2C/start_detect_918 ),
    .O(\my_I2C/N34 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y50" ),
    .INIT ( 64'hF3F3EE22C0C0EE22 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT8_SW0  (
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR1(\my_I2C/index_pointer [0]),
    .ADR5(aux3[7]),
    .ADR2(\my_I2C/reg_03 [7]),
    .ADR3(aux2[7]),
    .ADR0(aux1[7]),
    .O(\my_I2C/N8 )
  );
  X_FF #(
    .LOC ( "SLICE_X14Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_7  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_7/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[7] ),
    .O(\my_I2C/output_shift [7]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X14Y50" ),
    .INIT ( 64'hFFFF0000F0F0F0F0 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT8  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR5(\my_I2C/lsb_bit ),
    .ADR4(\my_I2C/N8 ),
    .ADR2(\my_I2C/output_shift [6]),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[7] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y43" ),
    .INIT ( 64'hFE0EF404FE0EF404 ))
  Mmux_LED211 (
    .ADR5(1'b1),
    .ADR2(DIR_UP_IBUF_0),
    .ADR1(aux1[2]),
    .ADR0(DIR_DOWN_IBUF_0),
    .ADR4(aux3[2]),
    .ADR3(aux2[2]),
    .O(LED2_OBUF_1040)
  );
  X_FF #(
    .LOC ( "SLICE_X15Y43" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_2_P_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_2_P_2/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_2_P_2/IN ),
    .O(\my_I2C/input_shift_2_P_2_948 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_23_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y43" ),
    .INIT ( 64'hCC00CC00C4C48080 ))
  \my_I2C/RST_input_shift[7]_AND_23_o1  (
    .ADR0(\my_I2C/input_shift_1_LDC_974 ),
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR2(\my_I2C/input_shift_1_P_1_975 ),
    .ADR4(\my_I2C/input_shift_1_C_1_976 ),
    .ADR3(\my_I2C/input_shift_2 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_23_o )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y44" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_3_P_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_3_P_3/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_3_P_3/IN ),
    .O(\my_I2C/input_shift_3_P_3_898 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_21_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y44" ),
    .INIT ( 64'hCC00CC00C8C84040 ))
  \my_I2C/RST_input_shift[7]_AND_21_o1  (
    .ADR0(\my_I2C/input_shift_2_LDC_978 ),
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_2_P_2_948 ),
    .ADR2(\my_I2C/input_shift_2_C_2_979 ),
    .ADR3(\my_I2C/input_shift_3 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_21_o )
  );
  X_INV   \INV_my_I2C/output_shift_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/output_shift[0]/INV_my_I2C/output_shift_0CLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y45" ),
    .INIT ( 64'h0000000000000001 ))
  \my_I2C/_n0181_inv11  (
    .ADR1(\my_I2C/index_pointer [2]),
    .ADR4(\my_I2C/index_pointer [3]),
    .ADR0(\my_I2C/index_pointer [4]),
    .ADR3(\my_I2C/index_pointer [5]),
    .ADR2(\my_I2C/index_pointer [6]),
    .ADR5(\my_I2C/index_pointer [7]),
    .O(\my_I2C/_n0181_inv1 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y45" ),
    .INIT ( 64'hFFFFFFFFFFF7FFFF ))
  \my_I2C/_n0197_inv1  (
    .ADR2(\my_I2C/start_detect_918 ),
    .ADR5(\my_I2C/_n0181_inv1 ),
    .ADR1(\my_I2C/bit_counter [2]),
    .ADR4(\my_I2C/bit_counter [1]),
    .ADR0(\my_I2C/bit_counter [0]),
    .ADR3(\my_I2C/bit_counter [3]),
    .O(\my_I2C/_n0197_inv )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y45" ),
    .INIT ( 64'hFF55FF55AA00AA00 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT1_SW0  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR0(\my_I2C/index_pointer [0]),
    .ADR3(aux2[0]),
    .ADR5(aux1[0]),
    .O(\my_I2C/N22 )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/output_shift_0  (
    .CE(\my_I2C/_n0197_inv ),
    .CLK(\NlwBufferSignal_my_I2C/output_shift_0/CLK ),
    .I(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[0] ),
    .O(\my_I2C/output_shift [0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y45" ),
    .INIT ( 64'hA0F0A000C0F0C000 ))
  \my_I2C/Mmux_output_shift[6]_index_pointer[7]_mux_49_OUT1  (
    .ADR2(\my_I2C/lsb_bit ),
    .ADR3(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/reg_03 [0]),
    .ADR5(\my_I2C/index_pointer [0]),
    .ADR1(aux3[0]),
    .ADR4(\my_I2C/N22 ),
    .O(\my_I2C/output_shift[6]_index_pointer[7]_mux_49_OUT[0] )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_3_C_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_3_C_3/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_3_C_3/IN ),
    .O(\my_I2C/input_shift_3_C_3_897 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_22_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y46" ),
    .INIT ( 64'h0000000040000000 ))
  \my_I2C/_n0181_inv2  (
    .ADR0(\my_I2C/index_pointer [1]),
    .ADR5(\my_I2C/index_pointer [0]),
    .ADR3(\my_I2C/_n0181_inv1 ),
    .ADR2(\my_I2C/ack_bit ),
    .ADR1(\my_I2C/state_FSM_FFd3_919 ),
    .ADR4(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/_n0181_inv )
  );
  X_INV   \INV_my_I2C/reg_00_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[2]/INV_my_I2C/reg_00_2CLK )
  );
  X_INV   \INV_my_I2C/reg_00_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[2]/INV_my_I2C/reg_00_1CLK )
  );
  X_INV   \INV_my_I2C/reg_00_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\aux1[2]/INV_my_I2C/reg_00_0CLK )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_2  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_2/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_2/IN ),
    .O(aux1[2]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 64'hFF00F0F0AAAAAAAA ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT11  (
    .ADR1(1'b1),
    .ADR0(SW0_IBUF_0),
    .ADR4(\my_I2C/input_shift_0_LDC_927 ),
    .ADR3(\my_I2C/input_shift_0_P_0_928 ),
    .ADR2(\my_I2C/input_shift_0_C_0_929 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[0] )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_1  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_1/CLK ),
    .I(\NlwBufferSignal_my_I2C/reg_00_1/IN ),
    .O(aux1[1]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 64'h8000000000000000 ))
  \my_I2C/Madd_index_pointer[7]_GND_4_o_add_20_OUT_cy<5>11  (
    .ADR2(\my_I2C/index_pointer [5]),
    .ADR3(\my_I2C/index_pointer [4]),
    .ADR1(\my_I2C/index_pointer [3]),
    .ADR5(\my_I2C/index_pointer [2]),
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/index_pointer [0]),
    .O(\my_I2C/Madd_index_pointer[7]_GND_4_o_add_20_OUT_cy[5] )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 1'b0 ))
  \my_I2C/reg_00_0  (
    .CE(\my_I2C/_n0181_inv ),
    .CLK(\NlwBufferSignal_my_I2C/reg_00_0/CLK ),
    .I(\my_I2C/input_shift_0 ),
    .O(aux1[0]),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y47" ),
    .INIT ( 64'hFFFF00FFFF000000 ))
  \my_I2C/input_shift_01  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(\my_I2C/input_shift_0_LDC_927 ),
    .ADR4(\my_I2C/input_shift_0_P_0_928 ),
    .ADR5(\my_I2C/input_shift_0_C_0_929 ),
    .O(\my_I2C/input_shift_0 )
  );
  X_INV   \INV_my_I2C/output_controlCLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\SDA_out/INV_my_I2C/output_controlCLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y48" ),
    .INIT ( 64'h0000000800000000 ))
  \my_I2C/state[2]_state[2]_OR_31_o11  (
    .ADR3(\my_I2C/N24 ),
    .ADR0(\my_I2C/input_shift_7 ),
    .ADR5(\my_I2C/input_shift_5 ),
    .ADR1(\my_I2C/input_shift_3 ),
    .ADR2(\my_I2C/input_shift_2 ),
    .ADR4(\my_I2C/N26 ),
    .O(\my_I2C/state[2]_state[2]_OR_31_o1 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y48" ),
    .INIT ( 64'h05AFFFFFFFFFFFFF ))
  \my_I2C/address_detect_SW1  (
    .ADR1(1'b1),
    .ADR0(\my_I2C/input_shift_1_LDC_974 ),
    .ADR4(\my_I2C/state_FSM_FFd1_917 ),
    .ADR2(\my_I2C/input_shift_1_C_1_976 ),
    .ADR3(\my_I2C/input_shift_1_P_1_975 ),
    .ADR5(\my_I2C/input_shift_0 ),
    .O(\my_I2C/N26 )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y48" ),
    .INIT ( 1'b1 ))
  \my_I2C/output_control  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/output_control/CLK ),
    .I(\my_I2C/PWR_3_o_PWR_3_o_MUX_29_o ),
    .O(SDA_out),
    .SET(\my_I2C/RSTN_inv ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y48" ),
    .INIT ( 64'hFFF3FCF00F030C00 ))
  \my_I2C/Mmux_PWR_3_o_PWR_3_o_MUX_29_o12  (
    .ADR0(1'b1),
    .ADR2(\my_I2C/lsb_bit ),
    .ADR3(\my_I2C/N34 ),
    .ADR4(\my_I2C/N32 ),
    .ADR1(\my_I2C/state[2]_state[2]_OR_31_o1 ),
    .ADR5(\my_I2C/N33 ),
    .O(\my_I2C/PWR_3_o_PWR_3_o_MUX_29_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y48" ),
    .INIT ( 64'hAAAAFFFFAAAAEFFF ))
  \my_I2C/Mmux_PWR_3_o_PWR_3_o_MUX_29_o11_SW0_SW1  (
    .ADR0(\my_I2C/start_detect_918 ),
    .ADR4(\my_I2C/state_FSM_FFd3_919 ),
    .ADR3(\my_I2C/input_shift_7 ),
    .ADR2(\my_I2C/input_shift_5 ),
    .ADR1(\my_I2C/N24 ),
    .ADR5(\my_I2C/N36 ),
    .O(\my_I2C/N33 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y49" ),
    .INIT ( 64'h0C0C444400CC00CC ))
  \my_I2C/RST_input_shift[7]_AND_16_o1  (
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR0(\my_I2C/input_shift_6_C_6_982 ),
    .ADR2(\my_I2C/input_shift_6_P_6_994 ),
    .ADR4(\my_I2C/input_shift_6_LDC_971 ),
    .ADR3(\my_I2C/input_shift_5 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_16_o )
  );
  X_FF #(
    .LOC ( "SLICE_X15Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_6_C_6  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_6_C_6/CLK ),
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[6] ),
    .O(\my_I2C/input_shift_6_C_6_982 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_16_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X15Y49" ),
    .INIT ( 64'hEE44EEEEEE444444 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT71  (
    .ADR2(1'b1),
    .ADR4(\my_I2C/input_shift_6_LDC_971 ),
    .ADR3(\my_I2C/input_shift_6_P_6_994 ),
    .ADR5(\my_I2C/input_shift_6_C_6_982 ),
    .ADR1(\my_I2C/input_shift_5 ),
    .ADR0(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[6] )
  );
  X_LATCHE #(
    .LOC ( "SLICE_X16Y42" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_0_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_0_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_0_LDC_927 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_28_o ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y43" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_0_C_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_0_C_0/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_0_C_0/IN ),
    .O(\my_I2C/input_shift_0_C_0_929 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_28_o ),
    .SET(GND)
  );
  X_LATCHE #(
    .LOC ( "SLICE_X16Y44" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_3_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_3_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_3_LDC_896 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_22_o ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y45" ),
    .INIT ( 1'b0 ))
  \my_I2C/stop_detect  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/stop_detect/CLK ),
    .I(\NlwBufferSignal_my_I2C/stop_detect/IN ),
    .O(\my_I2C/stop_detect_895 ),
    .RST(\my_I2C/stop_rst ),
    .SET(GND)
  );
  X_BUF   \my_I2C/input_shift_1_LDC/my_I2C/input_shift_1_LDC_BMUX_Delay  (
    .I(\my_I2C/start_rst ),
    .O(\my_I2C/start_rst_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y46" ),
    .INIT ( 64'hFFFFAAAAFFFFAAAA ))
  \my_I2C/stop_rst1  (
    .ADR3(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(\my_I2C/stop_resetter_1028 ),
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR5(1'b1),
    .O(\my_I2C/stop_rst )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y46" ),
    .INIT ( 32'hFAFAFAFA ))
  \my_I2C/start_rst1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(\my_I2C/start_resetter_1009 ),
    .ADR3(1'b1),
    .ADR0(\my_I2C/RSTN_inv ),
    .O(\my_I2C/start_rst )
  );
  X_LATCHE #(
    .LOC ( "SLICE_X16Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_1_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_1_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_1_LDC_974 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_26_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y47" ),
    .INIT ( 64'hF0A030A0C0A000A0 ))
  \my_I2C/RST_input_shift[7]_AND_27_o1  (
    .ADR0(SW0_IBUF_0),
    .ADR1(\my_I2C/input_shift_0_LDC_927 ),
    .ADR2(\my_I2C/RSTN_inv ),
    .ADR5(\my_I2C/input_shift_0_C_0_929 ),
    .ADR4(\my_I2C/input_shift_0_P_0_928 ),
    .ADR3(\my_I2C/ack_bit ),
    .O(\my_I2C/RST_input_shift[7]_AND_27_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y47" ),
    .INIT ( 64'hAA228A02A8208800 ))
  \my_I2C/RST_input_shift[7]_AND_19_o1  (
    .ADR2(\my_I2C/input_shift_3_LDC_896 ),
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_3_P_3_898 ),
    .ADR5(\my_I2C/input_shift_3_C_3_897 ),
    .ADR3(\my_I2C/input_shift_4 ),
    .ADR1(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_19_o )
  );
  X_FF #(
    .LOC ( "SLICE_X16Y47" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_0_P_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_0_P_0/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_0_P_0/IN ),
    .O(\my_I2C/input_shift_0_P_0_928 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_27_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y47" ),
    .INIT ( 64'hB8B8B8B8FF00FF00 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT51  (
    .ADR4(1'b1),
    .ADR1(\my_I2C/input_shift_4_LDC_906 ),
    .ADR0(\my_I2C/input_shift_4_P_4_908 ),
    .ADR2(\my_I2C/input_shift_4_C_4_907 ),
    .ADR3(\my_I2C/input_shift_3 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[4] )
  );
  X_LATCHE #(
    .LOC ( "SLICE_X16Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_5_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_5_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_5_LDC_937 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_18_o ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X16Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_5_C_5  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_5_C_5/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_5_C_5/IN ),
    .O(\my_I2C/input_shift_5_C_5_944 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_18_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y49" ),
    .INIT ( 64'h000AA0AA22222222 ))
  \my_I2C/RST_input_shift[7]_AND_18_o1  (
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_5_P_5_946 ),
    .ADR2(\my_I2C/input_shift_5_LDC_937 ),
    .ADR3(\my_I2C/input_shift_5_C_5_944 ),
    .ADR1(\my_I2C/input_shift_4 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_18_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y43" ),
    .INIT ( 64'h0A0A222200AA00AA ))
  \my_I2C/RST_input_shift[7]_AND_28_o1  (
    .ADR3(SW0_IBUF_0),
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR1(\my_I2C/input_shift_0_C_0_929 ),
    .ADR2(\my_I2C/input_shift_0_P_0_928 ),
    .ADR4(\my_I2C/input_shift_0_LDC_927 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/RST_input_shift[7]_AND_28_o )
  );
  X_INV   \INV_my_I2C/start_detectCLK  (
    .I(SW0_IBUF_BUFG_894),
    .O(\my_I2C/start_detect/INV_my_I2C/start_detectCLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y46" ),
    .INIT ( 64'h00C00CCC44444444 ))
  \my_I2C/RST_input_shift[7]_AND_22_o1  (
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR4(\my_I2C/input_shift_3_C_3_897 ),
    .ADR3(\my_I2C/input_shift_3_P_3_898 ),
    .ADR2(\my_I2C/input_shift_3_LDC_896 ),
    .ADR0(\my_I2C/input_shift_2 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_22_o )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/start_detect  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/start_detect/CLK ),
    .I(\NlwBufferSignal_my_I2C/start_detect/IN ),
    .O(\my_I2C/start_detect_918 ),
    .RST(\my_I2C/start_rst_0 ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y46" ),
    .INIT ( 64'hF3F3C0C0FF00FF00 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT41  (
    .ADR0(1'b1),
    .ADR1(\my_I2C/input_shift_3_LDC_896 ),
    .ADR2(\my_I2C/input_shift_3_P_3_898 ),
    .ADR4(\my_I2C/input_shift_3_C_3_897 ),
    .ADR3(\my_I2C/input_shift_2 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[3] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y47" ),
    .INIT ( 64'hAAA80A08A2A00200 ))
  \my_I2C/RST_input_shift[7]_AND_17_o1  (
    .ADR1(\my_I2C/input_shift_4_LDC_906 ),
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR5(\my_I2C/input_shift_4_P_4_908 ),
    .ADR3(\my_I2C/input_shift_4_C_4_907 ),
    .ADR4(\my_I2C/input_shift_5 ),
    .ADR2(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_17_o )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y47" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_5_P_5  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_5_P_5/CLK ),
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[5] ),
    .O(\my_I2C/input_shift_5_P_5_946 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_17_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y47" ),
    .INIT ( 64'hFFF055F0AAF000F0 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT61  (
    .ADR1(1'b1),
    .ADR0(\my_I2C/input_shift_5_LDC_937 ),
    .ADR5(\my_I2C/input_shift_5_C_5_944 ),
    .ADR4(\my_I2C/input_shift_5_P_5_946 ),
    .ADR2(\my_I2C/input_shift_4 ),
    .ADR3(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[5] )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y47" ),
    .INIT ( 64'h048C048C0000CCCC ))
  \my_I2C/RST_input_shift[7]_AND_26_o1  (
    .ADR1(\my_I2C/RSTN_inv ),
    .ADR2(\my_I2C/input_shift_1_C_1_976 ),
    .ADR3(\my_I2C/input_shift_1_P_1_975 ),
    .ADR0(\my_I2C/input_shift_1_LDC_974 ),
    .ADR4(\my_I2C/input_shift_0 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_26_o )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y47" ),
    .INIT ( 64'h0000000000000030 ))
  \my_I2C/ack_bit1_1  (
    .ADR0(1'b1),
    .ADR1(\my_I2C/start_detect_918 ),
    .ADR2(\my_I2C/bit_counter [3]),
    .ADR4(\my_I2C/bit_counter [2]),
    .ADR5(\my_I2C/bit_counter [1]),
    .ADR3(\my_I2C/bit_counter [0]),
    .O(\my_I2C/ack_bit1_925 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y48" ),
    .INIT ( 64'hFFFDFF75FEFCBA30 ))
  \my_I2C/address_detect_SW0  (
    .ADR1(\my_I2C/input_shift_6_LDC_971 ),
    .ADR0(\my_I2C/input_shift_4_LDC_906 ),
    .ADR2(\my_I2C/input_shift_6_C_6_982 ),
    .ADR4(\my_I2C/input_shift_6_P_6_994 ),
    .ADR3(\my_I2C/input_shift_4_P_4_908 ),
    .ADR5(\my_I2C/input_shift_4_C_4_907 ),
    .O(\my_I2C/N24 )
  );
  X_FF #(
    .LOC ( "SLICE_X17Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_4_C_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_4_C_4/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_4_C_4/IN ),
    .O(\my_I2C/input_shift_4_C_4_907 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_20_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y48" ),
    .INIT ( 64'h008822AA0A0A0A0A ))
  \my_I2C/RST_input_shift[7]_AND_20_o1  (
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR3(\my_I2C/input_shift_4_P_4_908 ),
    .ADR1(\my_I2C/input_shift_4_LDC_906 ),
    .ADR4(\my_I2C/input_shift_4_C_4_907 ),
    .ADR2(\my_I2C/input_shift_3 ),
    .ADR5(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_20_o )
  );
  X_INV   \INV_my_I2C/bit_counter_3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_3CLK )
  );
  X_INV   \INV_my_I2C/bit_counter_2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_2CLK )
  );
  X_INV   \INV_my_I2C/bit_counter_1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_1CLK )
  );
  X_INV   \INV_my_I2C/bit_counter_0CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_0CLK )
  );
  X_BUF   \my_I2C/bit_counter[3]/my_I2C/bit_counter[3]_DMUX_Delay  (
    .I(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o_pack_8 ),
    .O(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o )
  );
  X_BUF   \my_I2C/bit_counter[3]/my_I2C/bit_counter[3]_BMUX_Delay  (
    .I(\my_I2C/bit_counter[1]_pack_6 ),
    .O(\my_I2C/bit_counter [1])
  );
  X_SFF #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/bit_counter_3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/bit_counter_3/CLK ),
    .I(\my_I2C/Result [3]),
    .O(\my_I2C/bit_counter [3]),
    .SRST(\my_I2C/ack_bit_start_detect_OR_6_o_0 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 64'h77FF880077FF8800 ))
  \my_I2C/Mcount_bit_counter_xor<3>11  (
    .ADR2(1'b1),
    .ADR1(\my_I2C/bit_counter [0]),
    .ADR0(\my_I2C/bit_counter [1]),
    .ADR4(\my_I2C/bit_counter [3]),
    .ADR3(\my_I2C/bit_counter [2]),
    .ADR5(1'b1),
    .O(\my_I2C/Result [3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 32'h00110000 ))
  \my_I2C/bit_counter[3]_PWR_3_o_equal_2_o<3>1  (
    .ADR2(1'b1),
    .ADR1(\my_I2C/bit_counter [0]),
    .ADR0(\my_I2C/bit_counter [1]),
    .ADR4(\my_I2C/bit_counter [3]),
    .ADR3(\my_I2C/bit_counter [2]),
    .O(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o_pack_8 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 64'hFFFFFFFFFCFEFFFF ))
  \my_I2C/Mmux_PWR_3_o_PWR_3_o_MUX_29_o11_SW0_SW0  (
    .ADR2(\my_I2C/output_shift [7]),
    .ADR1(\my_I2C/start_detect_918 ),
    .ADR5(\my_I2C/state_FSM_FFd3_919 ),
    .ADR3(\my_I2C/master_ack_913 ),
    .ADR0(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o ),
    .ADR4(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/N32 )
  );
  X_SFF #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/bit_counter_2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/bit_counter_2/CLK ),
    .I(\my_I2C/Result [2]),
    .O(\my_I2C/bit_counter [2]),
    .SRST(\my_I2C/ack_bit_start_detect_OR_6_o_0 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 64'h7777888877778888 ))
  \my_I2C/Mcount_bit_counter_xor<2>11  (
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\my_I2C/bit_counter [0]),
    .ADR4(\my_I2C/bit_counter [2]),
    .ADR1(\my_I2C/bit_counter [1]),
    .ADR5(1'b1),
    .O(\my_I2C/Result [2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 32'h66666666 ))
  \my_I2C/Mcount_bit_counter_xor<1>11  (
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR0(\my_I2C/bit_counter [0]),
    .ADR3(1'b1),
    .ADR1(\my_I2C/bit_counter [1]),
    .O(\my_I2C/Result [1])
  );
  X_SFF #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/bit_counter_1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/bit_counter_1/CLK ),
    .I(\my_I2C/Result [1]),
    .O(\my_I2C/bit_counter[1]_pack_6 ),
    .SRST(\my_I2C/ack_bit_start_detect_OR_6_o_0 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_SFF #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/bit_counter_0  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/bit_counter_0/CLK ),
    .I(\my_I2C/Result [0]),
    .O(\my_I2C/bit_counter [0]),
    .SRST(\my_I2C/ack_bit_start_detect_OR_6_o_0 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y49" ),
    .INIT ( 64'h00000000FFFFFFFF ))
  \my_I2C/Mcount_bit_counter_xor<0>11_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(\my_I2C/bit_counter [0]),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .O(\my_I2C/Result [0])
  );
  X_FF #(
    .LOC ( "SLICE_X18Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/stop_resetter  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/stop_resetter/CLK ),
    .I(\NlwBufferSignal_my_I2C/stop_resetter/IN ),
    .O(\my_I2C/stop_resetter_1028 ),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_FF #(
    .LOC ( "SLICE_X18Y47" ),
    .INIT ( 1'b1 ))
  \my_I2C/input_shift_4_P_4  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_4_P_4/CLK ),
    .I(\NlwBufferSignal_my_I2C/input_shift_4_P_4/IN ),
    .O(\my_I2C/input_shift_4_P_4_908 ),
    .SET(\my_I2C/RST_input_shift[7]_AND_19_o ),
    .RST(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y47" ),
    .INIT ( 64'h8000000000000000 ))
  \my_I2C/_n0193_inv1  (
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR1(\my_I2C/index_pointer [0]),
    .ADR2(\my_I2C/_n0181_inv1 ),
    .ADR5(\my_I2C/ack_bit ),
    .ADR3(\my_I2C/state_FSM_FFd3_919 ),
    .ADR0(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/_n0193_inv )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y47" ),
    .INIT ( 64'h0000000000000300 ))
  \my_I2C/ack_bit1  (
    .ADR0(1'b1),
    .ADR1(\my_I2C/start_detect_918 ),
    .ADR3(\my_I2C/bit_counter [3]),
    .ADR4(\my_I2C/bit_counter [2]),
    .ADR5(\my_I2C/bit_counter [1]),
    .ADR2(\my_I2C/bit_counter [0]),
    .O(\my_I2C/ack_bit )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y48" ),
    .INIT ( 64'h000AA0AA202A202A ))
  \my_I2C/RST_input_shift[7]_AND_14_o1  (
    .ADR0(\my_I2C/RSTN_inv ),
    .ADR1(\my_I2C/input_shift_7_C_7_997 ),
    .ADR4(\my_I2C/input_shift_7_P_7_996 ),
    .ADR5(\my_I2C/input_shift_7_LDC_995 ),
    .ADR3(\my_I2C/input_shift_6 ),
    .ADR2(\my_I2C/ack_bit1_925 ),
    .O(\my_I2C/RST_input_shift[7]_AND_14_o )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_7_C_7  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_7_C_7/CLK ),
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[7] ),
    .O(\my_I2C/input_shift_7_C_7_997 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_14_o ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y48" ),
    .INIT ( 64'hFAFA5050FF00FF00 ))
  \my_I2C/Mmux_input_shift[7]_input_shift[6]_mux_8_OUT81  (
    .ADR1(1'b1),
    .ADR0(\my_I2C/input_shift_7_LDC_995 ),
    .ADR4(\my_I2C/input_shift_7_P_7_996 ),
    .ADR2(\my_I2C/input_shift_7_C_7_997 ),
    .ADR3(\my_I2C/input_shift_6 ),
    .ADR5(\my_I2C/ack_bit ),
    .O(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[7] )
  );
  X_INV   \INV_my_I2C/state_FSM_FFd3CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd3CLK )
  );
  X_INV   \INV_my_I2C/state_FSM_FFd2CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd2CLK )
  );
  X_INV   \INV_my_I2C/state_FSM_FFd1CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd1CLK )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 64'hFFFF7FFFFFFFFFFF ))
  \my_I2C/address_detect_SW3  (
    .ADR1(\my_I2C/state_FSM_FFd1_917 ),
    .ADR0(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o ),
    .ADR3(\my_I2C/input_shift_7 ),
    .ADR4(\my_I2C/input_shift_0 ),
    .ADR2(\my_I2C/input_shift_5 ),
    .ADR5(\my_I2C/input_shift_1 ),
    .O(\my_I2C/N38 )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/state_FSM_FFd3  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/state_FSM_FFd3/CLK ),
    .I(\my_I2C/state_FSM_FFd3-In ),
    .O(\my_I2C/state_FSM_FFd3_919 ),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 64'h5555000055550100 ))
  \my_I2C/state_FSM_FFd3-In1  (
    .ADR0(\my_I2C/start_detect_918 ),
    .ADR2(\my_I2C/input_shift_2 ),
    .ADR3(\my_I2C/input_shift_3 ),
    .ADR4(\my_I2C/state_FSM_FFd3_919 ),
    .ADR1(\my_I2C/N24 ),
    .ADR5(\my_I2C/N38 ),
    .O(\my_I2C/state_FSM_FFd3-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/state_FSM_FFd2  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/state_FSM_FFd2/CLK ),
    .I(\my_I2C/state_FSM_FFd2-In ),
    .O(\my_I2C/state_FSM_FFd2_920 ),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 64'h0F0F0F000E0F0A00 ))
  \my_I2C/state_FSM_FFd2-In1  (
    .ADR2(\my_I2C/start_detect_918 ),
    .ADR0(\my_I2C/state_FSM_FFd3_919 ),
    .ADR1(\my_I2C/master_ack_913 ),
    .ADR4(\my_I2C/state_FSM_FFd2_920 ),
    .ADR3(\my_I2C/bit_counter[3]_PWR_3_o_equal_2_o ),
    .ADR5(\my_I2C/state[2]_state[2]_OR_31_o1 ),
    .O(\my_I2C/state_FSM_FFd2-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 1'b0 ))
  \my_I2C/state_FSM_FFd1  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/state_FSM_FFd1/CLK ),
    .I(\my_I2C/state_FSM_FFd1-In ),
    .O(\my_I2C/state_FSM_FFd1_917 ),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y49" ),
    .INIT ( 64'hFFF0FFF0FEF0FFF0 ))
  \my_I2C/state_FSM_FFd1-In1  (
    .ADR4(\my_I2C/bit_counter [3]),
    .ADR1(\my_I2C/bit_counter [2]),
    .ADR5(\my_I2C/bit_counter [1]),
    .ADR3(\my_I2C/state_FSM_FFd1_917 ),
    .ADR0(\my_I2C/bit_counter [0]),
    .ADR2(\my_I2C/start_detect_918 ),
    .O(\my_I2C/state_FSM_FFd1-In )
  );
  X_FF #(
    .LOC ( "SLICE_X18Y50" ),
    .INIT ( 1'b0 ))
  \my_I2C/master_ack  (
    .CE(\my_I2C/ack_bit ),
    .CLK(\NlwBufferSignal_my_I2C/master_ack/CLK ),
    .I(\my_I2C/SDA_INV_11_o ),
    .O(\my_I2C/master_ack_913 ),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X18Y50" ),
    .INIT ( 64'h3333333333333333 ))
  \my_I2C/SDA_INV_11_o1_INV_0  (
    .ADR0(1'b1),
    .ADR5(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .ADR1(SW0_IBUF_0),
    .O(\my_I2C/SDA_INV_11_o )
  );
  X_FF #(
    .LOC ( "SLICE_X19Y46" ),
    .INIT ( 1'b0 ))
  \my_I2C/start_resetter  (
    .CE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/start_resetter/CLK ),
    .I(\NlwBufferSignal_my_I2C/start_resetter/IN ),
    .O(\my_I2C/start_resetter_1009 ),
    .RST(\my_I2C/RSTN_inv ),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X19Y47" ),
    .INIT ( 64'hF0F0F0F0F0F0F1F0 ))
  \my_I2C/_n0177_inv1  (
    .ADR1(\my_I2C/bit_counter [2]),
    .ADR3(\my_I2C/bit_counter [3]),
    .ADR5(\my_I2C/bit_counter [1]),
    .ADR4(\my_I2C/bit_counter [0]),
    .ADR0(\my_I2C/start_detect_918 ),
    .ADR2(\my_I2C/stop_detect_895 ),
    .O(\my_I2C/_n0177_inv )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X19Y47" ),
    .INIT ( 64'h0000800000000000 ))
  \my_I2C/_n0185_inv1  (
    .ADR4(\my_I2C/index_pointer [1]),
    .ADR0(\my_I2C/index_pointer [0]),
    .ADR2(\my_I2C/_n0181_inv1 ),
    .ADR5(\my_I2C/ack_bit ),
    .ADR1(\my_I2C/state_FSM_FFd3_919 ),
    .ADR3(\my_I2C/state_FSM_FFd2_920 ),
    .O(\my_I2C/_n0185_inv )
  );
  X_LATCHE #(
    .LOC ( "SLICE_X19Y48" ),
    .INIT ( 1'b0 ))
  \my_I2C/input_shift_7_LDC  (
    .GE(VCC),
    .CLK(\NlwBufferSignal_my_I2C/input_shift_7_LDC/CLK ),
    .I(1'b1),
    .O(\my_I2C/input_shift_7_LDC_995 ),
    .RST(\my_I2C/RST_input_shift[7]_AND_14_o ),
    .SET(GND)
  );
  X_BUF   \NlwBufferBlock_SW2_IBUF_BUFG/IN  (
    .I(SW2_IBUF_0),
    .O(\NlwBufferSignal_SW2_IBUF_BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_SW0_IBUF_BUFG/IN  (
    .I(SW0_IBUF_0),
    .O(\NlwBufferSignal_SW0_IBUF_BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_SW1_OBUFT/I  (
    .I(SDA_out),
    .O(\NlwBufferSignal_SW1_OBUFT/I )
  );
  X_BUF   \NlwBufferBlock_LED0_OBUF/I  (
    .I(LED0_OBUF_1030),
    .O(\NlwBufferSignal_LED0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED1_OBUF/I  (
    .I(LED1_OBUF_1039),
    .O(\NlwBufferSignal_LED1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED2_OBUF/I  (
    .I(LED2_OBUF_1040),
    .O(\NlwBufferSignal_LED2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED3_OBUF/I  (
    .I(LED3_OBUF_1041),
    .O(\NlwBufferSignal_LED3_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED4_OBUF/I  (
    .I(LED4_OBUF_1042),
    .O(\NlwBufferSignal_LED4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED5_OBUF/I  (
    .I(LED5_OBUF_931),
    .O(\NlwBufferSignal_LED5_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED6_OBUF/I  (
    .I(LED6_OBUF_940),
    .O(\NlwBufferSignal_LED6_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_LED7_OBUF/I  (
    .I(LED7_OBUF_951),
    .O(\NlwBufferSignal_LED7_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_3/CLK  (
    .I(\aux3[3]/INV_my_I2C/reg_02_3CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_3/IN  (
    .I(\my_I2C/input_shift_3 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_3/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_2/CLK  (
    .I(\aux3[3]/INV_my_I2C/reg_02_2CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_2/IN  (
    .I(\my_I2C/input_shift_2 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_2/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_1/CLK  (
    .I(\aux3[3]/INV_my_I2C/reg_02_1CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_1/IN  (
    .I(\my_I2C/input_shift_1 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_1/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_0/CLK  (
    .I(\aux3[3]/INV_my_I2C/reg_02_0CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_0/IN  (
    .I(\my_I2C/input_shift_0 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_0/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_3/CLK  (
    .I(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_3CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_3/IN  (
    .I(\my_I2C/input_shift_3 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_3/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_2/CLK  (
    .I(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_2CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_2/IN  (
    .I(\my_I2C/input_shift_2 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_2/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_1/CLK  (
    .I(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_1CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_1/IN  (
    .I(\my_I2C/input_shift_1 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_1/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_0/CLK  (
    .I(\my_I2C/reg_03[3]/INV_my_I2C/reg_03_0CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_0/IN  (
    .I(\my_I2C/input_shift_0 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_0/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_1_C_1/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_1_C_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_1_C_1/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[1] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_1_C_1/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_3/CLK  (
    .I(\aux1[3]/INV_my_I2C/reg_00_3CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_3/IN  (
    .I(\my_I2C/input_shift_3 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_3/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_4_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_19_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_4_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_7/CLK  (
    .I(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_7CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_7/IN  (
    .I(\my_I2C/input_shift_7 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_7/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_6/CLK  (
    .I(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_6CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_6/IN  (
    .I(\my_I2C/input_shift_6 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_6/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_5/CLK  (
    .I(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_5CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_5/IN  (
    .I(\my_I2C/input_shift_5 ),
    .O(\NlwBufferSignal_my_I2C/reg_03_5/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_03_4/CLK  (
    .I(\my_I2C/reg_03[7]/INV_my_I2C/reg_03_4CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_03_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_7/CLK  (
    .I(\aux2[7]/INV_my_I2C/reg_01_7CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_7/IN  (
    .I(\my_I2C/input_shift_7 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_7/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_6/CLK  (
    .I(\aux2[7]/INV_my_I2C/reg_01_6CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_6/IN  (
    .I(\my_I2C/input_shift_6 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_6/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_5/CLK  (
    .I(\aux2[7]/INV_my_I2C/reg_01_5CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_5/IN  (
    .I(\my_I2C/input_shift_5 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_5/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_4/CLK  (
    .I(\aux2[7]/INV_my_I2C/reg_01_4CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_4/IN  (
    .I(\my_I2C/input_shift_4 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_4/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_7/CLK  (
    .I(\aux3[7]/INV_my_I2C/reg_02_7CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_7/IN  (
    .I(\my_I2C/input_shift_7 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_7/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_6/CLK  (
    .I(\aux3[7]/INV_my_I2C/reg_02_6CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_6/IN  (
    .I(\my_I2C/input_shift_6 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_6/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_5/CLK  (
    .I(\aux3[7]/INV_my_I2C/reg_02_5CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_5/IN  (
    .I(\my_I2C/input_shift_5 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_5/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_4/CLK  (
    .I(\aux3[7]/INV_my_I2C/reg_02_4CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_02_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_02_4/IN  (
    .I(\my_I2C/input_shift_4 ),
    .O(\NlwBufferSignal_my_I2C/reg_02_4/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_1/CLK  (
    .I(\my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_1CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_0/CLK  (
    .I(\my_I2C/index_pointer[1]/INV_my_I2C/index_pointer_0CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_1_P_1/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_1_P_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_4/CLK  (
    .I(\my_I2C/output_shift[4]/INV_my_I2C/output_shift_4CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_3/CLK  (
    .I(\my_I2C/output_shift[4]/INV_my_I2C/output_shift_3CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_7_P_7/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_7_P_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_7_P_7/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[7] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_7_P_7/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_6_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_15_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_6_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_6/CLK  (
    .I(\my_I2C/output_shift[6]/INV_my_I2C/output_shift_6CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_5/CLK  (
    .I(\my_I2C/output_shift[6]/INV_my_I2C/output_shift_5CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_7/CLK  (
    .I(\aux1[7]/INV_my_I2C/reg_00_7CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_7/IN  (
    .I(\my_I2C/input_shift_7 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_7/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_6/CLK  (
    .I(\aux1[7]/INV_my_I2C/reg_00_6CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_6/IN  (
    .I(\my_I2C/input_shift_6 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_6/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_5/CLK  (
    .I(\aux1[7]/INV_my_I2C/reg_00_5CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_5/IN  (
    .I(\my_I2C/input_shift_5 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_5/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_4/CLK  (
    .I(\aux1[7]/INV_my_I2C/reg_00_4CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_4/IN  (
    .I(\my_I2C/input_shift_4 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_4/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_2_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_23_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_2_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_2_C_2/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_2_C_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_2/CLK  (
    .I(\my_I2C/output_shift[2]/INV_my_I2C/output_shift_2CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_1/CLK  (
    .I(\my_I2C/output_shift[2]/INV_my_I2C/output_shift_1CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_3/CLK  (
    .I(\my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_3CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_2/CLK  (
    .I(\my_I2C/index_pointer[3]/INV_my_I2C/index_pointer_2CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_3/CLK  (
    .I(\aux2[3]/INV_my_I2C/reg_01_3CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_2/CLK  (
    .I(\aux2[3]/INV_my_I2C/reg_01_2CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_2/IN  (
    .I(\my_I2C/input_shift_2 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_2/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_1/CLK  (
    .I(\aux2[3]/INV_my_I2C/reg_01_1CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_1/IN  (
    .I(\my_I2C/input_shift_1 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_1/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_0/CLK  (
    .I(\aux2[3]/INV_my_I2C/reg_01_0CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_01_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_01_0/IN  (
    .I(\my_I2C/input_shift_0 ),
    .O(\NlwBufferSignal_my_I2C/reg_01_0/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_4/CLK  (
    .I(\my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_4CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_5/CLK  (
    .I(\my_I2C/index_pointer[4]/INV_my_I2C/index_pointer_5CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_7/CLK  (
    .I(\my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_7CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/index_pointer_6/CLK  (
    .I(\my_I2C/index_pointer[7]/INV_my_I2C/index_pointer_6CLK ),
    .O(\NlwBufferSignal_my_I2C/index_pointer_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_6_P_6/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_6_P_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_6_P_6/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[6] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_6_P_6/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_7/CLK  (
    .I(\my_I2C/output_shift[7]/INV_my_I2C/output_shift_7CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_2_P_2/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_2_P_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_2_P_2/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[2] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_2_P_2/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_3_P_3/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_3_P_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_3_P_3/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[3] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_3_P_3/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_shift_0/CLK  (
    .I(\my_I2C/output_shift[0]/INV_my_I2C/output_shift_0CLK ),
    .O(\NlwBufferSignal_my_I2C/output_shift_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_3_C_3/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_3_C_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_3_C_3/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[3] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_3_C_3/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_2/CLK  (
    .I(\aux1[2]/INV_my_I2C/reg_00_2CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_2/IN  (
    .I(\my_I2C/input_shift_2 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_2/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_1/CLK  (
    .I(\aux1[2]/INV_my_I2C/reg_00_1CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_1/IN  (
    .I(\my_I2C/input_shift_1 ),
    .O(\NlwBufferSignal_my_I2C/reg_00_1/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/reg_00_0/CLK  (
    .I(\aux1[2]/INV_my_I2C/reg_00_0CLK ),
    .O(\NlwBufferSignal_my_I2C/reg_00_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/output_control/CLK  (
    .I(\SDA_out/INV_my_I2C/output_controlCLK ),
    .O(\NlwBufferSignal_my_I2C/output_control/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_6_C_6/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_6_C_6/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_0_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_27_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_0_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_0_C_0/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_0_C_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_0_C_0/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[0] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_0_C_0/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_3_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_21_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_3_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/stop_detect/CLK  (
    .I(SW0_IBUF_BUFG_894),
    .O(\NlwBufferSignal_my_I2C/stop_detect/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/stop_detect/IN  (
    .I(SW2_IBUF_0),
    .O(\NlwBufferSignal_my_I2C/stop_detect/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_1_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_25_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_1_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_0_P_0/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_0_P_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_0_P_0/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[0] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_0_P_0/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_5_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_17_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_5_LDC/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_5_C_5/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_5_C_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_5_C_5/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[5] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_5_C_5/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/start_detect/CLK  (
    .I(\my_I2C/start_detect/INV_my_I2C/start_detectCLK ),
    .O(\NlwBufferSignal_my_I2C/start_detect/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/start_detect/IN  (
    .I(SW2_IBUF_0),
    .O(\NlwBufferSignal_my_I2C/start_detect/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_5_P_5/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_5_P_5/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_4_C_4/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_4_C_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_4_C_4/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[4] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_4_C_4/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/bit_counter_3/CLK  (
    .I(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_3CLK ),
    .O(\NlwBufferSignal_my_I2C/bit_counter_3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/bit_counter_2/CLK  (
    .I(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_2CLK ),
    .O(\NlwBufferSignal_my_I2C/bit_counter_2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/bit_counter_1/CLK  (
    .I(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_1CLK ),
    .O(\NlwBufferSignal_my_I2C/bit_counter_1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/bit_counter_0/CLK  (
    .I(\my_I2C/bit_counter[3]/INV_my_I2C/bit_counter_0CLK ),
    .O(\NlwBufferSignal_my_I2C/bit_counter_0/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/stop_resetter/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/stop_resetter/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/stop_resetter/IN  (
    .I(\my_I2C/stop_detect_895 ),
    .O(\NlwBufferSignal_my_I2C/stop_resetter/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_4_P_4/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_4_P_4/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_4_P_4/IN  (
    .I(\my_I2C/input_shift[7]_input_shift[6]_mux_8_OUT[4] ),
    .O(\NlwBufferSignal_my_I2C/input_shift_4_P_4/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_7_C_7/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/input_shift_7_C_7/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/state_FSM_FFd3/CLK  (
    .I(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd3CLK ),
    .O(\NlwBufferSignal_my_I2C/state_FSM_FFd3/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/state_FSM_FFd2/CLK  (
    .I(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd2CLK ),
    .O(\NlwBufferSignal_my_I2C/state_FSM_FFd2/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/state_FSM_FFd1/CLK  (
    .I(\my_I2C/state_FSM_FFd3/INV_my_I2C/state_FSM_FFd1CLK ),
    .O(\NlwBufferSignal_my_I2C/state_FSM_FFd1/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/master_ack/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/master_ack/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/start_resetter/CLK  (
    .I(SW2_IBUF_BUFG_892),
    .O(\NlwBufferSignal_my_I2C/start_resetter/CLK )
  );
  X_BUF   \NlwBufferBlock_my_I2C/start_resetter/IN  (
    .I(\my_I2C/start_detect_918 ),
    .O(\NlwBufferSignal_my_I2C/start_resetter/IN )
  );
  X_BUF   \NlwBufferBlock_my_I2C/input_shift_7_LDC/CLK  (
    .I(\my_I2C/RST_input_shift[7]_AND_13_o ),
    .O(\NlwBufferSignal_my_I2C/input_shift_7_LDC/CLK )
  );
  X_ZERO   NlwBlock_top_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_top_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

