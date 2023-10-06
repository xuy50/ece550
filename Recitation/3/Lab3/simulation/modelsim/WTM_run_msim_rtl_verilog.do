transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3 {D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3/fadder.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3 {D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3/WTM.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3 {D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3/hadder.v}

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3 {D:/xy/GDA/MS/ECE/550/Recitation/3/Lab3/WTM_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  WTM_tb

add wave *
view structure
view signals
run -all
