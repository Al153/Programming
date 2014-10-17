import math #gets mathsy functions

def get_y(a,x):
	return a*math.cosh(a/x)-a

def binary_search(x,y,lower_bound,upper_bound,precision = 100):
	middle = (upper_bound + lower_bound)/2.0 			#middle is mean of two bounds
	if precision == 0:									#if desired precision reached
		return middle 									#middle is best estimate
	else:
		y_test = get_y(middle,x) 							#otherwise, get value of y
		print "y = ", y_test
		if y_test > y:									#if y is too big, then search between middle and lower bounds, decrements precision to count down
			return binary_search(x,y,middle,lower_bound,precision-1)
		elif y_test < y:									#if y if too small, then search between middle and upper bounds
			return binary_search(x,y,upper_bound,middle,precision-1)
		else:
			return middle										#if y = goal then return middle

