module runway (
	input  logic clk, reset,
	input  logic [1:0] sw,
	output logic [2:0] ledr
	);
	
	enum logic [2:0] {M = 3'b010, C = 3'b101, L = 3'b100, R = 3'b001} ps, ns;
	
	always_comb begin
		case (sw)
			2'b00: begin case (ps)
					C: ns = M;
					default: ns = C;
				endcase end
			2'b01: begin case (ps)
					M: ns = L;
					R: ns = M;
					default: ns = R;
				endcase end
			2'b10: begin case (ps)
					M: ns = R;
					L: ns = M;
					default: ns = L;
				endcase end
			default: ns = ps;
		endcase		
	end
	
	assign ledr = ps;

	always_ff @(posedge clk)
		if (reset)
			ps <= M;
		else
			ps <= ns;	
			
endmodule	// runway