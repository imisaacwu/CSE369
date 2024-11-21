/* Top-level module that defines the I/Os for the DE1-SoC board
 * and the circuit behavior.
 */
module lab2 (
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
  output logic [9:0] LEDR,
  input  logic [3:0] KEY,
  input  logic [9:0] SW
  );

  // Default values, turns off the HEX displays
  assign HEX0 = 7'b1111111;
  assign HEX1 = 7'b1111111;
  assign HEX2 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX4 = 7'b1111111;
  assign HEX5 = 7'b1111111;

  // 57
  logic D1, D0;
  // Logic to check if SW[3]-SW[0] match your bottom digit,
  assign D0 = ~SW[3] & SW[2] & SW[1] & SW[0];
  // and SW[7]-SW[4] match the next.
  assign D1 = ~SW[7] & SW[6] & ~SW[5] & SW[4];
  // Result should drive LEDR0.
  assign LEDR[0] = D1 & D0;

endmodule  // lab2
