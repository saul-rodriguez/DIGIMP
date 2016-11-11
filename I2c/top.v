/*
* top.v 
*
* SW1
*
*
*/



module top(SW0,SW1,SW2,SW3);

input  SW0; //SDA
output SW1; //SDA_tri
input  SW2; //SCL
input  SW3; //RESETN

//wire SDA_aux;

wire SDA_out;

tri_buf tri_buf1(.in(SDA_out),.enable(SDA_out),.out(SW1));

I2C my_I2C(.SDA(SW0),.SDAout(SDA_out),.SCL(SW2),.RSTN(SW3));

endmodule


/*
*                 enable        _____
*               |\|            |     |
*       in _____| \____ out ___|GPIO |
*               | /            |     |
*               |/          <--|_____|
*                               
*/

module tri_buf(in,enable,out);
input in, enable;
inout out;

//enable == 1 then GPIO is input
//enable == 0 then GPIO is output
 
assign out = enable ? 1'bz : in; 

endmodule
