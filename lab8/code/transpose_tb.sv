module transpose_tb();
	logic [15:0][15:0] in, out;
	
	transpose dut (.*);

	initial begin
		in = '0; out = '0;
		#50; in[0] = 16'hFFFF; in[13] = 16'hFFFF;
		#50;
	end
endmodule	// transpose_tb