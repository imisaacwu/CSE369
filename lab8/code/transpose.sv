module transpose (in, out);
	input logic [15:0][15:0] in;
	output logic [15:0][15:0] out;
	
	always_comb begin
		integer i, j;
		for(i = 0; i < 16; i++)
			for(j = 0; j < 16; j++)
				out[i][j] = in[j][i];
	end
endmodule	// transpose