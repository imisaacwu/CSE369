// Edge Detector Test Bench
module edge_detector_tb ();
	logic clk, in, out, reset;
	
	edge_detector dut (.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		in <= 0;
		out <= 0;
		reset <= 0;
		
		// Init
		reset <= 1;				@(posedge clk);
		reset <= 0;				@(posedge clk);
		
		// No input test
									@(posedge clk);
									@(posedge clk);

		// One cycle press
		reset <= 1;
		reset <= 0; in <= 1; @(posedge clk);
						in <= 0; @(posedge clk);
									@(posedge clk);
		// Press & hold
		reset <= 1;
		reset <= 0; in <= 1; @(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);		
						in <= 0; @(posedge clk);

		$stop; // Pause
	end
endmodule	// edge_detector_tb