/*
###############################################################
#  Generated by:      Cadence Encounter 14.27-s035_1
#  OS:                Linux x86_64(Host ID s2424.it.kth.se)
#  Generated on:      Mon Apr 11 16:40:31 2016
#  Design:            FreqDiv64
#  Command:           saveNetlist FreqDiv64_fe.v
###############################################################
*/
module FreqDiv64 (
	Fin, 
	Fsel, 
	Resetn, 
	Fout, 
	F_PFD);
   input Fin;
   input [3:0] Fsel;
   input Resetn;
   output Fout;
   output F_PFD;

   // Internal wires
   wire FE_OFN0_Resetn;
   wire [14:0] divider;
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
   wire n_11;
   wire n_12;
   wire n_13;
   wire n_14;
   wire n_15;
   wire n_16;
   wire n_17;
   wire n_18;
   wire n_19;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_25;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_35;
   wire n_36;
   wire n_37;
   wire n_38;
   wire n_39;
   wire n_40;
   wire n_41;
   wire n_42;
   wire n_43;
   wire n_44;
   wire n_45;
   wire n_46;

   OA22X3_HV g445 (.Q(n_44),
	.B2(n_30),
	.B1(n_37),
	.A2(n_34),
	.A1(n_41));
   OA22X3_HV g446 (.Q(n_43),
	.B2(n_34),
	.B1(n_36),
	.A2(n_33),
	.A1(n_35));
   IMUX2XL_HV g448 (.S(Fsel[0]),
	.Q(n_41),
	.B(divider[12]),
	.A(divider[11]));
   IMUX2XL_HV g449 (.S(Fsel[0]),
	.Q(n_40),
	.B(divider[8]),
	.A(divider[7]));
   IMUX2XL_HV g450 (.S(Fsel[2]),
	.Q(n_39),
	.B(divider[13]),
	.A(divider[9]));
   IMUX2XL_HV g451 (.S(Fsel[2]),
	.Q(n_38),
	.B(divider[6]),
	.A(divider[2]));
   IMUX2XL_HV g452 (.S(Fsel[2]),
	.Q(n_37),
	.B(divider[14]),
	.A(divider[10]));
   IMUX2XL_HV g453 (.S(Fsel[0]),
	.Q(n_36),
	.B(divider[4]),
	.A(divider[3]));
   IMUX2XL_HV g454 (.S(Fsel[2]),
	.Q(n_35),
	.B(F_PFD),
	.A(divider[1]));
   HAX3_HV g268 (.SUM(n_26),
	.CO(n_25),
	.B(divider[13]),
	.A(n_23));
   HAX3_HV g270 (.SUM(n_24),
	.CO(n_23),
	.B(divider[12]),
	.A(n_21));
   HAX3_HV g272 (.SUM(n_22),
	.CO(n_21),
	.B(divider[11]),
	.A(n_19));
   HAX3_HV g274 (.SUM(n_20),
	.CO(n_19),
	.B(divider[10]),
	.A(n_17));
   HAX3_HV g276 (.SUM(n_18),
	.CO(n_17),
	.B(divider[9]),
	.A(n_15));
   HAX3_HV g278 (.SUM(n_16),
	.CO(n_15),
	.B(divider[8]),
	.A(n_13));
   HAX3_HV g280 (.SUM(n_14),
	.CO(n_13),
	.B(divider[7]),
	.A(n_11));
   HAX3_HV g282 (.SUM(n_12),
	.CO(n_11),
	.B(divider[6]),
	.A(n_9));
   HAX3_HV g284 (.SUM(n_10),
	.CO(n_9),
	.B(F_PFD),
	.A(n_7));
   HAX3_HV g286 (.SUM(n_8),
	.CO(n_7),
	.B(divider[4]),
	.A(n_5));
   HAX3_HV g288 (.SUM(n_6),
	.CO(n_5),
	.B(divider[3]),
	.A(n_3));
   HAX3_HV g290 (.SUM(n_4),
	.CO(n_3),
	.B(divider[2]),
	.A(n_1));
   HAX3_HV g292 (.SUM(n_2),
	.CO(n_1),
	.B(divider[1]),
	.A(divider[0]));
   XOR2X1_HV g266 (.Q(n_27),
	.B(n_25),
	.A(divider[14]));
   OAI221X3_HV g444 (.Q(n_45),
	.C1(n_44),
	.B2(n_32),
	.B1(n_40),
	.A2(n_33),
	.A1(n_39));
   OAI221X3_HV g447 (.Q(n_42),
	.C1(n_31),
	.B2(n_28),
	.B1(divider[0]),
	.A2(Fsel[0]),
	.A1(Fin));
   INVXL_HV g457 (.Q(n_32),
	.A(n_31));
   INVXL_HV g460 (.Q(n_29),
	.A(Fsel[2]));
   INVXL_HV g461 (.Q(n_28),
	.A(Fsel[0]));
   DFCX1_HV \divider_reg[14]  (.RN(Resetn),
	.QN(UNCONNECTED),
	.Q(divider[14]),
	.D(n_27),
	.CP(Fin));
   DFCX1_HV \divider_reg[13]  (.RN(Resetn),
	.QN(UNCONNECTED0),
	.Q(divider[13]),
	.D(n_26),
	.CP(Fin));
   DFCX1_HV \divider_reg[12]  (.RN(Resetn),
	.QN(UNCONNECTED1),
	.Q(divider[12]),
	.D(n_24),
	.CP(Fin));
   DFCX1_HV \divider_reg[11]  (.RN(Resetn),
	.QN(UNCONNECTED2),
	.Q(divider[11]),
	.D(n_22),
	.CP(Fin));
   DFCX1_HV \divider_reg[10]  (.RN(Resetn),
	.QN(UNCONNECTED3),
	.Q(divider[10]),
	.D(n_20),
	.CP(Fin));
   DFCX1_HV \divider_reg[9]  (.RN(Resetn),
	.QN(UNCONNECTED4),
	.Q(divider[9]),
	.D(n_18),
	.CP(Fin));
   DFCX1_HV \divider_reg[8]  (.RN(Resetn),
	.QN(UNCONNECTED5),
	.Q(divider[8]),
	.D(n_16),
	.CP(Fin));
   DFCX1_HV \divider_reg[7]  (.RN(Resetn),
	.QN(UNCONNECTED6),
	.Q(divider[7]),
	.D(n_14),
	.CP(Fin));
   DFCX1_HV \divider_reg[6]  (.RN(FE_OFN0_Resetn),
	.QN(UNCONNECTED7),
	.Q(divider[6]),
	.D(n_12),
	.CP(Fin));
   DFCX1_HV \divider_reg[4]  (.RN(FE_OFN0_Resetn),
	.QN(UNCONNECTED9),
	.Q(divider[4]),
	.D(n_8),
	.CP(Fin));
   DFCX1_HV \divider_reg[3]  (.RN(FE_OFN0_Resetn),
	.QN(UNCONNECTED10),
	.Q(divider[3]),
	.D(n_6),
	.CP(Fin));
   DFCX1_HV \divider_reg[2]  (.RN(Resetn),
	.QN(UNCONNECTED11),
	.Q(divider[2]),
	.D(n_4),
	.CP(Fin));
   DFCX1_HV \divider_reg[1]  (.RN(Resetn),
	.QN(UNCONNECTED12),
	.Q(divider[1]),
	.D(n_2),
	.CP(Fin));
   DFCX1_HV \divider_reg[0]  (.RN(Resetn),
	.QN(n_0),
	.Q(divider[0]),
	.D(n_0),
	.CP(Fin));
   CLKBUFX2_HV FE_OFC0_Resetn (.Q(FE_OFN0_Resetn),
	.A(Resetn));
   OAI211X3_HV g443 (.Q(n_46),
	.C1(n_42),
	.B1(n_43),
	.A2(n_30),
	.A1(n_38));
   OR2X2_HV g455 (.Q(n_34),
	.B(Fsel[1]),
	.A(n_29));
   NAND2XL_HV g456 (.Q(n_33),
	.B(Fsel[1]),
	.A(n_28));
   NAND2XL_HV g459 (.Q(n_30),
	.B(Fsel[1]),
	.A(Fsel[0]));
   MUX2X3_HV g442 (.S(Fsel[3]),
	.Q(Fout),
	.B(n_45),
	.A(n_46));
   NOR2XL_HV g458 (.Q(n_31),
	.B(Fsel[2]),
	.A(Fsel[1]));
   DFCX4_HV \divider_reg[5]  (.RN(Resetn),
	.QN(UNCONNECTED8),
	.Q(F_PFD),
	.D(n_10),
	.CP(Fin));
endmodule

