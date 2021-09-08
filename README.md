# MIPS-32-implementation

Arithmetic and Logical Unit (ALU) </br>

ALU operation support

AluOp(3:0) | Mnemonic  |  Result =   |  Description   |
-----------|-----------|-------------|----------------|
0000       |   add     |   A + B     |   Addition     |
0010       |   sub     |   A - B     |  Subtraction   |
0100       |   and     |  A and B    |  Logical and   |
0101       |    or     |  A or B     |  Logical or    |
0110       |   xor     |  A xor B    |  Exclusive or  |
0111       |   nor     |  A nor B    |  Logical nor   |
1010       |   slt     | (A - B)[31] |  Set less than |
Others     |   n.a.    | Don’t care  |                |

verilog file   :  alu.v
testbench file : alu_tb.v

Done:
ALU 32 bit

To do:
CU 
Memory
Pipelinig
