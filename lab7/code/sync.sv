// Synchronizer
module sync (
		input logic clk, r_in,
		output logic r_sync
	);
	
	logic buff;
	
	d_ff d0 (.R(buff), .*);
	d_ff d1 (.r_in(buff), .R(r_sync), .*);	

endmodule	// sync