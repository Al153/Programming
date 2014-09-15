Struct Context 		#context storage
	int Zero	0
	int One		0
	int Accumulator	0
	int Jump		0
	int PC			0
	int Flags_set		0
	int Flags_reset		0
	int Stack_pointer	0
	int gp0		0
	int gp1		0
	int gp2		0
	int gp3		0
	int gp4		0
	int gp5		0
	int gp6		0
	int gp7		0
end Struct


int Context_switch.current_context 0 
int Context_switch.previous_context

#_____________ init _____________
Context Context0
Context Context1
Context Context2
Context Context3

#_____________ set context _____________
#gp0: address ==> none
ptr Context_switch.set_context0
ptr Context_switch.set_context1
ptr Context_switch.set_context2
ptr Context_switch.set_context3

Store gp0 Context0.PC %Context_switch.set_context0
Move Jump PC

Store gp0 Context1.PC %Context_switch.set_context1
Move Jump PC

Store gp0 Context2.PC %Context_switch.set_context2
Move Jump PC

Store gp0 Context3.PC %Context_switch.set_context3
Move Jump PC

#_____________ Change_context _____________


