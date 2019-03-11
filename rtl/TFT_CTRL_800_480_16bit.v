/*============================================================================
*
*  LOGIC CORE:          TFT驱动模块		
*  MODULE NAME:         TFT_CTRL()
*  COMPANY:             芯航线电子工作室
*                       http://xiaomeige.taobao.com
*	author:					小梅哥
*	author QQ Group：472607506
*  REVISION HISTORY:  
*
*    Revision 1.0  01/01/2016     Description: Initial Release.
*
*  FUNCTIONAL DESCRIPTION:
===========================================================================*/
module TFT_CTRL_800_480_16bit(
	Clk33M,	//系统输入时钟25MHZ
	Rst_n,	//复位输入，低电平复位
	data_in,	//待显示数据
	hcount,		//TFT行扫描计数器
	vcount,		//TFT场扫描计数器
	TFT_RGB,	//TFT数据输出
	TFT_HS,		//TFT行同步信号
	TFT_VS,		//TFT场同步信号
	TFT_BLANK,
	TFT_VCLK,
	TFT_DE
	//Error
);
	

`define RED      16'hf800
`define GREEN    16'h07e0
`define BLUE     16'h001f
`define WHITE    16'hffff
`define BLACK    16'h0000
`define YELLOW   16'hffe0
`define CYAN     16'hf81f
`define ROYAL    16'h07ff
`define PINK     16'hfe19

	
	//----------------模块输入端口----------------
	input  Clk33M;          //系统输入时钟33MHZ
	input  Rst_n;
	input  [15:0]data_in;     //待显示数据

	//----------------模块输出端口----------------
	output [11:0]hcount;
	output [11:0]vcount;
	output [15:0]TFT_RGB;  //TFT数据输出
	output TFT_HS;           //TFT行同步信号
	output TFT_VS;           //TFT场同步信号
	output TFT_BLANK;
	output TFT_DE;
	output TFT_VCLK;
	//output reg Error;

	//----------------内部寄存器定义----------------
	reg [11:0] hcount_r;     //TFT行扫描计数器
	reg [11:0] vcount_r;     //TFT场扫描计数器
	//----------------内部连线定义----------------
	wire hcount_ov;   //行扫描一行结束时为1
	wire vcount_ov;	//列扫描一行结束时为1
	wire TFT_DE;		//有效显示区标定

	//TFT行、场扫描时序参数表
	parameter TFT_HS_end=10'd1,
				 hdat_begin=10'd46,
				 hdat_end=10'd846,
				 hpixel_end=12'd1056,
				 TFT_VS_end=10'd1,
				 vdat_begin=10'd24,
				 vdat_end=10'd504,
				 vline_end=10'd524;

	assign hcount=TFT_DE?(hcount_r-hdat_begin):12'd0;
	assign vcount=TFT_DE?(vcount_r-vdat_begin):12'd0;
	
	assign TFT_BLANK = TFT_DE;
	assign TFT_VCLK = Clk33M;
	
	
	wire    [15:0]     data_theme;
	wire    [13:0]     addr_theme;
	
	wire     		 	 data_0;
	wire    [6:0]      addr_0;
	wire     		 	 data_1;
	wire    [6:0]      addr_1;
	wire     		 	 data_2;
	wire    [6:0]      addr_2;
	wire     		 	 data_3;
	wire    [6:0]      addr_3;
	wire     		 	 data_4;
	wire    [6:0]      addr_4;
	wire     		 	 data_5;
	wire    [6:0]      addr_5;
	wire     		 	 data_6;
	wire    [6:0]      addr_6;
	wire     		 	 data_7;
	wire    [6:0]      addr_7;
	wire     		 	 data_8;
	wire    [6:0]      addr_8;
	wire     		 	 data_9;
	wire    [6:0]      addr_9;
	
	
	reg   [3:0] channel;

	//**********************TFT驱动部分**********************
	//行扫描
	always@(posedge Clk33M or negedge Rst_n)
	if(!Rst_n)
		hcount_r<=12'd0;
	else if(hcount_ov)
		hcount_r<=12'd0;
	else
		hcount_r<=hcount_r+12'd1;

	assign hcount_ov=(hcount_r==hpixel_end);

	//场扫描
	always@(posedge Clk33M or negedge Rst_n)
	if(!Rst_n)
		vcount_r<=12'd0;
	else if(hcount_ov) begin
		if(vcount_ov)
			vcount_r<=12'd0;
		else
			vcount_r<=vcount_r+12'd1;
	end
	else 
		vcount_r<=vcount_r;
		
	assign 	vcount_ov=(vcount_r==vline_end);

	//数据、同步信号输出
	assign TFT_DE=((hcount_r>=hdat_begin)&&(hcount_r<hdat_end))
					&&((vcount_r>=vdat_begin)&&(vcount_r<vdat_end));
					
	assign TFT_HS=(hcount_r>TFT_HS_end);
	assign TFT_VS=(vcount_r>TFT_VS_end);
	
	always@(hcount or vcount)
	begin
		if((hcount>190) && (hcount<608) && (vcount<32))
			channel = 4'b0001;		
			
		
		else if((hcount <8) && (vcount>64) && (vcount<80))
			channel = 4'b0010;
		
		else
			channel = 4'b0000;
	end
	
	
//assign TFT_RGB =data_in;


assign  addr_theme = hcount[10:0]  -190  + vcount[10:0]*416;
assign  addr_0 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8

assign  TFT_RGB= (channel[0])?data_theme:(channel[1]?(data_0?data_in:`RED):data_in);


/*
always@(*)
begin
	if(!flag)
		if(TFT_RGB == data_in)
			Error <= 1;
	
		else
			Error <= 0;
	
	else
			Error <= 0;
	
		
end
*/

ROM_theme  ROM_theme_inst (
	.address ( addr_theme ),
	.clock ( Clk33M ),
	.q ( data_theme )
	);	
	
ROM_0  ROM_0_inst (
.address ( addr_0 ),
.clock ( Clk33M ),
.q ( data_0 )
);

ROM_1  ROM_1_inst (
.address ( addr_1 ),
.clock ( Clk33M ),
.q ( data_1 )
);

ROM_2  ROM_2_inst (
.address ( addr_2 ),
.clock ( Clk33M ),
.q ( data_2 )
);

ROM_3  ROM_3_inst (
.address ( addr_3 ),
.clock ( Clk33M ),
.q ( data_3 )
);

ROM_4  ROM_4_inst (
.address ( addr_4 ),
.clock ( Clk33M ),
.q ( data_4 )
);

ROM_5  ROM_5_inst (
.address ( addr_5 ),
.clock ( Clk33M ),
.q ( data_5 )
);

ROM_6  ROM_6_inst (
.address ( addr_6 ),
.clock ( Clk33M ),
.q ( data_6 )
);

ROM_7  ROM_7_inst (
.address ( addr_7 ),
.clock ( Clk33M ),
.q ( data_7 )
);

ROM_8  ROM_8_inst (
.address ( addr_8 ),
.clock ( Clk33M ),
.q ( data_8 )
);

ROM_9  ROM_9_inst (
.address ( addr_9 ),
.clock ( Clk33M ),
.q ( data_9 )
);

endmodule 
