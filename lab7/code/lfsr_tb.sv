module lfsr_tb();
	logic clk, reset, indicator;
	logic [8:0] out;

	assign indicator = (out == 9'b0);
	
	lfsr dut (.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		
		for(i = 1; i < 1000; i++) begin
			@(posedge clk);
		end
		
		$stop;
	end
endmodule	// lfsr_tb