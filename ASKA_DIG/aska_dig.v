`ifndef ASKA_DIG_V
`define ASKA_DIG_V

    //`include "aska_npg.v"
    //`include "aska_spi.v"

    `include "/home/saul/projects/DIGIMP/ASKA_SPI/aska_spi.v"
    `include "/home/saul/projects/DIGIMP/ASKA_NPG/aska_npg.v"


    module aska_dig (
			input clk,   // internal clock 20 kHz
			input reset_l, // Reset async. (L)
            input porborn, //Power-on-Reset/Brown-out-Reset (L)
			input SPI_CS, // chip select  (L)
			input SPI_Clk, // Mode 0, data is sampled at the rising edge
			input SPI_MOSI, // Master output  Slave Input				
			output [31:0] up_switches,  // Controls the P switches in the H bridge
            output [31:0] down_switches, // Controls the N switches in the H bridge
            output [5:0] DAC,
            output pulse_active);
 

    /**********************************************/
    /* Configuration words bit mapping            */
    /*                                            */
    /* conf0:                                     */
    /*                                            */
    /* bits 32-24: [7:0] ON_time                  */
    /* bits 23-18: [5:0] ramp                     */
    /* bits 17-12: [5:0] amplitude                */
    /* bits 11-0:  [11:0] freq                    */
    /*                                            */
    /* conf1:                                     */
    /*                                            */
    /* bits 9-0: [9:0] ramp_factor                */
    /* bits 19-10: [9:0] OFF_time                 */
    /* bit 22: enable                             */
    /* bits 23-21: [2:0] phaseDuration            */
    /*                                            */
    /**********************************************/

    wire resetn;

    wire [31:0] conf0;
	wire [31:0] conf1;
	wire [31:0] ele1;
	wire [31:0] ele2;

    wire [5:0] amplitude; //0 - 50 mA
    wire [11:0] freq; // 4.88 Hz (4095) - 50 Hz (400) 
    wire [2:0] phaseDuration; // 50 us (1) - 350 us (7) 
    wire [5:0] ramp; // up to 1s (50 for 50 Hz) 
    wire [9:0] ramp_factor; //[1 - 1024] (amplitude/ramp*2^4)
    wire [7:0] ON_time; // up to 4s (in pulses, 200 for 50 Hz)
    wire [9:0] OFF_time; // up to 12s (in pulses 600 for 50 Hz)   
    wire enable;

    assign resetn = reset_l & porborn;

    assign amplitude = conf0[17:12];
    assign freq = conf0[11:0];
    assign phaseDuration = conf1[23:21];
    assign ramp = conf0[23:18];
    assign ramp_factor = conf1[9:0];
    assign ON_time = conf0[32:24];
    assign OFF_time = conf1[19:10];
    assign enable = conf1[20];

    aska_spi spi1 (
			.clk(clk),
			.resetn(resetn),
			.SPI_CS(SPI_CS),
			.SPI_Clk(SPI_Clk),
			.SPI_MOSI(SPI_MOSI),			 
			.conf0(conf0),
			.conf1(conf1),
			.ele1(ele1),
			.ele2(ele2)
		);

    aska_npg npg1 (
            .clk(clk),
            .resetn(resetn),
            .amplitude(amplitude),
            .freq(freq),
            .phaseDuration(phaseDuration),
            .ramp(ramp),
            .ramp_factor(ramp_factor),
            .ON_time(ON_time),
            .OFF_time(OFF_time),
            .electrode1(ele1),
            .electrode2(ele2),
            .enable(enable),
            .up_switches(up_switches),
            .down_switches(down_switches),
            .DAC(DAC),
            .pulse_active(pulse_active)
    );

    endmodule

`endif