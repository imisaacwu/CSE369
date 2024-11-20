// LED Light module
module light #(parameter default_status=0) (
	input logic clk, L, R, LL, RL, reset,
	output logic out
	);
	
	// Logic is simple enough, don't need an enum
	// 0 LED off, 1 LED on
	logic ps = default_status, ns;
	
	always_comb begin	
		case(ps)
			0: if ((L & ~R & RL) | (~L & R & LL)) ns = 1;	// Light will be turned on
				else										  ns = 0;
			1: if (L ^ R)								  ns = 0;	// Position moved away from this light
				else										  ns = 1;
		endcase
	end

	assign out = ps;
	
	always_ff @(posedge clk)
		if (reset)
			ps <= default_status;
		else
			ps <= ns;

endmodule	// light
	