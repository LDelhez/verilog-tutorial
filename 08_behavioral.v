//
// In addition to the `assign` keyword, Verilog also allows to describe circuits
// by describing their behavior, rather than their structure.
//
// This is done using the `always` construct.
// The syntax is 
//
//      always @(sensitivity_list) begin
//          body
//      end
//
// The presence of such a construct in a module definition indicates that the behavior of 
// the module is as if `body` is executed each time that any signal of the `sensitivity_list`
// is modified.
//
// Any wire, input, or output assigned in an `always` construct *must* be defined as `reg`. 
// For inputs and outputs, this is done by adding the keyword `reg` in the signal definition.
// For intermediate wires, this is done by replacing the keyword `wire` by `reg`.
//
//
// The following module implements an AND gate.
//

module and_behavior(
    a,
    b,
    c
    );

input a;
input b;
output reg c;           // <- `c` is defined as `reg` because it is driven inside of a `always` construct

always @(a, b) begin    // <- this `always` construct is sensitive to changes of `a` and `b`
    c = a & b;          // <- when `a` or `b` changes, `c` is updated accordingly; `c` implicitly keeps its value when `a` and `b` stay constant 
end

endmodule

// 
// The following module implements a NAND gate.
//

module nand_behavior(
    a,
    b,
    c
    );

input a;
input b;
output c;               // <- `c` is not a `reg` here because it is not driven inside an `always` construct 

reg tmp;                // <- `tmp` must be defined as `reg` because it is driven inside an `always` construct

always @(a, b) begin
    tmp = a & b;
end

assign c = ~tmp;

endmodule

//
// Because of their simplicity, the above two examples do not illustrate the difference in semantics
// between behavioral and structural (i.e. without `always` constructs) definitions.
// 
// The following example demonstrates that `always` constructs do not describe the *structure* of the
// circuit, but rather the *behavior* of the circuit.    
// 

module nand_behavior_1(
    a,
    b,
    c
    );

input a;
input b;
output c;

reg tmp;

always @(a, b) begin
    tmp = a & b;         
    tmp = ~tmp;         // <- `tmp` IS UPDATED! 
end

assign c = tmp;

endmodule

// 
// As indicated, `tmp` is updated inside the `always` construct.
// The `=` in `tmp = ~tmp` does not correspond to a *connection* between two physical wires
// whereas the `=` in `assign c = tmp` does. 
// 
// Indeed, the concept of ~updating~ a connection between two wires is nonsensical.
//
// In this example, the semantic of the always block is:
//  """
//   Whenever `a` or `b` changes, the value of `tmp` should be set to `a & b`, 
//   the value of `tmp` should then IMMEDIATLY be set to `~tmp`. 
//  """
//
// This behavior is *identical* to the behavior of a NAND gate. 
// 

