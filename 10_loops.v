// 
// In addition to conditionals, behavioral description also allows the use of 
// looping constructs to define modules.
// 
// Different looping constructs are available. The simplest construct is the
// `while` loop. Its syntax is 
//
//    while (guard) begin
//       body 
//    end
// 
// This loop executes `body` repeatedly until `guard` becomes zero (i.e. false).
// In general, the loop `guard` cannot depend on the value of any wire/reg/input/output.
// 
//
// The following example shows how to use a `while` loop to output the negation of a bus.  
//

module inv_bus(
    in,
    out
    );

input [7:0] in;
output reg [7:0] out;

integer i;

always @(in) begin // <- `in` is the only signal used as input in this `always` contruct 
    i = 0;
    while (i < 8) begin
        out[i] = ~in[i];
        i = i + 1;
    end
end

endmodule

//
// In the above example, the variable `i` does not correspond to actual physical wire of the circuit.
// This variable is only used to keep count of the iterations of the loop.
// For this reason, it is defined as an `integer` and not as a `reg`.
// 
// `integer`s have an implicit width of 32 bits. They support the same operators as a 32-bit bus does.
// When specifying an `integer` constant, its width can be omitted, as it is assumed to be 32.
// This is the reason why the constants 0, 8, and 1 in the above code are not written as
// 32'd0, 32'd8, and 32'd1. 
//
//
// As it is a common pattern, Verilog provides a shorthand for certain `while` loops:
//
//    init            
//    while (guard) begin                     for (init; guard; update) begin
//        body                    <->             body
//        update                              end
//    end
//
// `for` loops are more common than `while` loops.  
//
// The following module is equivalent to the above `inv_bus` module.
//

module inv_bus_for(
    in,
    out
    );

input [7:0] in;
output reg [7:0] out;

integer i;

always @(in) begin
    for (i = 0; i < 8; i = i + 1) begin
        out[i] = ~in[i];
    end
end

endmodule

//
// The following two modules are equivalent.
// They both output 1 when all the bits of their input bus are 1.
//

module and_reduce_1(
    in,
    all_ones
    );

input [9:0] in;
output reg all_ones;

integer i;

always @(in) begin
    all_ones = 1'b1;
    for (i = 0; i < 10; i = i + 1) begin
       all_ones = all_ones & in[i]; 
    end
end

endmodule

//

module and_reduce_2(
    in,
    all_ones
    );

input [9:0] in;
output reg [9:0] all_ones;

integer i;

always @(in) begin
    all_ones = 1'b1;
    for (i = 0; i < 10; i = i + 1) begin
        if (~in[i]) begin
            all_ones = 1'b0;            
        end
    end
end

endmodule

//
// Though `integer` variables do not themselves correspond to physical wires, 
// they can be used to generate constant wires inside of the loop.
//
// The following module checks whether its input bus is 8'b1010_1010.  
//

module test10(
    in,
    out
    );

input [7:0] in;
output reg out;

integer i; // <- `i` is an `integer`; there is no single physical bus that carries the value of `i`  

always @(in) begin
    out = 1'b1;
    for (i = 0; i < 8; i = i + 1) begin
        if (in[i] != i[0]) begin 
            out = 1'b0;
        end
    end
end

endmodule

//
// The following module outputs (in ^ 8'b11_10_01_00).
//

module zero_to_three(
    in,
    out
    );

input [7:0] in;
output reg [7:0] out;

integer i;

always @(in) begin
    for (i = 0; i < 8; i = i + 2) begin
        out[i] = in[i] ^ i[0];
        out[i + 1] = in[i + 1] ^ i[1];
    end
end

endmodule
