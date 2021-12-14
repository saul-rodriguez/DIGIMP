/*
* test_io.v
* SW7 = ENABLE
* SW6 = IN
* LED0 = OUT
*/



module top(SW7,SW6,LED0);

input SW7;
input SW6;
output LED0;

tri_buf tri_buf1(.in(SW6), .enable(SW7), .out(LED0));

assign ARDUINO_RESET = 0;

endmodule

module tri_buf(in,enable,out);
input in, enable;
output out;

assign out = enable ? in : 1'bz;

endmodule


