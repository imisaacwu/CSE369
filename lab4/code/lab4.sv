module lab4 (
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
  output logic [9:0] LEDR,
  input  logic [3:0] KEY,
  input  logic [9:0] SW
	);

	lab3 sale_stolen (.LEDR, .KEY, .SW);
	display item (.SW(SW[3:1]), .*);

endmodule	// lab4
