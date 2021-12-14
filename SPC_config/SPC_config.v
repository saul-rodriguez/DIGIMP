/**************************************
* Module: SPC_config
* Date:2015-07-02  
* Author: saul     
*
* Description: 
***************************************/
module  SPC_config(
Fref,
Cfg_in,
Clk,
Resetn
);

output Fref;
output Cfg_in;
output Clk;
output Resetn; 

//Lines to drive
//reg Clk, Resetn, Cfg_in, Strobe;
reg Clk, Resetn, Cfg_in, Fref;


//Output signals

parameter cycle = 2000; // 2000 ns -> 500 kHz

parameter [10:0] confWord  = 11'b10101100001; //0x561
parameter [10:0] confWord2 = 11'b11001010111; //0x657
reg [10:0] conf;
reg [10:0] conf2;


initial begin
    
    conf = confWord;
    conf2 = confWord2;
    
    Clk = 0;
    Resetn = 1;
    Cfg_in = 0;
    Fref = 0;
//    Strobe = 0;
    
    // Global Reset 
    #1 Resetn = 0;
    #10 Resetn = 1; 

    #10 Clk = 0; Cfg_in = conf[0]; 
    #10 Clk = 1;    
    #10 Clk = 0; Cfg_in = conf[1];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[2];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[3];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[4];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[5];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[6];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[7];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[8];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[9];
    #10 Clk = 1;
    #10 Clk = 0; Cfg_in = conf[10];
    #10 Clk = 1;
    #10 Clk = 0;
    
/*    //Second word
    #15 Resetn = 0;
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
    
  //  #5 Strobe = 1;
  //  #50 $finish;    
    
*/
end

always #(cycle/2) Fref = ~Fref;



endmodule

