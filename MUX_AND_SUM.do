onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group COUNTER -radix unsigned /MUX_AND_SUM_TestBench/counter
add wave -noupdate -expand -group INPUTS -radix decimal /MUX_AND_SUM_TestBench/Multiplicand_Input
add wave -noupdate -expand -group INPUTS -radix decimal /MUX_AND_SUM_TestBench/Multiplier_Input
add wave -noupdate -expand -group INPUTS -radix decimal /MUX_AND_SUM_TestBench/Product_Input
add wave -noupdate -expand -group INPUTS /MUX_AND_SUM_TestBench/Shift_CA2
add wave -noupdate -expand -group OUTPUT -radix decimal /MUX_AND_SUM_TestBench/Product_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 290
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
WaveRestoreZoom {0 ps} {80 ps}
