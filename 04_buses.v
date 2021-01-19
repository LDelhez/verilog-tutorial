//
// Often, circuits involve groups of wires that are semantically related.    
//
// For this reason, Verilog allows to define *buses* of wires that share a same name. 
// Such a bus can be created by adding `[N:0]` before the bus name when it is defined,
// where N is equal to one less than the width of the bus. 
//
// Inputs, outputs, and itermediate wires can all be defined as buses.  
//
//
// The following module has a 4-bit input bus as input, and a 7-bit output bus as output.  
//

module example_bus(
    a,
    b
    );

input [3:0] a;  // <- `a` is 4-bit bus
output [6:0] b; // <- `b` is 7-bit bus

endmodule


//
// The `assign` keyword can be used to connect an entire bus the another bus *of the same width*.
//
// The following module is thus a 3-bit buffer.
//

module buffer3(
    in,
    out
    );

input [2:0] in;
output [2:0] out;

assign out = in; // <- this line performs 3 connections

endmodule

// 
// Individual bits of a bus can be accessed and assigned using square brackets.  
// The index of the rightmost bit of a bus is 0.
//
// For instance, the following module is functionally equivalent to the previous `buffer3` module. 
//

module buffer3_brackets(
    in,
    out
    );

input [2:0] in;
output [2:0] out;

assign out[0] = in[0]; // <- this line performs 1 connection
assign out[1] = in[1]; // <- this line performs 1 connection
assign out[2] = in[2]; // <- this line performs 1 connection

endmodule

//
// The following modules checks if its two input buses are identical. 
//

module same_buses(
    in1,
    in2,
    all_equal
    );

input [3:0] in1;
input [3:0] in2;
output all_equal;

wire [3:0] equal;

assign equal[0] = in1[0] == in2[0];
assign equal[1] = in1[1] == in2[1];
assign equal[2] = in1[2] == in2[2];
assign equal[3] = in1[3] == in2[3];


assign all_equal = equal[0] & equal[1] & equal[2] & equal[3]; 


endmodule

