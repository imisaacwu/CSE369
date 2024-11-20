// Top-level Module
module tug_of_war #(parameter clock_no=23) (
	input logic CLOCK_50,		// 50 MHz clock
	input logic [9:0] SW,
	input logic [3:0] KEY,
	output logic [6:0] HEX0,
	output logic [9:0] LEDR
	);
	
//	logic [31:0] clks;
//	clock_divider cdiv (.clock(CLOCK_50), .divided_clocks(clks));
	logic clk;
	assign clk = CLOCK_50;
//	assign clk = clks[clock_no];

	// User inputs
	logic l_in, r_in, reset_in;
	assign l_in = ~KEY[3];
	assign r_in = ~KEY[0];
	assign reset_in = SW[9];

	// Synchronized inputs
	logic l_sync, r_sync, reset_sync;
	sync sync (.*);
	
	// Edge detectors
	logic L, R, reset;
	edge_detector left  (.in(l_sync), .out(L), .*);
	edge_detector right (.in(r_sync), .out(R), .*);
	assign reset = reset_sync;
	
	light #(0) L9 (.out(LEDR[9]), .LL(0),		  .RL(LEDR[8]), .*);
	light #(0) L8 (.out(LEDR[8]), .LL(LEDR[9]), .RL(LEDR[7]), .*);
	light #(0) L7 (.out(LEDR[7]), .LL(LEDR[8]), .RL(LEDR[6]), .*);
	light #(0) L6 (.out(LEDR[6]), .LL(LEDR[7]), .RL(LEDR[5]), .*);
	light #(1) L5 (.out(LEDR[5]), .LL(LEDR[6]), .RL(LEDR[4]), .*);
	light #(0) L4 (.out(LEDR[4]), .LL(LEDR[5]), .RL(LEDR[3]), .*);
	light #(0) L3 (.out(LEDR[3]), .LL(LEDR[4]), .RL(LEDR[2]), .*);
	light #(0) L2 (.out(LEDR[2]), .LL(LEDR[3]), .RL(LEDR[1]), .*);
	light #(0) L1 (.out(LEDR[1]), .LL(LEDR[2]), .RL(0),		 .*);
	
	// Unused LEDR[0]
	assign LEDR[0] = 0;
	
	victory vic (.L_fin(LEDR[9]), .R_fin(LEDR[1]), .*);
	
endmodule	// tug_of_war