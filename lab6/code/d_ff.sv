// D flip-flop
module d_ff (
	input logic clk, l_in, r_in, reset_in,
	output logic L, R, reset
	);
	
	// {l, r, reset}
	logic [2:0] buffer;
	
	always_comb begin
		L = buffer[0];
		R = buffer[1];
		reset = buffer[2];
	end
	
	always_ff @(posedge clk) begin
		buffer <= {reset_in, r_in, l_in};
	end

endmodule	// d_ff