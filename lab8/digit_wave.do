onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /digit_tb/reset
add wave -noupdate -radix unsigned /digit_tb/curr
add wave -noupdate -radix decimal -childformat {{{/digit_tb/in[4]} -radix decimal} {{/digit_tb/in[3]} -radix decimal} {{/digit_tb/in[2]} -radix decimal} {{/digit_tb/in[1]} -radix decimal} {{/digit_tb/in[0]} -radix decimal}} -subitemconfig {{/digit_tb/in[4]} {-height 15 -radix decimal} {/digit_tb/in[3]} {-height 15 -radix decimal} {/digit_tb/in[2]} {-height 15 -radix decimal} {/digit_tb/in[1]} {-height 15 -radix decimal} {/digit_tb/in[0]} {-height 15 -radix decimal}} /digit_tb/in
add wave -noupdate -radix unsigned /digit_tb/out
add wave -noupdate -radix decimal /digit_tb/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {221 ps} 0}
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
WaveRestoreZoom {0 ps} {250 ps}
