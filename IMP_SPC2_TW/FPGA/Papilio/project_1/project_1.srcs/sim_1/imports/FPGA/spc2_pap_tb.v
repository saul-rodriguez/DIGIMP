/**********************************************************************
* Module: spc1_tb
* Date:2015-05-02  
* Author: saul     
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

module  spc2_pap_tb(
);

//Lines to drive
//reg Clk, Resetn, Cfg_in, Strobe;
reg Clk, Resetn, Cfg_in, DIR_LEFT;


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

parameter [15:0] confWord  = 16'b1010_1_1011_0_1_001_0_1; //0x561
parameter [15:0] confWord2 = 16'b0101_0_0100_1_0_110_1_0; //0x657

reg [15:0] conf;
reg [15:0] conf2;


initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,my_top);
    
    conf = confWord;
    conf2 = confWord2;
    
    Clk = 0;
    Resetn = 1;
    Cfg_in = 0;
    DIR_LEFT = 1;
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
    
  //  #5 Strobe = 1;
    #50 $finish;    
    
end

always begin
    #5 Clk = ~Clk;
end

//spc2 my_spc2(Cfg_in,Clk,Resetn,F,IQ,GS,CE,NS,GD,FS,RE);
top my_top(Cfg_in,Clk,Resetn,DIR_LEFT,LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,ARDUINO_RESET);

endmodule

