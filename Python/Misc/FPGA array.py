import FPGA_cell_1 as FPGA
import importlib


def import_program(name):
	program  = __import__(name)
	return program

def create_lookup(cell): #Generates lookup table for cell
	program = []
	for combination in xrange(16):
		E = combination&1
		N = (combination>>1)&1
		S = (combination>>2)&1
		W = (combination>>3)&1
		program.append(cell.behaviour(W,S,N,E))
	return program

def create_FPGA(program): #creates an array of FPGA cells based on a program
	to_convert = program.Program()
	FPGA_array = []
	for row in to_convert.array:
		array_row = []
		for cell in row:
			array_row.append(FPGA.Cell(create_lookup(cell)))
		FPGA_array.append(array_row)
	return FPGA_array


def add_ports(FPGA_array): #adds ports to the edges of the chip
	line_no = len(FPGA_array)
	FPGA_array.insert(0,[FPGA.Port()]*len(FPGA_array[0]))
	FPGA_array.append([FPGA.Port()]*len(FPGA_array[0]))
	for line in FPGA_array:
		line.insert(0,FPGA.Port())
		line.append(FPGA.Port())
	return FPGA_array

def wire_up(FPGA_array):#connects up cells in the FPGA
	y = len(FPGA_array) #y corresponds to i (no of rows)
	x = len(FPGA_array[0]) #x corresponds to j (no of columns)
	if y >3 and x>3: 
		for i in xrange(2,len(FPGA_array)-2):
			for j in xrange(2,len(FPGA_array[i])-2):
				FPGA[i][j].wireUp(FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1].outWest,FPGA_array[i+1][j].outNorth,FPGA_array[i][j-1].outEast)
				
		i = 1
		for j in xrange(2,len(FPGA_array[1])-2):
			FPGA_array[i][j].wireUp(FPGA_array[i-1][j],FPGA_array[i][j+1].outWest,FPGA_array[i+1][j].outNorth,FPGA_array[i][j-1].outEast)
		i = -2
		for j in xrange(2,len(FPGA_array[-2])-2):
			FPGA_array[i][j].wireUp(FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1].outWest,FPGA_array[i+1][j],FPGA_array[i][j-1].outEast)
		j = 1
		for i in xrange(2,len(FPGA_array)-2):
			FPGA_array[i][j].wireUp((FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1].outWest,FPGA_array[i+1][j],FPGA_array[i][j-1]))
		j = -2
		for i in xrange(2,len(FPGA_array)-2):
			FPGA_array[i][j].wireUp((FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1],FPGA_array[i+1][i],FPGA_array[i][j-1].outEast))

	elif y>3 and x <= 3:
		j = 1
		for i in xrange(2,y-2):
			FPGA_array[i][j].wireUp(FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1],FPGA_array[i+1][j].outNorth,FPGA_array[i][j-1])
		i = 1
		FPGA_array[i][j].wireUp(FPGA_array[i-1][j],FPGA_array[i][j+1],FPGA_array[i+1][j].outNorth,FPGA_array[i][j-1])
		i = -2
		FPGA_array[i][j].wireUp(FPGA_array[i-1][j].outSouth,FPGA_array[i][j+1],FPGA_array[i+1][j],FPGA_array[i][j-1])

	elif y <= 3 and x >3:
		i = 1
		for j in xrange(2,x-2):
			FPGA_array[i][j].wireUp(FPGA_array[i-1][j],FPGA_array[i][j+1].outWest,FPGA_array[i+1][j],FPGA_array[i][j-1].outEast)
		j = 1
		FPGA_array[i][j].wireUp(FPGA_array[i-1][j],FPGA_array[i][j+1],FPGA_array[i+1][j],FPGA_array[i][j-1].outEast)
		j = -2
		FPGA_array[i][j].wireUp(FPGA_array[i-1][j],FPGA_array[i][j+1].outWest,FPGA_array[i+1][j],FPGA_array[i][j-1])

	else:
		FPGA_array[1][1].wireUp(FPGA_array[0,1],FPGA_array[1][2],FPGA_array[2][1],FPGA_array[1][0])

def build(name):
	try:
		program = import_program(name)
	except:
		program = import_program(name[0:-3]) #removes ".py"
	solution = create_FPGA(program)
	solution = add_ports(solution)
	return(wire_up(solution))


build("Example FPGA Program")