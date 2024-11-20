module display(
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	input  logic [2:0] SW
	);

	always_comb
		case (SW)
			// Banana
			3'b000: begin
			  HEX5 = 7'b0000011;
			  HEX4 = 7'b0001000;
			  HEX3 = 7'b1001000;
			  HEX2 = 7'b0001000;
			  HEX1 = 7'b1001000;
			  HEX0 = 7'b0001000;
			  end
			// Bottle
			3'b001: begin
			  HEX5 = 7'b0000011;
			  HEX4 = 7'b1000000;
			  HEX3 = 7'b0000111;
			  HEX2 = 7'b0000111;
			  HEX1 = 7'b1000111;
			  HEX0 = 7'b0000110;
			  end
			// Needle
			3'b011: begin
			  HEX5 = 7'b1001000;
			  HEX4 = 7'b0000110;
			  HEX3 = 7'b0000110;
			  HEX2 = 7'b0100001;
			  HEX1 = 7'b1000111;
			  HEX0 = 7'b0000110;
			  end
			// Pencil
			3'b100: begin
			  HEX5 = 7'b0001100;
			  HEX4 = 7'b0000110;
			  HEX3 = 7'b1001000;
			  HEX2 = 7'b1000110;
			  HEX1 = 7'b1111001;
			  HEX0 = 7'b1000111;
			  end
			// Spring
			3'b101: begin
			  HEX5 = 7'b0010010;
			  HEX4 = 7'b0001100;
			  HEX3 = 7'b0101111;
			  HEX2 = 7'b1111001;
			  HEX1 = 7'b1001000;
			  HEX0 = 7'b1000010;
			  end
			// Sponge
			3'b110: begin
			  HEX5 = 7'b0010010;
			  HEX4 = 7'b0001100;
			  HEX3 = 7'b1000000;
			  HEX2 = 7'b1001000;
			  HEX1 = 7'b1000010;
			  HEX0 = 7'b0000110;
			  end
			default: begin
			  HEX5 = 7'bX;
			  HEX4 = 7'bX;
			  HEX3 = 7'bX;
			  HEX2 = 7'bX;
			  HEX1 = 7'bX;
			  HEX0 = 7'bX;
		  end
		endcase

endmodule	// display