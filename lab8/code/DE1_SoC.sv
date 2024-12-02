// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 output logic [9:0]  LEDR;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;
	 
	 
	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK;
	 
	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
	 
	 assign SYSTEM_CLOCK = clk[23]; // 1526 Hz clock signal
	 assign LED_REFRESH_CLOCK = clk[15];
	 assign LEDR[9] = SYSTEM_CLOCK;
	 
	 /* If you notice flickering, set SYSTEM_CLOCK faster.
	    However, this may reduce the brightness of the LED board. */
	
	 
	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic RST;                   // reset - toggle this on startup
	 
	 assign RST = SW[0];
	 
	 /* Standard LED Driver instantiation - set once and 'forget it'. 
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(LED_REFRESH_CLOCK), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);
	 
	 
	 /* LED board test submodule - paints the board with a static pattern.
	    Replace with your own code driving RedPixels and GrnPixels.
		 
	 	 KEY0      : Reset
		 =================================================================== */

	 logic [15:0][15:0] red;
	 logic [15:0][15:0] grn;
	 logic [3:0] in;
	 
	 edge_detector ed0 (.in(~KEY[0]), .out(in[0]), .clk(SYSTEM_CLOCK), .reset(RST));
	 edge_detector ed1 (.in(~KEY[1]), .out(in[1]), .clk(SYSTEM_CLOCK), .reset(RST));
	 edge_detector ed2 (.in(~KEY[2]), .out(in[2]), .clk(SYSTEM_CLOCK), .reset(RST));
	 edge_detector ed3 (.in(~KEY[3]), .out(in[3]), .clk(SYSTEM_CLOCK), .reset(RST));


	 logic [8:0] random;
	 lfsr rndm (.clk(SYSTEM_CLOCK), .reset(RST), .out(random));
	 
	 logic [3:0] pt;
	 track t0 (.clk(SYSTEM_CLOCK), .in(in[0]), .note(random[6] & random[3]), .reset(RST), .pt(pt[0]), .red(red[12]), .grn(grn[12]));
	 track t1 (.clk(SYSTEM_CLOCK), .in(in[1]), .note(random[2] & random[5]), .reset(RST), .pt(pt[1]), .red(red[13]), .grn(grn[13]));
	 track t2 (.clk(SYSTEM_CLOCK), .in(in[2]), .note(random[4] & random[8]), .reset(RST), .pt(pt[2]), .red(red[14]), .grn(grn[14]));
	 track t3 (.clk(SYSTEM_CLOCK), .in(in[3]), .note(random[7] & random[1]), .reset(RST), .pt(pt[3]), .red(red[15]), .grn(grn[15]));
	 
	 transpose tp_red (.in(red), .out(RedPixels));
	 transpose tp_grn (.in(grn), .out(GrnPixels));
	 
	 logic pts, dummy;
	 logic [4:0] buffer;
//	 assign pts = pt[0] + pt[1] + pt[2] + pt[3];
	 
	 digit d0 (.clk(SYSTEM_CLOCK), .in(pt[0]), .reset(RST), .hex(HEX0), .cout(buffer[0]));
	 digit d1 (.clk(SYSTEM_CLOCK), .in({3'b0, buffer[0]}), .reset(RST), .hex(HEX1), .cout(buffer[1]));
	 digit d2 (.clk(SYSTEM_CLOCK), .in({3'b0, buffer[1]}), .reset(RST), .hex(HEX2), .cout(buffer[2]));
	 digit d3 (.clk(SYSTEM_CLOCK), .in({3'b0, buffer[2]}), .reset(RST), .hex(HEX3), .cout(buffer[3]));
	 digit d4 (.clk(SYSTEM_CLOCK), .in({3'b0, buffer[3]}), .reset(RST), .hex(HEX4), .cout(buffer[4]));
	 digit d5 (.clk(SYSTEM_CLOCK), .in({3'b0, buffer[4]}), .reset(RST), .hex(HEX5), .cout(dummy));

	 
endmodule