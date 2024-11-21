onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate {/lab4_tb/SW[3]}
add wave -noupdate {/lab4_tb/SW[2]}
add wave -noupdate {/lab4_tb/SW[1]}
add wave -noupdate {/lab4_tb/SW[0]}
add wave -noupdate {/lab4_tb/LEDR[0]}
add wave -noupdate {/lab4_tb/LEDR[1]}
add wave -noupdate /lab4_tb/HEX0
add wave -noupdate /lab4_tb/HEX1
add wave -noupdate /lab4_tb/HEX2
add wave -noupdate /lab4_tb/HEX3
add wave -noupdate /lab4_tb/HEX4
add wave -noupdate /lab4_tb/HEX5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {324 ps}
