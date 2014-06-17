import msvcrt 

def kbfunc(): 
   x = msvcrt.kbhit()
   if x: 
      ret = ord(msvcrt.getch()) 
   else: 
      ret = 0 
   return ret

string = ''
while 1:
	for i in xrange(100000):
		x = kbfunc()
		string += chr(x) if x else ''
	print "string = ", string
	string = ''
	go = raw_input('')