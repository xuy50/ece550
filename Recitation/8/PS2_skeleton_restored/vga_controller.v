module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 up_switch, dn_switch, left_switch, right_switch // switch-input
							 );

	
input iRST_n;
input iVGA_CLK;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
reg [9:0] x, y;
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
  x <= ADDR % 640;
  y <= ADDR / 640;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here
 input up_switch, dn_switch, left_switch, right_switch;

 reg [9:0] o_x = 10'd320;
 reg [9:0] o_y = 10'd240;
 reg [15:0] prescaler;
 
 always @(posedge VGA_CLK_n)
 begin
	if(x>o_x && x<o_x+50 && y>o_y && y<o_y+50)
		bgr_data <= 24'haf5fff;
	else
		bgr_data <= bgr_data_raw;
 end
 
 always @(posedge VGA_CLK_n)
 begin
	prescaler <= prescaler + 1;
	
	if (prescaler == 0)
	begin
		if (up_switch)
		begin
			o_y <= (o_y == 0) ? 10'd480 : o_y - 1;
		end
		
		if (dn_switch)
		begin
			o_y <= (o_y == 480) ? 10'd0 : o_y + 1;
		end
		
		if (left_switch)
		begin
			o_x <= (o_x == 0) ? 10'd640 : o_x - 1;
		end
		
		if (right_switch)
		begin
			o_x <= (o_x == 640) ? 10'd0 : o_x + 1;
		end
	end
 end
	
//////Color table output
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;
//always@(posedge VGA_CLK_n) bgr_data <= bgr_data_raw;
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















