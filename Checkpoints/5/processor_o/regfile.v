module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	// write data into reg
	wire [31:0] decd;
	wire [31:0] q[0:31];
	
	bitCheck bcw(ctrl_writeReg, ctrl_writeEnable, decd);
	
	dffe_ref dffe0(q[0], 32'b0, clock, decd[0], ctrl_reset);
	
	genvar i; //generate counter
	generate 
		for(i = 1; i <= 31; i = i + 1) begin : regWriteCheck_loop
			dffe_ref dffei(q[i], data_writeReg, clock, decd[i], ctrl_reset);
		end
	endgenerate

	
	// read A & B data
	// check the a & b reg positons.
	wire [31:0] decda;
	wire [31:0] decdb;
	bitCheck bca(ctrl_readRegA, 1'b1, decda);
	bitCheck bcb(ctrl_readRegB, 1'b1, decdb);
	
	// read A & read B			
	generate 
		for(i = 0; i <= 31; i = i + 1) begin : readAB_loop
			assign data_readRegA = decda[i] ? q[i] : 32'bz;
			assign data_readRegB = decdb[i] ? q[i] : 32'bz;
		end
	endgenerate

endmodule
