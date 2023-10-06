module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] addr; // add operation result
	wire ofa; // add operation overflow
	wire [31:0] subr; // substract operation result
	wire ofs; // substract operation overflow
	
	addition addO(data_operandA[31:0], data_operandB[31:0], addr[31:0], ofa); // add operation
	subtraction subO(data_operandA[31:0], data_operandB[31:0], subr[31:0], ofs); // substract operation
	
	assign data_result[31:0] = ctrl_ALUopcode[0] ? subr : addr; // mux for check the result
	assign overflow = ctrl_ALUopcode[0] ? ofs : ofa; // mux for check the overflow
	

endmodule
