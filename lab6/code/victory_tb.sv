// Victory display Test Bench
module victory_tb();
	logic clk, L, R, L_fin, R_fin, reset;
	logic [6:0] HEX0;
	
	victory dut (.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		// Reset
		reset <= 1;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
		reset <= 0;															@(posedge clk);

		// Inputs not near ends
		reset <= 0;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
						L <= 1;												@(posedge clk);
																				@(posedge clk);
									R <= 1;									@(posedge clk);
																				@(posedge clk);
						L <= 0;												@(posedge clk);
																				@(posedge clk);

		// Left win, make sure inputs after don't change display
		reset <= 0;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
						L <= 1;				L_fin <= 1;					@(posedge clk);
						L <= 0;				L_fin <= 0;					@(posedge clk);
									R <= 1;									@(posedge clk);
						L <= 1;												@(posedge clk);
						
		// Reset
		reset <= 1;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
		reset <= 0;															@(posedge clk);

		// Right win, same thing
		reset <= 0;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
									R <= 1;					R_fin <= 1;	@(posedge clk);
									R <= 0;					R_fin <= 0;	@(posedge clk);
						L <= 1;												@(posedge clk);
									R <= 1;									@(posedge clk);
									
		// Reset
		reset <= 1;	L <= 0;	R <= 0;	L_fin <= 0;	R_fin <= 0;	@(posedge clk);
		reset <= 0;															@(posedge clk);
																				@(posedge clk);
																				@(posedge clk);
																				@(posedge clk);

		$stop;	// Pause
	end
endmodule	// victory_tb