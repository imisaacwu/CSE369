// 9-bit Linear Feedback Shift Register
module lfsr (
	input logic clk, reset,
	output logic [8:0] out
	);
	
	always_ff @(posedge clk) begin
		if (reset) out <= 9'b0;
		else out <= {out[7:0], ~(out[8] ^ out[4])};
	end

endmodule	// lfsr