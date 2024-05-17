/********************************/
/* aska_npg.v                   */
/*                              */
/* Author: Saul Rodriguez       */  
/* Date: 2024-05-17             */
/********************************/

module aska_npg (
    input clk,
    input resetn,
    input [11:0] freq,
    input [2:0] phaseDuration,
    input [5:0] ramp,
    input [3:0] up,
    input [3:0] down,
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
        freq_count <= 11'b0;
        //freq_count_ready <= 1'b0;

    end else begin
        if (enable) begin
            freq_count <= freq_count + 1;

            if (freq_count == freq) begin
                freq_count <= 11'b0;
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
        phase_up_count <= 3'b0;        
        phase_up_state <= 1'b0;

    end else begin
        if (freq_count_ready) begin
            phase_up_state <= 1'b1;
            phase_up_count <= phase_up_count + 1;
        end else if (phase_up_state == 1'b1) begin
            phase_up_count <= phase_up_count + 1;

            if (phase_up_count == phaseDuration) begin
                phase_up_count <= 3'b0;
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
        phase_down_count <= 3'b0;        
        phase_down_state <= 1'b0;

    end else begin
        if (phase_pause_ready) begin
            phase_down_state <= 1'b1;
            phase_down_count <= phase_down_count + 1;
        end else if (phase_down_state == 1'b1) begin
            phase_down_count <= phase_down_count + 1;

            if (phase_down_count == phaseDuration) begin
                phase_down_count <= 3'b0;
                phase_down_state <= 1'b0;
            end
        end
    end
end

assign phase_down_count_ready = (phase_down_count == phaseDuration) ? 1'b1 : 1'b0;

// Control enable signals for H bridge UP and DOWN switches

always @(*) begin
    if (phase_up_state) begin
        up_switches = up;
        down_switches = down;
    end else if (phase_down_state) begin
        up_switches = down;
        down_switches = up;    
    end else begin 
        up_switches = 4'b0;        
        down_switches = 4'b0;        
    end  
end

    
endmodule
