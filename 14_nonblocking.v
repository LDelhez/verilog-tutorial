//
// The following module implements a 3-cycle delay line.
// Its output is equal to its input delayed by 3 clock cycles.
//
// --a->[reg]--b->[reg]--c->[reg]--d-> 
//

module delay3(
    clk,
    a,
    d
    );

input clk;
input a;
output reg d;

reg b;
reg c;

always @(posedge clk) begin
    d = c;
    c = b;
    b = a;
end

endmodule

//
// Note the order of the assignments in the `always` construct.
// If the order is changed, the behavior of the module changes.
// For instance, the following module actually implements a 1-cycle delay line. 
//

module delay3_incorrect(
    clk,
    a,
    d
    );

input clk;
input a;
output reg d;

reg b;
reg c;

always @(posedge clk) begin
    b = a;
    c = b;
    d = c;
end

endmodule

//
// To allow hardware designers to reason about the interconnection
// of multiple flip-flops without worrying about the ordering of
// statements, Verilog supports a non-blocking assignment operator. 
//
// Block assignement operator: `=`
// Non-blocking assignement operator: `<=` 
//
//
// Non-blocking assignments are applied at the same time at the end
// of the current `always` construct. 
//
// The following two implementations are thus identical. 
// 

module delay3_1(
    clk,
    a,
    d
    );

input clk;
input a;
output reg d;

reg b;
reg c;

always @(posedge clk) begin
    d <= c;
    c <= b;
    b <= a;
end

endmodule


module delay3_2(
    clk,
    a,
    d
    );

input clk;
input a;
output reg d;

reg b;
reg c;

always @(posedge clk) begin
    b <= a;
    c <= b;
    d <= c;
end

endmodule
