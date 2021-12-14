/*
###############################################################
#  Generated by:      Cadence Innovus 15.28-s017_1
#  OS:                Linux x86_64(Host ID s2424.it.kth.se)
#  Generated on:      Tue Aug 29 16:02:24 2017
#  Design:            cur_dec
#  Command:           saveNetlist ../FINALDATA/last/cur_dec_final.v
###############################################################
*/
module shift_left_vlog_unsigned (
	Z, 
	SH, 
	A);
   output [15:0] Z;
   input [3:0] SH;
   input A;

   // Internal wires
   wire CTS_71;
   wire n_15;
   wire n_13;
   wire n_12;
   wire n_11;
   wire n_6;
   wire n_5;
   wire n_4;
   wire n_3;
   wire n_2;
   wire n_0;

   CLKINVX1 CTS_cex_INV_in_0__G0_L1_1 (.A(SH[0]),
	.Q(CTS_71));
   OR2X3 g68 (.A(SH[2]),
	.B(n_0),
	.Q(n_13));
   OR2X3 g70 (.A(SH[1]),
	.B(SH[2]),
	.Q(n_15));
   NAND2XL g178 (.A(CTS_71),
	.B(SH[3]),
	.Q(n_5));
   NAND2XL g179 (.A(CTS_71),
	.B(n_6),
	.Q(n_4));
   NAND2XL g180 (.A(SH[0]),
	.B(SH[3]),
	.Q(n_3));
   NAND2XL g181 (.A(SH[0]),
	.B(n_6),
	.Q(n_2));
   NAND2XL g67 (.A(n_0),
	.B(SH[2]),
	.Q(n_12));
   NAND2XL g69 (.A(SH[2]),
	.B(SH[1]),
	.Q(n_11));
   NOR2XL g162 (.A(n_3),
	.B(n_11),
	.Q(Z[15]));
   NOR2XL g163 (.A(n_3),
	.B(n_12),
	.Q(Z[13]));
   NOR2XL g164 (.A(n_5),
	.B(n_13),
	.Q(Z[10]));
   NOR2XL g165 (.A(n_4),
	.B(n_12),
	.Q(Z[4]));
   NOR2XL g166 (.A(n_2),
	.B(n_13),
	.Q(Z[3]));
   NOR2XL g167 (.A(n_3),
	.B(n_15),
	.Q(Z[9]));
   NOR2XL g168 (.A(n_4),
	.B(n_13),
	.Q(Z[2]));
   NOR2XL g169 (.A(n_2),
	.B(n_15),
	.Q(Z[1]));
   NOR2XL g170 (.A(n_5),
	.B(n_15),
	.Q(Z[8]));
   NOR2XL g171 (.A(n_4),
	.B(n_15),
	.Q(Z[0]));
   NOR2XL g172 (.A(n_2),
	.B(n_11),
	.Q(Z[7]));
   NOR2XL g173 (.A(n_5),
	.B(n_11),
	.Q(Z[14]));
   NOR2XL g174 (.A(n_5),
	.B(n_12),
	.Q(Z[12]));
   NOR2XL g175 (.A(n_4),
	.B(n_11),
	.Q(Z[6]));
   NOR2XL g176 (.A(n_3),
	.B(n_13),
	.Q(Z[11]));
   NOR2XL g177 (.A(n_2),
	.B(n_12),
	.Q(Z[5]));
   INVXL g64 (.A(SH[3]),
	.Q(n_6));
   INVXL g71 (.A(SH[1]),
	.Q(n_0));
endmodule

module cur_dec (
	out, 
	in);
   output [15:0] out;
   input [3:0] in;

   // Internal wires
   wire CTS_80;
   wire CTS_79;
   wire CTS_78;
   wire CTS_77;
   wire CTS_76;
   wire CTS_75;
   wire CTS_74;
   wire CTS_73;
   wire CTS_72;
   wire CTS_71;
   wire CTS_70;
   wire CTS_69;
   wire CTS_68;
   wire CTS_67;
   wire CTS_66;
   wire CTS_65;
   wire logic_1_1_net;

   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_8 (.A(CTS_80),
	.Q(out[15]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_7 (.A(CTS_79),
	.Q(out[13]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_6 (.A(CTS_78),
	.Q(out[9]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_5 (.A(CTS_77),
	.Q(out[11]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_4 (.A(CTS_76),
	.Q(out[3]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_3 (.A(CTS_75),
	.Q(out[1]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_2 (.A(CTS_74),
	.Q(out[7]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_1 (.A(CTS_73),
	.Q(out[5]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_8 (.A(CTS_72),
	.Q(out[10]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_7 (.A(CTS_71),
	.Q(out[8]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_6 (.A(CTS_70),
	.Q(out[14]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_5 (.A(CTS_69),
	.Q(out[12]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_4 (.A(CTS_68),
	.Q(out[4]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_3 (.A(CTS_67),
	.Q(out[2]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_2 (.A(CTS_66),
	.Q(out[0]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_1 (.A(CTS_65),
	.Q(out[6]));
   LOGIC1 tie_1_cell (.Q(logic_1_1_net));
   shift_left_vlog_unsigned sll_18_12 (.Z({ CTS_80,
		CTS_70,
		CTS_79,
		CTS_69,
		CTS_77,
		CTS_72,
		CTS_78,
		CTS_71,
		CTS_74,
		CTS_65,
		CTS_73,
		CTS_68,
		CTS_76,
		CTS_67,
		CTS_75,
		CTS_66 }),
	.SH(in),
	.A(logic_1_1_net));
endmodule

