`include "top.v"

`timescale 1 ns/ 1ps
//`timescale 1us/ 1ps

`define AMPLITUDE 25
`define FREQ 400
`define PHASE 4
`define RAMP  50
`define RAMP_FACTOR (`AMPLITUDE*16)/`RAMP
//`define RAMP_FACTOR 0
`define ON_TIME  50
`define OFF_TIME  50
`define ELE1  32'b0000_0000_0000_0000_1000_0000_0000_0000
`define ELE2  32'b0000_0000_0000_0000_0100_0000_0000_0000

module top_tb();

    reg resetn;
    reg porborn;    
    reg SPI_Clk;
	reg SPI_MOSI;
	reg SPI_CS;

    // Stimulation parameters
    reg [5:0] amplitude; //0 - 50 mA
    reg [11:0] freq; // 4.88 Hz (4095) - 50 Hz (400)
    reg [2:0] phaseDuration;
    reg [5:0] ramp;
    reg [9:0] ramp_factor;
    reg [7:0] ON_time; // up to 4s (200 for 50 Hz)ramp = `RAMP;    
    reg [9:0] OFF_time; // up to 12s (600 for 50 Hz)
    reg [`ELEC_NUM:0] electrode1;
    reg [`ELEC_NUM:0] electrode2;
    reg enable;

    reg [`M-1:0] conf0;
	reg [`M-1:0] conf1;
	
	always @(*) begin
		    conf0[17:12] = amplitude;
    	    conf0[11:0] = freq;
    	    conf1[23:21] = phaseDuration;
    	    conf0[23:18] = ramp;
    	    conf1[9:0] = ramp_factor;
    	    conf0[32:24] = ON_time;
    	    conf1[19:10] = OFF_time;
    	    conf1[20] = enable;
		    conf1[31:24] = 8'b0000_0000;	
	end

// Main Clk ULX
    parameter CLK_DELAY = 20;  // 25 MHz

// Clock Generators:
    reg clk25;
	always #(CLK_DELAY) clk25 = ~clk25;

    parameter MAIN_CLK_DELAY = 25000;  // 20 kHz
	parameter SPI_CLK_DELAY = 2; // 500 kHz

//Instantiation of UUT
		
	wire [6:0] btn;
	//assign btn = {{(5){1'b0}}, reset_l };
	
	reg [5:0] gp; //inputs
	//assign gp = {1'b0,1'b0,1'b0,SPI_CS,SPI_MOSI,SPI_Clk};
	
	wire [13:0] gn;	//outputs	
	wire [7:0] led;

    always @(*) begin
        gp[0] = resetn;
        gp[1] = porborn;
        gp[2] = SPI_Clk;
        gp[3] = SPI_MOSI;
        gp[4] = SPI_CS;
    end

    wire [2:0] up_switches;
    wire [2:0] down_switches;
    wire pulse_active;
    wire [5:0] DAC;
    wire clk_20khz;

    assign clk_20khz = gn[0];
    assign up_switches = gn[3:1];
    assign down_switches = gn[6:4];    
    assign DAC = gn[12:7];
    assign pulse_active = gn[13];
    
	
	top top1
		(	.gp(gp),
			.gn(gn),
			.led(led),
			.btn(btn),
			.clk_25mhz(clk25)			
			);
   

    reg [7:0] TX_data; // Data to send through MOSI	
	reg [7:0] SPI_Master_RX; // Data received through MISO  

