transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Multiplicador_Secuencial.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Control_Unit.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/OneShot.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Load_Control.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/MUX_AND_SUM.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Right_Shifter.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Left_Shifter.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Product_Register.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Counter.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Bin_2_BCD.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Conversor_Valor_Absoluto.sv}
vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/BCD_7Display.sv}

vlog -sv -work work +incdir+C:/Users/isaac/OneDrive\ -\ ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial {C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/Multiplicador_Secuencial_TestBench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Multiplicador_Secuencial_TestBench

do C:/Users/isaac/OneDrive - ITESO/ITESO/Veri/Fall2024/Practicas/Practica1_Multiplicador_Secuencial/simulation/modelsim/MULT_SECUENCIAL.do
