def Max_search(starting_point,end,tries,up_or_down,target,function):
	current = starting_point
	if up:
		best = 0
	else:
		best = 2**32-1
	configuration = 0
	step = (end -starting_point)/tries
	while current<end:
		trial_best,trial_configuration = hill_climb(starting_point,function)
		if up:
			if trial_best > best:
				best = trial_best
				configuration = trial_configuration
				if best >= target:
					return best,configuration
			starting_point += step
		else:
			if trial_best < best:
				best = trial_best
				configuration = trial_configuration
				if best <= target:
					return



