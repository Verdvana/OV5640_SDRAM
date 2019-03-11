module Data_Integration(
		input 					clk,
		input 					rst_n,
		
		input 		[15:0] 	data_in,
		output    	[15:0] 	data_out

);

parameter 	 hpixel_end=11'd800,
				 vline_end=11'd480;
				 
				 
reg [10:0] hcount;
reg [10:0] vcount;

wire hcount_ov;   //行扫描一行结束时为1
wire vcount_ov;	//列扫描一行结束时为1

assign hcount_ov=(hcount==hpixel_end);
assign vcount_ov=(vcount==vline_end);


wire    [15:0]     data_theme;
wire   [16:0]      addr_theme;
	
reg flag ;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		hcount<=11'd0;
	
	else if(hcount_ov)
		hcount<=11'd0;
		
	else
		hcount<=hcount+1;	
end


always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		vcount<=11'd0;
	
	else if(vcount_ov)
		vcount<=11'd0;
		
	else
		vcount<=hcount+1;	
end
	
/*	
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		flag<=0;
		
	else
		flag<=1;	
end
*/

/*
always@(hcount or vcount)
begin
	if((hcount>190) && (hcount<608) && (vcount<32))
	begin
		addr_theme = hcount[10:0]  -190  + vcount[10:0]*416;   //32*416
		data_out = data_theme;		
	end
		
	else
		data_out =data_in;
end
*/


always@(hcount or vcount)
begin
	if((hcount>190) && (hcount<608) && (vcount<32))
	begin
		flag<=1;		
	end
		
	else
		flag<=0;
end

assign  addr_theme = hcount[10:0]  -190  + vcount[10:0]*416;
assign  data_out=flag?data_theme:data_in;

ROM_theme  ROM_theme_inst (
	.address ( addr_theme ),
	.clock ( clk ),
	.q ( data_theme )
	);
	
endmodule
