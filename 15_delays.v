`timescale 1ns/1ns

// 
//  ^
// The above line specifies the unit of the delays written in the 
// current file, and the precision of the delays that can be defined.
// 
// Here, `timescale 1ns/1ns indicates that delays are expressed as
// nanoseconds. The smallest delay that can be defined is 1ns.
//
// Here:
//   #1 is 1ns
//   #17 is 17ns
//   #1.1 is equivalent to #1 
//
//
//
// Delays are used in testbenches to shape the wanted sequence of inputs, 
// to generate the clock signal, as well as reset signals.
// 
// The following testbench generates these waveforms:
//
// time: 0   2   4   6   8   10  12  14
//       |   |   |   |   |   |   |   |  
//           ____    ____    ____    ____
//  clk: ____    ____    ____    ____    
//
//       ______
//  rst:       __________________________
//
//                 ____          ________
//  d:   __________    __________
//
//


module tb_delays;

reg clk;
reg rst;
reg d;

initial begin // <- Initial construct are evaluated at t = 0.

    // Here, t = 0.

    clk = 1'b0; 
    rst = 1'b1;
    d = 1'b0;

    #3;
    // Here, t = 3;

    rst = 1'b0;

    #2;
    // Here, t = 5.

    d = 1'b1;

    #2;
    // Here, t = 7.

    d = 1'b0;

    #5;
    // Here, t = 12.

    d = 1'b1;
    
    #4;

    $finish(); // <- finishes the simulation

end

always #2 clk = ~clk; // <- Every 2 units of time, clk is inverted.


endmodule

//
// A testbench finishes its execution when no signal is modified anymore.
// Because of the line `always #2 clk = ~clk;` the `clk` signal is here
// modified forever. 
// To stop the simulation despite this, a `$finish` command is needed.
//
//
//
// In addition to fixed delays, it is possible to pause the execution until
// a specific event is detected.
//
// This is done using the syntax:
//
//      @(trigger);
//
// 
// For example, the following module generates these waveforms:
//
// time: 0   2   4   6   8   10  12  14
//       |   |   |   |   |   |   |   |  
//           ____    ____    ____    ____
//  clk: ____    ____    ____    ____    ____
//
//       ______
//  rst:       ______________________________
//
//                   ____    
//  d:   ____________    ____________________
//


module tb_wait;

reg clk;
reg rst;
reg d;

initial begin

    // Here, t = 0.

    clk = 1'b0; 
    rst = 1'b1;
    d = 1'b0;

    #3;
    // Here, t = 3;

    rst = 1'b0;

    @(posedge clk);
    // Here, t = 6.

    d = 1'b1;

    @(negedge clk);
    // Here, t = 8.

    d = 1'b0;    

    #10;

    $finish(); 
    
end

always #2 clk = ~clk;


endmodule

