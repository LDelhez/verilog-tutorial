//
// In Verilog, a circuit is described by a `module`. 
//  
// The simplest (useless) module is one without any inputs and ouputs:
// 

module empty;   // <- start of the module; `empty` is here the name of the defined module 

// body of the module

endmodule       // <- end of the module

//
// The ports (i.e. inputs and outputs) of a module are listed after its name, between parantheses.
// In addition, the direction (i.e. `input` or `output`) of the port must be specified in the module body.
//

module example1(    // <- start of module; `example1 is the name of the defined module 
    a,              // <- `a` is a port 
    b               // <- `b` is also port
    );              // <- don't forget the `;`

input a;            // <- `a` is an input port that will be driven by an external module
output b;           // <- `b` is an output port that will be driven by the current module 

endmodule

// 
// In the `example1` module, the output port `b` is not driven; it isn't connected to any other wire. 
// In general, all output ports of all modules should always be driven. 
//
// In Verilog, one can connect two wires with the keyword `assign`.
// The following module implements a buffer (i.e. a circuit that copies its input to its output).  
//

module buffer(
    in,
    out
    );

input in;
output out;

assign out = in; // `in` drives `out`

endmodule

// 
// Note that it would have been illegal to write `assign in = out` instead of `assign out = in`. 
// Indeed, `in` is an input wire and is therefore assumed to be driven by an external module.
// Since it is illegal for a signal to have more than one driver, `assign in = out` is illegal here.  
//

