// set the timescale
`timescale 1 ns / 100 ps
module FSM_tb(); // testbenches take no arguments
	reg w;
	reg clock;
	reg rst;
	wire countMoore;
	wire countMealy;
	wire [2:0]STATEMoore;
	wire [2:0]STATEMealy;
	
	reg [2:0]SMo;
	reg [2:0]NSMo;
	
	reg [2:0]SMe;
	reg [2:0]NSMe;
	
	FSM test_FSM(clock,
						rst,
						w,
						countMoore,
						countMealy,
						STATEMoore,
						STATEMealy);
	
	initial begin
		$display($time, "simulation start");
		clock = 1'b0;
		rst = 1'b0;
		
		@(negedge clock);
		rst = 1'b1;
		w = 1'b0;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		#100 w=1'b0;
		#40 w=1'b1;
		
		@(negedge clock);
		$stop;
	end
	
	always
		#10 clock = ~clock;

endmodule
