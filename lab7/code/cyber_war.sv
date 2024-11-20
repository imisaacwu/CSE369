// Top-level Module
module cyber_war #(parameter clock_no=20) (
	input logic CLOCK_50,
	input logic [9:0] SW,
	input logic [3:0] KEY,
	output logic [6:0] HEX5, HEX0,
	output logic [9:0] LEDR,
	output logic L
	);
	
	logic [clock_no-1:0] clks;
	clock_divider #(clock_no) cdiv (.clock(CLOCK_50), .divided_clocks(clks));
	logic clk;
	assign clk = clks[clock_no-1];
//	assign clk = CLOCK_50;

	// User inputs
	logic r_in, reset_in, soft_reset_in;
	assign r_in = ~KEY[0];
	assign reset_in = SW[9];
	assign soft_reset_in = ~KEY[3];

	// Synchronize input
	logic r_sync;
	sync sync (.*);
	
	// Edge detector
	logic R, reset;
	edge_detector right (.in(r_sync), .out(R), .*);
	
	assign reset = reset_in | soft_reset_in;
	
	// Randomizer
	logic [8:0] random;
	logic [9:0] sum;
	lfsr r (.clk, .reset(reset_in), .out(random));
	adder add (.A({1'b0, random}), .B({1'b0, SW[8:0]}), .sum);
	
	assign rand_out = random;
	assign sum_out = sum;
	assign L = (sum[9] == 1);
	
	light #(0) L9 (.out(LEDR[9]), .LL(0),		  .RL(LEDR[8]), .L, .R, .*);
	light #(0) L8 (.out(LEDR[8]), .LL(LEDR[9]), .RL(LEDR[7]), .L, .R, .*);
	light #(0) L7 (.out(LEDR[7]), .LL(LEDR[8]), .RL(LEDR[6]), .L, .R, .*);
	light #(0) L6 (.out(LEDR[6]), .LL(LEDR[7]), .RL(LEDR[5]), .L, .R, .*);
	light #(1) L5 (.out(LEDR[5]), .LL(LEDR[6]), .RL(LEDR[4]), .L, .R, .*);
	light #(0) L4 (.out(LEDR[4]), .LL(LEDR[5]), .RL(LEDR[3]), .L, .R, .*);
	light #(0) L3 (.out(LEDR[3]), .LL(LEDR[4]), .RL(LEDR[2]), .L, .R, .*);
	light #(0) L2 (.out(LEDR[2]), .LL(LEDR[3]), .RL(LEDR[1]), .L, .R, .*);
	light #(0) L1 (.out(LEDR[1]), .LL(LEDR[2]), .RL(0),		 .L, .R, .*);
	
	// Unused LEDR[0]
	assign LEDR[0] = 0;
	
	// Win counters
	counter l_count (.in(L & ~R & LEDR[9]), .out(HEX5), .reset(reset_in), .*);
	counter r_count (.in(R & ~L & LEDR[1]), .out(HEX0), .reset(reset_in), .*);
	
endmodule	// cyber_war
