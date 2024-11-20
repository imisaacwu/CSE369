// Win Counter module
module counter (
	input logic clk, in, reset,
	output logic [6:0] out
	);
	
	logic [2:0] count = 3'b000;
	
	always_comb begin
		case(count)
			3'b000: out = 7'b1000000;
			3'b001: out = 7'b1111001;
			3'b010: out = 7'b0100100;
			3'b011: out = 7'b0110000;
			3'b100: out = 7'b0011001;
			3'b101: out = 7'b0010010;
			3'b110: out = 7'b0000010;
			3'b111: out = 7'b1111000;
		endcase
	end
	
		
	always_ff @(posedge clk) begin
		if (reset) count <= 3'b000;
		else if(in) count <= count + 1;
	end

endmodule	// counter