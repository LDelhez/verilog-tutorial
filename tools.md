# Utilization of the Verilog tools

## Local tools

### iverilog

Iverilog is used to simulate testbenches.  

While inside the folder where all testbenches and modules are located, run the following commands
```
iverilog -y. testbench_filename.v
vvp a.out
```

### yosys

Yosys is used to synthesize modules.  

In the folder where the modules are located create a `run.ys` file with the following content:
```
read_verilog file1.v file2.v file3.v
synth
abc
clean
stat
```

All the files containing the top modules and the submodules must be listed after the `read_verilog` command. 
Testbenches must not be listed.  

To synthesize, run the following command:
```
yosys run.ys
```

For combinational circuits, check that no latch and no flip-flop has been generated under the last section 
titled *Printing statistics*. For synchronous sequential circuit, only check that no latch has been generated.
Latch cell names include the keyword `LATCH`. Flip-flop cell names include the keyword `FF`.


## Online edaplayground.com platform

### Simulation

If the testbench file is not the default `testbench.sv` file, replace the content of `testbench.sv` by
```
`include "file_to_use_as_testbench.v"
``` 

On the left pannel, under *Tools & Simulators*, select *Icarus Verilog* (any version). 
As compile options, write `-y.`.  

Simulations can then be started by click the *Run* button. 
Outputs are printed in the *Log* tab at the bottom of the window.  

### Synthesis

On the left pannel, under *Tools & Simulators*, select *Yosys* (any version). 
Check the `use run.ys file instead` option, and the `downloading files after run`.  

Create a `run.ys` file with the following content:
```
read_verilog file1.v file2.v file3.v
synth
abc
clean
tee -o stat.txt stat
```

All the files containing the top modules and the submodules must be listed after the `read_verilog` command. 
Testbenches must not be listed.  

To synthesize, click the *Run* button. If browser pop-ups are enabled, outputs files will be automatically downloaded.  

For combinational circuits, check that no latch and no flip-flop has been generated in the downloaded `stat.txt` file.
For synchronous sequential circuit, only check that no latch has been generated.
Latch cell names include the keyword `LATCH`. Flip-flop cell names include the keyword `FF`.




