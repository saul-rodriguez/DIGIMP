/**************************************
* Module: I2C 
* Date:2016-11-12  
* Author: saul     
*
* Description: I2C slave block with 4 8-bit registers
*
* SDA = data line input
* SDA_out = data line output 
* CLS = clock line input
* RSTN = reset active low (L)
            _________
           |         |
    SDA--->| reg_00  |
 SDAout<---| reg_01  | 
    SCL--->| reg_02  |  
   RSTN--->| reg_03  |  
           |_________|

NOTES:
 - The SDAout output needs to be connected to a 3-state output buffer only pulls down the line when SDAout is (L), otherwise teh output is Z (pull-up) 
 - The SDA and SDAout can be merged in a singla SDA "inout" output pin for FPGA implementations. A 3-state buffer which only pulls-down 
 the SDA line when SDAout is (L) would look like this:  
 
 assign SDA = SDAout ? 1'bz : SDA_out;
 
 In this case, both lines have been kept separately in order to be able to use this module for ASIC synthesis.
 - For ASIC synthesis, the SDA and SDAout should be glued to the IO digital PAD. SDA should be connected to the core input. SDAout should control the enable 
 (typically enable = 1 for input and 0 for output ) also connected to the core output. Note that the IO pad configuration may vary!
 

VERIFICATION:
- This code has been simulated synthesized and tested using a Papilio Duo FPGA (Xilinx Spartan 6) using Xilinx ISE WEB Pack 14.7 (Planahead), 
and a Raspberry PI 2 Model B I2C running an application using WiringPi and WiringPiI2C "C" libraries.
 

***************************************/


module  I2C(
SDA,
SDAout,
SCL,
RSTN
);

input SDA;
output SDAout;
input SCL;
input RSTN; 

wire RST;
assign RST = ~RSTN;

//Start Detection
reg  start_detect;
reg  start_resetter;
wire start_rst = RST | start_resetter;

always @ (posedge start_rst or negedge SDA)
begin
        if (start_rst)
                start_detect <= 1'b0;
        else
                start_detect <= SCL;
end

always @ (posedge RST or posedge SCL)
begin
        if (RST)
                start_resetter <= 1'b0;
        else
                start_resetter <= start_detect;
end

//Stop Detection
reg             stop_detect;
reg             stop_resetter;
wire            stop_rst = RST | stop_resetter;

always @ (posedge stop_rst or posedge SDA)
begin   
        if (stop_rst)
                stop_detect <= 1'b0;
        else
                stop_detect <= SCL;
end

always @ (posedge RST or posedge SCL)
begin   
        if (RST)
                stop_resetter <= 1'b0;
        else
                stop_resetter <= stop_detect;
end

// Counter
reg [3:0] bit_counter;

