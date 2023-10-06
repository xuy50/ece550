module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output reg [31:0] data_result;
   output reg isNotEqual, isLessThan, overflow;
	
	reg [31:0] rtemp;
	reg oftemp;
	
	parameter add=5'b0,
				sub=5'b1,
				ando=5'b10,
				oro=5'b11;
	

	always@(*)
	begin
	
		case(ctrl_ALUopcode)
		
		add:
		begin
			rtemp = data_operandA + data_operandB;
			if(((data_operandA[31] & data_operandB[31]) & (!rtemp[31])) | (((!data_operandA[31]) & (!data_operandB[31])) & rtemp[31]))
			begin
				oftemp = 1'b1;
			end
			else 
			begin
				oftemp = 1'b0;
			end
		end
		
		sub:
		begin
			rtemp = data_operandA - data_operandB;
			if(((data_operandA[31] & (!data_operandB[31])) & (!rtemp[31])) | (((!data_operandA[31]) & data_operandB[31]) & rtemp[31]))
			begin
				oftemp = 1'b1;
			end
			else 
			begin
				oftemp = 1'b0;
			end
		end
		
		ando:
		begin
			rtemp = data_operandA & data_operandB;
			oftemp = 1'b0;
		end
		
		oro:
		begin
			rtemp = data_operandA | data_operandB;
			oftemp = 1'b0;
		end
			
		endcase
		
		data_result <= rtemp;
		overflow <= oftemp;
		
	end
	
//	always@(data_result)
//	begin
//		case(ctrl_ALUopcode)
//		
//		add:
//		begin
//			if(((data_operandA[31] & data_operandB[31]) & (!data_result[31])) | (((!data_operandA[31]) & (!data_operandB[31])) & data_result[31]))
//			begin
//				overflow = 1'b1;
//			end
//			else 
//			begin
//				overflow = 1'b0;
//			end
//		end
//		
//		sub:
//		begin
//			if(((data_operandA[31] & (!data_operandB[31])) & (!data_result[31])) | (((!data_operandA[31]) & data_operandB[31]) & data_result[31]))
//			begin
//				overflow = 1'b1;
//			end
//			else 
//			begin
//				overflow = 1'b0;
//			end
//		end
//		endcase
//	end
	
endmodule
