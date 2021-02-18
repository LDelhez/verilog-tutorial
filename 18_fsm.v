
//
//  
// Example of a typical FSM implementation:
//
//

module fsm(
    clk,
    rst,
    in1,
    in2,
    out1,
    out2
);

input clk;
input rst;
input in1, in2;
output reg out1, out2;

reg [1:0] state, next_state; // Register that holds the current state.

// State encodings
localparam STATE_S0 = 2'd0;
localparam STATE_S1 = 2'd1;
localparam STATE_S2 = 2'd2;


// Combinational part of the FSM
always @(*) begin
    // Default values (to avoid latches)
    next_state = state;

    out1 = 1'b0; 
    out2 = 2'b0;

    case(state)
    
        // For each possible state, set the proper value 
        // of the `next_state` signal as well as the outputs.

        STATE_S0: begin
            if (in1) begin
                next_state = STATE_S1;
            end
            out1 = 1'b1;
        end

        STATE_S1: begin
            out2 = 1'b1;
            next_state = STATE_S2;
        end

        STATE_S2: begin
            if (in1 & in2) begin
                next_state = STATE_S1;
            end else if (~in1) begin
                next_state = STATE_S0;
            end
            out1 = 1'b1;
        end
    
    endcase
end




// Non-combinational part of the FSM
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state = STATE_S1; // Initial state
    end else begin
        state = next_state;
    end
end



endmodule
