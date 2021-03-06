/**************************************
* Module: PFD
* Date:2015-06-30  
* Author: saul     
*
* Description: 
***************************************/
module  PFD(
A,
B,
Resetn,
QAN,
QB
);

//inputs
input A;
input B;
input Resetn;

//outputs
output QAN;
output QB;

reg QA, QAN;
reg QB;

wire res;

assign res = Resetn & ~(QA & QB);

always @(posedge A,negedge res)
begin
    if(res == 0) begin
        QA <= 0;
        QAN <= 1;
    end else begin
        QA <= 1;
        QAN <= 0;    
    end
end

always @(posedge B,negedge res)
begin
    if(res == 0) begin
        QB <= 0;        
    end else begin        
        QB <= 1;    
    end
end


 





endmodule

