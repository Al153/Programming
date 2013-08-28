class CPU:
    def __init__(self,rom,globalbits): #ideally rom should be atleast 68 bits, global bits is the number of bits of the CPU -eg 8bit
    	self.state = 0 #(0: read instr 1:decode 2:execute/read/write memory 3:settle)
    	self.pcreg = [0] #to allow destinations + sources
    	self.regA = [0] 
    	self.regB = [0]
    	self.haltflag = 0
    	self.rom = rom
    	ifFlag = 0
    	self.bits = globalbits

    def run(self):
    	if not self.ifFlag:
    		if self.state == 0: #read instr
    			self.instrReg = self.rom[self.pcReg] #must be be in [[0000][00][0000....]], the instr register is not necessary
    			self.state += 1
    		if self.state == 1: #decode instr
    			opcode = self.instrReg[0]
    			registercode = self.instrReg[1]
    			data = self.instrReg[2]
    			if opcode == 0:#halt
    				self.haltflag = 1
    			if opcode == 1:#ALU: add
    				sourcea =  self.regA
    			if opcode == 2:#ALU: AND
    			if opcode == 3:#ALU: NOT
    			if opcode == 4:#ALU: shift down #shift up can be accomplished through adding
    			if opcode == 5:#Move registers
    			if opcode == 6:#Load register from memory in data
    			if opcode == 7:#Write register to memory in data
    			if opcode == 8:#if registers equal:
    			if opcode == 9:#if register > register:
    			if opcode == 10:#end if statement
    			if opcode == 11:#load register with data
    			if opcode == 12:#input data to memory [IO]
    			if opcode == 13:#output data from memory[IO]
    			if opcode == 14:#output data in register[IO]
    			if opcode == 15:#



    		if self.state == 2: #execute / r/w memory

    		if self.state == 3: #settle system


    		self.pcreg = (self.pcreg +1)%len(self.rom)
    		return self.haltflag
    	else:
        

class ALU:
	def __init__(self,bitsize):
		self.max = 2**bitsize
	def operate(self, inA, inB, opcode):
		if opcode == 0: #add
			out = (inA + inB)%self.max
		elif opcode == 1:#and
			out = inA & inB
		elif opcode == 2:#not
			out = inA ^ (self.max-1) #best way to do positive not-ing in python, i have found so far
		elif opcode == 3: #shift down
			out = inA >> 1
		return out

class Memory:
	def __init__(self,bitsize):
		self.size = 2**bitsize
		self.memory = [0]*self.size

