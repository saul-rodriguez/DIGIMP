/**************************************
* Module: SAR5
* Date:2017-05-25  
* Author: saul     
*
* Description: Succesive Approximation Register 5 bits
* 
* INPUTS:
* clk = system's clock. Registers change with posedge. The master controller should sample the outputs (sar, ready, sar_serial) with nededge 
* comp = This is the output of the analog comparator (Vin > Vdac) ? 1:0
* resetn = reset registers, active low (L)
*
* OUTPUTS:
* sar = N-bit output register to control the DAC, active high (H).
* start_ready = is set, active high (H), when the sar output contains the complete converted solution (N bits). It also flags that a
          new conversion started, and that in the next cycle sar_serial will have the MSB value available.           
* sar_serial = serial output from MSB to LSB
***************************************/

module sar5(
clk,
comp,
resetn,
sar,
sar_serial,
start_ready);

input clk;
input comp;
input resetn;
output [4:0] sar;
output sar_serial;
output start_ready;

reg [2:0] counter; 
reg [4:0] dac_test;
reg [4:0] dac;
reg sar_serial;

wire ready;

always @(posedge clk or negedge resetn) 
begin
	if (!resetn) begin
		dac <= 0;
		counter <= 5;		
	end else begin
		if (counter == 0) begin
			dac <= 0;
			counter <= 5;			
		end else begin 
			counter <= counter - 1;
			if (comp) begin
				dac[counter - 1] <= 1;
				sar_serial <= 1;
			end else begin
				dac[counter - 1] <= 0;			
				sar_serial <= 0;
			end
		end
	end
end
 
assign start_ready = (counter == 3'b101);

//dac_test 
always @(counter)
begin
	case(counter)
		3'b101:  dac_test = 5'b10000;
		3'b100:  dac_test = 5'b01000;
		3'b011:  dac_test = 5'b00100;
		3'b010:  dac_test = 5'b00010;
		3'b001:  dac_test = 5'b00001;	
		default: dac_test = 5'b00000;	
	endcase
end

assign sar = dac_test | dac;

endmodule
