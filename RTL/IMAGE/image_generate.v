module image_generate(
	input							clk,
	input							rst_n,
	
	output	reg	[15:0]	data_out,
	output						data_en
);

localparam	BLACK 	= 16'h0000,		//黑色
				BLUE 		= 16'h001f,		//蓝色
				RED 		= 16'hf800,		//红色
				PURPPLE 	= 16'hf81f,		//紫色
				GREEN		= 16'h07e0,		//绿色
				CYAN 		= 16'h07ff,		//青色
				YELLOW 	= 16'hffe0,		//黄色
				WHITE 	= 16'hffff;		//白色

				
reg		[24:0]	cnt;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cnt <= 25'd0;
	else if(cnt == 25'd25000000)
		cnt <= 25'd0;
	else
		cnt <= cnt + 1'b1;
end

reg					en;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		en <= 1'b0;
	else if(cnt == 25'd25000000)
		en <= 1'b1;
	else
		en <= en;
end

reg		[2:0]		data_cnt;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		data_cnt <= 3'd0;
	else if(cnt == 25'd25000000)
		if(data_cnt == 3'd7)
			data_cnt <= 3'd0;
		else
			data_cnt <= data_cnt + 1'b1;
	else
		data_cnt <= data_cnt;
end
	

always @(*) begin
	case(data_cnt)
		3'd0 	 : data_out = BLUE;
		3'd1 	 : data_out = BLACK;
		3'd2 	 : data_out = RED;
		3'd3 	 : data_out = PURPPLE;
		3'd4 	 : data_out = GREEN;
		3'd5 	 : data_out = CYAN;
		3'd6 	 : data_out = YELLOW;
		3'd7 	 : data_out = WHITE;
		default: data_out = BLUE;
	endcase
end

assign	data_en = en;
endmodule
