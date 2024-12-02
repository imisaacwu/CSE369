module track (clk, in, note, reset, pt, red, grn);
	input logic clk, in, note, reset;
	output logic pt;
	output logic [15:0] red, grn;

	logic [15:0] buffer = '0;
	
	always_comb begin
		red = {buffer[15], !(in & buffer[14]), buffer[13:0]};
		grn = {1'b0, !(in & !buffer[14]), 14'b0};
	end
	
	assign pt = (in & buffer[14]);
	
	always_ff @(posedge clk) begin
		if (reset) buffer <= '0;
		else buffer <= {buffer[14:0], note};
	end

endmodule	// track