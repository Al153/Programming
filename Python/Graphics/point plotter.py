import pygame
pygame.init()
fpsClock = pygame.time.clock()
windowSurfaceObject = pygame.display.set_mode((640,640))
pygame.display.set_caption("N-D")
white = pygame.Color(255,255,255)
black = pygame.colour(0,0,0)


def plot_point(viewer_vector,object_vector,image_position):
	'''viewer_vector = position of eye, object_vector = position of point, image_position = distance between image and eye'''
	viewer_line = viewer_vector[:2]
	delta_xy = [object_vector[0]-viewer_line[0],object_vector[1]-viewer_line[1]]
	delta_z = object_vector[2]-viewer_vector[2]
	scaling = delta_z/float(image_position)
	image_vector = [delta_xy[0]*scaling,delta_xy[1]*scaling]
	return image_vector

def plot_point_n(viewer_vector,object_vector,image_position):
	'''plots a point in 2 dimensions, from n'''
	dimensions = len(object_vector)
	for i in xrange(dimensions-2)

def draw_line(start_coord,end_coord):
	pygame.draw.line(windowSurfaceObject,black,start_coord,end_coord,1)

class shape:
	def __init__(self,points,line_map):
		self.points = points #list of N-D coordinates
		self.line_map = line_map #list of line pointers
def draw(shape):
	for line in shape.line_map:
		point0 = line[0]
		point1 = line[1]


