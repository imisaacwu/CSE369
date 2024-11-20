// 10-bit Adder
module adder (
	input logic [9:0] A, B,
	output logic [9:0] sum
	);
	
	logic [1:0] C; // carry bits
	
	always_comb begin
		{C[1], sum[8:0]} = A[8:0] + B[8:0];
		{C[0], sum[9]} = A[9] + B[9] + C[1];
	end

endmodule	// adder