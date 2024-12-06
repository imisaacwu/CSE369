// Top-level module that defines the I/Os for the DE-1 SoC board
module DDR (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50, red, grn);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 output logic [9:0]  LEDR;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;
	 
//	 logic [31:0] clk;
//	 logic SYSTEM_CLOCK;
//	 
//	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
//	 
//	 assign SYSTEM_CLOCK = clk[22]; // 1526 Hz clock signal
//	 assign LED_REFRESH_CLOCK = clk[15];
	 assign SYSTEM_CLOCK = CLOCK_50;
	 assign LED_REFRESH_CLOCK = CLOCK_50;
	 
	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic reset;                 // reset - toggle this on startup
	 
	 assign reset = SW[0];
	 
	 /* Standard LED Driver instantiation - set once and 'forget it'. 
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(LED_REFRESH_CLOCK), .RST(reset), .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);

	 output logic [15:0][15:0] red, grn;

	 logic [8:0] random;
	 lfsr rndm (.clk(SYSTEM_CLOCK), .reset, .out(random));
	 
	 logic [3:0][1:0] pts;
	 track t0 (.clk(SYSTEM_CLOCK), .in(~KEY[0]), .note(random[6] & random[3]), .reset, .pt(pts[0]), .red(red[12]), .grn(grn[12]));
	 track t1 (.clk(SYSTEM_CLOCK), .in(~KEY[1]), .note(random[2] & random[5]), .reset, .pt(pts[1]), .red(red[13]), .grn(grn[13]));
	 track t2 (.clk(SYSTEM_CLOCK), .in(~KEY[2]), .note(random[4] & random[8]), .reset, .pt(pts[2]), .red(red[14]), .grn(grn[14]));
	 track t3 (.clk(SYSTEM_CLOCK), .in(~KEY[3]), .note(random[7] & random[1]), .reset, .pt(pts[3]), .red(red[15]), .grn(grn[15]));
	 
	 transpose tp_red (.in(red), .out(RedPixels));
	 transpose tp_grn (.in(grn), .out(GrnPixels));
	 
	 logic [4:0] total;
	 point_adder adder (.pts, .total);
	 
	 logic [5:0][3:0] state;
	 logic [5:0][3:0] state_buff;
	 logic [5:0][1:0] c_buff;

	 digit d0 (.curr(state[0]), .in(total), 									.reset, .out(state_buff[0]), .carry_out(c_buff[0]));
	 digit d1 (.curr(state[1]), .in({{3{c_buff[0][1]}}, c_buff[0]}),	.reset, .out(state_buff[1]), .carry_out(c_buff[1]));
	 digit d2 (.curr(state[2]), .in({{3{c_buff[1][1]}}, c_buff[1]}),	.reset, .out(state_buff[2]), .carry_out(c_buff[2]));
	 digit d3 (.curr(state[3]), .in({{3{c_buff[2][1]}}, c_buff[2]}),	.reset, .out(state_buff[3]), .carry_out(c_buff[3]));
	 digit d4 (.curr(state[4]), .in({{3{c_buff[3][1]}}, c_buff[3]}),	.reset, .out(state_buff[4]), .carry_out(c_buff[4]));
	 digit d5 (.curr(state[5]), .in({{3{c_buff[4][1]}}, c_buff[4]}),	.reset, .out(state_buff[5]), .carry_out(c_buff[5]));
	 
	 digit_display dd0 (.clk(SYSTEM_CLOCK), .in(state_buff[0]), .reset, .hex(HEX0), .out(state[0]));
	 digit_display dd1 (.clk(SYSTEM_CLOCK), .in(state_buff[1]), .reset, .hex(HEX1), .out(state[1]));
	 digit_display dd2 (.clk(SYSTEM_CLOCK), .in(state_buff[2]), .reset, .hex(HEX2), .out(state[2]));
	 digit_display dd3 (.clk(SYSTEM_CLOCK), .in(state_buff[3]), .reset, .hex(HEX3), .out(state[3]));
	 digit_display dd4 (.clk(SYSTEM_CLOCK), .in(state_buff[4]), .reset, .hex(HEX4), .out(state[4]));
	 digit_display dd5 (.clk(SYSTEM_CLOCK), .in(state_buff[5]), .reset, .hex(HEX5), .out(state[5]));
	 
endmodule	// DDR