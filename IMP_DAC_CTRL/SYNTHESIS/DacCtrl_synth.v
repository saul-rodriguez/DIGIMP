
// Generated by Cadence Encounter(R) RTL Compiler RC14.24 - v14.20-s034_1

// Verification Directory fv/DacCtrl 

module DacCtrl(CountEnable, Clk, Resetn, StepNum, P, IP, IN, QP, QN);
  input CountEnable, Clk, Resetn, StepNum;
  output [16:0] P;
  output IP, IN, QP, QN;
  wire CountEnable, Clk, Resetn, StepNum;
  wire [16:0] P;
  wire IP, IN, QP, QN;
  wire [4:0] count;
  wire UNCONNECTED, UNCONNECTED0, n_0, n_1, n_2, n_4, n_5, n_6;
  wire n_7, n_8, n_9, n_10, n_11, n_12, n_13, n_14;
  wire n_16, n_17, n_18, n_21, n_22, n_23, n_24, n_25;
  wire n_27, n_28, n_30, n_31, n_34, n_35, n_36, n_37;
  wire n_38, n_39, n_40, n_42, n_44, n_45, n_46, n_51;
  wire n_54, n_55, n_58;
  NOR2X3_HV g1155(.A (n_58), .B (n_54), .Q (P[13]));
  NOR2X3_HV g1153(.A (n_58), .B (count[4]), .Q (P[5]));
  NOR2X3_HV g1154(.A (n_55), .B (count[4]), .Q (P[3]));
  NOR2X3_HV g1156(.A (n_55), .B (n_54), .Q (P[11]));
  NOR2X3_HV g1148(.A (n_51), .B (n_54), .Q (P[9]));
  NOR2X3_HV g1147(.A (n_51), .B (count[4]), .Q (P[1]));
  OAI22X3_HV g1163(.A1 (n_46), .A2 (count[4]), .B1 (n_45), .B2
       (count[3]), .Q (P[8]));
  NOR2X3_HV g1151(.A (n_42), .B (count[4]), .Q (P[7]));
  OAI22X3_HV g1165(.A1 (n_40), .A2 (count[4]), .B1 (n_39), .B2
       (count[3]), .Q (P[4]));
  DFCSX2_HV \count_reg[4] (.RN (Resetn), .CP (Clk), .D (count[4]), .SI
       (n_54), .SE (n_34), .Q (count[4]), .QN (UNCONNECTED));
  AOI32X3_HV g1168(.A1 (n_30), .A2 (n_38), .A3 (n_37), .B1 (n_36), .B2
       (n_44), .Q (n_58));
  OAI22X3_HV g1164(.A1 (n_46), .A2 (n_54), .B1 (n_45), .B2 (n_44), .Q
       (P[16]));
  NOR2X3_HV g1152(.A (n_42), .B (n_54), .Q (P[15]));
  OAI22X3_HV g1166(.A1 (n_40), .A2 (n_54), .B1 (n_39), .B2 (n_44), .Q
       (P[12]));
  AOI32X3_HV g1167(.A1 (n_35), .A2 (n_38), .A3 (n_37), .B1 (n_36), .B2
       (count[3]), .Q (n_55));
  AOI22X3_HV g1149(.A1 (n_35), .A2 (n_31), .B1 (n_34), .B2 (n_37), .Q
       (n_51));
  AO22X3_HV g1160(.A1 (n_28), .A2 (n_54), .B1 (n_27), .B2 (n_44), .Q
       (P[6]));
  OAI22X3_HV g1158(.A1 (n_25), .A2 (count[4]), .B1 (n_24), .B2
       (count[3]), .Q (P[2]));
  AOI32X3_HV g1161(.A1 (n_21), .A2 (n_44), .A3 (n_37), .B1 (n_31), .B2
       (n_30), .Q (n_42));
  DFCX1_HV \count_reg[3] (.RN (Resetn), .CP (Clk), .D (n_22), .Q
       (count[3]), .QN (n_44));
  AO22X3_HV g1159(.A1 (n_28), .A2 (count[4]), .B1 (n_27), .B2
       (count[3]), .Q (P[14]));
  OAI22X3_HV g1157(.A1 (n_25), .A2 (n_54), .B1 (n_24), .B2 (n_44), .Q
       (P[10]));
  NAND2XL_HV g1175(.A (n_23), .B (n_30), .Q (n_46));
  AND2X3_HV g1176(.A (n_31), .B (count[2]), .Q (n_36));
  NAND2XL_HV g1177(.A (n_23), .B (count[2]), .Q (n_40));
  HAX3_HV g1162(.A (n_21), .B (count[3]), .CO (n_34), .SUM (n_22));
  OAI31X6_HV g1171(.A1 (n_4), .A2 (count[1]), .A3 (count[0]), .B1
       (CountEnable), .Q (P[0]));
  AND2X3_HV g1185(.A (n_18), .B (n_17), .Q (n_23));
  AND2X3_HV g1186(.A (n_18), .B (count[0]), .Q (n_31));
  NAND3X3_HV g1170(.A (n_16), .B (n_9), .C (n_37), .Q (n_25));
  NOR3X3_HV g1180(.A (n_8), .B (n_17), .C (n_13), .Q (n_27));
  NOR3X3_HV g1172(.A (n_16), .B (n_14), .C (n_11), .Q (n_28));
  NAND2XL_HV g1178(.A (n_12), .B (count[2]), .Q (n_45));
  DFCX1_HV \count_reg[1] (.RN (Resetn), .CP (Clk), .D (n_10), .Q
       (count[1]), .QN (n_5));
  DFCSX2_HV \count_reg[2] (.RN (Resetn), .CP (Clk), .D (count[2]), .SI
       (n_6), .SE (n_38), .Q (count[2]), .QN (UNCONNECTED0));
  DFCX3_HV QP_reg(.RN (Resetn), .CP (n_2), .D (IP), .Q (QP), .QN (QN));
  OR2X3_HV g1174(.A (n_14), .B (n_13), .Q (n_39));
  OR3X3_HV g1179(.A (n_7), .B (n_17), .C (n_13), .Q (n_24));
  NOR3X3_HV g1187(.A (count[1]), .B (count[0]), .C (n_13), .Q (n_12));
  NOR2XL_HV g1188(.A (count[1]), .B (n_11), .Q (n_18));
  AO21X3_HV g1191(.A1 (n_5), .A2 (count[0]), .B1 (n_9), .Q (n_10));
  INVXL_HV g1195(.A (n_7), .Q (n_8));
  HAX3_HV g1182(.A (n_6), .B (count[3]), .CO (n_30), .SUM (n_16));
  INVXL_HV g1181(.A (n_9), .Q (n_14));
  XNOR2X2_HV g1196(.A (n_5), .B (count[2]), .Q (n_7));
  NOR2XL_HV g1189(.A (n_1), .B (n_6), .Q (n_21));
  AOI21X3_HV g1190(.A1 (n_6), .A2 (StepNum), .B1 (n_35), .Q (n_4));
  INVX3_HV g1192(.A (IN), .Q (IP));
  IMUX2XL_HV g1194(.A (n_44), .B (n_6), .S (StepNum), .Q (n_2));
  INVXL_HV g1198(.A (n_11), .Q (n_37));
  MUX2X3_HV g1193(.A (count[4]), .B (count[3]), .S (StepNum), .Q (IN));
  NAND2XL_HV g1199(.A (n_0), .B (CountEnable), .Q (n_11));
  INVXL_HV g1201(.A (n_1), .Q (n_38));
  NOR2XL_HV g1204(.A (n_5), .B (count[0]), .Q (n_9));
  DFCX1_HV \count_reg[0] (.RN (Resetn), .CP (Clk), .D (n_17), .Q
       (count[0]), .QN (n_17));
  NAND2XL_HV g1202(.A (count[1]), .B (count[0]), .Q (n_1));
  NOR2XL_HV g1203(.A (count[2]), .B (count[3]), .Q (n_35));
  NAND2XL_HV g1200(.A (CountEnable), .B (StepNum), .Q (n_13));
  INVXL_HV g1205(.A (count[2]), .Q (n_6));
  INVX3_HV g1208(.A (count[4]), .Q (n_54));
  INVXL_HV g1210(.A (StepNum), .Q (n_0));
endmodule

