class List: #Functional list in python
	def __init__(self,payload,tail):
		self.head = payload
		self.tail = tail
		self.type = "List"

class Nil: #sentinel of list
	def __init__(self):
		self.type = "Nil"