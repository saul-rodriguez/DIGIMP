/********************************/
/* aska_npg.v                   */
/*                              */
/* Author: Saul Rodriguez       */  
/* Date: 2024-05-17             */
/********************************/

module aska_npg (
    input clk,
    input resetn,
    input [5:0] amplitude, //0 - 50 mA
    input [11:0] freq, // 4.88 Hz (4093) - 50 Hz (400) 
    input [2:0] phaseDuration, // 50 us (1) - 350 us (7) 
    input [5:0] ramp, // up to 1s (50 for 50 Hz) 
    input [9:0] ramp_factor, //[1 - 1024] (amplitude/ramp*2^4)
    input [7:0] ON_time, // up to 4s (200 for 50 Hz)
    input [9:0] OFF_time, // up to 12s (600 for 50 Hz)
    input [3:0] electrode1,
    input [3:0] electrode2,
    input enable,
    output reg [3:0] up_switches,
    output reg [3:0] down_switches);


/************************************/
/*  Frequency reference generator   */
/************************************/

reg [5:0]freq_count;
wire freq_count_ready;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        freq_count <= 11'b000_0000_0000;        

    end else begin
        if (enable) begin
            if (freq_count < freq) begin
                freq_count <= freq_count + 1;    
            end else begin
                freq_count <= 11'b000_0000_0000;
            end            
        end
    end
end

assign freq_count_ready = (freq_count == freq) ? 1'b1 : 1'b0;

/*********************/
/*  Pulse generator  */
/*********************/

//Positive phase logic

reg [2:0] phase_up_count;
reg phase_up_state;
wire phase_up_count_ready;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        phase_up_count <= 3'b000;        
        phase_up_state <= 1'b0;

    end else begin
        if (freq_count_ready) begin
            phase_up_state <= 1'b1;
            phase_up_count <= phase_up_count + 1;
        end else if (phase_up_state == 1'b1) begin
            if (phase_up_count < phaseDuration) begin
                phase_up_count <= phase_up_count + 1;    
            end else begin
                phase_up_count <= 3'b000;
                phase_up_state <= 1'b0;
            end
        end
    end
end

assign phase_up_count_ready = (phase_up_count == phaseDuration) ? 1'b1 : 1'b0;

// Pause 1 cycle
reg phase_pause_ready;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        phase_pause_ready <= 1'b0;

    end else begin
        if (phase_up_count_ready == 1'b1) begin
            phase_pause_ready <= 1'b1;    
        end else if (phase_pause_ready == 1'b1) begin
            phase_pause_ready <= 1'b0;
        end
    end
end

//Negative phase logic

reg [2:0] phase_down_count;
reg phase_down_state;
wire phase_down_count_ready;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        phase_down_count <= 3'b000;        
        phase_down_state <= 1'b0;

    end else begin
        if (phase_pause_ready) begin
            phase_down_state <= 1'b1;
            phase_down_count <= phase_down_count + 1;
        end else if (phase_down_state == 1'b1) begin
            if (phase_down_count < phaseDuration) begin
                phase_down_count <= phase_down_count + 1;    
            end else begin           
                phase_down_count <= 3'b000;
                phase_down_state <= 1'b0;
            end
        end
    end
end

assign phase_down_count_ready = (phase_down_count == phaseDuration) ? 1'b1 : 1'b0;

// Control enable signals for H bridge UP and DOWN switches

always @(*) begin
    if (phase_up_state) begin
        up_switches = electrode1;
        down_switches = electrode2;
    end else if (phase_down_state) begin
        up_switches = electrode2;
        down_switches = electrode1;    
    end else begin 
        up_switches = 4'b0;        
        down_switches = 4'b0;        
    end  
end

/*********************/
/* Amplitude Control */
/*********************/

// State machine for controlling ON/OFF time

reg [2:0] on_off_ctrl;

// states:
parameter IDLE = 3'b000;
parameter UP =   3'b001;
parameter ON =   3'b011;
parameter DOWN =   3'b010;
parameter OFF =  3'b110;

wire UP_ready;
wire ON_ready;
wire DOWN_ready;
wire OFF_ready;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        on_off_ctrl <= IDLE;                
    end else begin
        case (on_off_ctrl)

            IDLE:   if (enable == 1'b0) begin
                        on_off_ctrl <= IDLE;
                    end else begin
                        on_off_ctrl <= UP;
                    end

            UP:     if (enable == 1'b0) begin
                        on_off_ctrl <= IDLE;
                    end else begin
                        if (UP_ready == 1'b1) begin
                            on_off_ctrl <= ON;
                        end else begin
                            on_off_ctrl <= UP;
                        end
                    end

            ON:     if (enable == 1'b0) begin
                        on_off_ctrl <= IDLE;
                    end else begin
                        if (ON_ready == 1'b1) begin
                            on_off_ctrl <= DOWN;
                        end else begin
                            on_off_ctrl <= ON;
                        end    
                    end

            DOWN:   if (enable == 1'b0) begin
                        on_off_ctrl <= IDLE;
                    end else begin
                        if (DOWN_ready == 1'b1) begin
                            on_off_ctrl <= OFF;
                        end else begin
                            on_off_ctrl <= DOWN;
                        end    
                    end   
                    
            
            OFF:    if (enable == 1'b0) begin
                        on_off_ctrl <= IDLE;
                    end else begin
                        if (OFF_ready == 1'b1) begin
                            on_off_ctrl <= UP;
                        end else begin
                            on_off_ctrl <= OFF;
                        end    
                    end   

            default: on_off_ctrl <= IDLE;

        endcase
    end
end

//UP counter
reg [5:0] UP_count;
reg UP_count_state;
//wire UP_ready;

reg [9:0] accumulator_up;
wire [5:0] up_amplitude;

always @(posedge clk or negedge resetn) begin
    if (resetn == 1'b0) begin
        UP_count <= 6'b00_0000;        
        accumulator_up <= 10'b00_0000_0000;;
        
    end else begin
        if (on_off_ctrl == UP) begin            
            if (UP_count < ramp) begin
                if (freq_count_ready == 1'b1) begin
                    UP_count <= UP_count + 1;
                    accumulator_up <= accumulator_up + ramp_factor;
                end    
            end else begin
                UP_count <= 6'b00_0000;                
                accumulator_up <= 10'b00_0000_0000;
            end
        end
    end
end

assign UP_ready = (UP_count == ramp) ? 1'b1 : 1'b0;

assign up_amplitude = accumulator_up[9:4];
//ON counter

//DOWN counter

//OFF counter
    
endmodule
