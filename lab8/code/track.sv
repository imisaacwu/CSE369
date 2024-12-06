module track (clk, in, note, reset, pt, red, grn);
	input logic clk, in, note, reset;
	output logic [1:0] pt;
	output logic [15:0] red, grn;

	logic [15:0] buffer = 16'b0;
	
	enum logic [1:0] {Hit = 2'b11, Early = 2'b10, Idle = 2'b01, Miss = 2'b00} points;
	
	always_comb begin
		if (in & buffer[14]) points = Hit;
		else if (in & buffer[13]) points = Early;
		else if (in) points = Miss;
		else points = Idle;
	end
	
	assign red = {buffer[15], !(in & buffer[14]), buffer[13:0]};
	assign grn = {1'b0, (!in | buffer[14]), 14'b0};
	
	assign pt = points;
	
	always_ff @(posedge clk) begin
		if (reset) buffer <= '0;
		else buffer <= {!in & buffer[14], buffer[13:0], note};
	end

endmodule	// track