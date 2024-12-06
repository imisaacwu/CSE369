module digit_display (clk, in, reset, hex, out);
	input logic clk, reset;
	input logic [3:0] in;
	output logic [6:0] hex;
	output logic [3:0] out;
	
	logic [3:0] state = '0;
	
	always_comb begin
		case (state)
			4'b0000: hex = 7'b1000000;	// 0
			4'b0001: hex = 7'b1111001;	// 1
			4'b0010: hex = 7'b0100100;	// 2
			4'b0011: hex = 7'b0110000;	// 3
			4'b0100: hex = 7'b0011001;	// 4
			4'b0101: hex = 7'b0010010;	// 5
			4'b0110: hex = 7'b0000010;	//	6
			4'b0111: hex = 7'b1111000;	// 7
			4'b1000: hex = 7'b0000000;	// 8
			4'b1001: hex = 7'b0010000;	// 9
			default: hex = 7'bX;
		endcase
	end
	
	assign out = state;
	
	always_ff @(posedge clk) begin
		if (reset) state <= '0;
		else state <= in;
	end

endmodule	// digit_display