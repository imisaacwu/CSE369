onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /victory_tb/clk
add wave -noupdate /victory_tb/reset
add wave -noupdate /victory_tb/L
add wave -noupdate /victory_tb/R
add wave -noupdate /victory_tb/L_fin
add wave -noupdate /victory_tb/R_fin
add wave -noupdate /victory_tb/HEX0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1581 ps}
