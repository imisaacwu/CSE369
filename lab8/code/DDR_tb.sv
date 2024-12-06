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
	
	initial begin
		SW[0] <= 1; KEY <= 4'b1111; red <= '0; grn <= '0;
		@(posedge clk); SW[0] <= 0;
		@(posedge clk);
		@(posedge clk); $stop;
	end
endmodule	// DDR_tb