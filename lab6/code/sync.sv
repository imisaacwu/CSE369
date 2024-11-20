// Synchronizer
module sync (
		input logic clk, l_in, r_in, reset_in,
		output logic l_sync, r_sync, reset_sync
	);
	
	// {l, r, reset}
	logic [2:0] buff;
	
	d_ff d0 (.L(buff[0]), .R(buff[1]), .reset(buff[2]), .*);
	d_ff d1 (.l_in(buff[0]), .r_in(buff[1]), .reset_in(buff[2]),
				.L(l_sync), .R(r_sync), .reset(reset_sync), .*);	

endmodule	// sync