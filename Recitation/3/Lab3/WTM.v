module WTM(input [4:0]in1,
				input [4:0]in2,
				output reg [9:0]out,
				output reg cout);
	wire [26:0]c;
	wire [26:0]s;
	
	//stage 1
	hadder S1(in1[1]&in2[0],in1[0]&in2[1],c[0],s[0]);
	fadder S2(in1[2]&in2[0],in1[1]&in2[1],in1[0]&in2[2],c[1],s[1]);
	fadder S3(in1[2]&in2[1],in1[1]&in2[2],in1[0]&in2[3],c[2],s[2]);
	hadder S4(in1[4]&in2[0],in1[3]&in2[1],c[3],s[3]);
	fadder S5(in1[2]&in2[2],in1[1]&in2[3],in1[0]&in2[4],c[4],s[4]);
	fadder S6(in1[3]&in2[2],in1[2]&in2[3],in1[1]&in2[4],c[5],s[5]);
	fadder S7(in1[4]&in2[2],in1[3]&in2[3],in1[2]&in2[4],c[6],s[6]);
	hadder S8(in1[4]&in2[3],in1[3]&in2[4],c[7],s[7]);
	
	//stage 2
	hadder S9(s[1],c[0],c[8],s[8]);
	fadder S10(s[2],c[1],in1[3]&in2[0],c[9],s[9]);
	fadder S11(s[3],s[4],c[2],c[10],s[10]);
	fadder S12(c[4],s[5],in1[4]&in2[1],c[11],s[11]);
	hadder S13(c[5],s[6],c[12],s[12]);
	hadder S14(c[6],s[7],c[13],s[13]);
	hadder S15(c[7],in1[4]&in2[4],c[14],s[14]);
	
	//stage 3
	hadder S16(c[8],s[9],c[15],s[15]);
	hadder S17(c[9],s[10],c[16],s[16]);
	fadder S18(c[10],s[11],c[3],c[17],s[17]);
	hadder S19(c[11],s[12],c[18],s[18]);
	hadder S20(c[12],s[13],c[19],s[19]);
	hadder S21(c[13],s[14],c[20],s[20]);
	
	//stage 4
	hadder S22(c[15],s[16],c[21],s[21]);
	fadder S23(c[16],s[17],c[21],c[22],s[22]);
	fadder S24(c[17],s[18],c[22],c[23],s[23]);
	fadder S25(c[18],s[19],c[23],c[24],s[24]);
	fadder S26(c[19],s[20],c[24],c[25],s[25]);
	fadder S27(c[14],c[20],c[25],c[26],s[26]);
	
	always@(*)
	begin
		out[0] <= in1[0]&in2[0];
		out[1] <= s[0];
		out[2] <= s[8];
		out[3] <= s[15];
		out[4] <= s[21];
		out[5] <= s[22];
		out[6] <= s[23];
		out[7] <= s[24];
		out[8] <= s[25];
		out[9] <= s[26];
		cout <= c[26];
		
	end
endmodule