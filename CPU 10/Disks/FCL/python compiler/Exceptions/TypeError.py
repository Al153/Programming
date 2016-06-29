class TypeError(Exception): # an exception signifying that a type error has occured
	def __init__(self,message):
		self.msg = message
	def __str__(self):
		return self.msg