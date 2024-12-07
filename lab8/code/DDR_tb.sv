module DDR_tb();
	logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0]  LEDR, SW;
	logic [3:0]  KEY;
	logic [35:0] GPIO_1;
	logic [15:0][15:0] red, grn;
	logic clk;
	
	DDR dut (.CLOCK_50(clk), .*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		SW[0] <= 1; KEY <= 4'b1111; red <= 16'h0000; grn <= 16'h0000;
		@(posedge clk); SW[0] <= 0;
		for (i = 0; i < 20; i++) @(posedge clk);
		@(posedge clk); KEY <= 4'b1101;
		@(posedge clk); KEY <= 4'b1100;
		@(posedge clk); KEY <= 4'b1110;
		@(posedge clk); KEY <= 4'b1011;
		@(posedge clk); KEY <= 4'hf;
		@(posedge clk); KEY <= 4'b0111;
		@(posedge clk); KEY <= 4'hf;
		for (i = 0; i < 4; i++) @(posedge clk);
		@(posedge clk); KEY <= 4'b0111;
		@(posedge clk); KEY <= 4'hf;
		for (i = 0; i < 5; i++) @(posedge clk);
		@(posedge clk); SW[0] <= 1;
		@(posedge clk); SW[0] <= 0;
		@(posedge clk); $stop;
	end
endmodule	// DDR_tb