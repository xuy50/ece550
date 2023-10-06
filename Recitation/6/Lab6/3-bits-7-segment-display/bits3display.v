module bits3display(
	input [2:0]a,b,
	input cin,
	output [6:0] HEX2,HEX1,HEX0
);
reg [3:0] sum,cout;
reg [3:0] result_one_digit;
reg [3:0] result_ten_digit;

always@(*) begin
	sum <= a + b + cin;
//	cout[0] <= sum[3];
//	cout[3:1] <= 3'b0;
cout=1'b0;
	result_one_digit = sum%10;
	result_ten_digit = sum/10;
end

sevensegment sevensegment0(result_one_digit,HEX0);
sevensegment sevensegment1(result_ten_digit,HEX1);
sevensegment sevensegment2(cout,HEX2);

endmodule



module sevensegment(
	input [3:0]in2,
	output reg[6:0]display
);
always@(*) begin
    case(in2)
    0 : display = 7'b1000000;
    1 : display = 7'b1111001;
    2 : display = 7'b0100100;
    3 : display = 7'b0110000;
	 
    4 : display = 7'b0011001;
    5 : display = 7'b0010010;
    6 : display = 7'b0000010;
    7 : display = 7'b1111000;
	 
    8 : display = 7'b0000000;
	 9 : display = 7'b0010000;
//   10 : display = 7'b0000100;
//	11 : display = 7'b1100000;
//		
//	12 : display = 7'b0110001;
//	13 : display = 7'b1000011;
//	14 : display = 7'b0110000;
//	15 : display = 7'b0111000;
    default: display = 7'b1111111;
    endcase
end
endmodule
