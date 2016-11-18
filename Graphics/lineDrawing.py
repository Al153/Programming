m = (y_1 - y_0)/(x_1 - x_0) # wlog take x and y such that 0 <= m <= 1. m is the gradient
x = round(x_0)				# x and y are the iterated coordinates
y_i = y_0 + m*(x - x_0)		# y_i is the Y coord when X = x

y = round(y_i)				# y is the pixel coord that y_i is in
yf = yi - y 				# yf is the "real" underlying position of the line within the pixel

while x <= round(x_i):		# for each x value
	draw(x,y,colour)
	x += 1					# calculate the new x
	yf = yf + m				# calculate the new underlying position of the line
	if (yf > 0.5):			# if yf is in the pixel above
		y += 1				# increase y to point to the pixel above
		yf -= 1				# decrement yf to point to the position in this new pixel



# wlog take x and y such that 0 <= grad <= 1
# a*x + b*y + c = 0 is the function of the line

a = (y_1 - y_0)				# a is delta y
b = -(x_1 - x_0)			# b is -delta x
c = x_1*y0 - x_0*y_1		#  c is final constant
x = round(x_0)				# x and y are the coordinates of the current pixel
y = round((-a * x - c)/b)	# find the value of the line when X = x
d = a * (x+1) + b*(y+0.5) + c 	# d is the decision variable ( = a*X + b*Y + c) at
								# the top middle of the current pixel

while x =< round(x_1):
	draw(x,y)			# draw the current pixel
	if d < 0:			# if d < 0 then the midpoint of the top of the pixel is above the line
		d = d + a 		# so only x is going to be incremented, so adjust d for change in x only
	else:
		d = d + a + b 	# otherwise incrementing x and y
		y += 1			# increment y and x
	x += 1

# A decision variable is:
# d = x^2 + y^2 - r^2, where x and y are relative to the centre.

# we only look at the octant of the circle, where  0 =< dy/dx <= 1

# d = 0: on line
# d < 0: in circle
# d > 0 outside of circle

# draw(x,y)
# if d(x+1,y+0.5)>0 go SE
# else go E

# if E then 	d' 	= (x+2)^2 + (y-0.5)^2 - r^2
#					= d + 2x + 3
#				x 	= x + 1

# if SE then 	d' 	=  (x+2)^2 + (y-1.5)^2 - r^2
#					= d + 2x - 2y + 5
#				x 	= x + 1
#				y 	= y - 1

y =  round(r)
x = 0
d = (x+1)^2 + (y-1/2)^2 - r^2 # ( = 1 )
while x < y:
	draw(x,y,centre)			# draw(x,y,c) draws to ((c+-x),(c+-y)), ((c+-y),(c+-x)) to get all octants
	x = x + 1
	if d < 0: # go east
		d = d + 2x + 3
	else: # go SE
		d = d + 2x - 2y + 5
		y = y -1

