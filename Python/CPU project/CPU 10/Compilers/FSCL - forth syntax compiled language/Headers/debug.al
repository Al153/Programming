Subroutine debug.print_flags()
	Out @'F'
	Out @':' 
	Out @32
	Outd Flags_set
	Out  @10
	Return

Subroutine debug.wait() 
	Out @'P'
	Out @'r'
	Out @'e'
	Out @'s'
	Out @'s'
	Out @32
	Out @'a'
	Out @'n'
	Out @'y'
	Out @32
	Out @'k'
	Out @'e'
	Out @'y'
	Out @32
	Out @'t'
	Out @'o'
	Out @32
	Out @'c'
	Out @'o'
	Out @'n'
	Out @'t'
	Out @'i'
	Out @'n'
	Out @'u'
	Out @'e'
	Out @10
	In gp0 %debug.wait_loop
	if gp0 then Return
	Load PC debug.wait_loop

Subroutine debug.clear_flags()
	Move Zero Flags_reset
	Return

Subroutine debug.print_acc()
	Out @'A'
	Out @':' 
	Out @32
	Outd Accumulator
	Out  @10
	Return