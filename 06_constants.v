//
// Literal constants can be used in expressions.
// The width of the constant should always be specified when defined.  
//
// The syntax is:
//
//      xxx'yzzz 
//      
// where 
//   xxx is an integers that indicates the width (i.e. number of bits) of the constant
//   y is `b` for binary, `h` for hexadecimal, or `d` for decimal
//   zzz is the actual constant
//
//
// Example: 
//

module constants;


wire [2:0] a; 
wire [3:0] b;
wire [4:0] c;

assign a = 3'b000;  // The three bits of `a` are set to 0. 
assign b = 4'hc;    // `b` is set to 12, thus `b == 4'b1100`
assign c = 5'd13;   // `c` is set to 13, thus `c == 5'b01101`


wire d;
wire [4:0] e;

assign d = |(b & 4'b0011);  // `d` is here equal to 0 
assign e = {(5){1'b1}} ^ c; // `e` is here equal to 5'b10010


endmodule


// 
// For more readability, underscores can be used to separate groups of bits in constants.
// 

module constants_underscore;

wire [7:0] a;
wire [7:0] b;
wire same;

assign a = 8'b00010111;
assign b = 8'b0001_0111;

assign same = a == b; // `same` is here equal to 1

endmodule
