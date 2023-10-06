// set the timescale
`timescale 1 ns / 100 ps
module WTM_tb(); // testbenches take no arguments
 	// set up inputs as registers so they can be manipulated at will
 	reg [4:0]in1;
 	reg [4:0]in2;
 	
 	// clocks are useful for testbenches because they allow you to check your
 	// circuit at regular intervals large enough for signals to propagate
 	reg clock;
 	
 	// set up output as wire
	wire [9:0] out;
 	wire cout;
 	
 	// prepare any other variables you want - nothing is off-limits in a TB
 	integer num_errors;
 	
 	// instantiate the WTM
 	WTM test_WTM (in1, in2, out, cout);
 	           
 	// begin simulation
 	initial begin
       	$display($time, " simulation start");
       	
       	clock = 1'b0;
       	
       	       	
   @(negedge clock);
       	#(10)
       	in1 = 5'd0;//5'b00000
       	in2 = 5'd20;//5'b10100;
			#(1)
       	$display("in1 = %d, in2 = %d, should output = %d, out'd = %d, should output = %b, out'b = %b, cout = %b", in1, in2, (10'd0 * 10'd20), out, (10'd0 * 10'd20), out, cout);
			
	@(negedge clock); // wait for the clock to go negative
       	#(10)
       	in1 = 5'd25;//5'b11001;
       	in2 = 5'd16;//5'b10000;
			#(1)
       	$display("in1 = %d, in2 = %d, should output = %d, out'd = %d, should output = %b, out'b = %b, cout = %b", in1, in2, (10'd25 * 10'd16), out, (10'd25 * 10'd16), out, cout);
			
	@(negedge clock); // wait for the clock to go negative
       	#(10)
       	in1 = 5'd31;//5'b11001;
       	in2 = 5'd1;//5'b10000;
			#(1)
       	$display("in1 = %d, in2 = %d, should output = %d, out'd = %d, should output = %b, out'b = %b, cout = %b", in1, in2, (10'd31 * 10'd1), out, (10'd31 * 10'd1), out, cout);
			
			
   @(negedge clock);
			$display("stop");
	      $stop;
	   
 	end
 	
 	always
       	#10 clock = ~clock; // toggle clock every 10 timescale units
 	
endmodule
