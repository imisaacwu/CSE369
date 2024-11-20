module dbl_seg7 (
  output logic [6:0] HEX0, HEX1,
  input  logic [7:0] SW
  );
  
  logic[6:0] inv_d1, inv_d2;
  
  seg7 d1 (.bcd(SW[3:0]), .leds(inv_d1));
  seg7 d2 (.bcd(SW[7:4]), .leds(inv_d2));
  
  assign HEX0 = ~inv_d1;
  assign HEX1 = ~inv_d2;

endmodule  // dbl_seg7
