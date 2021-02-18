//
// Non-combinational elements can be described using the `always` construct
// by using the proper sensitivity list and by omitting to set some variables
// in all execution paths.
//
//
// The following is a valid Verilog definition of a latch:
//

module d_latch(
    E,
    D,
    Q
    );

input E;
input D;
output reg Q;

always @(E, D) begin
    if (E) begin
        Q = D;
    end
end 

endmodule

//
// Note that Q is not set in all possible execution paths.
// If E is 0, Q is not modified. 
// 
//
// In contrast to latches, flip-flops are only transparent at clock edges.
// To describe this functionality, extra keywords are required: `posedge` and `negedge`.
// The following is a description of a positive-edge-triggered flip-flop: 
//

module d_ff(
    CLK,
    D,
    Q
    );

input CLK;
input D;
output reg Q;

always @(posedge CLK) begin
    Q = D;
end

endmodule

//
// Note that D is not in the sensitivity list of the `always` construct.
//
//
// Flip-flops sometimes include an asynchronous reset pin. Whenever this
// pin is high, even in the middle of a clock cycle, the output of the 
// flip-flop is reset to 0.
// As the flip-flop is sensitive to the value of the reset pin in addition
// to the clock signal, the reset wire must be included in the sensitivity
// list of the `always` construct.
//
// A flip-flop with an asynchronous reset port can be defined as follows:  
//

module rd_ff(
    CLK,
    R,  // <- reset port
    D,
    Q
    );

input CLK;
input R;
input D;
output reg Q;

always @(posedge CLK or posedge R) begin
    if (R) begin
        Q = 1'b0;   // If R == 1'b1, Q is unconditionally set to 0.
    end else begin
        Q = D;      // If R == 1'b0, the flip-flop behaves normally.
    end
end

endmodule

//
// In the same manner, one can define a flip-flop with an
// asynchronous set pin as follows: 
//

module sd_ff(
    CLK,
    S,  // <- set port
    D,
    Q
    );

input CLK;
input S;
input D;
output reg Q;

always @(posedge CLK or posedge S) begin
    if (S) begin
        Q = 1'b1;   
    end else begin
        Q = D;      
    end
end

endmodule

// 
// It is also possible to describe a flip-flop with both an
// asynchronous set pin and an asynchronnous reset pin.
//

module rsd_ff(
    CLK,
    R,
    S,
    D,
    Q
    );

input CLK;
input R;
input S;
input D;
output reg Q;

always @(posedge CLK or posedge R or posedge S) begin
    if (R) begin
        Q = 1'b0;
    end else if (S) begin
        Q = 1'b1;
    end else begin
        Q = D;
    end
end

endmodule

//
// Naturally, one can also implement wide registers in the
// same manner as a one-bit flip-flop. 
//

module register_8bits(
    CLK,
    D,
    Q
    );

input CLK;
input [7:0] D;
output reg [7:0] Q;

always @(posedge CLK) begin
    Q = D;
end

endmodule



