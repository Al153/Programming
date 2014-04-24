def execute(function):
	return function_binding(function).execute

class function_binding:
	def __init__(self,function):
		self.function = function
	def execute(self,*args):
		return self.function(*args)



def sqrt(x):
	return sqrt_class(x).execute

class sqrt_class:
	def __init__(self,x):
		self.x = x

	def execute(self):
		guess = 2.0
		for i in xrange(100):
			guess = (self.x/guess  + guess)/2
		print guess

execute(sqrt)(9)()

