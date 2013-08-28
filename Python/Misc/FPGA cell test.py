import FPGA_cell_1 as FPGA

program = [[0,0,0,0],[1,0,0,0],[0,0,0,0],[1,0,0,0],
			  [1,0,0,0],[0,0,1,0],[1,0,0,0],[0,0,1,0],
			  [1,0,0,0],[0,0,1,0],[1,0,0,0],[0,0,1,0],
			  [0,0,1,0],[1,0,1,0],[0,0,1,0],[1,0,1,0]]

#Full adder

#inputs
West = FPGA.Port()
East = FPGA.Port()
South = FPGA.Port()
North = FPGA.Port() #(unused)

Cell = FPGA.Cell(program)
Cell.wireUp(North,East,South,West) #A:East B:West C:South

print "A\tB\tC\t\tS\tC"

for i in xrange(8):
	East.signal = i&1
	West.signal = (i>>1)&1
	South.signal = (i>>2)&1
	Cell.update()
	Cell.flip()
	print str(East.signal) + "\t" + str(West.signal) + "\t" + str(South.signal) + "\t\t" +str(Cell.outWest.signal) + "\t" + str(Cell.outNorth.signal)
	

go = raw_input("press enter to close")
