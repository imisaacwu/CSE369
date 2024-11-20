// Victory HEX display module
module victory (
	input logic clk, L, R, L_fin, R_fin, reset,
	output logic [6:0] HEX0
	);
	
	enum logic [6:0] {Off = 7'b1111111, Left = 7'b0100100, Right = 7'b1111001} ps, ns;
	
	always_comb begin
		case(ps)
			Off: begin
					if(L & ~R & L_fin) ns = Left;
					else if(R & ~L & R_fin) ns = Right;
					else ns = ps;
				end
			default: ns = ps;
		endcase
	end
	
	assign HEX0 = ps;
	
	always_ff @(posedge clk)
		if (reset)
			ps <= Off;
		else
			ps <= ns;

endmodule	// victory