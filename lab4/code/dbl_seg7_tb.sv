module dbl_seg7_tb();
  logic [7:0] SW;
  logic [6:0] HEX0, HEX1;
	
	// Instantiate device under test
	dbl_seg7 dut (.HEX0, .HEX1, .SW);
	
	// Try all switch combinations
	integer i;
	initial begin
	  SW[7:0] = 1'b0;
	  for(i = 0; i < 256; i++) begin
	    SW = i; #20;
	  end
	end
endmodule	// dbl_seg7_tb