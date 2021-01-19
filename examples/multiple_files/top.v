`timescale 1ns/1ns

module top(
    a,
    b,
    o
    );


input [1:0] a;
input [1:0] b;
output o;

wire [1:0] tmp;

nand_gate gate0(.a(a[0]), .b(b[0]), .o(tmp[0]));
nand_gate gate1(.a(a[1]), .b(b[1]), .o(tmp[1]));

assign o = &tmp;

endmodule
