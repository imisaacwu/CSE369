module adder_tb();
	logic [9:0] A, B, sum;
	
	adder dut (.*);
	
	initial begin
		A = 10'h0;		B = 10'h1; 		#10;
		A = 10'h171;	B = 10'h8E;		#10;
		A = 10'd369;	B = 10'd655;	#10;
		A = 10'h3FF;	B = 10'h3FF;	#10;
		A = 10'h1FF;	B = 10'h1FF;	#10;
		A = 10'h200;	B = 10'h200;	#10;
	end
endmodule	// adder_tb