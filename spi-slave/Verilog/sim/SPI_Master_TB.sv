///////////////////////////////////////////////////////////////////////////////
// Description:       Simple test bench for SPI Master module
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`include "SPI_Master.v"
`include "SPI_Slave.v"

module SPI_Master_TB ();
  
  parameter SPI_MODE = 0; // CPOL = 1, CPHA = 1
  parameter CLKS_PER_HALF_BIT = 4;  // 6.25 MHz (SPI_CLK = 3.125 MHz)
  parameter MAIN_CLK_DELAY = 20;  // 25 MHz

  logic r_Rst_L     = 1'b0;
  logic w_SPI_Clk;
  logic r_Clk       = 1'b0;
  logic w_SPI_MOSI;
  logic w_SPI_MISO;
  logic r_SPI_CS;

  // Master Specific
  logic [7:0] r_Master_TX_Byte = 0;
  logic r_Master_TX_DV = 1'b0;
  logic w_Master_TX_Ready;
  logic r_Master_RX_DV;
  logic [7:0] r_Master_RX_Byte;
  
  // Slave specific
  logic [7:0] w_Slave_RX_Byte;
  logic w_Slave_RX_DV;
  logic r_Slave_TX_DV;
  logic [7:0] r_Slave_TX_Byte;
  

  // Clock Generators:
  always #(MAIN_CLK_DELAY) r_Clk = ~r_Clk;

  // Instantiate UUT
  SPI_Master 
  #(.SPI_MODE(SPI_MODE),
    .CLKS_PER_HALF_BIT(CLKS_PER_HALF_BIT)) SPI_Master_UUT
  (
   // Control/Data Signals,
   .i_Rst_L(r_Rst_L),     // FPGA Reset
   .i_Clk(r_Clk),         // FPGA Clock
   
   // TX (MOSI) Signals
   .i_TX_Byte(r_Master_TX_Byte),     // Byte to transmit on MOSI
   .i_TX_DV(r_Master_TX_DV),         // Data Valid Pulse with i_TX_Byte
   .o_TX_Ready(w_Master_TX_Ready),   // Transmit Ready for Byte
   
   // RX (MISO) Signals
   .o_RX_DV(r_Master_RX_DV),       // Data Valid pulse (1 clock cycle)
   .o_RX_Byte(r_Master_RX_Byte),   // Byte received on MISO

   // SPI Interface
   .o_SPI_Clk(w_SPI_Clk),
   .i_SPI_MISO(w_SPI_MISO),
   //.i_SPI_MISO(w_SPI_MOSI),
   .o_SPI_MOSI(w_SPI_MOSI)
   );
  
    
  SPI_Slave SPI_Slave_UUT
  	(
  		.clk(r_Clk),
  		.resetn(r_Rst_L),
  		.SPI_CS(r_SPI_CS),
  		.SPI_Clk(w_SPI_Clk),
  		.SPI_MOSI(w_SPI_MOSI),
  		.SPI_MISO(w_SPI_MISO),
  		.Rx_DV(w_Slave_RX_DV),
  		.Rx_Byte(w_Slave_RX_Byte),
  		.Tx_Byte(r_Slave_TX_Byte), // 8 bit data to transmit
  		.Tx_DV(r_Slave_TX_DV)	    
  		);
  
  // Sends a single byte from master to slave.
  task SendSingleByte(input [7:0] data);
  	@(negedge r_Clk);
  	#1;
  	r_SPI_CS = 0;
    @(posedge r_Clk);
    r_Master_TX_Byte <= data;
    r_Master_TX_DV   <= 1'b1;
    @(posedge r_Clk);
    r_Master_TX_DV <= 1'b0;
    @(posedge w_Master_TX_Ready);
    @(posedge r_Clk);
    r_SPI_CS = 1;
  endtask // SendSingleByte

  // Sends two bytes from master to slave
  task SendTwoByte(input [7:0] data, input [7:0] data2 );
  	@(negedge r_Clk);
  	#1;
  	r_SPI_CS = 0;
  	@(posedge r_Clk);
  	r_Master_TX_Byte <= data;
  	r_Master_TX_DV   <= 1'b1;
  	@(posedge r_Clk);
  	r_Master_TX_DV <= 1'b0;
  	@(posedge w_Master_TX_Ready);
  	@(posedge r_Clk);
  	r_Master_TX_Byte <= data2;
  	r_Master_TX_DV   <= 1'b1;
  	@(posedge r_Clk);
  	r_Master_TX_DV <= 1'b0;
  	@(posedge w_Master_TX_Ready);
  	@(posedge r_Clk);
  	r_SPI_CS = 1;
  endtask // SendSingleByte
  
  //Places data to send from slave to master
  task SendSlaveByte(input [7:0] data);
  	@(posedge w_Slave_RX_DV);
  	r_Slave_TX_DV <= 1'b1;
  	r_Slave_TX_Byte <= data;
  	@(posedge r_Clk);    	
  	r_Slave_TX_DV <= 1'b0;
  endtask
  
  initial begin
      // Required for EDA Playground
      $dumpfile("dump.vcd"); 
      $dumpvars;
      
      r_SPI_CS = 1'b1;
      r_Slave_TX_DV = 1'b0;
      r_Slave_TX_Byte = 8'h00;
      r_Rst_L  <= 1'b0;
      repeat(10) @(posedge r_Clk);
      r_Rst_L  <= 1'b1;
      
      @(posedge r_Clk);     
      
      // Test sending single byte MOSI
      SendSingleByte(8'hC1);      
      
      // Test sending double byte MOSI 
      SendSingleByte(8'hBE);     
      SendSingleByte(8'hEF);      
      repeat(20) @(posedge r_Clk);
      
      // Test sending double byte MOSI with a single CS
      SendTwoByte(8'haa, 8'hbb);
      SendTwoByte(8'hcc, 8'hdd);
      repeat(20) @(posedge r_Clk);
      
      $finish();      
    end // initial begin
    
    initial begin
    	@(negedge r_SPI_CS);
    	r_Slave_TX_DV <= 1'b0;
    	r_Slave_TX_Byte <= 8'h54;    	
    	SendSlaveByte(8'h33);
    	SendSlaveByte(8'h44);
    	SendSlaveByte(8'h55);
    	SendSlaveByte(8'h66);
    	SendSlaveByte(8'h77);
    	SendSlaveByte(8'h88);
        
    end
    
   // initial begin
    always @(negedge r_Master_RX_DV) begin
    	$display("Received MISO 0x%X", r_Master_RX_Byte);
    end
    
    always @(negedge w_Slave_RX_DV) begin
    	$display("Received MOSI 0x%X", w_Slave_RX_Byte);
    end
    
    	
    //end

endmodule // SPI_Slave
