onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CLK /Product_Register_TestBench/clk
add wave -noupdate -expand -group RESET /Product_Register_TestBench/reset
add wave -noupdate -expand -group INPUTS /Product_Register_TestBench/Load_enable
add wave -noupdate -expand -group INPUTS -radix decimal /Product_Register_TestBench/Product_Input
add wave -noupdate -expand -group OUTPUTS -radix decimal /Product_Register_TestBench/Product_Output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 396
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
WaveRestoreZoom {0 ps} {93 ps}
