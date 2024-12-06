module digit_display_tb();
	logic clk, reset;
	logic [3:0] in, out;
	logic [6:0] hex;
	
	digit_display dut(.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end

	integer i;
	initial begin
		reset <= 1; in <= '0; out <= '0; hex <= '0;
		@(posedge clk); reset <= 0;
		for (i = 0; i < 10; i++) begin
			@(posedge clk); in <= in + 1;
		end
		@(posedge clk);
		@(posedge clk); $stop;
	end
endmodule	// digit_display_tb