module lab3_tb();
  logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
  logic [9:0] LEDR;
  logic [3:0] KEY;
  logic [9:0] SW;

  // instantiate device under test
  lab3 dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);

  // test input sequence - try all combinations of inputs
  integer i;
  initial begin
    SW[9:4] = 1'b0;
    for(i = 0; i < 16; i++) begin
      SW[3:0] = i; #10;
    end
  end
endmodule  // lab3_tb
