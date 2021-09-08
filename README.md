# MIPS-32 bit-implementation

Simulator & Tools: Icarus Verilog + GTKWave </br>
Installation Guide: http://inf-server.inf.uth.gr/~konstadel/resources/Icarus_Verilog_GTKWave_guide.pdf

## Arithmetic and Logical Unit (ALU) </br>

### Status Flag - Zero FLag (ZF) </br>
ZF = 1 if result = 32'b0 else ZF = 0

### ALU operation support ###

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

*verilog file   :  alu.v* </br>
*testbench file : alu_tb.v*

- [x] ALU 32 bit
- [ ] CU 
- [ ] Memory
- [ ] Pipelinig
