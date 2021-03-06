/*
###############################################################
#  Generated by:      Cadence Encounter 14.25-s034_1
#  OS:                Linux x86_64(Host ID localhost.localdomain)
#  Generated on:      Fri Jul  1 21:55:14 2016
#  Design:            spc2
#  Command:           saveNetlist spc2_fe.v
###############################################################
*/
module spc2 (
	Cfg_in, 
	Clk, 
	Resetn, 
	F, 
	IQ, 
	GS, 
	CE, 
	NS, 
	GD, 
	FS, 
	RE);
   input Cfg_in;
   input Clk;
   input Resetn;
   output [3:0] F;
   output IQ;
   output [3:0] GS;
   output CE;
   output NS;
   output [2:0] GD;
   output FS;
   output RE;

   // Internal wires
   wire [4:0] count;
   wire [15:0] out;
   wire UNCONNECTED;
   wire UNCONNECTED0;
   wire UNCONNECTED1;
   wire UNCONNECTED2;
   wire UNCONNECTED3;
   wire UNCONNECTED4;
   wire UNCONNECTED5;
   wire UNCONNECTED6;
   wire UNCONNECTED7;
   wire UNCONNECTED8;
   wire UNCONNECTED9;
   wire UNCONNECTED10;
   wire UNCONNECTED11;
   wire UNCONNECTED12;
   wire UNCONNECTED13;
   wire UNCONNECTED14;
   wire UNCONNECTED15;
   wire UNCONNECTED16;
   wire UNCONNECTED17;
   wire UNCONNECTED18;
   wire UNCONNECTED19;
   wire UNCONNECTED20;
   wire UNCONNECTED21;
   wire UNCONNECTED22;
   wire UNCONNECTED23;
   wire UNCONNECTED24;
   wire UNCONNECTED25;
   wire UNCONNECTED26;
   wire UNCONNECTED27;
   wire UNCONNECTED28;
   wire UNCONNECTED29;
   wire UNCONNECTED30;
   wire UNCONNECTED31;
   wire UNCONNECTED32;
   wire UNCONNECTED33;
   wire UNCONNECTED34;
   wire n_0;
   wire n_1;
   wire n_2;
   wire n_3;
   wire n_4;
   wire n_5;
   wire n_6;
   wire n_7;
   wire n_8;
   wire n_9;
   wire n_10;
   wire n_12;
   wire n_13;

   DFCX3_HV \F_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED26),
	.Q(F[1]),
	.D(out[13]),
	.CP(n_9));
   DFCX3_HV \F_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED25),
	.Q(F[2]),
	.D(out[14]),
	.CP(n_9));
   DFCX3_HV \F_reg[3]  (.RN(Resetn),
	.QN(UNCONNECTED24),
	.Q(F[3]),
	.D(out[15]),
	.CP(n_9));
   DFCX3_HV \F_reg[0]  (.RN(Resetn),
	.QN(UNCONNECTED22),
	.Q(F[0]),
	.D(out[12]),
	.CP(n_9));
   DFCX3_HV IQ_reg (.RN(Resetn),
	.QN(UNCONNECTED20),
	.Q(IQ),
	.D(out[11]),
	.CP(n_9));
   DFCX3_HV \GS_reg[3]  (.RN(Resetn),
	.QN(UNCONNECTED18),
	.Q(GS[3]),
	.D(out[10]),
	.CP(n_9));
   DFCX3_HV \GS_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED16),
	.Q(GS[2]),
	.D(out[9]),
	.CP(n_9));
   DFCX3_HV \GS_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED14),
	.Q(GS[1]),
	.D(out[8]),
	.CP(n_9));
   DFCX3_HV \GS_reg[0]  (.RN(Resetn),
	.QN(UNCONNECTED12),
	.Q(GS[0]),
	.D(out[7]),
	.CP(n_9));
   DFCX3_HV CE_reg (.RN(Resetn),
	.QN(UNCONNECTED10),
	.Q(CE),
	.D(out[6]),
	.CP(n_9));
   DFCX3_HV NS_reg (.RN(Resetn),
	.QN(UNCONNECTED8),
	.Q(NS),
	.D(out[5]),
	.CP(n_9));
   DFCX3_HV \GD_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED6),
	.Q(GD[2]),
	.D(out[4]),
	.CP(n_9));
   DFCX3_HV \GD_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED4),
	.Q(GD[1]),
	.D(out[3]),
	.CP(n_9));
   DFCX3_HV \GD_reg[0]  (.RN(Resetn),
	.QN(UNCONNECTED2),
	.Q(GD[0]),
	.D(out[2]),
	.CP(n_9));
   DFCX3_HV FS_reg (.RN(Resetn),
	.QN(UNCONNECTED0),
	.Q(FS),
	.D(out[1]),
	.CP(n_9));
   DFCX3_HV RE_reg (.RN(Resetn),
	.QN(UNCONNECTED),
	.Q(RE),
	.D(out[0]),
	.CP(n_9));
   XOR2X1_HV g148 (.Q(n_1),
	.B(n_10),
	.A(count[1]));
   XOR2X1_HV g141 (.Q(n_6),
	.B(n_2),
	.A(count[3]));
   XOR2X1_HV g139 (.Q(n_7),
	.B(n_5),
	.A(count[4]));
   INVXL_HV g144 (.Q(n_4),
	.A(n_2));
   DFCX1_HV \count_reg[0]  (.RN(Resetn),
	.QN(n_10),
	.Q(count[0]),
	.D(n_10),
	.CP(Clk));
   DFCX1_HV \count_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED34),
	.Q(count[1]),
	.D(n_1),
	.CP(Clk));
   DFCX1_HV \count_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED33),
	.Q(count[2]),
	.D(n_3),
	.CP(Clk));
   DFCX1_HV \count_reg[3]  (.RN(Resetn),
	.QN(UNCONNECTED32),
	.Q(count[3]),
	.D(n_6),
	.CP(Clk));
   DFCX1_HV \out_reg[15]  (.RN(Resetn),
	.QN(UNCONNECTED30),
	.Q(out[15]),
	.D(Cfg_in),
	.CP(Clk));
   DFCX1_HV \out_reg[14]  (.RN(Resetn),
	.QN(UNCONNECTED29),
	.Q(out[14]),
	.D(out[15]),
	.CP(Clk));
   DFCX1_HV \out_reg[13]  (.RN(Resetn),
	.QN(UNCONNECTED28),
	.Q(out[13]),
	.D(out[14]),
	.CP(Clk));
   DFCX1_HV \out_reg[12]  (.RN(Resetn),
	.QN(UNCONNECTED27),
	.Q(out[12]),
	.D(out[13]),
	.CP(Clk));
   DFCX1_HV \out_reg[11]  (.RN(Resetn),
	.QN(UNCONNECTED23),
	.Q(out[11]),
	.D(out[12]),
	.CP(Clk));
   DFCX1_HV \out_reg[10]  (.RN(Resetn),
	.QN(UNCONNECTED21),
	.Q(out[10]),
	.D(out[11]),
	.CP(Clk));
   DFCX1_HV \out_reg[9]  (.RN(Resetn),
	.QN(UNCONNECTED19),
	.Q(out[9]),
	.D(out[10]),
	.CP(Clk));
   DFCX1_HV \out_reg[8]  (.RN(Resetn),
	.QN(UNCONNECTED17),
	.Q(out[8]),
	.D(out[9]),
	.CP(Clk));
   DFCX1_HV \out_reg[7]  (.RN(Resetn),
	.QN(UNCONNECTED15),
	.Q(out[7]),
	.D(out[8]),
	.CP(Clk));
   DFCX1_HV \out_reg[6]  (.RN(Resetn),
	.QN(UNCONNECTED13),
	.Q(out[6]),
	.D(out[7]),
	.CP(Clk));
   DFCX1_HV \out_reg[5]  (.RN(Resetn),
	.QN(UNCONNECTED11),
	.Q(out[5]),
	.D(out[6]),
	.CP(Clk));
   DFCX1_HV \out_reg[4]  (.RN(Resetn),
	.QN(UNCONNECTED9),
	.Q(out[4]),
	.D(out[5]),
	.CP(Clk));
   DFCX1_HV \out_reg[3]  (.RN(Resetn),
	.QN(UNCONNECTED7),
	.Q(out[3]),
	.D(out[4]),
	.CP(Clk));
   DFCX1_HV \out_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED5),
	.Q(out[2]),
	.D(out[3]),
	.CP(Clk));
   DFCX1_HV \out_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED3),
	.Q(out[1]),
	.D(out[2]),
	.CP(Clk));
   DFCX1_HV \out_reg[0]  (.RN(Resetn),
	.QN(UNCONNECTED1),
	.Q(out[0]),
	.D(out[1]),
	.CP(Clk));
   OR2X3_HV g150 (.Q(n_0),
	.B(count[1]),
	.A(count[0]));
   DFPX3_HV \count_reg[4]  (.SN(Resetn),
	.QN(UNCONNECTED31),
	.Q(count[4]),
	.D(n_7),
	.CP(Clk));
   NAND3X1_HV g98 (.Q(n_8),
	.C(n_12),
	.B(n_10),
	.A(n_13));
   NOR2XL_HV g147 (.Q(n_2),
	.B(count[2]),
	.A(n_0));
   NOR2XL_HV g143 (.Q(n_5),
	.B(count[3]),
	.A(n_4));
   NOR2XL_HV g96 (.Q(n_9),
	.B(n_8),
	.A(Clk));
   NOR2XL_HV g37 (.Q(n_12),
	.B(count[3]),
	.A(count[4]));
   NOR2XL_HV g36 (.Q(n_13),
	.B(count[1]),
	.A(count[2]));
   AO21X3_HV g146 (.Q(n_3),
	.B1(n_2),
	.A2(count[2]),
	.A1(n_0));
endmodule

