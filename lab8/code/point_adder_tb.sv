module point_adder_tb();
	logic [3:0][1:0] pts;
	logic [4:0] total;
	
	point_adder dut (.*);
	
//	Hit = 2'b11, Early = 2'b10, Idle = 2'b01, Miss = 2'b00
	initial begin
		total = 4'b0;
		pts = '{2'b00, 2'b00, 2'b00, 2'b00}; #10;
		pts = '{2'b10, 2'b10, 2'b10, 2'b10}; #10;
		pts = '{2'b11, 2'b11, 2'b10, 2'b10}; #10;
		pts = '{2'b11, 2'b11, 2'b11, 2'b11}; #10;
		pts = '{2'b11, 2'b11, 2'b00, 2'b00}; #10;
	end
endmodule	// point_adder_tb