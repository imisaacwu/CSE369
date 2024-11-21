onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /light_tb/clk
add wave -noupdate /light_tb/L
add wave -noupdate /light_tb/R
add wave -noupdate /light_tb/LL
add wave -noupdate /light_tb/RL
add wave -noupdate /light_tb/reset
add wave -noupdate /light_tb/normal
add wave -noupdate /light_tb/center
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {4 ns}
