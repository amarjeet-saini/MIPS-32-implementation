module alu (
    input [31:0] a,b,
    input [3:0] AluOp,
    output zf,
    output [31:0] out);

    wire [31:0]  w_nb, w_b, w_arithOut,w_addOut, w_logicOut, w_st, w_ab;
    wire [31:0] aandb, aorb, axorb, anorb;
    
    // arithmetic unit

    //adder & subtractor
    assign w_nb = ~b;
    mux32_21 i1 (.a(b), .b(~b), .sel(AluOp[1]), .out(w_b));
    // add : alu[1] == 0 ; sub : alu[1] == 1
    fa i2 (.a(a), .b(w_b), .cin(AluOp[1]), .out(w_addOut));
    
    //stl - set less than 
    //if a < b then stl == 1 else stl == 0
    //compute a-b = w_ab[31] == 1 -> a < b => slt = 1 
    fa i3 (.a(a), .b(w_nb), .cin(1'b1), .out(w_ab));
    assign w_st = (w_ab[31] ^ 1'b1 ? 32'd0 : 32'd1) ;
    mux32_21 i4 (.a(w_addOut), .b(w_st), .sel(AluOp[3]), .out(w_arithOut));

    //logical unit
    assign aandb = a & b;
    assign aorb = a | b;
    assign axorb = a ^ b;
    assign anorb = ~(a | b);
    
    mux32_41 i5 (.a(aandb), .b(aorb), .c(axorb), .d(anorb), .sel(AluOp[1:0]), .out(w_logicOut));
    
    //logical :- alu[2] == 1
    //arith   :- alu[2] == 0
    mux32_21 i6 (.a(w_arithOut), .b(w_logicOut), .sel(AluOp[2]), .out(out));
    
    //zero flag set to ‘logic-1’ if all the bits of ‘Result’ are 0
    integer o = -1;	    
    assign zf = (out & o ? 1'b0 : 1'b1);

endmodule

module fa(
    input [31:0]a,b,
    input cin,
    output [31:0]out );

    assign out = a + b + cin;

endmodule

module mux32_21(
    input [31:0] a,b,
    input sel,
    output [31:0] out );
    
    assign out = sel ? b: a;

endmodule

module mux32_41(
    input [31:0] a,b,c,d,
    input [1:0] sel,
    output [31:0] out );
    
    wire [31:0] y1,y2;

    mux32_21 i_first (.a(a), .b(b), .sel(sel[0]), .out(y1));
    mux32_21 i_second (.a(c), .b(d), .sel(sel[0]), .out(y2));
    mux32_21 i_third (.a(y1), .b(y2), .sel(sel[1]), .out(out));

endmodule