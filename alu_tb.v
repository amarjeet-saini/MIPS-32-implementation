`timescale 1 ns / 1 ns
`include "alu.v"

module alu_tb;
    
    // input
    reg [31:0] a,b;
    reg [3:0] AluOp; 
    
    // output
    wire zf;
    wire [31:0] out;
  
    // unit under test
    alu uut(a, b, AluOp, zf, out);


    initial begin
    
        $dumpfile("alu_tb.vcd");
        $dumpvars(0,alu_tb);
        
        //first 4 add 
        //1a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd0;
        #5

        //1b
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd0;
        #5

        //1c
        a = 32'd12;
        b = 32'd12;
        AluOp = 4'd0;
        #5

        //2 sub
        //2a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd2; 
        #5
        //2b
        a = 32'd12;
        b = 32'd1;
        AluOp = 4'd2;
        #5
        //2c
        a = 32'd25;
        b = 32'd12;
        AluOp = 4'd2;             
        #5

        //2 sub
        //2a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd2; 
        #5
        //2b
        a = 32'd12;
        b = 32'd1;
        AluOp = 4'd2;
        #5
        //2c
        a = 32'd25;
        b = 32'd12;
        AluOp = 4'd2;             
        #5

        //3 logical and
        //3a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd4; 
        #5
        //3b
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd4;
        #5
        //3c
        a = 32'd0;
        b = 32'd0;
        AluOp = 4'd4;             
        #5

        //4 logical or
        //4a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd5; 
        #5
        //4b
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd5;
        #5
        //4c
        a = 32'd0;
        b = 32'd0;
        AluOp = 4'd5;             
        #5

        //5 logical xor
        //5a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd6; 
        #5
        //5b
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd6;
        #5
        //5c
        a = 32'd0;
        b = 32'd0;
        AluOp = 4'd6;             
        #5

        //6 logical nor
        //6a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd7; 
        #5
        //6b
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd7;
        #5
        //6c
        a = 32'd0;
        b = 32'd0;
        AluOp = 4'd7;             
        #5

        //7a
        a = 32'd0;
        b = 32'd1;
        AluOp = 4'd10;             
        #5
        //7b
        a = 32'd1;
        b = 32'd0;
        AluOp = 4'd10;             
        #5
        //7c
        a = 32'd1;
        b = 32'd1;
        AluOp = 4'd10;             
        #5
        $display("test completed");
    end
endmodule
