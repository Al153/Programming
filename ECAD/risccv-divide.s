
.text
div:
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

	mv a2, a0
	mv a3, a1
	mv a0, zero # Q := 0                 -- initialize quotient and remainder to zero          
	mv a1, zero # R := 0 

	addi a4, zero, 1 # a4 := 1 << 31
	slli a4, a4, 31	# i is encoded by the bit number rather than the value


	divLoop:
		add a1, a1, a1 		# R = R + R = R << 1
		and t3, a2, a4       # R(0) := N(i)
		or a1, a1, t3

		bge a1, a3, increaseQ

		rest:

			beq a4, zero, divEnd	
			srli a4, a4, 1		# decrement i if it's > 0
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




.global main		# Export the symbol 'main' so we can call it from other files
.type main, @function
main:
	.macro  DEBUG_PRINT     reg
	csrw 0x7b2, \reg
	.endm

        addi    a0, zero, 12    # a0 <- 12
        addi    a1, zero, 4     # a1 <- 4
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder

        addi    a0, zero, 93    # a0 <- 93
        addi    a1, zero, 7     # a1 <- 7
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder

        lui     a0, (0x12345000>>12)
        ori     a0, a0, 0x678   # a0 <- 0x12345678
        addi    a1, zero, 255   # a1 <- 255
        call    div
        DEBUG_PRINT a0          # display the quotient
        DEBUG_PRINT a1          # display the remainder
