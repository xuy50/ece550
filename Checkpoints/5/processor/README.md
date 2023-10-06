This processor is designed by 
Yang Xu yx248
Jingzhi Zhao jz422
Mengyao Zhang mz215

#freqdiv.v
To implement this processor, we first built two clock_dividers, one to devide the given clock by 2, one by 4.

#skeleton.v
Then we passed the 4-times slower clock to the PC in our processor and regfile.

#operchecker.v
We also built one operation checker module to parse the given 32-bits instruction.
Given an 32-bits instruction as input, we could obtain the instruction type(R, I or J), whether Rd, Rs, Rt were needed, what operation should alu do and whether to use writeReg.

#regfile.v  bitCheck.v dffe.v
We designed our own register file using bitCheck.v and dffe.v .

#processor.v

We first used our operchecker module to parse the instrcution from the output of imem (q_imem) and got all operation checkers needed. Then we read dataA and dataB from that instruction(q_imem) and performed the corresponding ALU operation. After the ALU operation, we obtained aluOverflow, which was uesd to check overflow for $rstatus. Then we used ALU to add dataA and dataB to obtain demeAddr for the output for dmem. After that, we dealed with output for Regfile, dmem and pc.
