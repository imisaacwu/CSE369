/* Top-level module that defines the I/Os for the DE1-SoC board
 * and the circuit behavior.
 */
module lab3 (
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
  output logic [9:0] LEDR,
  input  logic [3:0] KEY,
  input  logic [9:0] SW
  );

  logic U, P, C, Mark, Discounted, Stolen;
  assign U = SW[3];
  assign P = SW[2];
  assign C = SW[1];
  assign Mark = SW[0];

  assign Discounted = P | (U & C);
  assign Stolen = (~U & ~C & ~Mark) | (U & ~P & ~Mark);

  assign LEDR[1] = Discounted;
  assign LEDR[0] = Stolen;

endmodule  // lab3
