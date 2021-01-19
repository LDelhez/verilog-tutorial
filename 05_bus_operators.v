//
// To facilate the manipulation of buses, different operators can be used with buses.
//
// If `a` and `b` are two buses:
//
//   `a & b` applies a AND function for each bit position of the bus 
//   `a | b` applies a OR function for each bit position of the bus
//   `a ^ b` applies a XOR function for each bit position of the bus
//   `~a` inverts all the bits of the bus
//
//   `a == b` outputs 1 iff the buses `a` and `b` are identical
//   `a != b` outputs 1 iff the buses `a` and `b` are different
//   `&a` outputs 1 iff all bits of `a` are 1
//   `|a` outputs 1 iff any bit of `a` is 1
//
//   `{a, b}` is the concatenation of `a` and `b`
//   `{(n){a}}` where n is an integer is the bus obtained by repeating `a` n times
//   `a[i]` where i is an integer is the ith element of `a`
//   `a[i:j]` where i and j are integers is the sub-bus of `a` from the ith to the jth element included  
//
//
//
//
// Note that a single wire is *the same* as a 1-bit bus. 
// Single wires can thus be manipulated in the same way as buses, using the above operators. 
//

//
// Module that checks if an input 6-bit bus consists of a repeated 2-bit pattern. 
//

module repeated(
    in,
    out
    );

input [5:0] in;
output out;

wire first_eq_second;
wire second_eq_third;

assign first_eq_second = in[1:0] == in[3:2];
assign second_eq_third = in[3:2] == in[5:4];

assign out = first_eq_second & second_eq_third;

endmodule

//
// Generally, there are many ways to implement the same logic in Verilog.
// The following module is functionally equivalent to the previous `repeated` module.  
//

module repeated_1(
    in,
    out
    );

input [5:0] in;
output out;

wire [5:0] expected;

assign expected = {(3){in[1:0]}};
assign out = expected == in;

endmodule

//
// The following module checks whether all bits of its two input 7-bit buses are 1.
//

module all_ones(
    a,
    b,
    out
    );

input [7:0] a;
input [7:0] b;
output out;

assign out = &{a, b};

endmodule

