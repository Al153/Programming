class IncompleteError(Exception): # an exception signifying that a type error has occured
	def __str__(self):
		return "Error: construction is not complete"