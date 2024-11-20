// Top-level Module Test Bench
module cyber_war_tb();
	logic clk, L;
	logic [9:0] SW;
	logic [3:0] KEY;
	logic [6:0] HEX5, HEX0;
	logic [9:0] LEDR;
	
	cyber_war dut(.CLOCK_50(clk), .*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		// Reset
		SW = 10'b1100000000;		KEY[3] <= 1;	KEY[0] <= 1;	@(posedge clk);
		SW[9] <= 0;															@(posedge clk);
		
		// Wait for Cyber Player win
		for (i = 0; i < 25; i++) begin
			@(posedge clk);
		end
		
		// Soft Reset
		SW[9] <= 0;	SW[8] <= 1;	KEY[3] <= 0;	KEY[0] <= 1;	@(posedge clk);
										KEY[3] <= 1;						@(posedge clk);

		// Make Cyber Player slow
		SW = 10'b0000000001;
		
		// Player victory
		for (i = 0; i < 8; i++) begin
			KEY[0] <= 0; @(posedge clk);
			KEY[0] <= 1; @(posedge clk);
		end
		
		// Reset
		SW = 10'b1100000000;		KEY[3] <= 1;	KEY[0] <= 1;	@(posedge clk);
		SW[9] <= 0;															@(posedge clk);
		
		$stop;	// Pause
	end
	
endmodule	// cyber_war_tb