//
// To help organize big designs, modules can include (i.e. instantiate) other modules.   
//
// The syntax is:
//
//   instantiated_module_name instance_name(
//     .name_of_input1_in_instantiated(name_of_driver1_in_current),
//     .name_of_input2_in_instantiated(name_of_driver2_in_current),
//          ...
//     .name_of_output1_in_instantiated(name_of_driven1_in_current),
//     .name_of_output2_in_instantiated(name_of_driven2_in_current),
//          ...
//   );
//
//
//
// The following shows how a NAND module could be created using a AND module and a NOT module. 
//

module not_gate(
    in,
    out
    );

input in;
output out;

assign out = ~in;

endmodule


module and_gate(
    in1,
    in2,
    out
    );

input in1;
input in2;
output out;

assign out = in1 & in2;

endmodule


module nand_gate(
    in1,
    in2,
    out
    );

input in1;
input in2;
output out;

wire tmp; // define a `tmp` wire for the output of the `and_gate` module

and_gate my_and_gate(
    .in1(in1),          // <- `in1` of `nand_gate` is fed as input to an `and_gate` module
    .in2(in2),          // <- `in2` of `nand_gate` is fed as input to an `and_gate` module
    .out(tmp)           // <- the output of `nand_gate` drives the local wire `tmp` 
);

not_gate my_not_gate(
    .in(tmp),           // <- `tmp` is fed as input to an `not_gate` module
    .out(out)           // <- the output of the module drives the local output `out`
);

endmodule


//
// The following shows how a module that tests the equality between three 2-bit buses can be constructed
// by instantiating twice another module that tests the equality of three bits.
//

module three_equal(
    a,
    b,
    c,
    equal
    );

input a;
input b;
input c;
output equal;

assign equal = (a == b) & (b == c); 

endmodule


module three_buses_equal(
    in1,
    in2,
    in3,
    out
    );

input [1:0] in1;
input [1:0] in2;
input [1:0] in3;
output out;

wire [1:0] same;

three_equal three_equal0(
    .a(in1[0]),
    .b(in2[0]),
    .c(in3[0]),
    .equal(same[0])
);

three_equal three_equal1(
    .a(in1[1]),
    .b(in2[1]),
    .c(in3[1]),
    .equal(same[1])
);

assign out = same[0] & same[1];

endmodule
