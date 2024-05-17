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
    input enable);


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
/*  Phase generator  */
/*********************/
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
        end

        if (phase_up_state == 1'b1) begin
            phase_up_count <= phase_up_count + 1;

            if (phase_up_count == phaseDuration) begin
                phase_up_count <= 3'b0;
                phase_up_state <= 1'b0;
            end
        end
    end
end

assign phase_up_count_ready = (phase_up_count == phaseDuration) ? 1'b1 : 1'b0;



    
endmodule