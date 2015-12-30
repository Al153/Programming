using std.hlib
using math.hlib

#needs a random function to generate a number between 0 and 1
#needs a neighbour generation function, to work

: get_step_down_probability ;
: get_temperature ;


: simulated_annealing 
	int state 0
	int energy 0
	int state_best 0
	int energy_best 0
	int energy_threshold
	int time 0
	int time_max 0
	int temperature 0
	
	int energy_function_pointer 0
	int neighbour_function_pointer 0

	# state, time given, energy threshold, energy_function_pointer, neighbour function pointer ==> state

	#__________________ set up variables before loop ________________
	DUP *state POP *state_best POP
	*time_max POP
	*energy_threshold POP
	*energy_function_pointer POP
	*neighbour_function_pointer POP

	state energy_function_pointer call DUP *energy POP *energy_best POP
	0 *time POP
	time time_max f< energy energy_threshold f> & while 
		time time_max f/ *temperature POP
		state neighbour_function_pointer call DUP
		energy_function_pointer call DUP
		energy SWAP temperature get_step_down_probability random f> if 
			*energy POP *state POP
		endif


	time time_max f< energy energy_threshold f> &  loop

;


