// Edge Detector
module edge_detector (
	input logic clk, in, reset,
	output logic out
	);
	
	// Logic is simple enough, don't need an enum
	// 0 inactive, 1 active
	logic ps, ns;
	
	always_comb begin
		case(ps)
			0: if (in) ns = 0;	// Held input, stay inactive
					else ns = 1;	// Falling edge
			1: if (in) ns = 0;	// Rising edge, go inactive after
					else ns = 1;	// No input, waiting for edge
		endcase
	end

	// Was previously active, now inactive (i.e. rising edge)
	assign out = (ns == 0 && ps == 1);
	
	always_ff @(posedge clk)
		if (reset)
			ps <= 0;
		else
			ps <= ns;

endmodule	// edge_detector
	
	