// Digit display module
module digit (clk, in, reset, hex, cout);
	input logic clk, reset;
	input logic [3:0] in;
	output logic [6:0] hex;
	output logic cout;
	
	logic [3:0] count = 4'b0000;
	logic [3:0] buffer;
	
	addN #(4) adder (.A(count), .B(in), .S(buffer), .C(cout));

	always_comb begin
		case(count)
			4'b0000: hex = 7'b1000000;
			4'b0001: hex = 7'b1111001;
			4'b0010: hex = 7'b0100100;
			4'b0011: hex = 7'b0110000;
			4'b0100: hex = 7'b0011001;
			4'b0101: hex = 7'b0010010;
			4'b0110: hex = 7'b0000010;
			4'b0111: hex = 7'b1111000;
			4'b1000: hex = 7'b0000000;
			4'b1001: hex = 7'b0010000;
			default: hex = 7'bX;
		endcase
	end
	
	always_ff @(posedge clk) begin
		if (reset) count <= 4'b0000;
		else count <= buffer;
	end
endmodule	// digit