initial begin
    // Required for EDA Playground
	$dumpfile("dump.vcd"); 
	//$dumpvars;
    $dumpvars(1,top_tb);
	$display("************************************");
	$display("Test ASKA DIG");

    //Initial State
		clk25 = 0;
		TX_data = 8'h00;
		resetn = 1'b1;
		porborn = 1'b1;
		SPI_CS = 1'b1;
		SPI_Clk = 1'b0;
		SPI_MOSI = 1'b0;
        
        enable = 1'b1;
		amplitude = `AMPLITUDE;
		freq = `FREQ;
		phaseDuration = `PHASE;
		ramp = `RAMP;
    	ramp_factor = `RAMP_FACTOR;
    	ON_time = `ON_TIME;
    	OFF_time = `OFF_TIME;
    	electrode1 = `ELE1;
    	electrode2 = `ELE2;
 
		//Reset
		#(10*MAIN_CLK_DELAY) resetn = 1'b0;
		#(10*MAIN_CLK_DELAY) resetn = 1'b1;
		#(10*MAIN_CLK_DELAY);
 
        send_ASKA(8'h02,electrode1);
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h03,electrode2);
        #(20*MAIN_CLK_DELAY);
		send_ASKA(8'h00,conf0);
		#(20*MAIN_CLK_DELAY);
		send_ASKA(8'h01,conf1);
		
		#(7500000*SPI_CLK_DELAY); 

/*
		enable = 0;
		#1;	send_ASKA(8'h01,conf1);

		#(5000000*SPI_CLK_DELAY); 
		ramp = 25;
		amplitude = 25;
		ramp_factor = (amplitude*16)/ramp;
		enable = 1;
		#1; send_ASKA(8'h00,conf0);		
		send_ASKA(8'h01,conf1);

		#(10000000*SPI_CLK_DELAY);

		porborn = 0;
		#(1000000*SPI_CLK_DELAY);
		porborn = 1;

		#(20000000*SPI_CLK_DELAY); 
   
*/
    #(64000000*CLK_DELAY); 
    $display("************************************");
	$finish;
end


	task send_ASKA(input [7:0] add, input [31:0] data);
		begin
			SPI_CS = 1'b0;
			#(4*SPI_CLK_DELAY); // models delay between CS and SPI master 
			
			send_byte(add);
			send_byte(data[31:24]);
			send_byte(data[23:16]);
			send_byte(data[15:8]);
			send_byte(data[7:0]);
			
			#(4*SPI_CLK_DELAY); // models delay between CS and SPI master 
			SPI_CS = 1'b1;	
			
			//Check values
			#(4*SPI_CLK_DELAY);

			$display("sent SPI add 0x%X, data 0x%X at time:",add, data,  $time);
						
			
            /*
			case (add)
				8'h00:  begin
							str1 = (data == conf0)? "OK" : "ERROR";
							$display("sent conf0 0x%X, received 0x%X, %s", data, conf0, str1);
						end
				8'h01: 	begin
							str1 = (data == conf1)? "OK" : "ERROR";
							$display("sent conf1 0x%X, received 0x%X, %s", data, conf1, str1);
						end						
				8'h02:  begin
							str1 = (data == ele1)? "OK" : "ERROR";
							$display("sent ele1 0x%X, received 0x%X, %s", data, ele1, str1);	
						end
				
				8'h03: 	begin
							str1 = (data == ele2)? "OK" : "ERROR";
							$display("sent ele2 0x%X, received 0x%X, %s", data, ele2, str1); 				
						end
						
			endcase
			*/
			
		end
	endtask

	task send_ASKA_error(input [7:0] add, input [31:0] data);
		begin
			SPI_CS = 1'b0;
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			
			send_byte(add);
			send_byte(data[31:24]);
			send_byte(data[23:16]);
			send_byte(data[15:8]);
			//send_byte(data[7:0]);
			
			#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_CS = 1'b1;	
			
		end
	endtask

	task send_byte(input [7:0] data);
		begin
			TX_data = data;			
			//#(4*MAIN_CLK_DELAY); // models delay between CS and SPI master 
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[7];
						
			#SPI_CLK_DELAY;		
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[6];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[5];
				
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[4];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[3];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[2];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[1];

			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
			SPI_MOSI = TX_data[0];
		
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b1;
			
			#SPI_CLK_DELAY;
			SPI_Clk = 1'b0;
						
		end
	endtask


endmodule
