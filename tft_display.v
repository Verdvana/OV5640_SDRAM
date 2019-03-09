module tft_display(
							input clk,
							input rst_n,
							input [10:0]	hcount,
							input [10:0]	vcount,
							
							input 	[15:0]  data_in,
							output reg [15:0]	vga_data
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

	
wire    [15:0]     data_theme;
reg   [16:0]      addr_theme;

wire           data_0;
reg    [6:0]  	addr_0;
wire           data_1;
reg    [6:0]  	addr_1;
wire           data_2;
reg   [6:0]  	addr_2;
wire           data_3;
reg    [6:0]  	addr_3;
wire           data_4;
reg    [6:0]  	addr_4;
wire           data_5;
reg    [6:0]  	addr_5;
wire           data_6;
reg    [6:0]  	addr_6;
wire           data_7;
reg    [6:0]  	addr_7;
wire           data_8;
reg    [6:0]  	addr_8;
wire           data_9;
reg    [6:0]  	addr_9;




reg [23:0] cnt;
reg        flag;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 24'b0;
	
	else if(cnt == 24'b1111_1111_1111_1111_1111_1111)
		begin
			cnt <= 24'b0;
			flag <= ~flag;
		end
	
	else
		cnt <= cnt+1;
end

reg [3:0] cnt1;
always@(posedge flag or negedge rst_n)
begin
	if(!rst_n)
		cnt1 <= 4'b0;
	
	else if(cnt1 == 9)
		cnt1 <= 4'b0;	
		
	else 
		cnt1 <= cnt1+1;
end


reg flag_rom_theme;


always@(*)
begin
/*	
	if((hcount>190) && (hcount<608) && (vcount<32))
		begin
			addr_theme = hcount[10:0] -190 + vcount[10:0]*416;   //32*416
			flag_rom_theme <= 1;
			vga_data = data_theme;		
		end
		
	 else if((hcount <8) && (vcount>64) && (vcount<80))
		begin
			case(cnt1)
				4'b0000:
					begin
						addr_0 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_0 ? `BLACK:`PINK;
					end
				
				4'b0001:
					begin
						addr_1 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_1 ? `BLACK:`PINK;
					end
				
				4'b0010:
					begin
						addr_2 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_2 ? `BLACK:`PINK;
					end
				
				4'b0011:
					begin
						addr_3 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_3 ? `BLACK:`PINK;
					end
				
				4'b0100:
					begin
						addr_4 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_4 ? `BLACK:`PINK;
					end
				
				4'b0101:
					begin
						addr_5 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_5 ? `BLACK:`PINK;
					end
				
				4'b0110:
					begin
						addr_6 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_6 ? `BLACK:`PINK;
					end
				
				4'b0111:
					begin
						addr_7 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_7 ? `BLACK:`PINK;
					end
				
				4'b1000:
					begin
						addr_8 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_8 ? `BLACK:`PINK;
					end
				
				4'b1001:
					begin
						addr_9 = hcount[10:0] + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_9 ? `BLACK:`PINK;
					end
				
				
			endcase		
		end
		
	else if((hcount >=8) &&(hcount <16) && (vcount>64) && (vcount<80))
		begin
			case(cnt1)
				4'b0000:
					begin
						addr_0 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_0 ? `BLACK:`PINK;
					end
				
				4'b0001:
					begin
						addr_1 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_1 ? `BLACK:`PINK;
					end
				
				4'b0010:
					begin
						addr_2 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_2 ? `BLACK:`PINK;
					end
				
				4'b0011:
					begin
						addr_3 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_3 ? `BLACK:`PINK;
					end
				
				4'b0100:
					begin
						addr_4 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_4 ? `BLACK:`PINK;
					end
				
				4'b0101:
					begin
						addr_5 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_5 ? `BLACK:`PINK;
					end
				
				4'b0110:
					begin
						addr_6 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_6 ? `BLACK:`PINK;
					end
				
				4'b0111:
					begin
						addr_7 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_7 ? `BLACK:`PINK;
					end
				
				4'b1000:
					begin
						addr_8 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_8 ? `BLACK:`PINK;
					end
				
				4'b1001:
					begin
						addr_9 = hcount[10:0]-8 + (vcount[10:0] - 64)*8;				//16*8
						flag_rom_theme <= 1;
						vga_data = data_9 ? `BLACK:`PINK;
					end
				
				
			endcase		
		end
		
	else
		begin
			flag_rom_theme <= 0;
			vga_data = data_in ;
		end
		
*/
vga_data = data_in;

end


/*
assign  addr_theme = hcount[10:0] + vcount[10:0]*416;
assign  vga_data = data_theme;
*/


	ROM0  ROM0_inst (
	.address ( addr_0 ),
	.clock ( clk ),
	.q ( data_0 )
	);

	ROM1  ROM1_inst (
	.address ( addr_1 ),
	.clock ( clk ),
	.q ( data_1 )
	);
	
	ROM2  ROM2_inst (
	.address ( addr_2 ),
	.clock ( clk ),
	.q ( data_2 )
	);
	
	ROM3  ROM3_inst (
	.address ( addr_3 ),
	.clock ( clk ),
	.q ( data_3 )
	);

	ROM4  ROM4_inst (
	.address ( addr_4 ),
	.clock ( clk ),
	.q ( data_4 )
	);
	
	ROM5  ROM5_inst (
	.address ( addr_5 ),
	.clock ( clk ),
	.q ( data_5 )
	);
	
	ROM6  ROM6_inst (
	.address ( addr_6 ),
	.clock ( clk ),
	.q ( data_6 )
	);
	
	ROM7  ROM7_inst (
	.address ( addr_7 ),
	.clock ( clk ),
	.q ( data_7 )
	);
	
	ROM8  ROM8_inst (
	.address ( addr_8 ),
	.clock ( clk ),
	.q ( data_8 )
	);
	
	ROM9  ROM9_inst (
	.address ( addr_9 ),
	.clock ( clk ),
	.q ( data_9 )
	);


	ROM_theme  ROM_theme_inst (
	.address ( addr_theme ),
	.clock ( clk ),
	.q ( data_theme )
	);


endmodule 