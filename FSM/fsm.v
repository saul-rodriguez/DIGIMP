/*
This FSM is a serial to paralel converter. 
The signal 'reset' clears all the registers
The signal 'start' signals the beginning of a new serial 8-bit word
The signal 'clk' is the clock of the system
The input 'in' is a single bit, serial data to the system
The output 'out' is an 8-bit register
Once the start signal is received, the 8 bits are saved in a register. When
the last bit is receiver, these bits are copied to an output register.
*/

module fsm(reset,start,clk,in,out);

input reset,
	  start,
	  clk,
	  in;

output [7:0] out;
reg [7:0] out;

parameter [1:0] IDLE = 2'b00;
parameter [1:0] RECEIVE = 2'b01;
//parameter [1:0] END = 2'b10;

reg [1:0] state; //Current state
reg [1:0] next_state;

reg [7:0] buffer;
reg [3:0] counter;

always @(state or in or start or counter)
begin
	next_state = state;
	
	case(state)
		IDLE:	if (start) begin
					next_state = RECEIVE;					
				end else begin
					next_state = IDLE;
				end
			
		RECEIVE: 
				if (counter == 4'd8 ) begin
					next_state = IDLE;
				end
				
//		END:
//				next_state = IDLE;	
				
		default:
				next_state = IDLE;	
	endcase
end

always @(posedge clk)
	begin
		if (reset) begin //Reset the registers
			buffer <= 8'b0;
			counter <= 4'b0;
			out <= 8'b0;
			state <= IDLE;		
		end else begin
			state <= next_state;
		end
		
		case(state)
			IDLE:
			     		begin
							buffer <= 8'b0;
							counter <= 4'b0;
						end
						
			RECEIVE:
			         	begin
							buffer <= (buffer << 1) | in;
							counter <= counter + 1;
							
							if (counter == 4'd8) begin
							     out <= buffer;
							end
						end
						
	/*		END:        
			            begin
			                buffer <= 8'b0;
                            counter <= 4'b0;
                            //out <= 8'b0;
			            end
	*/	             
			    
			default: 
			
			            begin
			                 state <= IDLE;
			            end
		endcase
	
	end



















endmodule //serpar
