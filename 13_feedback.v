//
// It is possible to describe circuit loops in Verilog. This can be done
// by having the same variable name on both sides of an `=` operator,
// in an `always` statement.
// 
// In the following module, the output of a flip-flop is connected to 
// its input through an inverter. The output of the circuit thus
// alternates between 1 and 0.  
//

module oscillator(
    clk,
    reset,
    out
    );

input clk;
input reset;
output reg out;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out = 1'b0;
    end else begin
        out = ~out; // Loop
    end
end

endmodule

//
// After being reset, the output of the following module stays
// low until the input become high. The output then stays high. 
//

module detect_1(
    clk,
    reset,
    in,
    out
    );

input clk;
input reset;
input in;
output reg out;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out = 1'b0;
    end else begin
        out = out | in;
    end
end

endmodule

// 
// Though the above two modules are perfectly functional, it is
// good practice to seperate combinational logic from non-combinational
// logic. In other words, it is recommended to avoid implementing 
// flip-flops and regular logic gates in the same `always` construct.
//
// A better manner to implement the above two modules is thus given here:
//

module oscillator_better(
    clk,
    reset,
    out
    );

input clk;
input reset;
output reg out;

wire out_next;

assign out_next = ~out; // Combinational logic

always @(posedge clk or posedge reset) begin // Only a flip-flop
    if (reset) begin
        out = 1'b0;
    end else begin
        out = out_next;
    end
end

endmodule


module detect_1_better(
    clk,
    reset,
    in,
    out
    );

input clk;
input reset;
input in;
output reg out;

wire out_next;

assign out_next = out | in;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out = 1'b0;
    end else begin
        out = out_next;
    end
end

endmodule
