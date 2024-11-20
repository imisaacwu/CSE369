// D flip-flop
module d_ff (
	input logic clk, r_in,
	output logic R
	);
	
	logic buffer;
	
	always_comb begin
		R = buffer;
	end
	
	always_ff @(posedge clk) begin
		buffer <= r_in;
	end

endmodule	// d_ff