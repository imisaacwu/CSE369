onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /track_tb/clk
add wave -noupdate /track_tb/in
add wave -noupdate /track_tb/note
add wave -noupdate /track_tb/reset
add wave -noupdate /track_tb/pt
add wave -noupdate -radix hexadecimal -childformat {{{/track_tb/red[15]} -radix hexadecimal} {{/track_tb/red[14]} -radix hexadecimal} {{/track_tb/red[13]} -radix hexadecimal} {{/track_tb/red[12]} -radix hexadecimal} {{/track_tb/red[11]} -radix hexadecimal} {{/track_tb/red[10]} -radix hexadecimal} {{/track_tb/red[9]} -radix hexadecimal} {{/track_tb/red[8]} -radix hexadecimal} {{/track_tb/red[7]} -radix hexadecimal} {{/track_tb/red[6]} -radix hexadecimal} {{/track_tb/red[5]} -radix hexadecimal} {{/track_tb/red[4]} -radix hexadecimal} {{/track_tb/red[3]} -radix hexadecimal} {{/track_tb/red[2]} -radix hexadecimal} {{/track_tb/red[1]} -radix hexadecimal} {{/track_tb/red[0]} -radix hexadecimal}} -subitemconfig {{/track_tb/red[15]} {-radix hexadecimal} {/track_tb/red[14]} {-radix hexadecimal} {/track_tb/red[13]} {-radix hexadecimal} {/track_tb/red[12]} {-radix hexadecimal} {/track_tb/red[11]} {-radix hexadecimal} {/track_tb/red[10]} {-radix hexadecimal} {/track_tb/red[9]} {-radix hexadecimal} {/track_tb/red[8]} {-radix hexadecimal} {/track_tb/red[7]} {-radix hexadecimal} {/track_tb/red[6]} {-radix hexadecimal} {/track_tb/red[5]} {-radix hexadecimal} {/track_tb/red[4]} {-radix hexadecimal} {/track_tb/red[3]} {-radix hexadecimal} {/track_tb/red[2]} {-radix hexadecimal} {/track_tb/red[1]} {-radix hexadecimal} {/track_tb/red[0]} {-radix hexadecimal}} /track_tb/red
add wave -noupdate -radix hexadecimal /track_tb/grn
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
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3812 ps}
