/*
###############################################################
#  Generated by:      Cadence Innovus 15.28-s017_1
#  OS:                Linux x86_64(Host ID s2424.it.kth.se)
#  Generated on:      Tue Aug 29 14:44:44 2017
#  Design:            fet_dec
#  Command:           saveNetlist ../FINALDATA/last/fet_dec_final.v
###############################################################
*/
module shift_left_vlog_unsigned (
	A, 
	SH, 
	Z);
   input A;
   input [4:0] SH;
   output [31:0] Z;

   // Internal wires
   wire CTS_135;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_15;
   wire n_17;
   wire n_29;
   wire n_31;
   wire n_34;
   wire n_36;

   CLKINVX1 CTS_cex_INV_in_0__G0_L1_1 (.A(SH[0]),
	.Q(CTS_135));
   AND2X3 g200 (.A(SH[1]),
	.B(n_0),
	.Q(n_4));
   AND2X3 g202 (.A(SH[2]),
	.B(SH[1]),
	.Q(n_2));
   NAND2XL g348 (.A(CTS_135),
	.B(SH[3]),
	.Q(n_10));
   NAND2XL g349 (.A(CTS_135),
	.B(n_11),
	.Q(n_9));
   NAND2XL g350 (.A(SH[0]),
	.B(SH[3]),
	.Q(n_8));
   NAND2XL g351 (.A(SH[0]),
	.B(n_11),
	.Q(n_7));
   NAND2XL g191 (.A(n_2),
	.B(SH[4]),
	.Q(n_12));
   NAND2XL g192 (.A(n_3),
	.B(SH[4]),
	.Q(n_17));
   NAND2XL g193 (.A(n_3),
	.B(n_1),
	.Q(n_36));
   NAND2XL g194 (.A(n_2),
	.B(n_1),
	.Q(n_29));
   NAND2XL g195 (.A(n_4),
	.B(n_1),
	.Q(n_34));
   NAND2XL g196 (.A(n_4),
	.B(SH[4]),
	.Q(n_15));
   NAND2XL g197 (.A(n_5),
	.B(SH[4]),
	.Q(n_13));
   NAND2XL g198 (.A(n_5),
	.B(n_1),
	.Q(n_31));
   NOR2XL g316 (.A(n_8),
	.B(n_12),
	.Q(Z[31]));
   NOR2XL g317 (.A(n_8),
	.B(n_13),
	.Q(Z[29]));
   NOR2XL g318 (.A(n_10),
	.B(n_15),
	.Q(Z[26]));
   NOR2XL g319 (.A(n_9),
	.B(n_13),
	.Q(Z[20]));
   NOR2XL g320 (.A(n_9),
	.B(n_31),
	.Q(Z[4]));
   NOR2XL g321 (.A(n_7),
	.B(n_34),
	.Q(Z[3]));
   NOR2XL g322 (.A(n_7),
	.B(n_15),
	.Q(Z[19]));
   NOR2XL g323 (.A(n_9),
	.B(n_34),
	.Q(Z[2]));
   NOR2XL g324 (.A(n_7),
	.B(n_36),
	.Q(Z[1]));
   NOR2XL g325 (.A(n_8),
	.B(n_17),
	.Q(Z[25]));
   NOR2XL g326 (.A(n_9),
	.B(n_15),
	.Q(Z[18]));
   NOR2XL g327 (.A(n_9),
	.B(n_36),
	.Q(Z[0]));
   NOR2XL g328 (.A(n_7),
	.B(n_17),
	.Q(Z[17]));
   NOR2XL g329 (.A(n_10),
	.B(n_17),
	.Q(Z[24]));
   NOR2XL g330 (.A(n_9),
	.B(n_17),
	.Q(Z[16]));
   NOR2XL g331 (.A(n_8),
	.B(n_29),
	.Q(Z[15]));
   NOR2XL g332 (.A(n_7),
	.B(n_12),
	.Q(Z[23]));
   NOR2XL g333 (.A(n_10),
	.B(n_29),
	.Q(Z[14]));
   NOR2XL g334 (.A(n_8),
	.B(n_31),
	.Q(Z[13]));
   NOR2XL g335 (.A(n_10),
	.B(n_12),
	.Q(Z[30]));
   NOR2XL g336 (.A(n_10),
	.B(n_13),
	.Q(Z[28]));
   NOR2XL g337 (.A(n_10),
	.B(n_31),
	.Q(Z[12]));
   NOR2XL g338 (.A(n_8),
	.B(n_34),
	.Q(Z[11]));
   NOR2XL g339 (.A(n_9),
	.B(n_12),
	.Q(Z[22]));
   NOR2XL g340 (.A(n_10),
	.B(n_34),
	.Q(Z[10]));
   NOR2XL g341 (.A(n_8),
	.B(n_36),
	.Q(Z[9]));
   NOR2XL g342 (.A(n_8),
	.B(n_15),
	.Q(Z[27]));
   NOR2XL g343 (.A(n_10),
	.B(n_36),
	.Q(Z[8]));
   NOR2XL g344 (.A(n_7),
	.B(n_29),
	.Q(Z[7]));
   NOR2XL g345 (.A(n_7),
	.B(n_13),
	.Q(Z[21]));
   NOR2XL g346 (.A(n_9),
	.B(n_29),
	.Q(Z[6]));
   NOR2XL g347 (.A(n_7),
	.B(n_31),
	.Q(Z[5]));
   INVXL g123 (.A(SH[3]),
	.Q(n_11));
   INVXL g203 (.A(SH[4]),
	.Q(n_1));
   INVXL g204 (.A(SH[2]),
	.Q(n_0));
   NOR2XL g199 (.A(n_0),
	.B(SH[1]),
	.Q(n_5));
   NOR2XL g201 (.A(SH[1]),
	.B(SH[2]),
	.Q(n_3));
