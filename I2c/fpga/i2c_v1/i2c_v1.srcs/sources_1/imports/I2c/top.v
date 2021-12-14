/*
* top.v 
*
* SW1
*
*
*/



module top(SW0,SW1,SW2,SW3,ARDUINO_RESET,LED7,LED6,LED5,LED4,LED3,LED2,LED1,LED0,DIR_UP,DIR_DOWN,DIR_LEFT);

input  SW0; //SDA
output SW1; //SDA_tri
input  SW2; //SCL
input  SW3; //RESETN
output ARDUINO_RESET;
//wire SDA_aux;
output reg LED7,LED6,LED5,LED4,LED3,LED2,LED1,LED0;
input DIR_UP, DIR_DOWN, DIR_LEFT;

assign ARDUINO_RESET = 0;

wire SDA_out;

wire [7:0] aux1;
wire [7:0] aux2;
wire [7:0] aux3;
wire [7:0] aux4;

tri_buf tri_buf1(.in(SDA_out),.enable(SDA_out),.out(SW1));

I2C my_I2C(.SDA(SW0),.SDAout(SDA_out),.SCL(SW2),.RSTN(SW3),.aux1(aux1),.aux2(aux2),.aux3(aux3),.aux4(aux4));

/*
* ONLY FOR DEBUG
*/
always @(*)
begin
    if(DIR_UP) begin
        LED0 = aux2[0];
        LED1 = aux2[1];
        LED2 = aux2[2];
        LED3 = aux2[3];
        LED4 = aux2[4];
        LED5 = aux2[5];
        LED6 = aux2[6];
        LED7 = aux2[7];
    end else if (DIR_DOWN) begin
        LED0 = aux3[0];
        LED1 = aux3[1];
        LED2 = aux3[2];
        LED3 = aux3[3];
        LED4 = aux3[4];
        LED5 = aux3[5];
        LED6 = aux3[6];
        LED7 = aux3[7];
    end else if (DIR_LEFT) begin 
        LED0 = aux4[0];
        LED1 = aux4[1];
        LED2 = aux4[2];
        LED3 = aux4[3];
        LED4 = aux4[4];
        LED5 = aux4[5];
        LED6 = aux4[6];
        LED7 = aux4[7];
    end else begin
        LED0 = aux1[0];
        LED1 = aux1[1];
        LED2 = aux1[2];
        LED3 = aux1[3];
        LED4 = aux1[4];
        LED5 = aux1[5];
        LED6 = aux1[6];
        LED7 = aux1[7];
    end

end

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
