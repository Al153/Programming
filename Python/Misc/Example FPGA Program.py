class Adder:
	def behaviour(self,w,s,n,e):
		W = (e^w)^s
		N = ((e^w)&n)|(e&w)
		S = 0
		E = 0
		return [W,S,N,E]

class Program:   #North = up, south = down, east = right, west = left
	def __init__(self):
		self.array =[
		[Adder()],
		[Adder()],
		[Adder()],
		[Adder()]
		]
