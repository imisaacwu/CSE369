module addN #(parameter N=32) (A, B, S, C);
	input logic [N-1:0] A, B;
	output logic [N-1:0] S;
	output logic C;
	logic C2;
	
	always_comb begin
		{C2, S[N-2:0]} = A[N-2:0] + B[N-2:0];
		{C, S[N-1]} = A[N-1] + B[N-1] + C2;
	end
endmodule	// addN