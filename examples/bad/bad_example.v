`timescale 1ns/1ns

//
// Expected truth table:
// 
//   a b | out
//   0 0 |  1
//   0 1 |  0
//   1 0 |  0
//   1 1 |  x       <- don't care
//

module bad_example(
    a,
    b,
    out
    );

input a;
input b;
output reg out;

always @(a, b) begin
    if ({a, b} == 2'b00) begin
        out = 1'b1;
    end else if ({a, b} == 2'b01) begin
        out = 1'b0;
    end else if ({a, b} == 2'b10) begin
        out = 1'b0;
    end
end

endmodule


