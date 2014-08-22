#_____________________ 32 bit CPU _____________________
#
#DWord					[00000000 00000000 00000000 00000000]
#bit number		 		0        8 	                   31
#						MSB 								LSB
#Byte memory address	a+0 						 a+3
#__________________ Busses __________________
#
#
#Name:			Width (bytes):			Notes:	
#
#Main Bus       4						Main CPU Data Bus, connected to all major parts of the CPU
#MemAddr		4						Carries address to memory
#
#RegAddr	    1						
#ALUControl		1						bits[0=>3]: operation
#
#
#__________________ Registers __________________
#
#    Address     Notes
#
#    0x0 		Zero register: always = [0,0,0,0]
#  	 0x1			One register:  always = [0,0,0,1]
#  	 0x2 		Accumulator:   stores the result of most recent multiplication
#  	 0x3			jump register: the original value of the program counter gets moved into this
#  	 0x4			Program counter: stores address of the next instruction to execute
#  	 0x5 		Flags set 	- data written here will be ORed with the data in the flags register
#  	 0x6			Flags reset - data written here will be ANDed with the data in the flags register
#  	 0x7			Stack pointer - reserved for stack use (but stack is not built into hardware)
# 
#
#	 0x8 ==> 0xf GP registers (0...7)
#
#
#		
#
#
#__________________ Instruction Set __________________
#
#____ instruction format ____
#
#byte:   0    	1    	2    	3    			4    	5   	 6  	  7
#
#REG     Opcode  Reg1   reg2 	conditional	    A/D	    A/D 	 A/D 	  A/D
#L/S 	Opcode  Reg1   index    conditional     A/D	    A/D 	 A/D 	  A/D 
#
#bit [0] of conditional triggers a conditional command if high
#bit [1] of conditional triggers an "if x:" conditional with bits [3 ==> 7] as register address
#otherwise bits [4 ==> 7] as the conditional flag to check
#
#
#Opcode   Mnemonic   Type    Notes
#00		 Halt  		N/A
#01		 Pass		N/A 
#02		 MOV        REG 	 Reg2 <= reg1
#03		 LOD		L/S
#04		 STR		L/S
#05      CMP		REG
#06 	 CMP 		L/S
#07 	 OUT 		REG
#08 	 OUT 		L/S
#09 	 LODB 		L/S
#10 	 STRB       L/S
#11      LODW       L/S
#12      STRW       L/S
#.
#.
#.
#10		 ADD		REG
#11		 SUB		REG
#12		 MUL 		REG
#13		 DIV        REG
#14		 MOD  		REG
#15       AND 	    REG
#16		 OR 		REG
#17		 XOR		REG
#18		 NOT 		REG
#19       NAND       REG
#1a       NOR        REG
#1b		 XNOR		REG
#1c		 SHL		REG
#1d		 SHR		REG
#1e		 ADDc 		REG
#1f 	 SUBb 		REG
#
#.
#.
#.
#
#20		 ADD		L/S
#21		 SUB		L/S
#22		 MUL 		L/S
#23		 DIV        L/S
#24		 MOD  		L/S
#25       AND 	    L/S
#26		 OR 		L/S
#27		 XOR		L/S
#28		 NOT 		L/S
#29       NAND       L/S
#2a       NOR        L/S
#2b		 XNOR		L/S
#2c		 SHL		L/S
#2d		 SHR		L/S
#2e 		 ADDc 		L/S
#2f		 SUBb 		L/S
#
#
#__________________ Flags __________________
#
#[NNNN NNNN  NNNN NNNN  NNNN NNNN  EGLC BDSs]
#
	#Equal 				MSB of lowest byte
	#Greater than
	#Less than
#
	#Carry
	#Borrow
	#Division By Zero
#
	#Stack Overflow
	#Stack underflow 	LSB

	
import ALU
import Bus
import Memory
import Registers
import Output

def bytify(binary):
	"""turns a number into bytes"""
	bytes = [0,0,0,0]
	i = 3
	while binary:

		bytes[i]  = binary&255
		binary >>= 8
		i -= 1 
	return bytes

