module digit (curr, in, reset, out, carry_out);
	input logic reset;
	input logic [3:0] curr; // {0, 1, ... 9}
	input logic [4:0] in;	// {-8, -6, -4, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8}
	output logic [3:0] out;	// {0, 1, ... 9}
	output logic [1:0] carry_out; // {-1, 0, 1}
	
	logic [5:0] buffer;	// {-8, ... 17}
	always_comb begin
		buffer = curr + {in[4], in};
		if (buffer[5]) begin
			out = buffer + 6'b001010;
			carry_out = -1;
		end else if (buffer > 9) begin
			{buffer[5], out} = buffer - 10;
			carry_out = 1;
		end else begin
			out = buffer;
			carry_out = 0;
		end
	end

endmodule