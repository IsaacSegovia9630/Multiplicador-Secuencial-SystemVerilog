onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CLK /Multiplicador_Secuencial_TestBench/Clk_Input
add wave -noupdate -expand -group COUNTER -radix decimal /Multiplicador_Secuencial_TestBench/count
add wave -noupdate -expand -group INPUTS /Multiplicador_Secuencial_TestBench/Start_Input
add wave -noupdate -expand -group INPUTS /Multiplicador_Secuencial_TestBench/Reset_Input
add wave -noupdate -expand -group INPUTS -radix decimal /Multiplicador_Secuencial_TestBench/Multiplicand_Input
add wave -noupdate -expand -group INPUTS -radix decimal /Multiplicador_Secuencial_TestBench/Multiplier_Input
add wave -noupdate -expand -group {LOAD CONTROL OUTPUT} /Multiplicador_Secuencial_TestBench/Shift_CA2
add wave -noupdate -expand -group {LOAD CONTROL OUTPUT} -radix decimal /Multiplicador_Secuencial_TestBench/Multiplicand_Output
add wave -noupdate -expand -group {LOAD CONTROL OUTPUT} -radix decimal /Multiplicador_Secuencial_TestBench/Miltiplier_Output
add wave -noupdate -expand -group {LOAD CONTROL OUTPUT} /Multiplicador_Secuencial_TestBench/Sign_output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/Start_Output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/Enable_output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/Load_Enable_output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/Ready_Output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/State_output
add wave -noupdate -expand -group {CONTROL UNIT OUTPUT} /Multiplicador_Secuencial_TestBench/dut/C_UNIT/Current_state
add wave -noupdate -expand -group SHIFTERS -radix decimal /Multiplicador_Secuencial_TestBench/Right_Shifter_Multiplier_output
add wave -noupdate -expand -group SHIFTERS -radix decimal /Multiplicador_Secuencial_TestBench/Left_Shifter_Multiplicand_output
add wave -noupdate -expand -group {FINAL PRODUCT} -radix decimal /Multiplicador_Secuencial_TestBench/Product_Output
add wave -noupdate -expand -group {FINAL PRODUCT} /Multiplicador_Secuencial_TestBench/Product_Output_MUXANDSUM
add wave -noupdate -expand -group {PRODUCT CONVERTED} -radix decimal /Multiplicador_Secuencial_TestBench/Product_Converted_Output
add wave -noupdate -expand -group BIN_TO_BCD -radix hexadecimal /Multiplicador_Secuencial_TestBench/BIN2BCD
add wave -noupdate -expand -group {7 DISPLAYS OUTPUT} /Multiplicador_Secuencial_TestBench/Unidades_Segmentos_output
add wave -noupdate -expand -group {7 DISPLAYS OUTPUT} /Multiplicador_Secuencial_TestBench/Decenas_Segmentos_output
add wave -noupdate -expand -group {7 DISPLAYS OUTPUT} /Multiplicador_Secuencial_TestBench/Centenas_Segmentos_output
add wave -noupdate -expand -group {7 DISPLAYS OUTPUT} /Multiplicador_Secuencial_TestBench/Milesimas_Segmentos_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 565
configure wave -valuecolwidth 96
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
WaveRestoreZoom {0 ps} {61 ps}
