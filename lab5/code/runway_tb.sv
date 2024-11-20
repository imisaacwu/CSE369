module runway_tb ();
	logic clk, reset;
	logic [1:0] SW;
	logic [2:0] LEDR;
	
	runway dut (.sw(SW), .ledr(LEDR), .*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		SW <= 2'b0;
		LEDR <= 3'b0;
		
		// Init
		reset <= 1;	 				 @(posedge clk);
		
		// Calm
		reset <= 0; SW <= 2'b00; @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
		// R to L
						SW <= 2'b01; @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 
		// L to R
						SW <= 2'b10; @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
										 @(posedge clk);
		$stop;	// Pause sim
	end
endmodule
										 