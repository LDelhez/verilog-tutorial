
# Tools

For Linux and Windows users, both the simulation and synthesis tools can be easily installed locally.
Installing tools locally is the recommended way to use Verilog as it is the most flexible, it does not 
rely on a stable Internet connect, and it allows full control of the storage of the source files. 
As these are command line tools, some experience with the command line is necessary.  

For Mac users, and for Windows or Linux users preferring not to install the tools locally, 
Verilog design can be developed online at [https://www.edaplayground.com](https://www.edaplayground.com).
An account is needed to save source files on the platform. To prevent unexpected lost of your work, 
it is recommended to occasionally download the source files to your computer. 

## Fedora / CentOS

Run the following command:
```
sudo dnf install iverilog yosys
```

## Ubuntu / Debian

Run the following command:
```
sudo apt-get install iverilog yosys
```

## Windows

1. Download the iverilog installer: [https://bleyer.org/icarus/iverilog-v11-20201123-x64_setup.exe](https://bleyer.org/icarus/iverilog-v11-20201123-x64_setup.exe).
2. Run the installer:
    - When asked, check the option to *add the iverilog executable to the PATH*.
    - Keep all other options to their default choice.
3. Download the yosys program: [http://www.clifford.at/yosys/nogit/win32/yosys-win32-mxebin-0.9.zip](http://www.clifford.at/yosys/nogit/win32/yosys-win32-mxebin-0.9.zip).
4. Extract the content of the yosys zip archive and copy all the extracted files to the iverilog install folder (i.e. `C:\iverilog\bin` if default location has been used).
5. Open a command line and check that the following commands can run: `iverilog`, `vvp`, `yosys`.








