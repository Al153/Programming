from PIL import Image
import sys

def asciify(name,result_file_name):
	result = open(result_file_name,'w')
	height,width = get_image(name)

	for i in xrange(height):
		for j in xrange(width):
			r,g,b = get_pixel(j,i)
			result.write(create_ascii(r,g,b))

		result.write("\n")
	result.close()

def get_image(name):
	im = Image.open(name)
	im = im.resize((150,150),Image.ANTIALIAS)
	#print im.size
	#go = raw_input('')
	global rgb_im
	rgb_im = im.convert('RGB')
	width,height = im.size
	return height,width

def create_ascii(r,g,b):
 	r >>= 4
 	g >>= 4
 	b >>= 4

 	#smooth_value = (r*g*b)**(1/3.0)
 	smooth_value = (r+g+b)/3
 	if smooth_value <4:
 		ascii_char = "#"
 	elif smooth_value <8:
 		ascii_char = "!"
 	elif smooth_value < 12:
 		ascii_char = "0"
 	else:
 		ascii_char = " "
 	return ascii_char

def get_pixel(x,y):
	rgb = rgb_im.getpixel((x,y))
	return rgb[0], rgb[1], rgb[2]


asciify("test.JPG","result.txt")




