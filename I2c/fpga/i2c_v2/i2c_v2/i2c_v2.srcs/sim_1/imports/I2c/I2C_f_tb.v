/**************************************
* Module: I2C_tb
* Date:2015-06-21  
* Author: saul     
*
* Description: 


***************************************/
`timescale 10ns / 1ps

module  I2C_f_tb(
);

//Nets to drive
reg SCL;
reg RSTN;

//reg SDA;
//reg RST;

//wire SDAW;

reg SDA;

//assign SDAW = (~SDA) ? 1'bz : 1'b0;

//Output wires
//wire SDAout;
//wire ARDUINO_RESET;
//wire LED7,LED6,LED5,LED4,LED3,LED2,LED1,LED0;
//reg DIR_UP, DIR_DOWN, DIR_LEFT; 
 

initial begin
    $dumpfile("I2C.vcd");
    $dumpvars(0,my_top);
    
    RSTN = 1;
    SCL = 1;
    SDA = 1;
//    DIR_UP = 1;
//    DIR_DOWN = 0;
//    DIR_LEFT = 0;
    
    #2 RSTN = 0;
    #2 RSTN = 1;
    #40;
    
    `include "write_i2c.inc"
    #40;
   // `include "write_i2c_2.inc"
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

//I2C my_I2C(SDA,SDAout,SCL,RSTN);
top my_top(.SW0(SDA),.SW1(SDAout),.SW2(SCL),.SW3(RSTN),.ARDUINO_RESET(ARDUINO_RESET));
//.LED7(LED7),.LED6(LED6),.LED5(LED5),.LED4(LED4),.LED3(LED3),.LED2(LED2),.LED1(LED1),.LED0(LED0),.DIR_UP(DIR_UP));

endmodule

