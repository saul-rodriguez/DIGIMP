/**************************************
* Module: SPC_config_tb
* Date:2015-07-02  
* Author: saul     
*
* Description: 
***************************************/
module  SPC_config_tb(
);

//Nets to drive

//Outputs
wire Fref, Cfg_in, Clk, Resetn;


initial begin
    $dumpfile("SPC_config.vcd");
    $dumpvars(0,my_SPC_config);
        

    #500 $finish; 
end

SPC_config my_SPC_config(
Fref,
Cfg_in,
Clk,
Resetn
); 


endmodule