wire  lsb_bit = (bit_counter == 4'h7) && !start_detect;
wire  ack_bit = (bit_counter == 4'h8) && !start_detect; // 8 bits + ack

always @ (negedge SCL)
begin
        if (ack_bit || start_detect)
                bit_counter <= 4'h0;
        else
                bit_counter <= bit_counter + 4'h1;
end

// Latching the data 
reg [7:0] input_shift;

parameter [6:0] device_address = 7'h55;
wire            address_detect = (input_shift[7:1] == device_address);
wire            read_write_bit = input_shift[0];

always @ (posedge RST or posedge SCL)
begin
       if (RST) begin
            if (!ack_bit) 
                input_shift <= {input_shift[6:0], SDA};
       end else begin
              if (!ack_bit) 
                input_shift <= {input_shift[6:0], SDA};
      end
end
   
// Detection of Master Acknowledgement
reg master_ack;

always @ (posedge SCL)
        if (ack_bit)
                master_ack <= ~SDA;

// State Machine
// States change only whan ack_bit is asserted!
 
parameter [2:0] STATE_IDLE      = 3'h0,
                STATE_DEV_ADDR  = 3'h1,
                STATE_READ      = 3'h2,
                STATE_IDX_PTR   = 3'h3,
                STATE_WRITE     = 3'h4;

reg [2:0]       state;
wire            write_strobe = (state == STATE_WRITE) && ack_bit;

always @ (posedge RST or negedge SCL)
begin
        if (RST)
                state <= STATE_IDLE;
        else if (start_detect)
                state <= STATE_DEV_ADDR;
        else if (ack_bit)
        begin
                case (state)
                STATE_IDLE:
                        state <= STATE_IDLE;

                STATE_DEV_ADDR:
                        if (!address_detect)
                                state <= STATE_IDLE;
                        else if (read_write_bit)
                                state <= STATE_READ;
                        else
                                state <= STATE_IDX_PTR;

                STATE_READ:
                        if (master_ack)
                                state <= STATE_READ;
                        else
                                state <= STATE_IDLE;

                STATE_IDX_PTR:
                        state <= STATE_WRITE;

                STATE_WRITE:
                        state <= STATE_WRITE;
                endcase
        end
end

//Index pointer
// Only changes on ack_bit!

reg [7:0] index_pointer;

always @ (posedge RST or negedge SCL)
begin
        if (RST)
              index_pointer <= 8'h00;
              // THE FOLLOWING LINES WERE REMOVED SINCE THEY CAUSED A GLITCH WHEN TESTING WITH A RASPBERRY I2C
     /* else if (stop_detect)
                index_pointer <= 8'h00;     */            
        else if (ack_bit)
        begin
                if (state == STATE_IDX_PTR)
                        index_pointer <= input_shift;
                else
                        index_pointer <= index_pointer + 8'h01;
        end
end

//Register writes
reg [7:0]       reg_00;
reg [7:0]       reg_01;
reg [7:0]       reg_02;
reg [7:0]       reg_03;

/*
always @ (posedge RST or negedge SCL)
begin
        if (RST)
                reg_03 <= 8'h00;
        else if (write_strobe && (index_pointer == 8'h03))
                reg_03 <= input_shift;
end
*/

always @ (posedge RST or negedge SCL)
begin
        if (RST) begin
                reg_00 <= 8'h00;
                reg_01 <= 8'h00;
                reg_02 <= 8'h00;
                reg_03 <= 8'h00;
        end
        else if (write_strobe) begin
            case (index_pointer)
                8'h00: reg_00 <= input_shift;
                8'h01: reg_01 <= input_shift;
                8'h02: reg_02 <= input_shift;
                8'h03: reg_03 <= input_shift;                
            endcase
        end
          
end

// Read requests
reg [7:0]       output_shift;

always @ (negedge SCL)
begin   
        if (lsb_bit)
        begin   
                case (index_pointer)
                8'h00: output_shift <= reg_00;
                8'h01: output_shift <= reg_01;
                8'h02: output_shift <= reg_02;
                8'h03: output_shift <= reg_03;
                // ... and so on ...

                endcase
        end
        else
                output_shift <= {output_shift[6:0], 1'b0};
end

//output control

reg             output_control;
assign          SDAout = output_control ? 1'b1 : 1'b0;

always @ (posedge RST or negedge SCL)
begin   
        if (RST)
                output_control <= 1'b1;
                
        else if (start_detect)
                output_control <= 1'b1;
        else if (lsb_bit)
        begin   
                output_control <=
                    !(((state == STATE_DEV_ADDR) && address_detect) ||
                      (state == STATE_IDX_PTR) ||
                      (state == STATE_WRITE));
        end
        else if (ack_bit)
        begin
                // Deliver the first bit of the next slave-to-master
                // transfer, if applicable.
                if (((state == STATE_READ) && master_ack) ||
                    ((state == STATE_DEV_ADDR) &&
                        address_detect && read_write_bit))
                        output_control <= output_shift[7];
                else
                        output_control <= 1'b1;
        end
        else if (state == STATE_READ)
                output_control <= output_shift[7];
        else
                output_control <= 1'b1;
end

endmodule

