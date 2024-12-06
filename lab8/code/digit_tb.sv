module digit_tb();
	logic reset;
	logic [3:0] curr, out;
	logic [4:0] in;
	logic [1:0] carry_out;

	digit dut (.*);

	initial begin
		$monitor("curr=%d, in=%d, out=%d, carry=%d", curr, $signed(in), out, $signed(carry_out));
		curr = '0; in = '0; reset = 1; out = '0; carry_out = '0;
		#10; reset = 0;
		#10; curr = '0; in = 5'b01000;
		#10; curr = 4'b1000; in = 5'b00100;
		#10; curr = 4'b0010; in = 5'b11000;
		#10; curr = '0; in = 5'b11000;
		#10; curr = 4'b1001; in = 5'b01000;
	end
endmodule	// digit_tb