// Top-level Module Test Bench
module tug_of_war_tb();
	logic clk;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [6:0] HEX0;
	logic [9:0] LEDR;
	
	tug_of_war dut(.CLOCK_50(clk), .*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		// Reset
		SW[9] <= 1;	KEY[3] <= 0;	KEY[0] <= 0;	@(posedge clk);
		SW[9] <= 0;											@(posedge clk);
		
		// Player 1 victory
											KEY[0] <= 1;	@(posedge clk);
											KEY[0] <= 0;	@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[0] <= 0;	@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[0] <= 0;	@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[0] <= 0;	@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[0] <= 0;	@(posedge clk);
		
		// Inputs after shouldn't change
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[1] <= 0;	@(posedge clk);
						KEY[3] <= 1;	KEY[0] <= 1;	@(posedge clk);
						KEY[3] <= 0;	KEY[0] <= 0;	@(posedge clk);
		
		// Reset
		SW[9] <= 1;	KEY[3] <= 0;	KEY[0] <= 0;	@(posedge clk);
		SW[9] <= 0;											@(posedge clk);
											
		// Player 2 victory
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
						
		// Inputs after shouldn't change
						KEY[3] <= 1;						@(posedge clk);
						KEY[3] <= 0;						@(posedge clk);
											KEY[0] <= 1;	@(posedge clk);
											KEY[1] <= 0;	@(posedge clk);
						KEY[3] <= 1;	KEY[0] <= 1;	@(posedge clk);
						KEY[3] <= 0;	KEY[0] <= 0;	@(posedge clk);
		
		// Reset
		SW[9] <= 1;	KEY[3] <= 0;	KEY[0] <= 0;	@(posedge clk);
		SW[9] <= 0;
		
		// Move LEDs around
		
		$stop;	// Pause
	end
	
endmodule	// tug_of_war_tb