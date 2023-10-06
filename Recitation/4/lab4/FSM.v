module FSM(input clock,
				input rst,
				input w,
				output reg countMoore,
				output reg countMealy,
				output reg [2:0]STATEMoore,
				output reg [2:0]STATEMealy);
	
	reg [2:0]SMo;
	reg [2:0]NSMo;
	
	reg [2:0]SMe;
	reg [2:0]NSMe;
	
	parameter // 8 states
	sMo0 = 3'd0,
	sMo1 = 3'd1,
	sMo2 = 3'd2,
	sMo3 = 3'd3,
	sMo4 = 3'd4,
	sMo5 = 3'd5,
	sMo6 = 3'd6,
	sMo7 = 3'd7;
	
	parameter // 8 states
	sMe0 = 3'd0,
	sMe1 = 3'd1,
	sMe2 = 3'd2,
	sMe3 = 3'd3,
	sMe4 = 3'd4,
	sMe5 = 3'd5,
	sMe6 = 3'd6,
	sMe7 = 3'd7;
	
	always @(posedge clock or negedge rst)
	begin
		if(rst == 1'b0)
		begin
			SMo <= sMo0;
			SMe <= sMe0;
		end
		else
		begin
			SMo <= NSMo;
			SMe <= NSMe;
		end
	end
	
	// Moore
	always @(SMo, w)
	begin
		case(SMo)
			sMo0:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				if(w == 1'b1)
					NSMo = sMo1;
				else
					NSMo = sMo0;
			end
			sMo1:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				if(w == 1'b1)
					NSMo = sMo2;
				else
					NSMo = sMo1;
			end
			sMo2:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				if(w == 1'b1)
					NSMo = sMo3;
				else
					NSMo = sMo2;
			end
			sMo3:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				if(w == 1'b1)
					NSMo = sMo4;
				else
					NSMo = sMo3;
			end
			sMo4:
			begin
				STATEMoore = SMo;
				countMoore = 1'b1;
				if(w == 1'b1)
					NSMo = sMo0;
				else
					NSMo = sMo4;
			end
			sMo5:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				NSMo = sMo0;
			end
			sMo6:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				NSMo = sMo0;
			end
			sMo7:
			begin
				STATEMoore = SMo;
				countMoore = 1'b0;
				NSMo = sMo0;
			end
		endcase
	end
	
	// Mealy
	always @(SMe, w)
	begin
		case(SMe)
			sMe0:
			begin
				if(w == 1'b1)
				begin
					NSMe = sMe1;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
				else
				begin
					NSMe = sMe0;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
			end
			sMe1:
			begin
				if(w == 1'b1)
				begin
					NSMe = sMe2;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
				else
				begin
					NSMe = sMe1;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
			end
			sMe2:
			begin
				if(w == 1'b1)
				begin
					NSMe = sMe3;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
				else
				begin
					NSMe = sMe2;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
			end
			sMe3:
			begin
				if(w == 1'b1)
				begin
					NSMe = sMe4;
					STATEMealy = NSMe;
					countMealy = 1'b1;
				end
				else
				begin
					NSMe = sMe3;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
			end
			sMe4:
			begin
				if(w == 1'b1)
				begin
					NSMe = sMe0;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
				else
				begin
					NSMe = sMe4;
					STATEMealy = NSMe;
					countMealy = 1'b0;
				end
			end
			sMe5:
			begin
				NSMe = sMe0;
				STATEMealy = NSMe;
				countMealy = 1'b0;
			end
			sMe6:
			begin
				NSMe = sMe0;
				STATEMealy = NSMe;
				countMealy = 1'b0;
			end
			sMe7:
			begin
				NSMe = sMe0;
				STATEMealy = NSMe;
				countMealy = 1'b0;
			end
		endcase
	end
	
endmodule
