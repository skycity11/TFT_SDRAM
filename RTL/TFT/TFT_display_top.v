module TFT_display_top(
	input					clk_50m,
	input					rst_n,
	
	//sdram control
	output				sdram_clk,		//sdram clock
	output				sdram_cke,		//sdram clock enable
	output				sdram_cs_n,		//sdram chip select
	output				sdram_we_n,		//sdram write enable
	output				sdram_cas_n,	//sdram column address strobe
	output				sdram_ras_n,	//sdram row address strobe
	output	 [1:0]	sdram_dqm,		//sdram data enable
	output	 [1:0]	sdram_ba,		//sdram bank address
	output	 [12:0]	sdram_addr,		//sdram address
	inout		 [15:0]	sdram_dq,		//sdram data

	output	[15:0]	tft_rgb,
	output				tft_vsync,
	output				tft_hsync,
	output				tft_clk,
	output				tft_de,
	output				tft_pwm,
	output				tft_blank_n
);

wire				clk33_3m;


//---------------------------------------------
//system global clock control
wire	sys_rst_n;		//global reset
wire	clk_ref;		//sdram ctrl clock
wire	clk_refout;		//sdram clock output
wire	clk_vga;		//vga clock
wire	clk_cmos;		//24MHz cmos clock
wire	clk_adc;		//4MHz ADC clock
system_ctrl_pll	u_system_ctrl_pll
(
	.clk					(clk_50m),			//global clock
	.rst_n				(rst_n),			//external reset
	
	.sys_rst_n			(sys_rst_n),	//global reset
	.clk_c0				(clk_ref),		//100MHz 
	.clk_c1				(clk_refout),	//100MHz -90deg
	.clk_c2				(clk_vga),		//30MHz
	.clk_c3				(clk_cmos),		//24MHz
	.clk_c4				(clk_adc)		//
);

assign	sdram_clk=clk_refout;

//--------------------------------------------------------------------------------------------------------
//image_generate
image_generate image_generator(
	.clk(clk_cmos),
	.rst_n(rst_n),
	
	.data_out(sys_data_in),
	.data_en(sys_we)
);



//--------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------
//Sdram_Control_2Port module 	
//sdram write port
wire				clk_write	=	clk_cmos;	//Change with input signal											
wire	[15:0]	sys_data_in;
wire				sys_we;
//sdram read port
wire			clk_read	=	clk_vga;	//Change with vga timing	
wire	[15:0]	sys_data_out1;
wire 	[7:0]	sys_data_out2;
wire			sys_rd1 = tft_req_image;
wire			sys_rd2;


sdram_control_top(
	.clk(clk_ref),
	.rst_n(sys_rst_n),
	.sdram_clk(sdram_clk),

	.Wr_data(sys_data_in),
	.Wr_en(sys_we),
	.Wr_addr(0),
	.Wr_max_addr(22'd640 * 22'd480),
	.Wr_load(~sys_rst_n),
	.Wr_clk(clk_write),
	.Wr_full(),
	.Wr_use(),

	.Rd_data(sys_data_out1),
	.Rd_en(sys_rd1),
	.Rd_addr(0),
	.Rd_max_addr(22'd640 * 22'd480),
	.Rd_load(~sys_rst_n),
	.Rd_clk(clk_vga),
	.Rd_empty(),
	.Rd_use(),

	.sdram_addr(sdram_addr),
	.sdram_ba(sdram_ba),
	.sdram_cs_n(sdram_cs_n),
	.sdram_cke(sdram_cke),
	.sdram_ras_n(sdram_ras_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_we_n(sdram_we_n),
	.sdram_dq(sdram_dq),
	.sdram_dqm(sdram_dqm)
);





wire	[10:0]	hcount_veneno;
wire	[10:0]	vcount_veneno;
wire				tft_req_veneno;

wire	[10:0]	hcount_xiaofang;
wire	[10:0]	vcount_xiaofang;
wire				tft_req_xiaofang;

wire	[10:0]	hcount_num;
wire	[10:0]	vcount_num;
wire				tft_req_num;

wire	[15:0]	data;


TFT_image u0(
	.clk_vga(clk_vga),
	.rst_n(rst_n),
	
	.tft_req_veneno(tft_req_veneno),	
	.hcount_veneno(hcount_veneno),	
	.vcount_veneno(vcount_veneno),	
	
	.tft_req_xiaofang(tft_req_xiaofang),
	.hcount_xiaofang(hcount_xiaofang),
	.vcount_xiaofang(vcount_xiaofang),
	
	.tft_req_num(tft_req_num),
	.hcount_num(hcount_num),
	.vcount_num(vcount_num),
	
	.tft_req_image(tft_req_image),
	.image_data(sys_data_out1),
	
	.display_data(data)										
);

TFT_driver u1(
	.clk_vga(clk_vga),
	.rst_n(rst_n),
	.data_in(data),
	
	.tft_req_veneno(tft_req_veneno),
	.hcount_veneno(hcount_veneno),
	.vcount_veneno(vcount_veneno),
	
	.tft_req_xiaofang(tft_req_xiaofang),
	.hcount_xiaofang(hcount_xiaofang),
	.vcount_xiaofang(vcount_xiaofang),
	
	
	.tft_req_num(tft_req_num),
	.hcount_num(hcount_num),
	.vcount_num(vcount_num),
	
	.tft_req_image(tft_req_image),
	
	.tft_rgb(tft_rgb),
	.tft_hs(tft_hsync),
	.tft_vs(tft_vsync),
	.tft_clk(tft_clk),
	.tft_de(tft_de),
	.tft_pwm(tft_pwm),
	.tft_blank_n(tft_blank_n)
);

endmodule
