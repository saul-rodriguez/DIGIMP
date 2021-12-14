
// Generated by Cadence Encounter(R) RTL Compiler RC14.25 - v14.20-s046_1

// Verification Directory fv/spc2 

module spc2(Cfg_in, Clk, Resetn, F, IQ, GS, CE, NS, GD, FS, RE);
  input Cfg_in, Clk, Resetn;
  output [3:0] F, GS;
  output IQ, CE, NS, FS, RE;
  output [2:0] GD;
  wire Cfg_in, Clk, Resetn;
  wire [3:0] F, GS;
  wire IQ, CE, NS, FS, RE;
  wire [2:0] GD;
  wire [4:0] count;
  wire [15:0] out;
  wire UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2,
       UNCONNECTED3, UNCONNECTED4, UNCONNECTED5, UNCONNECTED6;
  wire UNCONNECTED7, UNCONNECTED8, UNCONNECTED9, UNCONNECTED10,
       UNCONNECTED11, UNCONNECTED12, UNCONNECTED13, UNCONNECTED14;
  wire UNCONNECTED15, UNCONNECTED16, UNCONNECTED17, UNCONNECTED18,
       UNCONNECTED19, UNCONNECTED20, UNCONNECTED21, UNCONNECTED22;
  wire UNCONNECTED23, UNCONNECTED24, UNCONNECTED25, UNCONNECTED26,
       UNCONNECTED27, UNCONNECTED28, UNCONNECTED29, UNCONNECTED30;
  wire UNCONNECTED31, UNCONNECTED32, UNCONNECTED33, UNCONNECTED34, n_0,
       n_1, n_2, n_3;
  wire n_4, n_5, n_6, n_7, n_8, n_9, n_10, n_12;
  wire n_13;
  NOR2XL g36(.A (count[2]), .B (count[1]), .Q (n_13));
  NOR2XL g37(.A (count[3]), .B (count[4]), .Q (n_12));
  DFCX3 RE_reg(.RN (Resetn), .CP (n_9), .D (out[0]), .Q (RE), .QN
       (UNCONNECTED));
  DFCX3 FS_reg(.RN (Resetn), .CP (n_9), .D (out[1]), .Q (FS), .QN
       (UNCONNECTED0));
  DFCX1 \out_reg[0] (.RN (Resetn), .CP (Clk), .D (out[1]), .Q (out[0]),
       .QN (UNCONNECTED1));
  DFCX3 \GD_reg[0] (.RN (Resetn), .CP (n_9), .D (out[2]), .Q (GD[0]),
       .QN (UNCONNECTED2));
  DFCX1 \out_reg[1] (.RN (Resetn), .CP (Clk), .D (out[2]), .Q (out[1]),
       .QN (UNCONNECTED3));
  DFCX3 \GD_reg[1] (.RN (Resetn), .CP (n_9), .D (out[3]), .Q (GD[1]),
       .QN (UNCONNECTED4));
  DFCX1 \out_reg[2] (.RN (Resetn), .CP (Clk), .D (out[3]), .Q (out[2]),
       .QN (UNCONNECTED5));
  DFCX3 \GD_reg[2] (.RN (Resetn), .CP (n_9), .D (out[4]), .Q (GD[2]),
       .QN (UNCONNECTED6));
  DFCX1 \out_reg[3] (.RN (Resetn), .CP (Clk), .D (out[4]), .Q (out[3]),
       .QN (UNCONNECTED7));
  DFCX3 NS_reg(.RN (Resetn), .CP (n_9), .D (out[5]), .Q (NS), .QN
       (UNCONNECTED8));
  DFCX1 \out_reg[4] (.RN (Resetn), .CP (Clk), .D (out[5]), .Q (out[4]),
       .QN (UNCONNECTED9));
  DFCX3 CE_reg(.RN (Resetn), .CP (n_9), .D (out[6]), .Q (CE), .QN
       (UNCONNECTED10));
  DFCX1 \out_reg[5] (.RN (Resetn), .CP (Clk), .D (out[6]), .Q (out[5]),
       .QN (UNCONNECTED11));
  DFCX3 \GS_reg[0] (.RN (Resetn), .CP (n_9), .D (out[7]), .Q (GS[0]),
       .QN (UNCONNECTED12));
  DFCX1 \out_reg[6] (.RN (Resetn), .CP (Clk), .D (out[7]), .Q (out[6]),
       .QN (UNCONNECTED13));
  DFCX3 \GS_reg[1] (.RN (Resetn), .CP (n_9), .D (out[8]), .Q (GS[1]),
       .QN (UNCONNECTED14));
  DFCX1 \out_reg[7] (.RN (Resetn), .CP (Clk), .D (out[8]), .Q (out[7]),
       .QN (UNCONNECTED15));
  DFCX3 \GS_reg[2] (.RN (Resetn), .CP (n_9), .D (out[9]), .Q (GS[2]),
       .QN (UNCONNECTED16));
  DFCX1 \out_reg[8] (.RN (Resetn), .CP (Clk), .D (out[9]), .Q (out[8]),
       .QN (UNCONNECTED17));
  DFCX3 \GS_reg[3] (.RN (Resetn), .CP (n_9), .D (out[10]), .Q (GS[3]),
       .QN (UNCONNECTED18));
  DFCX1 \out_reg[9] (.RN (Resetn), .CP (Clk), .D (out[10]), .Q
       (out[9]), .QN (UNCONNECTED19));
  DFCX3 IQ_reg(.RN (Resetn), .CP (n_9), .D (out[11]), .Q (IQ), .QN
       (UNCONNECTED20));
  DFCX1 \out_reg[10] (.RN (Resetn), .CP (Clk), .D (out[11]), .Q
       (out[10]), .QN (UNCONNECTED21));
  DFCX3 \F_reg[0] (.RN (Resetn), .CP (n_9), .D (out[12]), .Q (F[0]),
       .QN (UNCONNECTED22));
  DFCX1 \out_reg[11] (.RN (Resetn), .CP (Clk), .D (out[12]), .Q
       (out[11]), .QN (UNCONNECTED23));
  DFCX3 \F_reg[3] (.RN (Resetn), .CP (n_9), .D (out[15]), .Q (F[3]),
       .QN (UNCONNECTED24));
  DFCX3 \F_reg[2] (.RN (Resetn), .CP (n_9), .D (out[14]), .Q (F[2]),
       .QN (UNCONNECTED25));
  DFCX3 \F_reg[1] (.RN (Resetn), .CP (n_9), .D (out[13]), .Q (F[1]),
       .QN (UNCONNECTED26));
  DFCX1 \out_reg[12] (.RN (Resetn), .CP (Clk), .D (out[13]), .Q
       (out[12]), .QN (UNCONNECTED27));
  DFCX1 \out_reg[13] (.RN (Resetn), .CP (Clk), .D (out[14]), .Q
       (out[13]), .QN (UNCONNECTED28));
  NOR2XL g96(.A (Clk), .B (n_8), .Q (n_9));
  DFCX1 \out_reg[14] (.RN (Resetn), .CP (Clk), .D (out[15]), .Q
       (out[14]), .QN (UNCONNECTED29));
  NAND3X1 g98(.A (n_13), .B (n_10), .C (n_12), .Q (n_8));
  DFCX1 \out_reg[15] (.RN (Resetn), .CP (Clk), .D (Cfg_in), .Q
       (out[15]), .QN (UNCONNECTED30));
  DFPX3 \count_reg[4] (.SN (Resetn), .CP (Clk), .D (n_7), .Q
       (count[4]), .QN (UNCONNECTED31));
  XOR2X1 g139(.A (count[4]), .B (n_5), .Q (n_7));
  DFCX1 \count_reg[3] (.RN (Resetn), .CP (Clk), .D (n_6), .Q
       (count[3]), .QN (UNCONNECTED32));
  XOR2X1 g141(.A (count[3]), .B (n_2), .Q (n_6));
  DFCX1 \count_reg[2] (.RN (Resetn), .CP (Clk), .D (n_3), .Q
       (count[2]), .QN (UNCONNECTED33));
  NOR2XL g143(.A (n_4), .B (count[3]), .Q (n_5));
  INVXL g144(.A (n_2), .Q (n_4));
  DFCX1 \count_reg[1] (.RN (Resetn), .CP (Clk), .D (n_1), .Q
       (count[1]), .QN (UNCONNECTED34));
  AO21X3 g146(.A1 (n_0), .A2 (count[2]), .B1 (n_2), .Q (n_3));
  NOR2XL g147(.A (n_0), .B (count[2]), .Q (n_2));
  XOR2X1 g148(.A (count[1]), .B (n_10), .Q (n_1));
  DFCX1 \count_reg[0] (.RN (Resetn), .CP (Clk), .D (n_10), .Q
       (count[0]), .QN (n_10));
  OR2X3 g150(.A (count[0]), .B (count[1]), .Q (n_0));
endmodule

