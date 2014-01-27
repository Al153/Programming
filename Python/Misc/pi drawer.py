import image
import math
base = image.new("RGBA",(2048,2048),colour=None)

red       = (255,0,0)
orange    = (255,128,0)
yellow    = (255,255,0)
green     =	(128,255,0)
cyan      = (0,255,255)
light_blue = (0,128,255)
dark_blue = (0,0,255)
purple    = (127,0,255)
pink      = (255,0,255)
magenta   = (255,0,127)

class data_table:
	def __init__(self,size,digit_string):
		self.initialise_table(size)
		self.digits = digit_string
		self.initialise_ranges
		self.colours = (red,orange,yellow,green,cyan,light_blue,dark_blue,purple,pink,magenta)


	def initialise_table(self,size): #creates a data table of correct size
		row = [0]*size
		self.data = []
		for i in xrange(size):
			self.data.append(list(row))

	def initialise_ranges(self): #creates the angle ranges for the segment
		previous = math.pi/2
		self.ranges = []
		for i in xrange(10):
			next = previous-(2*math.pi/10)
			self.ranges.append([previous,next])
			previous = next

	def create_outside(self):
		for i in xrange(10):
			this_range = self.ranges()
			for j in xrange()


def vector_distance(coords_1,coords_2):
	vector = (coords_1[0]-coords_2[0],coords_1[1]-coords_2[1])
	distance = math.sqrt(vector[0]**2+vector[1]**2)
