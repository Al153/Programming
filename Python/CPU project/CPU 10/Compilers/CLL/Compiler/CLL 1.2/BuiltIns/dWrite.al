################## built in function dWrite ##############################################

SUB gp7 @4 		 		 %function:dWrite									
								# disk addr, start, end ==> success?
Load gp3 Expression_stack [gp7] #len
SUB gp7 @4
Load gp2 Expression_stack [gp7] #start
SUB gp7 @4						
Load gp1 Expression_stack [gp7] #addr
HDScan gp1 						#scan to the right position
HDWrite gp3 gp2 0 				# write l characters from memory at addr s
Move Zero gp0 		
if EOF then Move One gp0 			#test for EOF
Store gp0 Expression_stack [gp7]  #push flag
ADD gp7 @4
Move Jump PC 
#######################################################################################