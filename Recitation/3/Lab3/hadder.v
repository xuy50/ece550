module hadder(a, b, cout, sum);
	input a, b;
	output cout, sum;
	
	xor s(sum, a, b);
	and c(cout, a, b);
	
endmodule