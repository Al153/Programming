import math

def main():
	array = user_prompt()
	mean = calculate_mean(array)
	sd = standard_deviation(array,mean)
	print "\nStandard deviation of values is: ", sd, " the mean is: ",mean

def user_prompt():
	error = 1
	while error:
		try:
			data = list(input("Hi, welcome to Al's Standard Deviation calculator\n Please enter data (in format '[x1, x2, x3, ... Xn]): "))
			return data
		except:
			print "\n\n Error! \n\nplease try again. Make sure your data is of the form [X1, X2, X3, ... Xn]\n\n"

def calculate_mean(array):
	total = 0
	for value in array:
		total = total + value
	mean = total/float(len(array))
	return mean

def standard_deviation(array,mean):
	total = 0
	for value in array:
		total = total + (value - mean)**2
	total = total/float(len(array))
	sd = math.sqrt(total)
	return sd

main()