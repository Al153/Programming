def prep_search(array,target):
	if array[0] == target:
		return 0
	elif array[-1] == target:
		return len(array)-1
	else:
		return search(array,len(array)-1,0,target)

def search(array,high_bound,low_bound,target):
	if high_bound == low_bound:
		return high_bound
	else:
		middle = (high_bound+low_bound)/2
		if middle == low_bound:
			return high_bound
		else:
			trial = array[middle]
			if trial == target:
				return middle
			else:
				if trial > target:
					return search(array,middle,low_bound,target)
				else:
					return search(array,high_bound,middle,target)

print prep_search([0,1,2,3,4],5)	