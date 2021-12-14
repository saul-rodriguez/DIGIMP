/**************************************
* Module: PFD_tb
* Date:2015-06-30  
* Author: saul     
*
* Description: 
***************************************/
module  PFD_tb(
);

//nets to drive
reg A;
reg B;
reg Resetn;

//output nets
wire QAN;
wire QB;

initial begin
    $dumpfile("PFD.vcd");
    $dumpvars(0,my_PFD);
    
    A = 0;
    B = 0;
    Resetn = 1;
    
    #2 Resetn = 0;
    #5 Resetn = 1;
    
    //A Before B
    #5 A = ~A;
    #1 B = ~B;
    #5 A = ~A;
    #1 B = ~B;
    #5 A = ~A;
    #1 B = ~B;
    #5 A = ~A;
    #1 B = ~B;
    #5 A = ~A;
    #1 B = ~B;
    #5 A = ~A;
    #1 B = ~B;
    
    //B Before A
    #5 B = ~B;
    #1 A = ~A;
    #5 B = ~B;
    #1 A = ~A;
    #5 B = ~B;
    #1 A = ~A;
    #5 B = ~B;
    #1 A = ~A;
    #5 B = ~B;
    #1 A = ~A;
    #5 B = ~B;
    #1 A = ~A;
    
    #200 $finish;
    
end

// A Active
/*
always begin
    #5 A = ~A;
    #1 B = ~B;
end
*/


// B Active
/*
always begin
    #5 B = ~B;
    #1 A = ~A;
end
*/

PFD my_PFD(A,B,Resetn,QAN,QB);


endmodule

