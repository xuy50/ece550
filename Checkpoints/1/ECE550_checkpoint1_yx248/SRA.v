module SRA(input [31:0] in,
				input [4:0] samp,
				output [31:0] out);
				
	wire check0;
	wire [1:0] check1;
	wire [3:0] check2;
	wire [7:0] check3;
	wire [15:0] check4;
	wire [31:0] temp0, temp1, temp2, temp3;
	
	assign check0 = in[31] ? 1'b1 : 1'b0;
	assign check1 = in[31] ? 2'b11 : 2'b0;
	assign check2 = in[31] ? 4'hF : 4'b0;
	assign check3 = in[31] ? 8'hFF : 8'b0;
	assign check4 = in[31] ? 16'hFFFF : 16'b0;
	
	assign temp0 = samp[0] ? {check0,in[31:1]} : in;
	assign temp1 = samp[1] ? {check1[1:0],temp0[31:2]} : temp0;
	assign temp2 = samp[2] ? {check2[3:0],temp1[31:4]} : temp1;
	assign temp3 = samp[3] ? {check3[7:0],temp2[31:8]} : temp2;
	assign out = samp[4] ? {check4[15:0],temp3[31:16]} : temp3;
	
endmodule