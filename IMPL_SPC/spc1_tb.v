/**************************************
* Module: spc1_tb
* Date:2015-05-02  
* Author: saul     
*
* Description: test bench for spc1
***************************************/
module  spc1_tb(
);

//Lines to drive
reg Clk, Resetn, Cfg_in, Strobe;

//Output signals
wire [3:0] F;
wire IQ;
wire [2:0] G;
wire CE;
wire [1:0] GCP;

parameter [10:0] confWord = 11'b10101100001;
reg [10:0] conf;

initial begin
    $dumpfile("spc1.vcd");
    $dumpvars(0,my_spc1);
    
    conf = confWord;
    
    Clk = 0;
    Resetn = 1;
    Cfg_in = 0;
    Strobe = 0;
    
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
    #5 Strobe = 1;
    #50 $finish;    
    
end

always begin
    #5 Clk = ~Clk;
end

spc1 my_spc1(Cfg_in,Clk,Strobe,Resetn,F,IQ,G,CE,GCP);


endmodule

