nop

#test OF
#add
addi $1, $0, 65535	# r1 = 131071
sll $2, $1, 15		# r2 = r1 * 2^15
addi $3, $0, 32768	# r3 = 32768
add $1, $2, $3		# r1 = -2147483648 (r30=1)