endmodule

module fet_dec (
	in, 
	out);
   input [4:0] in;
   output [31:0] out;

   // Internal wires
   wire CTS_160;
   wire CTS_159;
   wire CTS_158;
   wire CTS_157;
   wire CTS_156;
   wire CTS_155;
   wire CTS_154;
   wire CTS_153;
   wire CTS_152;
   wire CTS_151;
   wire CTS_150;
   wire CTS_149;
   wire CTS_148;
   wire CTS_147;
   wire CTS_146;
   wire CTS_145;
   wire CTS_144;
   wire CTS_143;
   wire CTS_142;
   wire CTS_141;
   wire CTS_140;
   wire CTS_139;
   wire CTS_138;
   wire CTS_137;
   wire CTS_136;
   wire CTS_135;
   wire CTS_134;
   wire CTS_133;
   wire CTS_132;
   wire CTS_131;
   wire CTS_130;
   wire CTS_129;
   wire logic_1_1_net;

   CLKBUFX4 CTS_ccl_BUF_in_0__G0_L3_16 (.A(CTS_160),
	.Q(out[31]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_15 (.A(CTS_159),
	.Q(out[29]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_14 (.A(CTS_158),
	.Q(out[25]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_13 (.A(CTS_157),
	.Q(out[15]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_12 (.A(CTS_156),
	.Q(out[13]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_11 (.A(CTS_155),
	.Q(out[11]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_10 (.A(CTS_154),
	.Q(out[9]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_9 (.A(CTS_153),
	.Q(out[27]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_8 (.A(CTS_152),
	.Q(out[3]));
   CLKBUFX4 CTS_ccl_BUF_in_0__G0_L3_7 (.A(CTS_151),
	.Q(out[19]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_6 (.A(CTS_150),
	.Q(out[1]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_5 (.A(CTS_149),
	.Q(out[17]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_4 (.A(CTS_148),
	.Q(out[23]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_3 (.A(CTS_147),
	.Q(out[7]));
   CLKBUFX4 CTS_ccl_BUF_in_0__G0_L3_2 (.A(CTS_146),
	.Q(out[21]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L3_1 (.A(CTS_145),
	.Q(out[5]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_16 (.A(CTS_144),
	.Q(out[26]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_15 (.A(CTS_143),
	.Q(out[24]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_14 (.A(CTS_142),
	.Q(out[14]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_13 (.A(CTS_141),
	.Q(out[30]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_12 (.A(CTS_140),
	.Q(out[28]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_11 (.A(CTS_139),
	.Q(out[12]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_10 (.A(CTS_138),
	.Q(out[10]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_9 (.A(CTS_137),
	.Q(out[8]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_8 (.A(CTS_136),
	.Q(out[20]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_7 (.A(CTS_135),
	.Q(out[4]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_6 (.A(CTS_134),
	.Q(out[2]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_5 (.A(CTS_133),
	.Q(out[18]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_4 (.A(CTS_132),
	.Q(out[0]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_3 (.A(CTS_131),
	.Q(out[16]));
   CLKBUFX3 CTS_ccl_BUF_in_0__G0_L4_2 (.A(CTS_130),
	.Q(out[22]));
   CLKBUFX4 CTS_ccl_BUF_in_0__G0_L4_1 (.A(CTS_129),
	.Q(out[6]));
   LOGIC1 tie_1_cell (.Q(logic_1_1_net));
   shift_left_vlog_unsigned sll_18_12 (.A(logic_1_1_net),
	.SH(in),
	.Z({ CTS_160,
		CTS_141,
		CTS_159,
		CTS_140,
		CTS_153,
		CTS_144,
		CTS_158,
		CTS_143,
		CTS_148,
		CTS_130,
		CTS_146,
		CTS_136,
		CTS_151,
		CTS_133,
		CTS_149,
		CTS_131,
		CTS_157,
		CTS_142,
		CTS_156,
		CTS_139,
		CTS_155,
		CTS_138,
		CTS_154,
		CTS_137,
		CTS_147,
		CTS_129,
		CTS_145,
		CTS_135,
		CTS_152,
		CTS_134,
		CTS_150,
		CTS_132 }));
endmodule

