module track_tb();
	logic clk, in, note, reset;
	logic [1:0] pt;
	logic [15:0] red, grn;
	track dut(.*);
	
	parameter CLK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		in <= 0; note <= 0; pt <= '0;
		red <= '0; grn <= '0;

		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		note <= 1;	@(posedge clk);
		note <= 0;	@(posedge clk);
		note <= 1;	@(posedge clk);
		note <= 0;	@(posedge clk);
		@(posedge clk);
		in <= 1;		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		in <= 0;
		
		for(i = 1; i < 7; i++) begin
			@(posedge clk);
		end
		in <= 1;		@(posedge clk);
		in <= 0;		@(posedge clk);
		@(posedge clk);
		in <= 1;		@(posedge clk);
		in <= 0;		@(posedge clk);
		
		$stop;
	end

endmodule	// track_tb