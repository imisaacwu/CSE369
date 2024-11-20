// Testbench for simpleFSM
module simpleFSM_tb ();
  logic clk, reset, w;
  logic out;

  simpleFSM dut (.clk, .reset, .w, .out);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  // Set up the inputs to the design. Each line is a clock cycle.
  initial begin
    // Defining ALL input signals at t = 0 will avoid red (undefined) signals
    // in your simulation.
    reset <= 1; w <= 0; @(posedge clk);
    reset <= 0; w <= 0; @(posedge clk);
                        @(posedge clk);
                        @(posedge clk);
                        @(posedge clk);
                w <= 1; @(posedge clk);
                w <= 0; @(posedge clk);
                w <= 1; @(posedge clk);
                        @(posedge clk);
                        @(posedge clk);
                        @(posedge clk);
                w <= 0; @(posedge clk);
                        @(posedge clk);
    $stop;  // pause the simulation
  end
endmodule  // simpleFSM_tb