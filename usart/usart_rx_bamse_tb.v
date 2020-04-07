//usart_rx_bamse_tb.v

`timescale 1ns/1ps

`include "uart_tx.v"
//`include "uart_rx.v"
`include "usart_rx_bamse.v"

`define CLK_FREQ 32000000
`define BRATE 9600
`define END_SIM 36000
`define RX_UART 8'h00

module usart_tb();

parameter N=`CLK_FREQ/`BRATE;

reg       i_Rst_H;
reg       clk;
reg       i_TX_DV;
reg [7:0] i_TX_Byte; 
reg [11:0] i_Clk_per_bit;
wire  o_TX_Active;
wire  o_TX_Serial;
wire  o_TX_Done;

reg [7:0] address;
reg ren;
wire int_rx;

wire o_Rx_DV;
wire [7:0] port_out;


UART_TX tx( 
	  .i_Rst_H(i_Rst_H),
      .i_Clock(clk),
      .i_TX_DV(i_TX_DV),
	  .i_TX_Byte(i_TX_Byte),
	  .i_Clk_per_bit(i_Clk_per_bit),
	  .o_TX_Active(o_TX_Active),
	  .o_TX_Serial(o_TX_Serial),
	  .o_TX_Done(o_TX_Done)
   );
      
USART_RX_BAMSE #(.ADDR(`RX_UART)) rx_mod(
	.rst(i_Rst_H),
	.rx(o_TX_Serial),
	.clk(clk),
	.clk_per_bit(i_Clk_per_bit),
	.port_out(port_out),	
	.address(address),		
	.ren(ren),
	.int_rx(int_rx)
);

parameter tck = 31.25; // clock Pailio (32 MHz)
always #(tck/2) clk = ~clk;

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0,tx,rx_mod);
	
	clk = 0;
	i_Rst_H = 0;
	i_TX_DV = 0;
	i_TX_Byte = 8'haf;
	i_Clk_per_bit = N;
	address = `RX_UART;
	ren = 0;
		
	#tck i_Rst_H = 1;
	#tck i_Rst_H = 0;
	
	#(5*tck) i_TX_DV = 1;
	#(5*tck) i_TX_DV = 0;
	
	#(35000*tck) ren = 1;
	#tck ren = 0;
	
	#(1000*tck) i_TX_Byte = 8'h53;
	#(5*tck) i_TX_DV = 1;
	#(5*tck) i_TX_DV = 0;
	
	#(`END_SIM*tck) $finish;
end

endmodule 
