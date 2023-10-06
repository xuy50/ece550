transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/skeleton_test.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/dffe.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/regfile.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/bitCheck.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/alu.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/freqdiv.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/processor.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/operchecker.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/imem.v}
vlog -vlog01compat -work work +incdir+D:/xy/GDA/MS/ECE/550/Project\ Checkpoints/4/processor {D:/xy/GDA/MS/ECE/550/Project Checkpoints/4/processor/dmem.v}

