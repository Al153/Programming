############################## GETW ################################
#returns a char
In gp0 %getw 				#waits for a user to press a key
Compare gp0 Zero
if Equal then Load PC getw
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
###################################################################