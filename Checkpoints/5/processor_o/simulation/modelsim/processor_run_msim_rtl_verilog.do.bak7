transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/skeleton.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/dffe.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/regfile.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/bitCheck.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/alu.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/freqdiv.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/processor.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/operchecker.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/imem.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/dmem.v}

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_o {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_o/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
