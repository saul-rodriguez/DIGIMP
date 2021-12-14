/*
###############################################################
#  Generated by:      Cadence Innovus 15.28-s017_1
#  OS:                Linux x86_64(Host ID s2424.it.kth.se)
#  Generated on:      Wed Jul  5 17:28:19 2017
#  Design:            sar5
#  Command:           saveNetlist ../FINALDATA/last/sar5_final_fillcap.v -excludeLeafCell -includePhysicalInst -excludeCellInst { FILLCELLX32 FILLCELLX16 FILLCELLX8 FILLCELLX4 FILLCELLX2 FILLCELLX1  }
###############################################################
*/
// Generated by Cadence Encounter(R) RTL Compiler RC14.25 - v14.20-s046_1
// Verification Directory fv/sar5 
module sar5 (
	clk, 
	comp, 
	resetn, 
	out);
   input clk;
   input comp;
   input resetn;
   output [4:0] out;

   // Internal wires
   wire [2:0] counter;
   wire [4:0] dac_out;
   wire UNCONNECTED;
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
   wire n_15;
   wire n_16;
   wire n_18;
   wire n_20;
   wire n_21;
   wire n_22;
   wire n_23;
   wire n_24;
   wire n_26;
   wire n_27;
   wire n_28;
   wire n_29;
   wire n_30;
   wire n_31;
   wire n_32;
   wire n_33;
   wire n_34;
   wire n_39;

   // Module instantiations
   DFPX3 \counter_reg[2]  (
	.D(n_39),
	.SN(resetn),
	.CP(clk),
	.Q(counter[2]),
	.QN(n_4));
   DFPX3 \counter_reg[0]  (
	.D(n_33),
	.SN(resetn),
	.CP(clk),
	.Q(counter[0]),
	.QN(n_3));
   DFCX1 \counter_reg[1]  (
	.D(n_32),
	.RN(resetn),
	.CP(clk),
	.Q(counter[1]),
	.QN(n_8));
   DFCX1 \dac_out_reg[2]  (
	.D(n_31),
	.RN(resetn),
	.CP(clk),
	.Q(dac_out[2]),
	.QN(n_2));
   DFCX1 \dac_out_reg[4]  (
	.D(n_27),
	.RN(resetn),
	.CP(clk),
	.Q(dac_out[4]),
	.QN(n_0));
   DFCX1 \dac_out_reg[3]  (
	.D(n_30),
	.RN(resetn),
	.CP(clk),
	.Q(dac_out[3]),
	.QN(UNCONNECTED));
   NAND2XL g593 (
	.A(n_34),
	.B(counter[0]),
	.Q(n_33));
   NOR2XL g594 (
	.A(n_28),
	.B(n_23),
	.Q(n_32));
   DFCX1 \dac_out_reg[0]  (
	.D(n_21),
	.RN(resetn),
	.CP(clk),
	.Q(dac_out[0]),
	.QN(n_1));
   OAI21X3 g597 (
	.A1(n_18),
	.A2(n_26),
	.B1(n_24),
	.Q(n_31));
   AO32X3 g599 (
	.A1(n_29),
	.A2(counter[2]),
	.A3(comp),
	.B1(n_22),
	.B2(dac_out[3]),
	.Q(n_30));
   INVXL g600 (
	.A(n_28),
	.Q(n_34));
   DFCX1 \dac_out_reg[1]  (
	.D(n_15),
	.RN(resetn),
	.CP(clk),
	.Q(dac_out[1]),
	.QN(n_12));
   OAI21X3 g598 (
	.A1(n_10),
	.A2(n_26),
	.B1(n_20),
	.Q(n_27));
   AO21X3 g606 (
	.A1(n_29),
	.A2(counter[2]),
	.B1(dac_out[3]),
	.Q(out[3]));
   OAI21X3 g605 (
	.A1(n_23),
	.A2(counter[2]),
	.B1(dac_out[2]),
	.Q(n_24));
   NOR2XL g609 (
	.A(n_22),
	.B(counter[2]),
	.Q(n_28));
   OAI21X3 g596 (
	.A1(n_16),
	.A2(n_26),
	.B1(n_6),
	.Q(n_21));
   OAI31X2 g604 (
	.A1(n_9),
	.A2(n_5),
	.A3(counter[1]),
	.B1(dac_out[4]),
	.Q(n_20));
   NAND2X3 g602 (
	.A(n_18),
	.B(n_2),
	.Q(out[2]));
   NAND2X3 g603 (
	.A(n_16),
	.B(n_1),
	.Q(out[0]));
   OAI22X3 g610 (
	.A1(n_13),
	.A2(n_26),
	.B1(n_7),
	.B2(n_12),
	.Q(n_15));
   NAND2X3 g611 (
	.A(n_13),
	.B(n_12),
	.Q(out[1]));
   INVXL g613 (
	.A(n_29),
	.Q(n_22));
   NAND2X3 g612 (
	.A(n_10),
	.B(n_0),
	.Q(out[4]));
   NAND2XL g607 (
	.A(n_9),
	.B(n_8),
	.Q(n_16));
   NAND2XL g608 (
	.A(n_9),
	.B(counter[1]),
	.Q(n_18));
   HAX3 g614 (
	.A(n_3),
	.B(n_8),
	.CO(n_29),
	.SUM(n_23));
   NAND2XL g615 (
	.A(n_7),
	.B(counter[1]),
	.Q(n_13));
   NAND3X3 g617 (
	.A(counter[2]),
	.B(counter[0]),
	.C(n_8),
	.Q(n_10));
   OAI21X3 g616 (
	.A1(counter[2]),
	.A2(counter[1]),
	.B1(dac_out[0]),
	.Q(n_6));
   NOR2XL g619 (
	.A(n_4),
	.B(counter[0]),
	.Q(n_5));
   NOR2XL g620 (
	.A(n_3),
	.B(counter[2]),
	.Q(n_9));
   NOR2XL g618 (
	.A(counter[2]),
	.B(counter[0]),
	.Q(n_7));
   INVXL g624 (
	.A(comp),
	.Q(n_26));
   OAI21X2 g2 (
	.A1(n_29),
	.A2(n_4),
	.B1(n_34),
	.Q(n_39));

   // Fillers and physical instances.
   FILLCAPX4 FILLERCAP_impl0_3 (
 );
   FILLCAPX4 FILLERCAP_impl0_2 (
 );
   FILLCAPX4 FILLERCAP_impl0_1 (
 );
endmodule

