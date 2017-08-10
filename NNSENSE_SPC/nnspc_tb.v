/**********************************************************************
* Module: nnspc_tb
* Date:2017-08-10  
* Author: saul     
*
* Description: test bench for nnspc
* 
* Configuation word: NSEL4,NSEL3,NSEL2,NSEL1,NSEL0,    DAC3,DAC2,DAC1,DAC0,     RE     
* 
* NSEL[4:0] NNFET selector (selects 1 of 32 fet sensors)
* DAC[3:0] Control for the current DAC
* RE        Reserve pin
*  
***********************************************************************/

module  nnspc_tb(
);

//Lines to drive
//reg Clk, Resetn, Cfg_in, Strobe;
reg Clk, Resetn, Cfg_in;


//Output signals
wire [4:0] NSEL;
wire [3:0] DAC;
wire RE;

parameter [9:0] confWord  = 10'b01010_1100_1; //0x01E
parameter [9:0] confWord2 = 10'b10101_0011_0; //0x3E1

reg [9:0] conf;
reg [9:0] conf2;


initial begin
    $dumpfile("nnspc.vcd");
    $dumpvars(0,my_nnspc);
    
    conf = confWord;
    conf2 = confWord2;
    
    Clk = 0;
    Resetn = 1;
    Cfg_in = 0;
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
    #10 Cfg_in = conf[9];;
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
    
  //  #5 Strobe = 1;
    #50 $finish;    
    
end

always begin
    #5 Clk = ~Clk;
end

nnspc my_nnspc(Cfg_in,Clk,Resetn,NSEL,DAC,RE);


endmodule

