import math
import matplotlib.pyplot as plt

def approx_I(I,a,population,delta_t):
	#a is infectivity
	#b is base rate of infection
	return I*a*delta_t*(population - I) #delta_I is proportional to infect*noninfected

def calculate_I(a,p,t,b):
	c = -math.log(float(b)/(p-b))/(a*p)
	e = math.e
	numerator = p * e**(a*p*(t-c))
	denominator = e**(a*p*(t-c))+1
	return numerator/denominator

def calculate_derivative_of_I(a,p,t,b):
	c = -math.log(float(b)/(p-b))/(a*p)
	e = math.e
	numerator = a*p*p * e**(a*p*(t-c))
	denominator = (e**(a*p*(t-c))+1)**2
	return numerator/denominator


def plot(I,a,p,delta_t,p_precision = 0.1):
	#p_precision determines how close the function has to to get to p in order for the loop to stop
	t_array,I_array,I_array2,dI_array = [],[],[],[]
	t = 0
	b = I
	while I < p-p_precision:
		t_array.append(t)
		I_array.append(calculate_I(a,p,t,b))
		I_array2.append(I)
		dI_array.append(calculate_derivative_of_I(a,p,t,b))
		
		I += approx_I(I,a,p,delta_t)
		t += delta_t
	
	fig = plt.figure()

	ax = fig.add_subplot(111)
	#fig.subplots_adjust(top=0.85)
	ax.set_title("delta t = "+str(delta_t))

	ax.set_xlabel('x')
	ax.set_ylabel('y')

	ax.plot(t_array,I_array)
	ax.plot(t_array,I_array2)
	ax.plot(t_array,dI_array)
	#ax.plot(X,dxreal)
	#ax.plot(X,dximag)
	ax.legend(["y = I", "y = approx(I)", "y = dI/dt"], loc = 'upper left')
	

	plt.show()


I = 1
a = 0.001
p = 1000
delta_t = 10
for i in xrange(5):
	try:
		plot(I,a,p,delta_t)
	except KeyboardInterrupt:
		pass
	delta_t /= 10.0







