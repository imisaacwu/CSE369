// Victory HEX display module
module victory (
	input logic clk, L, R, L_fin, R_fin, reset,
	output logic [6:0] HEX5, HEX0
	);
	
	counter left  (.in(L & ~R & L_fin), .out(HEX5), .*);
	counter right (.in(R & ~L & R_fin), .out(HEX0), .*);
	
endmodule	// victory