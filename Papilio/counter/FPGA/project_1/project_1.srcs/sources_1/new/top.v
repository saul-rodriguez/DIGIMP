`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 10:22:32 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input RESETN,
    input CLK,
    input EN,
    output LED0,
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5,
    output LED6,
    output LED7,
    output ARDUINO_RESET
    );
    
wire [25:0] aux_out;

assign ARDUINO_RESET = 0;



counter counter1(RESETN,CLK,EN,aux_out);

assign LED7 = aux_out[25];
assign LED6 = aux_out[24];
assign LED5 = aux_out[23];
assign LED4 = aux_out[22];
assign LED3 = aux_out[21];
assign LED2 = aux_out[20];
assign LED1 = aux_out[19];
assign LED0 = aux_out[18];

endmodule
