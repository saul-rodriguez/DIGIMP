/*
* test_io.v
* 
* Tri-output buffer
* SW7 = ENABLE
* SW6 = IN
* SW0 = OUTPUT

* Input buffer
* SW1 = INPUT 

* Test output
* LED0 = OUT
*/


/*
// Version using 2 pins: 1 for tri output buffer and 1 for input
module top(SW7,SW6,LED0,SW0,SW1,ARDUINO_RESET);

input SW7;
input SW6;
input SW1;

output LED0;
output SW0;

output ARDUINO_RESET;

tri_buf tri_buf1(.in(SW6), .enable(SW7), .out(SW0));

assign LED0 = SW1;

assign ARDUINO_RESET = 0;

endmodule

module tri_buf(in,enable,out);
input in, enable;
output out;

assign out = enable ? 1'bz : in;

endmodule
*/

//Version using 1 bi-directional pin
module top(SW7,SW6,LED0,SW0,SW1,ARDUINO_RESET);

input SW7;
input SW6;
input SW1;

output LED0;
inout SW0;

output ARDUINO_RESET;

tri_buf tri_buf1(.in(SW6), .enable(SW7), .out(SW0));

assign LED0 = SW0;

assign ARDUINO_RESET = 0;

endmodule

module tri_buf(in,enable,out);
input in, enable;
inout out;

assign out = enable ? 1'bz : in;

endmodule

