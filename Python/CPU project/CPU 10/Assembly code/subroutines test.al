#Call max(@5,@7,@6)
#Call max
#Call stack.print
#Halt

import "Assembly code\\Floating_point"
Push @130
Call FP.exp
Call FP.display
Halt














Subroutine max(a,b)
	
	def a gp1
	def b gp2
	
	Compare a,b
	if Greater then {	
		Push a 
		Return	
	}
	else {
		Push b
		Return
	}


