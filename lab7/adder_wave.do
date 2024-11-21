onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /adder_tb/A
add wave -noupdate -radix unsigned /adder_tb/B
add wave -noupdate -radix unsigned /adder_tb/sum
add wave -noupdate -radix decimal -childformat {{{/adder_tb/A[9]} -radix decimal} {{/adder_tb/A[8]} -radix decimal} {{/adder_tb/A[7]} -radix decimal} {{/adder_tb/A[6]} -radix decimal} {{/adder_tb/A[5]} -radix decimal} {{/adder_tb/A[4]} -radix decimal} {{/adder_tb/A[3]} -radix decimal} {{/adder_tb/A[2]} -radix decimal} {{/adder_tb/A[1]} -radix decimal} {{/adder_tb/A[0]} -radix decimal}} -subitemconfig {{/adder_tb/A[9]} {-height 15 -radix decimal} {/adder_tb/A[8]} {-height 15 -radix decimal} {/adder_tb/A[7]} {-height 15 -radix decimal} {/adder_tb/A[6]} {-height 15 -radix decimal} {/adder_tb/A[5]} {-height 15 -radix decimal} {/adder_tb/A[4]} {-height 15 -radix decimal} {/adder_tb/A[3]} {-height 15 -radix decimal} {/adder_tb/A[2]} {-height 15 -radix decimal} {/adder_tb/A[1]} {-height 15 -radix decimal} {/adder_tb/A[0]} {-height 15 -radix decimal}} /adder_tb/A
add wave -noupdate -radix decimal /adder_tb/B
add wave -noupdate -radix decimal /adder_tb/sum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {200 ps}
