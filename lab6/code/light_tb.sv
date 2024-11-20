// Light Test Bench
module light_tb();
	logic clk, L, R, LL, RL, reset;
	logic normal, center;
	
	light dut_n (.out(normal), .*);
	light #(1) dut_c (.out(center), .*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		// Init
		normal <= 0; center <= 1;
		reset <= 1;	L <= 0;	R <= 0;	LL <= 0;	RL <= 0; @(posedge clk);
		
		// Input not near this light
		reset <= 0;	L <= 1;	R <= 0;	LL <= 0;	RL <= 0;	@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
									R <= 1;							@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
						L <= 0;										@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
		
		// Left input, right light on
		reset <= 0;	L <= 0;	R <= 0;	LL <= 0;	RL <= 1;	@(posedge clk);
						L <= 1;										@(posedge clk);
									R <= 1;							@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
						L <= 0;	R <= 0;							@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
									R <= 1;							@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
		
		// Right input, left light on
		reset <= 0;	L <= 0;	R <= 0;	LL <= 1;	RL <= 0;	@(posedge clk);
									R <= 1;							@(posedge clk);
						L <= 1;										@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
						L <= 0;	R <= 0;							@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
						L <= 1;										@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
																		
		// Reset lights
		reset <= 1;	L <= 0;	R <= 0;	LL <= 0;	RL <= 0; @(posedge clk);
		reset <= 0;													@(posedge clk);
																		@(posedge clk);
																		@(posedge clk);
		
		$stop;	// Pause
	end
endmodule	// light_tb