module or2num(input [31:0] in1,
					input [31:0] in2,
					output [31:0] result);
	genvar i; //generate counter
	generate 
		for(i = 0; i <= 31; i = i + 1) begin : or_loop
			or or0_31(result[i], in1[i], in2[i]);//reverse input2
		end
	endgenerate
endmodule