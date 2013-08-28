class Port:
	def __init__(self):
		self.signal = 0
		self.next_signal = 0
	def flip(self):
		self.signal = self.next_signal

class Cell:
	def __init__(self,program):
		self.program = program
		self.outNorth = Port()
		self.outEast = Port()
		self.outWest = Port()
		self.outSouth = Port()

	def wireUp(self,ninput,einput,sinput,winput):
		self.inNorth = ninput
		self.inEast = einput
		self.inWest = winput
		self.inSouth = sinput

	def update(self):
		self.to_decode = self.inWest.signal
		self.to_decode <<=1
		self.to_decode += self.inSouth.signal
		self.to_decode <<=1
		self.to_decode += self.inNorth.signal
		self.to_decode <<=1
		self.to_decode += self.inEast.signal
		new_state = self.program[self.to_decode]
		self.outWest.next_signal = new_state[0]
		self.outSouth.next_signal = new_state[1]
		self.outNorth.next_signal = new_state[2]
		self.outEast.next_signal = new_state[3]

	def flip(self):
		self.outWest.flip()
		self.outSouth.flip()
		self.outNorth.flip()
		self.outEast.flip()