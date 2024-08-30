onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CLK /Left_Shifter_TestBench/clk
add wave -noupdate -expand -group ENABLE /Left_Shifter_TestBench/enable
add wave -noupdate -expand -group ENABLE /Left_Shifter_TestBench/Load_enable
add wave -noupdate -expand -group RESET /Left_Shifter_TestBench/reset
add wave -noupdate -expand -group INPUT /Left_Shifter_TestBench/Data_Input
add wave -noupdate -expand -group OUTPUT /Left_Shifter_TestBench/Data_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {415 ps} 0}
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
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {114 ps}
