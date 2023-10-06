# Project Checkpoint 1

 - Author: Yang Xu
 - netID: yx248
 - Data: 09/20/2022
 - Instructor: Rabih Younes, Hai Li
 - Course: ECE550 D

## Project Description:

&emsp;&emsp;This is the first checkpoint for the project which is to build a processor.<br>

&emsp;&emsp;For checkpoint 1, I need to design and simulate an Arithmetic Logical Unit(ALU) by Quartus with verilog. I need to implement an adder that supports addition and subtraction which is non-RCA adder for two 32-bits numbers.<br>
<br>

## Design Description

&emsp;&emsp;I use the verilog to design the ALU and simulate it in the Quartus. My AUL implements addition and subtraction for two 32-bits number.<br>

&emsp;&emsp;For the ALU, there are 4 inputs and 4 outputs. Two input 32-bits numbers are `data_operandA` and `data_operandB`, the ALU operation control code is `ctrl_ALUopcode`, which is used to identify and control operations. The input `ctrl_shiftamt` is used to get shift amount for SLL and SRA operations, which only needs to be used in SLL and SRA operations. The output 'data_result' is the result of ALU calculation. The output `isNotEqual` is used to check whether the two numbers are equal to each other. The output `isLessThan` is used to check whether `data_operandA` is strictly less than `data_operandB`. The output `overflow` is used to check whether it overflow in addition or subtraction operation.<br>

&emsp;&emsp;I use the modules to implement my ALU, and use wire to connect them to get the results in the main file.<br>

**Module alu**<br>
&emsp;&emsp;This is the main module to connect all modules to implement the operation functions. For the addition and subtraction operation, I connect the `module addition' and `module subtraction` with two input `data_operandA` & `data_operandB` and let them calculate at the same time, then I use a mux to check what operation need to be seleced, addition or subtraction, and then output the result and the overflow.<br>

**Module hadder**<br>
&emsp;&emsp;The `module hadder` implement a half adder with two 1bit inputs, and the carry_out and the sum of the two input are as outputs. The module is implemented by an `and` gate and an `xor` gate.<br>

**Module fadder**<br>
&emsp;&emsp;The `module fadder` implement a full adder with two 1bit and a carry_in inputs, and the carry_out and the sum of the two input are as outputs. The module is implemented by two `xor` gates, two `and` gates, and one `or` gate.<br>

**Module addition**<br>
&emsp;&emsp;The `module addition` implement the addition with two 32-bits. The two 32-bits numbers, `[31:0]in1` & `[31:0]in2`, are the inputs. I design this module that I use three 16bits RCA adders calculate together and then use the carry_out from first 16bits to choose the next 16bits result, then the result will be gotten, which are a lot of repetition, so I use the `generate for` to implement 31 times full adder. After gotten the result, the overfolw can be gotten by the very left one bit for the sum result `s[31]` and the the same position bit for `in1[31]` & `in2[31]`. I use the kmap get the the fomula for the overflow, which is `overflow = (in1[31])(in2[31])(s[31]')+(in1[31]')(in2[31]')(s[31])`. Then, translate it to the gate way, I use 4 `and` gate and an `or` gate to implement it. I also use 3 `not` gates to reverse the `in1[31]` & `in2[31]`, and `s[31]`. After these steps the module will output the result `s` and the `overflow` for the addition operation.<br>

**Module subtraction**<br>
&emsp;&emsp;The `module subtraction` implement the subtraction with two 32-bits. The two 32-bits numbers, `[31:0]in1` & `[31:0]in2`, are the inputs. I design this module that I reverse the bits of input number `in2` to get the `re2[31:0]` by a 'generate for'. After I get the reverse input number `in2`, I use three 16bits RCA adders calculate together, for the first 16bits I set the first carry_in to `1'b1` to get the first 16bits result. And then, I use the carry_out from first 16bits to choose the next 16bits result, then the result will be gotten. After gotten the result, the overfolw can be gotten by the very left one bit for the sum result `s[31]` and the the same position bit for `in1[31]` & `in2[31]`. I use the kmap get the the fomula for the overflow, which is `overflow = (in1[31])(in2[31]')(s[31]')+(in1[31]')(in2[31])(s[31])` which can write as `overflow = (in1[31])(re2[31])(s[31]')+(in1[31]')(in2[31])(s[31])`. Then, translate it to the gate way, I use 4 `and` gate and an `or` gate to implement it. I also use two `not` gates to reverse the `in1[31]` & `s[31]`. After these steps the module will output the result `s` and the `overflow` for the subtraction operation.<br>

**Modlue RCA_16bits**<br>
&emsp;&emsp;The `module RCA_16bits` implement a 16-bits RCA. There are two 16-bits input number `[15:0]in1` & `[15:0]in2`, a input carry_in, and two outouts result and carry_out. This 16-bits RCA adder is used for the 16-bits + 16-bits CSA adder in the module `addition` and `subtraction`. I use a 'generate for' to implement the 16-bits RCA adder.<br>

<br>




