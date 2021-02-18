//
// In a structural definition, conditional execution cannot be employed
// to describe logic. Indeed, because circuits are fixed, their structures
// *cannot* depend on the values that they manipulate.
//
// However, conditional execution can be used in behavioral definitions.
// The behavior of a circuit can indeed depend on the value of its inputs.
//
// The syntax for conditional execution is the following:
//
//    if (condition) begin
//        `body1`    
//    end else begin
//        `body2`
//    end 
//
// This construct indicates that `body1` should be executed if `condition` is currently nonzero,
// and `body2` should be executed if `condition` is zero. 
//
// The else clause can optionally be omitted:
// 
//    if (condition) begin
//        `body1`
//    end 
//
// 
//
// The following two modules both implement the function "if a is 0, copy x to the output, otherwise copy y."
// The two modules have exactly the same behavior, despite their different implementation styles.
//

module mux_struct(
    a,
    x,
    y,
    o
    );

input a;
input x;
input y;
output o;

assign o = (~a & x) | (a & y);

endmodule


module mux_beh(
    a,
    x,
    y,
    o
    );

input a;
input x;
input y;
output reg o;

always @(a, x, y) begin 
    if (a) begin
        o = y;
    end else begin
        o = x;
    end
end

endmodule

//
// Notice the sensitivity list in the above module. 
// In combinational designs, the sensitivity list will *always* contain *all* the variables that 
// are used as inputs (i.e. the ones that are not assigned any value) inside of the `always` body.
// The sensitivity list impacts the behavior that is described by the `always` construct. Improperly setting
// the sensitivity list therefore generally causes unwanted and erreneous logic to be deduced.      
//
//
// To generate combinational logic, the following *must* also be true:
// 
//  "ALL VARIABLES SET WITHIN AN ALWAYS BLOCK MUST BE SET IN ALL POSSIBLE EXECUTION PATHS"  
//
// In the above example, this property is satisfied because `o` is set to some value no matter what 
// the actual values of `a`, `x`, and `y` are. 
// 
//
// The following example does not satisfy the property and thus corresponds to a non-combinational circuit!
// 

module bad_example(
    a,
    b,
    c
    );

input a;
input b;
output reg c;

always @(a, b) begin
    if (a & b) begin
        c = 1'b1;       // `c` is only set if `(a & b)` is 1.
    end
end

endmodule

//
// The following examples are all valid implementations of a 2-input OR gate.
//

module or_1(
    a,
    b,
    c
    );

input a;
input b;
output c;

assign c = a | b;

endmodule

//

module or_2(
    a,
    b,
    c
    );

input a;
input b;
output reg c;

always @(a, b) begin
    if (a) begin
        c = 1'b1;
    end else begin
        if (b) begin
            c = 1'b1;
        end else begin
            c = 1'b0;
        end
    end
end

endmodule

//

module or_3(
    a,
    b,
    c
    );

input a;
input b;
output reg c;

always @(a, b) begin
    if (a) begin
        c = 1'b1;
    end else begin
        c = b;
    end
end

endmodule

//

module or_4(
    a,
    b,
    c
    );

input a;
input b;
output reg c;

always @(a, b) begin
    if ({a, b} == 2'b00) begin
        c = 1'b0;
    end else begin
        c = 1'b1;
    end
end

endmodule

//

module or_5(
    a,
    b,
    c
    );

input a;
input b;
output reg c;

always @(a, b) begin
    c = 1'b0;
    if (a) begin
        c = 1'b1;
    end
    if (b) begin
        c = 1'b1;
    end
end

endmodule

