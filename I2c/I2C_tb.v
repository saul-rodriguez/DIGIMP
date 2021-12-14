/**************************************
* Module: I2C_tb
* Date:2015-06-21  
* Author: saul     
*
* Description: 

 

***************************************/
module  I2C_tb(
);

//Nets to drive
reg SCL;
reg RSTN;

//reg SDA;
//reg RST;

wire SDAW;

reg SDA;

assign SDAW = (~SDA) ? 1'bz : 1'b0;

//Output wires
wire SDAout;

initial begin
    $dumpfile("I2C.vcd");
    $dumpvars(0,my_I2C);
    
    RSTN = 1;
    SCL = 1;
    SDA = 1;
    
    #2 RSTN = 0;
    #2 RSTN = 1;
    #40;
    
    `include "write_i2c.inc"
    #40;
    `include "write_i2c_2.inc"
    #40;
    `include "read_i2c.inc"
   
   
   /*
    #6 SDA = 0; // START
    #10 SCL = 0;
    #10 SCL = 1;
    #10 SCL = 0;
    #40 SCL = 1;
    #4 SDA = 1;
    */
    
    #50 $finish;
end

/*
always begin
    #20 SCL = ~ SCL;
end
*/

I2C my_I2C(SDA,SDAout,SCL,RSTN);


endmodule

