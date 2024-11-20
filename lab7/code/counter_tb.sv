module counter_tb();
	logic clk, in, reset;
	logic [6:0] out;
	
	counter dut (.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		reset <= 1; in <= 0; @(posedge clk);
		reset <= 0; 			@(posedge clk);
		
		for(i = 0; i < 7; i++) begin
			in <= 1; @(posedge clk);
			in <= 0; @(posedge clk);
		end
		
		reset <= 1; in <= 0; @(posedge clk);
		reset <= 0; 			@(posedge clk);
		
		$stop;
	end
endmodule	// counter_tb