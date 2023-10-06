module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	
	// adder / suber
	wire [31:0] addr; // add operation result
	wire ofa; // add operation overflow
	wire [31:0] subr; // substract operation result
	wire ofs; // substract operation overflow
	wire iltr;
	wire iner;
	
	addition addO(data_operandA[31:0], data_operandB[31:0], addr[31:0], ofa); // add operation
	subtraction subO(data_operandA[31:0], data_operandB[31:0], subr[31:0], ofs, iltr, iner); // substract operation
	
	//and / or
	wire [31:0] andr;
	wire [31:0] orr;
	
	and2num and0(data_operandA[31:0], data_operandB[31:0], andr);
	or2num or0(data_operandA[31:0], data_operandB[31:0], orr);
	
	// shifter
	wire [31:0] sllr;
	SLL SLL0(data_operandA[31:0], ctrl_shiftamt, sllr);
	
	wire [31:0] srar;
	SRA SRA0(data_operandA[31:0], ctrl_shiftamt, srar);
	
	
	// output mux selectors
	assign data_result[31:0] = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? srar : sllr) : (ctrl_ALUopcode[1] ? (ctrl_ALUopcode[0] ? orr : andr) : (ctrl_ALUopcode[0] ? subr : addr)); // mux for check the result
	assign overflow = ctrl_ALUopcode[4] ? 1'b0 : (ctrl_ALUopcode[3] ? 1'b0 : (ctrl_ALUopcode[2] ? 1'b0 : ((ctrl_ALUopcode[1] ? 1'b0 : (ctrl_ALUopcode[0] ? ofs : ofa))))); // mux for check the overflow
	assign isNotEqual = ctrl_ALUopcode[4] ? 1'b0 : (ctrl_ALUopcode[3] ? 1'b0 : (ctrl_ALUopcode[2] ? 1'b0 : ((ctrl_ALUopcode[1] ? 1'b0 : (ctrl_ALUopcode[0] ? iner : 1'b0))))); // mux for check the isNotEqual
	assign isLessThan = ctrl_ALUopcode[4] ? 1'b0 : (ctrl_ALUopcode[3] ? 1'b0 : (ctrl_ALUopcode[2] ? 1'b0 : ((ctrl_ALUopcode[1] ? 1'b0 : (ctrl_ALUopcode[0] ? iltr : 1'b0))))); // mux for check the isNotEqual
	

endmodule
