module hadder(a, b, cout, sum); // half adder
	input a, b;
	output cout, sum;
	
	xor s(sum, a, b);
	and c(cout, a, b);
	
endmodule