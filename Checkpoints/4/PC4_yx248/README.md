This processor is designed by
Yang Xu yx248

#freqdiv.v
To implement this processor, we first built two clock_dividers, one to devide the given clock by 2, one by 4.

#skeleton.v
Then we passed the 4-times slower clock to the PC in our processor and regfile.

#operchecker.v
We also built one operation checker module to parse the given 32-bits instruction.
Given an 32-bits instruction as input, we could obtain the instruction type, whether Rd, Rs, Rt were needed, what operation should alu do and whether to use writeReg.

#regfile.v  bitCheck.v dffe.v
We designed our own register file using bitCheck.v and dffe.v .

#processor.v

We first set up PC. Then passed input and output for imem.
After that, we got all operation checkers from operchecker module by putting q_imem as input.
And we did the alu operation and checked the overflow.
Finally, we passed input and output for register file and dmem.
