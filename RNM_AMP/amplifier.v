module amplifier(in, out, vdd, en, amp);

output out;
input in, vdd, en;
input [1:0] amp;
wreal out, in, vdd;
real gain,v;
parameter real factor = 10.0;

//event driven
wire active;
assign active = ((vdd > 0.9) && en)? 1 : 0;

always @(amp) begin
    if ((^amp) !== 1'bx) begin //check that amp is a valid word!
		gain = factor*amp;
	end else begin
    	gain = 0.0;
    end
end

always @(*) begin
    v = active ? gain*in : 0;
end

assign out = active ? v : 0;

endmodule



