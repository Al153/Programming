import random
import math

centre_coords = [17,180]
no_players = 8
limit = 100
lim2 = limit**2

for i in xrange(no_players):
	x = random.randrange(-100,100)
	y2 =lim2-x**2
	y = math.sqrt(y2)
	s = i%2
	if s ==1:
		y *= -1

	print centre_coords[0]+x,centre_coords[1]+y


