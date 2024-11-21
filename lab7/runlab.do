# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./code/cyber_war.sv"
vlog "./code/cyber_war_tb.sv"
vlog "./code/sync.sv"
vlog "./code/d_ff.sv"
vlog "./code/edge_detector.sv"
vlog "./code/light.sv"
vlog "./code/lfsr.sv"
vlog "./code/adder.sv"
vlog "./code/counter.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work cyber_war_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
