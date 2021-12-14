`ifndef USART_V
`define USART_V
 
module UART_TX 
   (
   input       i_Rst_H,
   input       i_Clock,
   input       i_TX_DV,
   input [7:0] i_TX_Byte,
   input [11:0] i_Clk_per_bit, 
   output reg  o_TX_Active,
   output reg  o_TX_Serial,
   output reg  o_TX_Done
   );
 
  localparam IDLE         = 3'b000;
  localparam TX_START_BIT = 3'b001;
  localparam TX_DATA_BITS = 3'b010;
  localparam TX_STOP_BIT  = 3'b011;
  localparam CLEANUP      = 3'b100;
  
  reg [2:0] r_SM_Main;
  reg [11:0] r_Clock_Count;
  reg [2:0] r_Bit_Index;
  reg [7:0] r_TX_Data;


  // Purpose: Control TX state machine
  always @(posedge i_Clock)
  begin
    if (i_Rst_H)
    begin
      r_SM_Main <= 3'b000;
      o_TX_Done <= 1'b0;
      o_TX_Active <= 1'b0;
    end
    else
    begin
      case (r_SM_Main)
      IDLE :
        begin
          o_TX_Serial   <= 1'b1;         // Drive Line High for Idle
          o_TX_Done     <= 1'b0;
          r_Clock_Count <= 0;
          r_Bit_Index   <= 0;
          
          if (i_TX_DV == 1'b1)
          begin
            o_TX_Active <= 1'b1;
            r_TX_Data   <= i_TX_Byte;
            r_SM_Main   <= TX_START_BIT;
          end
          else
            r_SM_Main <= IDLE;
        end // case: IDLE
      
      
      // Send out Start Bit. Start bit = 0
      TX_START_BIT :
        begin
          o_TX_Serial <= 1'b0;
          
          // Wait i_Clk_per_bit-1 clock cycles for start bit to finish
          if (r_Clock_Count < i_Clk_per_bit-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= TX_START_BIT;
          end
          else
          begin
            r_Clock_Count <= 0;
            r_SM_Main     <= TX_DATA_BITS;
          end
        end // case: TX_START_BIT
      
      
      // Wait i_Clk_per_bit-1 clock cycles for data bits to finish         
      TX_DATA_BITS :
        begin
          o_TX_Serial <= r_TX_Data[r_Bit_Index];
          
          if (r_Clock_Count < i_Clk_per_bit-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= TX_DATA_BITS;
          end
          else
          begin
            r_Clock_Count <= 0;
            
            // Check if we have sent out all bits
            if (r_Bit_Index < 7)
            begin
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main   <= TX_DATA_BITS;
            end
            else
            begin
              r_Bit_Index <= 0;
              r_SM_Main   <= TX_STOP_BIT;
            end
          end 
        end // case: TX_DATA_BITS
      
      
      // Send out Stop bit.  Stop bit = 1
      TX_STOP_BIT :
        begin
          o_TX_Serial <= 1'b1;
          
          // Wait i_Clk_per_bit-1 clock cycles for Stop bit to finish
          if (r_Clock_Count < i_Clk_per_bit-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= TX_STOP_BIT;
          end
          else
          begin
            o_TX_Done     <= 1'b1;
            r_Clock_Count <= 0;
            r_SM_Main     <= CLEANUP;
            o_TX_Active   <= 1'b0;
          end 
        end // case: TX_STOP_BIT
      
      
      // Stay here 1 clock
      CLEANUP :
        begin
          o_TX_Done <= 1'b1;
          r_SM_Main <= IDLE;
        end
      
      
      default :
        r_SM_Main <= IDLE;
      
    endcase
    end // else: !if(~i_Rst_L)
  end // always @ (posedge i_Clock or negedge i_Rst_L)

  
endmodule


module UART_RX
  (
   input            i_Rst_H,
   input            i_Clock,
   input            i_RX_Serial_asyn,
   input [11:0]		i_Clk_per_bit,
   output reg       o_RX_DV,
   output reg [7:0] o_RX_Byte
   );
   
  localparam IDLE         = 3'b000;
  localparam RX_START_BIT = 3'b001;
  localparam RX_DATA_BITS = 3'b010;
  localparam RX_STOP_BIT  = 3'b011;
  localparam CLEANUP      = 3'b100;
  
  reg [11:0] r_Clock_Count;
  reg [2:0] r_Bit_Index; //8 bits total
  reg [2:0] r_SM_Main;
    
  reg r_rx_meta;
  reg i_RX_Serial;
  
  reg [7:0] RX_Byte_temp;
  
  //Synchronize rx input
  always @(posedge i_Clock)
  begin
	r_rx_meta <= i_RX_Serial_asyn;		
	i_RX_Serial <= r_rx_meta;
  end
  
  // Purpose: Control RX state machine
  always @(posedge i_Clock)
  begin
    if (i_Rst_H)
    begin
      r_SM_Main <= 3'b000;
      o_RX_DV   <= 1'b0;
      o_RX_Byte <= 8'h00;
      RX_Byte_temp <= 8'h00;
    end
    else
    begin
      case (r_SM_Main)
      IDLE :
        begin
          o_RX_DV       <= 1'b0;
          r_Clock_Count <= 0;
          r_Bit_Index   <= 0;
          
          if (i_RX_Serial == 1'b0)          // Start bit detected
            r_SM_Main <= RX_START_BIT;
          else
            r_SM_Main <= IDLE;
        end
      
      // Check middle of start bit to make sure it's still low
      RX_START_BIT :
        begin
          if (r_Clock_Count == (i_Clk_per_bit-1)/2)
          begin
            if (i_RX_Serial == 1'b0)
            begin
              r_Clock_Count <= 0;  // reset counter, found the middle
              r_SM_Main     <= RX_DATA_BITS;
            end
            else
              r_SM_Main <= IDLE;
          end
          else
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= RX_START_BIT;
          end
        end // case: RX_START_BIT
      
      
      // Wait i_Clk_per_bit-1 clock cycles to sample serial data
      RX_DATA_BITS :
        begin
          if (r_Clock_Count < i_Clk_per_bit-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= RX_DATA_BITS;
          end
          else
          begin
            r_Clock_Count          <= 0;
            RX_Byte_temp[r_Bit_Index] <= i_RX_Serial;
            
            // Check if we have received all bits
            if (r_Bit_Index < 7)
            begin
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main   <= RX_DATA_BITS;
            end
            else
            begin
              r_Bit_Index <= 0;
              r_SM_Main   <= RX_STOP_BIT;
              //o_RX_Byte <= RX_Byte_temp;
            end
          end
        end // case: RX_DATA_BITS
      
      
      // Receive Stop bit.  Stop bit = 1
      RX_STOP_BIT :
        begin
          // Wait i_Clk_per_bit-1 clock cycles for Stop bit to finish
          if (r_Clock_Count < i_Clk_per_bit-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= RX_STOP_BIT;
          end
          else
          begin
			o_RX_Byte <= RX_Byte_temp;
            o_RX_DV       <= 1'b1;
            r_Clock_Count <= 0;
            r_SM_Main     <= CLEANUP;
          end
        end // case: RX_STOP_BIT
      
      
      // Stay here 1 clock
      CLEANUP :
        begin
          r_SM_Main <= IDLE;
          o_RX_DV   <= 1'b0;
        end
      
      
      default :
        r_SM_Main <= IDLE;
      
    endcase
    end // else: !if(~i_Rst_L)
  end // always @ (posedge i_Clock or negedge i_Rst_L)
  
endmodule // UART_RX

//This module connects the USART to the BAMSE
module USART_RX_BAMSE (
	rst,
	rx,
	clk,
	clk_per_bit,
	port_out,
	//rx_ready,
	address,		
	ren,
	int_rx,
);

parameter ADDR = 8'b0000_0000; 

input rst;
input rx;
input clk;
input [11:0] clk_per_bit; // clk_per_bit = clk_frequency / bit_rate (connect to CONFIG_UART_RX1,2)
output [7:0]port_out;
//output rx_ready;
input [7:0] address;
input ren;
output int_rx;

reg int_reset;
reg int_rx;

wire rx_ready;

UART_RX rx_module(
	  .i_Rst_H(rst),
	  .i_Clock(clk),
	  .i_RX_Serial_asyn(rx),
	  .i_Clk_per_bit(clk_per_bit),
      .o_RX_DV(rx_ready),
      .o_RX_Byte(port_out)
   );

always @(posedge clk) begin
	if (rst) begin
		int_reset <= 0;			
		int_rx <= 0;
	end else begin
		if (address == ADDR) begin
			if (ren) begin 
				int_reset <= 1;
			end
		end 
		
		if (int_reset) begin
			int_rx <= 0;
			int_reset <= 0;
		end else begin
			if (rx_ready) begin
				int_rx <= 1;
			end
		end
		
	end
end

endmodule


`endif
