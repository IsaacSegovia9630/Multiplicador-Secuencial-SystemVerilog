onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CLK /Control_Unit_TestBench/clk
add wave -noupdate -expand -group RESET /Control_Unit_TestBench/reset_Input
add wave -noupdate -expand -group INPUTS /Control_Unit_TestBench/Counter
add wave -noupdate -expand -group INPUTS /Control_Unit_TestBench/start
add wave -noupdate -expand -group OUTPUTS /Control_Unit_TestBench/Enable_output
add wave -noupdate -expand -group OUTPUTS /Control_Unit_TestBench/Load_Enable_output
add wave -noupdate -expand -group OUTPUTS /Control_Unit_TestBench/Ready_output
add wave -noupdate -expand -group OUTPUTS /Control_Unit_TestBench/State_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 288
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
WaveRestoreZoom {0 ps} {82 ps}