class CPU:
	def __init__(self,memory_dict):
		#______ Buses ______
		self.Main_bus = Bus.Bus(4)
		self.Memory_address_bus = Bus.Bus(4) 
		self.ALU_op_bus = Bus.Bus(1)
		self.Register_address_bus = Bus.Bus(1)
		self.Output_address_bus = Bus.Bus

		self.Registers = Registers.Register_bank(self.Main_bus,self.Register_address_bus)
		self.Memory_address_register = Registers.Memory_address_register(self.Main_bus,self.Memory_address_bus,4)
		self.Memory = Memory.Memory(self.Memory_address_bus, self.Main_bus,memory_dict)
		self.ALU = ALU.ALU(self.Main_bus,self.Main_bus,self.ALU_op_bus)
		self.Output = Output.IO(self.Main_bus,self.Output_address_bus)

		self.halt = 0 
		self.instruction_count = 0
		self.instr_dict = {
			0:self.Halt,
			1:self.Noop,
			2:self.Move,
			3:self.Load,
			4:self.Store,
			5:self.Compare_reg,
			6:self.Compare_addr,
			7:self.Out_reg,
			8:self.Out_addr,
			9:self.Outd_reg,
			10:self.Outd_addr,
			11:self.Load_byte,
			12:self.Store_byte,
			13:self.Load_word,
			14:self.Store_word,
			16:self.ALU_reg,
			17:self.ALU_reg,
			18:self.ALU_reg,
			19:self.ALU_reg,
			20:self.ALU_reg,
			21:self.ALU_reg,
			22:self.ALU_reg,
			23:self.ALU_reg,
			24:self.ALU_reg,
			25:self.ALU_reg,
			26:self.ALU_reg,
			27:self.ALU_reg,
			28:self.ALU_reg,
			29:self.ALU_reg,
			30:self.ALU_reg,
			31:self.ALU_reg,
			32:self.ALU_addr,
			33:self.ALU_addr,
			34:self.ALU_addr,
			35:self.ALU_addr,
			36:self.ALU_addr,
			37:self.ALU_addr,
			38:self.ALU_addr,
			39:self.ALU_addr,
			40:self.ALU_addr,
			41:self.ALU_addr,
			42:self.ALU_addr,
			43:self.ALU_addr,
			44:self.ALU_addr,
			45:self.ALU_addr,
			46:self.ALU_addr,
			47:self.ALU_addr,
			48:self.In_reg,
			49:self.In_addr
		}

		

	def run(self):
		try:
			while not self.halt:
				self.step()
				self.instruction_count += 1
		except KeyboardInterrupt:
			pass
			#print self.instruction_count
	def debug_run(self,start):
		try:
			ret_value = 0
			while not self.halt:
			
				self.step()
				if self.instruction_count >= start:
					print "instr: ",self.instruction, "A: ", self.addr, "PC: ",self.Registers.registers[4].data, "JMP: ",self.Registers.registers[3].data, "FLG: ", self.Registers.registers[5].data,
					next = str(raw_input(""))
				self.instruction_count += 1
				
		except:
			pass
		

	def step(self):
		self.fetch()
		self.execute()

	def fetch(self):
		#fetch instruction
		self.Register_address_bus.data = 4
		self.Registers.enable() #get address of next instruction from program counter

		self.Memory_address_register.set() #load up memory address
		self.Memory_address_register.enable()
		self.Memory.enable()		#extract instuction
		self.instruction = bytify(self.Main_bus.data)
		self.Registers.registers[4].add_4()

		self.Registers.enable()
		self.Memory_address_register.set()
		self.Memory_address_register.enable()
		self.Memory.enable()		#extract data
		self.addr = self.Main_bus.data

		self.Registers.registers[4].add_4()

	def execute(self):
		opcode = self.instruction[0]
		reg1_addr = self.instruction[1]
		reg2_addr = self.instruction[2]
		conditional = self.instruction[3]

		if  conditional&128:
			if not conditional&64:

				self.Register_address_bus.data = 6
				self.Registers.enable()
				if not (1<<(31-(conditional&31)))&self.Main_bus.data:
					if conditional&31 == 24 or conditional&31 == 25 or conditional&31 == 26:
						self.Main_bus.data = 4294967071 #reset all three of the  ><= flags
					else:
						self.Main_bus.data = (1<<(31-(conditional&31)))^4294967295
					self.Registers.set()
					return
				if conditional&31 == 24 or conditional&31 == 25 or conditional&31 == 26:
					self.Main_bus.data = 4294967071 #reset all three of the  ><= flags
				else:
					self.Main_bus.data = (1<<(31-(conditional&31)))^4294967295
				self.Registers.set()


			else:
				self.Register_address_bus.data = conditional
				self.Registers.enable()
				if not self.Main_bus.data:
					return
		self.instr_dict.get(opcode,self.Noop)(opcode,reg1_addr,reg2_addr)


	def Halt(self,opcode,reg1_addr,reg2_addr):
		self.halt = 1
	def Noop(self,opcode,reg1_addr,reg2_addr):	
		pass
	def Move(self,opcode,reg1_addr,reg2_addr):
		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		self.Register_address_bus.data = reg2_addr
		self.Registers.set()
	def Load(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Memory_address_register.enable()
		self.Memory.enable()
		self.Register_address_bus.data = reg1_addr
		self.Registers.set()
	def Store(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Register_address_bus.data = reg1_addr
		self.Memory_address_register.enable()
		self.Registers.enable()
		self.Memory.set()
	def Compare_reg(self,opcode,reg1_addr,reg2_addr):
		self.Register_address_bus.data = 6 #clears <>= flags
		self.Main_bus.data = 4294967071
		self.Registers.set()

		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		reg1_value = self.Main_bus.data
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()			
		reg2_value = self.Main_bus.data
		if reg1_value > reg2_value:
			self.Main_bus.data = 64
		elif reg1_value == reg2_value:
			self.Main_bus.data = 128
		else:
			self.Main_bus.data = 32
		self.Register_address_bus.data = 5
		self.Registers.set()
	def Compare_addr(self,opcode,reg1_addr,reg2_addr):
		self.Register_address_bus.data = 6 #clears <>= flags
		self.Main_bus.data = 4294967071
		self.Registers.set()

		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		reg1_value = self.Main_bus.data
		self.Main_bus.Data = self.addr
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Memory_address_register.enable()
		self.Memory.enable()
		reg2_value = self.Main_bus.data
		#print "reg value 1",reg1_value, "reg value 2",reg2_value
		if reg1_value > reg2_value:
			self.Main_bus.data = 64
		elif reg1_value == reg2_value:
			self.Main_bus.data = 128
		else:
			self.Main_bus.data = 32
		self.Register_address_bus.data = 5
		self.Registers.set()		
	def Out_reg(self,opcode,reg1_addr,reg2_addr):
		self.Output_address_bus.data = 0
		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		self.Output.set()
	def Out_addr(self,opcode,reg1_addr,reg2_addr):
		self.Output_address_bus.data = 0
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
	
		self.Memory_address_register.enable()
		self.Memory.enable()
		self.Output.set()
	def Outd_reg(self,opcode,reg1_addr,reg2_addr):
		self.Output_address_bus.data = 1
		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		self.Output.set()
	def Outd_addr(self,opcode,reg1_addr,reg2_addr):
		self.Output_address_bus.data = 1
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
	
		self.Memory_address_register.enable()
		self.Memory.enable()
		self.Output.set()
	def Load_byte(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Memory_address_register.enable()
		self.Memory.byte_enable()
		self.Register_address_bus.data = reg1_addr
		self.Registers.set()
	def Store_byte(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Register_address_bus.data = reg1_addr
		self.Memory_address_register.enable()
		self.Registers.enable()
		self.Memory.byte_set()
	def Load_word(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Memory_address_register.enable()
		self.Memory.word_enable()
		self.Register_address_bus.data = reg1_addr
		self.Registers.set()
	def Store_word(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Register_address_bus.data = reg1_addr
		self.Memory_address_register.enable()
		self.Registers.enable()
		self.Memory.word_set()
	def ALU_reg(self,opcode,reg1_addr,reg2_addr):
		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		self.ALU.set_reg_1()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.ALU.set_reg_2()
		self.execute_ALU_command(opcode&15,reg1_addr)
	def ALU_addr(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Memory_address_register.enable()
		self.Memory.enable()
		self.ALU.set_reg_2()
		self.Register_address_bus.data = reg1_addr
		self.Registers.enable()
		self.ALU.set_reg_1()
		self.execute_ALU_command(opcode&15,reg1_addr)



	def execute_ALU_command(self,opcode,reg1_addr):
		if opcode == 14: #add with carry
			self.Registers.registers[5].enable() #direct flag register enabling
			flag = self.Main_bus.data
			if not flag & 16: #if not set
				opcode = 0
			self.Main_bus.data = 4294967279
			self.Registers.registers[6].set()
		if opcode == 15:
			self.Registers.registers[5].enable()
			flag = self.Main_bus.data
			if not flag & 8: #if not set
				opcode = 1
			self.Main_bus.data = 4294967287
			self.Registers.registers[6].set()

		self.ALU_op_bus.data = opcode
		self.ALU.op()
		self.Register_address_bus.data = reg1_addr
		self.ALU.enable_reg_1()
		self.Registers.set()
		if opcode == 2: #multiplication
			self.Register_address_bus.data = 2
			self.ALU.enable_reg_2()
			self.Registers.set()
		self.Register_address_bus.data = 5
		self.ALU.enable_flags()
		self.Registers.set()

	def In_reg(self,opcode,reg1_addr,reg2_addr):
		self.Output.enable()
		#print self.Main_bus.data
		self.Register_address_bus.data = reg1_addr
		self.Registers.set()

	def In_addr(self,opcode,reg1_addr,reg2_addr):
		self.Main_bus.data = self.addr
		self.Memory_address_register.set()
		self.Register_address_bus.data = reg2_addr
		self.Registers.enable()
		self.Memory_address_register.add()
		self.Output.enable()
		self.Memory_address_register.enable()
		self.Registers.enable()
		self.Memory.set()

