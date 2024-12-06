onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DDR_tb/clk
add wave -noupdate /DDR_tb/KEY
add wave -noupdate {/DDR_tb/SW[0]}
add wave -noupdate -radix hexadecimal /DDR_tb/red
add wave -noupdate -radix hexadecimal /DDR_tb/grn
add wave -noupdate /DDR_tb/HEX0
add wave -noupdate /DDR_tb/HEX1
add wave -noupdate /DDR_tb/HEX2
add wave -noupdate /DDR_tb/HEX3
add wave -noupdate /DDR_tb/HEX4
add wave -noupdate /DDR_tb/HEX5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {51 ps} 0}
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
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1299 ps}
