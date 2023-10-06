transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/skeleton.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/dffe.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/regfile.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/bitCheck.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/alu.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/freqdiv.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/processor.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/operchecker.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/imem.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/dmem.v}

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/5/processor_test {D:/xy/GDA/MS/ECE/550/Project Checkpoints/5/processor_test/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
