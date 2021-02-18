`timescale 1ns/1ns

//
// When running a simulation, it is often useful to visualize
// the waveform of the various signals.
//
// This can be done by dumping the corresponding variables into 
// a .vcd file.
//
//
// The following testbench generates these waveforms:
//
// time: 0   2   4   6   8   10  12  14
//       |   |   |   |   |   |   |   |  
//           ____    ____    ____    ____
//  clk: ____    ____    ____    ____    ____
//
//       ______
//  rst:       ______________________________
//
//                 ____          ____________
//  d:   __________    __________
//
//
// The testbench dumps all its variable into the file "test.vcd".
//
//
// Waveforms can then be visualized with the command: gtkwave test.vcd
//


module tb_delays;

reg clk;
reg rst;
reg d;

initial begin
    $dumpfile("test.vcd");
    $dumpvars;
end

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

    $finish();
    
end

always #2 clk = ~clk; // <- Every 2 units of time, clk is inverted.


endmodule