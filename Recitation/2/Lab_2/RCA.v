module RCA(input [3:0]in1, 
				input [3:0]in2, 
				input cin, 
				output reg [3:0]sum, 
				output reg cout);
	wire [3:0]ctemp;
	wire [3:0]sumtemp;
	
	adder adder0(in1[0], in2[0], cin, ctemp[0], sumtemp[0]);
	adder adder1(in1[1], in2[1], ctemp[0], ctemp[1], sumtemp[1]);
	adder adder2(in1[2], in2[2], ctemp[1], ctemp[2], sumtemp[2]);
	adder adder3(in1[3], in2[3], ctemp[2], ctemp[3], sumtemp[3]);
	
	always@(*)
	begin
		cout <= ctemp[3];
		sum[3:0] = sumtemp[3:0];
	end
	
endmodule