//`include "constants.vams"
//`include "disciplines.vams"

`timescale 1 ns/ 1ps

module SPI_Master_TB ();

output reg SPI_Clk;
output reg SPI_MOSI;
output reg SPI_CS
output reg reset_l;
input SPI_MISO;

//parameter SPI_MODE = 0; // CPOL = 1, CPHA = 1
parameter CLKS_PER_HALF_BIT = 4;  // 6.25 MHz (SPI_CLK = 3.125 MHz)
parameter MAIN_CLK_DELAY = 20;  // 25 MHz
parameter SPI_CLK_DELAY = MAIN_CLK_DELAY*MAIN_CLK_DELAY;


// Clock Generators:
always #(MAIN_CLK_DELAY) r_Clk = ~r_Clk;
assign #6 d_Clk = r_Clk;   //delayed clock

reg [7:0] TX_data;

initial begin
 TX_data = 8'h00;
 reset_l = 1'b0;
 SPI_CS = 1'b1;
 SPI_Clk = 1'b0;
 SPI_MOSI = 1'b0;
 
end
    

endmodule 

