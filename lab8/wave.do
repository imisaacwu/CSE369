onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cyber_war_tb/clk
add wave -noupdate {/cyber_war_tb/SW[9]}
add wave -noupdate /cyber_war_tb/SW
add wave -noupdate {/cyber_war_tb/KEY[3]}
add wave -noupdate {/cyber_war_tb/KEY[0]}
add wave -noupdate /cyber_war_tb/L
add wave -noupdate /cyber_war_tb/LEDR
add wave -noupdate /cyber_war_tb/HEX0
add wave -noupdate /cyber_war_tb/HEX5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3507 ps} 0}
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
WaveRestoreZoom {3358 ps} {4718 ps}
