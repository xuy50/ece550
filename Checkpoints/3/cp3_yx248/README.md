# Project Checkpoint 3

 - Author: Yang Xu
 - netID: yx248
 - Data: 10/06/2022
 - Instructor: Rabih Younes, Hai Li
 - Course: ECE550 D

## Project Description:

&emsp;&emsp;This is checkpoint 3 for the project which is to build a processor.<br>

&emsp;&emsp;For this checkpoint I need to implement 32 Registers with 32 bits number.<br>
<br>

## Design Description

**Module regfile**<br>
&emsp;&emsp;This is the main module to connect all modules to implement the 32 registers read and write. First, I use the `moulde bitCheck` to get the target register I need to write the input number in by the input `ctrl_writeEnable` and `ctrl_writeReg` to do the decode operation, after that get the 32 bits decode result `decd` which only have one bit or zero bit is 1. Then, use a generate for loop to check which one register need to be rewriten into. After write part, I implenment the read part, I also use the `bitCheck` with the `ctrl_readRegA` and 'ctrl_readRegB' to get the read recoded result `decda` for `read A` and `decdb` for `read B`. Then use a generate for loop to check which registers need to be read out for A and B with a tristate buffers by a mux, if the mux checked that the decode result bit is `1` it will read the register that corresponds to this bit, else it will get high z.<br>

**Module dffe**<br>
&emsp;&emsp;The `module dffe` implement a 32 bits D Flip-Flop as a register for saving a 32 bit number.<br>

**Module bitCheck**<br>
&emsp;&emsp;The `module bitCheck` implement a decode operation for the 5 bits input 'ctrl' for read and write, and use a lift shift to get a 32 bits decode result and give back.<br>

<br>




