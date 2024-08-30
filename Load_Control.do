onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group INPUTS -radix decimal /Load_Control_TestBench/Multiplicand_Input
add wave -noupdate -expand -group INPUTS -radix decimal /Load_Control_TestBench/Miltiplier_Input
add wave -noupdate -expand -group OUTPUTS -radix decimal /Load_Control_TestBench/Multiplicand_Output
add wave -noupdate -expand -group OUTPUTS -radix decimal /Load_Control_TestBench/Miltiplier_Output
add wave -noupdate -expand -group OUTPUTS /Load_Control_TestBench/Shift_CA2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
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
WaveRestoreZoom {0 ps} {34 ps}
