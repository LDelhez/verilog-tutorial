//
// In addition to input and output wires, one can define intermediate signals with the keyword `wire`.  
//
// Example of a NAND gate:
//

module nand_with_wire(
    a,
    b,
    c
    );

input a;
input b;
output c;

wire tmp;

assign tmp = a & b;
assign c = ~tmp;

endmodule


//
// The following module always outputs 1.
//

module always_one(
    in,
    out
    );

input in;
output out;

wire x;

assign x = in & in & in;
assign out = x | ~x;

endmodule

