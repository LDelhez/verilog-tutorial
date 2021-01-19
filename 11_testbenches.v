`timescale 1ns/1ns

//
// When desiging circuits, it is important to test whether the defined modules
// behave as wanted. This is done using a special type of module known as 
// a testbench.
//
// A testbench is a module that does not describe a valid circuit.
// Instead, *a testbench is a computer program* that sends inputs 
// the circuit under test, and reads its outputs.
//
// When working with testbenches and simulations, *all* Verilog files must start 
// with a specification of the timescale as shown on top of this file. 
// 
// 
// The following testbench tests whether the `and_gate` module is correct
// by testing all possible combinations of inputs.
//

module and_gate(
    a,
    b,
    c
    );

input a;
input b;
output c;

assign c = a & b;

endmodule

module tb_and_gate;

reg a; // <- `a` and `b` must be defined as `reg` because they are assigned in an `inital` construct
reg b;
wire c;

and_gate device_under_test(
    .a(a),
    .b(b),
    .c(c)
);

initial begin
    
    a = 1'b0;
    b = 1'b0;
    #1;       // <- wait for 1ns
    if (c == 1'b0) begin // <- check output of the `and_gate` module
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

    a = 1'b1;
    b = 1'b0;
    #1;       
    if (c == 1'b0) begin 
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

    a = 1'b0;
    b = 1'b1;
    #1;      
    if (c == 1'b0) begin 
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

    a = 1'b1;
    b = 1'b1;
    #1;       
    if (c == 1'b1) begin 
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

end

endmodule

//
// In order to wait for the propagation of the input signals in the tested circuit,
// the `#1` statement is used before reading the ouputs signals.
//
//
// The `$display` command is used to display text on screen during simulation.
// 
// When executed, because the `and_gate` module is correct, the previous testbench
// thus prints on screen the following:
//
//      Correct output for a=0, b=0
//      Correct output for a=1, b=0
//      Correct output for a=0, b=1
//      Correct output for a=1, b=1
// 
// The syntax of `$display` is:
//
//      $display(template_string, variable1, variable2, ...);
//
// where `template_string` is the quoted text to print, optionally including special markers 
// that will be replaced by the current value of the corresponding variable specified after
// the `template_string`.   
// 
// Useful markers include:
//   %b    ->     prints the value of the variable in binary
//   %x    ->     prints the value of the variable in hexadecimal
//   %d    ->     prints the value of the variable in decimal
// 
// The number of markers in `template_string` *must* match the number of specified variables. 
// `$display("Values: %x %b", a, b, c)` is thus illegal, whereas
// `$display("Values: %x %b %b", a, b, c)` is valid. 
//
//
//
// 
// The following module checks whether its input contains only one 1.
// The given testbench tests all possible inputs to verify the functionality of this module.
//

module only_one(
    in,
    out
    );

input [3:0] in;
output reg out;

integer i;

always @(in) begin
    out = 1'b0;
    for (i = 1; i < 16; i = i * 2) begin
        if (in == i[3:0]) begin
            out = 1'b1;
        end
    end
end

endmodule


module tb_only_one;

reg [3:0] dut_in;
wire dut_out;

only_one dut(
    .in(dut_in),
    .out(dut_out)
);

integer i;
integer j;
integer count;

reg expected;

initial begin
    for (i = 0; i < 16; i = i + 1) begin // <- try all possible inputs
        dut_in = i[3:0];
        
        #1; // <- wait for propagation through the tested module
        
        count = 0;
        for (j = 0; j < 4; j = j + 1) begin
            if (i[j]) begin
                count = count + 1;  
            end
        end

        expected = (count == 1); 

        if (dut_out != expected) begin
            $display("Wrong output for in=%b; expected %b, got %b", dut_in, expected, dut_out);
        end
    end
end

endmodule
