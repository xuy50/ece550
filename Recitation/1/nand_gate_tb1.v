`timescale 1 ps / 1 ps

module tb;
		
	parameter simdelay = 20; // guaranteed 2 clocks
	parameter clock_delay = 5;
	parameter endelay = 60000;
			
	
	reg in1;
	reg in2;
	
	wire out;

	nand_gate DUT(.in1(in1), .in2(in2), .out(out));
		
		/* start clk and reset */
		#(simdelay) rst = 1'b0; clk = 1'b0; 
		#(simdelay) rst = 1'b1; /* go into normal circuit operation */
		#(endelay) en = 1'b1;#(simdelay) en = 1'b0;
		#(simdelay) in1 = 20'd4; in2 = 20'd10;#(simdelay) en = 1'b0;
		#(endelay) en = 1'b1;
		#(simdelay) in1 = 20'hFFFFF; in2 = 20'd8;#(simdelay) en = 1'b0;
		#(endelay) en = 1'b1;
		#(simdelay) in1 = 20'hFFFCA; in2 = 20'd33;#(simdelay) en = 1'b0;
		#(endelay) en = 1'b1;
		#(simdelay) in1 = 20'hFFFFB; in2 = 20'b0;
							
		#100; // let simulation finish
	
	end
	
		// this generates a clock
	always
	begin
		#(clock_delay) clk = !clk;
	end
	
	initial
		#300000 $stop; // This stops the simulation ... May need to be greater or less depending on your program
	
endmodule