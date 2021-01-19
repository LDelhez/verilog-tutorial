`timescale 1ns/1ns

module nand_gate(
    a,
    b,
    o
    );

input a;
input b;
output o;

assign o = ~(a & b);

endmodule
