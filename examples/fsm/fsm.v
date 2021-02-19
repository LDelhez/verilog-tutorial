`timescale 1ns/1ns

module fsm(
    clk,
    rst,
    in,
    out
    );

input clk;
input rst;
input in;

output out;

reg [1:0] state, next_state;

localparam STATE_S = 2'b00;
localparam STATE_S1 = 2'b01;
localparam STATE_S10 = 2'b10;
localparam STATE_S101 = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state = STATE_S;
    end else begin
        state = next_state;
    end
end

always @(*) begin
    next_state = state;
    out = 1'b0;

    case(state)

        STATE_S: begin
            if (in) begin
                next_state = STATE_S1;
            end
        end

        STATE_S1: begin
            if (~in) begin
                next_state = STATE_S10;
            end
        end

        STATE_S10: begin
            if (in) begin
                next_state = STATE_S101;
                out = 1'b1;
            end else begin
                next_state = STATE_S;
            end
        end

        STATE_S101: begin
            if (in) begin
                next_state = STATE_S1;
            end else begin
                next_state = STATE_S10;
            end
        end

    endcase
end


endmodule
