//
// To generate simple logic gates, various operators are defined in Verilog.
//
//   `a & b` computes the AND function of `a` and `b`   
//   `a | b` computes the OR function of `a` and `b`
//   `~a` is the negation of `a`
//   `a ^ b` is the XOR function of `a` and `b`
//   `a == b` is 1 iff `a` and `b` are identical
//   `a != b` is 1 iff `a` and `b` are different
// 
// Parentheses can be used to express complex expressions.
//
// Examples:
//

module and_gate( // This module implements a 2-input AND gate
    a,
    b,
    c
    );

input a;
input b;
output c;

assign c = a & b;  // `c` is driven by `a & b` 

endmodule


module and3_gate( // This module implements a 3-input AND gate
    in1,
    in2,
    in3,
    out
    );

input in1;
input in2;
input in3;
output out;

assign out = in1 & in2 & in3;

endmodule


module nand_gate( // This module implements a 2-input NAND gate
    a,
    b,
    c
    );

input a;
input b;
output c;

assign c = ~(a & b);

endmodule


module two_of_three( // The output of this module is 1 iff 2 of its inputs are equal to 1. 
    a,
    b,
    c,
    out
    );

input a;
input b;
input c;
output out;

assign out = (a & (b ^ c)) | (~a & b & c); 

endmodule


module and_or( // Modules can have more than one output.
    a,
    b,
    odd, // high iff `a` is different than `b`
    even // high iff `a` is equal to `b`
    );

input a;
input b;
output odd;
output even;

assign odd = a ^ b;
assign even = a == b;

endmodule


