`timescale 1ns/1ns

module tb_top;

reg [1:0] a;
reg [1:0] b;
wire o;

top dut(
    .a(a),
    .b(b),
    .o(o)
);

initial begin
    
    a = 2'b11;
    b = 2'b11;
    #1;      
    if (o == 1'b0) begin
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

    a = 2'b00;
    b = 2'b01;
    #1;
    if (o == 1'b1) begin 
        $display("Correct output for a=%b, b=%b", a, b); 
    end else begin
        $display("Incorrect output for a=%b, b=%b", a, b);
    end

end


endmodule
