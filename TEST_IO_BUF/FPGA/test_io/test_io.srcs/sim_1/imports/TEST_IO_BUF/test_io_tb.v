/*
 * test_io_tb.v 
 */
 
 module test_io_tb();
 
 //wires to drive
reg SW7;
reg SW6;
reg SW1;
 
 //output wires
wire LED0;
wire SW0;
//wire SW1;
wire ARDUINO_RESET;


initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,my_top);
    
    
		SW6 = 0; SW7 = 0;    
    #10 SW6 = 0; SW7 = 1;
    #10 SW6 = 1; SW7 = 0;
    #10 SW6 = 1; SW7 = 1;
    #10 SW6 = 0; SW7 = 0;
    #10 SW1 = 1;    
    
    #50 $finish;
end

top my_top(SW7,SW6,LED0,SW0, SW1, ARDUINO_RESET);

endmodule
 
