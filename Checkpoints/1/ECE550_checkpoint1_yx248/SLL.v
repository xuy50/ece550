module SLL(input [31:0] in,
				input [4:0] samp,
				output [31:0] out);
	
	wire [31:0] temp0, temp1, temp2, temp3;
	
	assign temp0 = samp[0] ? {in[30:0],1'b0} : in;
	assign temp1 = samp[1] ? {temp0[29:0],2'b0} : temp0;
	assign temp2 = samp[2] ? {temp1[27:0],4'b0} : temp1;
	assign temp3 = samp[3] ? {temp2[23:0],8'b0} : temp2;
	assign out = samp[4] ? {temp3[16:0],16'b0} : temp3;
	
endmodule
