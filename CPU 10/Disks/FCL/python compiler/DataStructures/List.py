class List: #Functional list in python
	def __init__(self,payload,tail):
		self.head = payload
		self.tail = tail
		self.type = "List"
	def __iter__(self):
		this = self
		while this.type != "Nil":
			yield this.head
			this = this.tail
		raise StopIteration
		
	@staticmethod
	def Map(f,xxs):
		if xxs.type - "Nil": return Nil
		else return List(f(xxs.head),Map(f,xxs.tail))

class Nil: #sentinel of list
	def __init__(self):
		self.type = "Nil"