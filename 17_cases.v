//
// Verilog supports a shorthand syntax to express long chains
// of equality tests such as:
//
//  if (var == ...) begin
//     ...
//  end else if (var == ...) begin
//      ...
//  end else if (var == ...) begin
//      ...
//  end else begin
//      ...
//  end
//
// 
// This can indeed be expressed more simply using a `case` construct.
//
// case(var)
//      value1: begin
//          // This is executed if var == value1.
//      end 
//      value2: begin
//          // This is executed if var == value1.
//      end 
//      ...
//      default: begin
//          // This is executed if var doesn't match any previous value.
//      end 
// endcase
// 
// 
//
//
// The two following modules are equivalent. 
//

module example_ifs(
    in,
    out
    );

input [2:0] in;
output reg [1:0] out;

always @(*) begin
    if (in == 3'b000) begin
        out = 2'b10;
    end else if (in == 3'b101) begin
        out = 2'b11;
    end else begin
        out = 2'b00;
    end
end

endmodule


module example_cases(
    in,
    out
    );

input [2:0] in;
output reg [1:0] out;

always @(*) begin
    case (in)
        
        3'b000: begin
            out = 2'b10;
        end 

        3'b101: begin
            out = 2'b11;
        end

        default: begin
            out = 2'b00;
        end

    endcase
end

endmodule

