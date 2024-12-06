module point_adder (pts, total);
	input logic [3:0][1:0] pts;
	output logic [4:0] total;
	
	logic [4:0] buffer;
	
	integer i;
	always_comb begin
		buffer = '0;

	//	Hit = 2'b11, Early = 2'b10, Idle = 2'b01, Miss = 2'b00
		for (i = 0; i < 4; i++) begin
			if (pts[i] == 2'b11) buffer += 4'b0010;
			else if (pts[i] == 2'b10) buffer += 4'b0001;
			else if (pts[i] == 2'b00) buffer -= 4'b0010;
		end
		total = buffer;
	end
endmodule	// point_adder