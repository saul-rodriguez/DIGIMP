/*
 * counter_tb
 */
 
 
module counter_tb();

//lines to drive
reg RESETN,CLK,EN;

//output signals
//wire [25:0] out;
wire LED0;
wire LED1;
wire LED2;
wire LED3;
wire LED4;
wire LED5;
wire LED6;
wire LED7;
wire ARDUINO_RESET;

initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,my_top);
    
    RESETN = 1;
    EN = 0;
    CLK = 0;
    
    #1 RESETN = 0;
    #2 RESETN = 1;
    #3 EN = 1;
    //#640000 $finish;   
    
end

always begin
    #2 CLK = ~CLK;
end

//counter my_counter(resetn,clk,en,out);
top my_top(RESETN,CLK,EN,LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,ARDUINO_RESET);

endmodule

