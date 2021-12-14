/**********************************************************************
* Module: vin_spc_tb
* Date:2016-07-29  
* Author: saul and raul     
*
* Description: test bench for spc2
* 
* Configuation word: F3,F2,F1,F0,    IQ,   GS3,GS2,GS1,GS0,  CE, NS,  GD2,GD1,GD0
* F<3:0>    Frequency selection 0 - 15  (0 highest frequency (VCO freq), 15 lowest frequency)
* IQ        I = 0, Q = 1
* GS<3:0>   Signal Generator Gain [0000, 0001, 0011, 0111, 1111]
* CE        Signal Generator enable 
* NS        Signal Generator number of steps NS = 0 (32 steps), NS = 1 (16 steps)
* GD<2:0>   Demodulator Gain [100, 101, 111, 011] (NOTE: G[2] is active low logic!)
* FS        Filter Selection FS = 0 (fast), FS = 1 (slow)
* RE        Reserve pin
*  
***********************************************************************/

module  vin_spc_tb(
);

//Lines to drive
//reg Clk, Resetn, Cfg_in, Strobe;
reg Clk, Resetn, Cfg_in, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN;


//Output signals

wire LED0;
wire LED1;
wire LED2;
wire LED3;
wire LED4;
wire LED5;
wire LED6;
wire LED7;
wire ARDUINO_RESET;

//Output signals
//wire [3:0] F;
//wire IQ;
//wire [2:0] G;
//wire CE;
//wire [1:0] GCP;

//Filter control
/*
wire EnLF;
wire EnMF;
wire EnHF;
wire [1:0] DN;
wire [2:0] DP;
wire EnRdeg;
wire [1:0] EnRdegHF;
wire [1:0] CcompSel;
wire [3:0] CapSel;

//Implantable
wire [3:0] F;
wire IQ;
wire [3:0] GS;
wire CE;
wire NS;
wire [2:0] GD;
wire FS;
wire RE;
*/
//parameter [15:0] confWord  = 16'b1010_1_1011_0_1_001_0_1; //0x561
//parameter [15:0] confWord2 = 16'b0101_0_0100_1_0_110_1_0; //0x657

parameter [32:0] confWord   = 33'b1_0_1_11_001_0_01_10_0110_1010_1_1011_0_1_001_0_1; //0x561
parameter [32:0] confWord2  = 33'b0_1_0_00_110_1_10_01_1001_0101_0_0100_1_0_110_1_0; //0x561

reg [32:0] conf;
reg [32:0] conf2;


initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,my_top);
    
    conf = confWord;
    conf2 = confWord2;
    
    Clk = 0;
    Resetn = 1;
    Cfg_in = 0;
    DIR_LEFT = 0;
    DIR_RIGHT = 0;
    DIR_UP = 0;
    DIR_DOWN = 0;
//    Strobe = 0;
    
    #1 Resetn = 0;
    #2 Resetn = 1;
    #1 Cfg_in = conf[0];
    #10 Cfg_in = conf[1];
    #10 Cfg_in = conf[2];
    #10 Cfg_in = conf[3];
    #10 Cfg_in = conf[4];
    #10 Cfg_in = conf[5];
    #10 Cfg_in = conf[6];
    #10 Cfg_in = conf[7];
    #10 Cfg_in = conf[8];
    #10 Cfg_in = conf[9];
    #10 Cfg_in = conf[10];
    #10 Cfg_in = conf[11];
    #10 Cfg_in = conf[12];
    #10 Cfg_in = conf[13];    
    #10 Cfg_in = conf[14];
    #10 Cfg_in = conf[15];
    #10 Cfg_in = conf[16];
    #10 Cfg_in = conf[17];
    #10 Cfg_in = conf[18];
    #10 Cfg_in = conf[19];
    #10 Cfg_in = conf[20];
    #10 Cfg_in = conf[21];
    #10 Cfg_in = conf[22];
    #10 Cfg_in = conf[23];
    #10 Cfg_in = conf[24];
    #10 Cfg_in = conf[25];
    #10 Cfg_in = conf[26];
    #10 Cfg_in = conf[27];
    #10 Cfg_in = conf[28];
    #10 Cfg_in = conf[29];
    #10 Cfg_in = conf[30];
    #10 Cfg_in = conf[31];
    #10 Cfg_in = conf[32];
    
    
    
    
    
    //Second word
    
    #60 Resetn = 0;
    #2 Resetn = 1;
    #1 Cfg_in = conf2[0];
    #10 Cfg_in = conf2[1];
    #10 Cfg_in = conf2[2];
    #10 Cfg_in = conf2[3];
    #10 Cfg_in = conf2[4];
    #10 Cfg_in = conf2[5];
    #10 Cfg_in = conf2[6];
    #10 Cfg_in = conf2[7];
    #10 Cfg_in = conf2[8];
    #10 Cfg_in = conf2[9];
    #10 Cfg_in = conf2[10];
    #10 Cfg_in = conf2[11];
    #10 Cfg_in = conf2[12];
    #10 Cfg_in = conf2[13];
    #10 Cfg_in = conf2[14];
    #10 Cfg_in = conf2[15];
    #10 Cfg_in = conf2[16];
    #10 Cfg_in = conf2[17];
    #10 Cfg_in = conf2[18];
    #10 Cfg_in = conf2[19];
    #10 Cfg_in = conf2[20];
    #10 Cfg_in = conf2[21];
    #10 Cfg_in = conf2[22];
    #10 Cfg_in = conf2[23];
    #10 Cfg_in = conf2[24];
    #10 Cfg_in = conf2[25];
    #10 Cfg_in = conf2[26];
    #10 Cfg_in = conf2[27];
    #10 Cfg_in = conf2[28];
    #10 Cfg_in = conf2[29];
    #10 Cfg_in = conf2[30];
    #10 Cfg_in = conf2[31];
    #10 Cfg_in = conf2[32];
    
    
  //  #5 Strobe = 1;
    #50 $finish;    
    
end

always begin
    #5 Clk = ~Clk;
end

//vin_spc my_vin_spc(Cfg_in,Clk,Resetn,F,IQ,GS,CE,NS,GD,FS,RE);
top my_top(Cfg_in,Clk,Resetn,DIR_LEFT,DIR_RIGHT,DIR_UP,DIR_DOWN,LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,ARDUINO_RESET);


endmodule



