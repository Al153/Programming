# Practical class and tick: ECAD+Arch Tick 1
# Full Name: Alexander Taylor
# CRSID: at736
# College: St John's

.text
do_div:
	addi sp,sp,-32	# Allocate stack space
	
	# store any callee-saved register you might overwrite
	sw ra, 0(sp)
	
	# do your work




	          
	# for i = n-1...0 do     -- where n is number of bits in N
  		# R := R << 1          -- left-shift R by 1 bit
  		# R(0) := N(i)         -- set the least-significant bit of R equal to bit i of the numerator
  		# if R >= D then
    		# R := R - D
    		# Q(i) := 1
  		# end
	# end
	# 
	# In assembly, write a function div that for two numbers in
	# registers a0 and a1, calculates (a0/a1) and returns the quotient
	# in a0 and remainder in a1. Use the provided example-asm
	# framework as a starting point, and put your function at
	# the top of main.s. Call it from the main() function. 

	# Q: a0
	# R: a1
	# N: a2
	# D: a3
	# i: a4
	# t: t3

	mv a2, a0
	mv a3, a1
	mv a0, zero # Q := 0                 -- initialize quotient and remainder to zero          
	mv a1, zero # R := 0 

	addi a4, zero, 1 # a4 := 1 << 31
	slli a4, a4, 31	# i is encoded by the bit number rather than the value


	divLoop:
		slli a1, a1, 1 		# R = R << 1
		and t3, a2, a4       # R(0) := N(i), use temp in this line

		beq t3, zero, skip
			addi t3, zero, 1 # t3 = 0 if t3 == 0 else 1
		skip:
			or a1, a1, t3		# then or it with a1
	

		bge a1, a3, increaseQ

		rest:
			srli a4, a4, 1		# decrement i if it's > 0
			beq a4, zero, divEnd
			j divLoop # unconditional jump

	divEnd:
		# load every register you stored above
		lw ra, 0(sp)
		addi sp,sp,32 	# Free up stack space
		ret


	increaseQ:
		sub a1, a1, a3
		or a0, a0, a4
		j rest




.global asm_main		# Export the symbol 'main' so we can call it from other files
.type main, @function
asm_main:
	.macro  DEBUG_PRINT     reg
	csrw 0x7b2, \reg
	.endm

        addi    a0, zero, 1    # a0 <- 12
        addi    a1, zero, 1     # a1 <- 4
        DEBUG_PRINT a0
        DEBUG_PRINT a1
        call    do_div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder

