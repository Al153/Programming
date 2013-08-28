#16 bit CPU
#65536 words of memory
#word = (sign,data) i.e. 17 bits
#16 registers: 8 special and 8 general purpose:

#Acc, Ext, Index, Flags, zero, one, ones, jump, Gp0-7

#Formats: (I = opcode, R = register 1, r = register 2, F = Flags, A = address or data, N = Null)
#Register based: [IIII IIII RRRR rrrr][FFFF NNNN NNNN NNNN] 
#Address based:   [IIII IIII RRRR FFFF][AAAA AAAA AAAA AAAA]

#Flags register:

#(C = Carry, B = borrow, O = MUL overflow, D = Divide by zero, S = Stack overflow, s = Stack empty
# G = greater than, L = Less than, E = Equals, N = Null)
#[CBOD SsGL ENNN NNNN]


#Hierarchy:

#Top: Bootstrap file: Starts program, imports the program choosing file - for secured release only

#Program constructor file: imports CPU file, imports and preprocesses machine code program, may also include assembler.

#CPU file: specifies CPU class, imports part files, the highest level part which is part of the emulated CPU

#Part files:
#	Program counter
#	ALU
#	Register
#	Memory
#	Stack



#__________________________Beginning of program________________________________________


import ProgramCounter
import ALU
import register
import memory
import stack
import time
import OutputUnit

class CPU:
	def __init__(self,program): #			accumulator								extended register 						index register 			
		self.Registers =  [register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False)]
								#            Flags									 = zero									   = one
		self.Registers += [register.Register(16,False,True,(0,0),True),register.Register(16,False,False,(0,0),False),register.Register(16,False,False,(0,1),False)]
								#			= all ones											jump register				
		self.Registers += [register.Register(16,False,False,(0,0xffff),False),register.Register(16,True,True,(0,0),False)]
								#			=General purpose regs
		self.Registers += [register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False),
							register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False),
							register.Register(16,True,True,(0,0),False),register.Register(16,True,True,(0,0),False)]
		self.ALU = ALU.ALU(self.Registers[0],self.Registers[1],self.Registers[3])
		self.Memory = memory.Memory(program,self.Registers[2])
		self.PC = ProgramCounter.PC(self.Memory,self.Registers[2])
		self.Stack = stack.Stack(self.Registers[3],64)
		self.halt = 0
		self.instr_count = 0
		self.Output = OutputUnit.OutputUnit()

	def part_decode_instr(self,instr): #extracts opcode
		opcode = instr[0][1]>>8
		instr = (instr[0][1]<<16)+instr[1][1]
		return opcode,instr

	def complete_decode_instr(self,instr,instr_type): #extracts rest of instr
		if instr_type == "R":
			reg1 = (instr>>20)&0xf
			reg2 = (instr>>16)&0xf
			flags = (instr>>12)&0xf
			address = 0
		elif instr_type == "A":
			reg1 = (instr>>20)&0xf
			reg2 = 0
			flags = (instr>>16)&0xf
			address = instr&0xffff
		return (reg1,reg2,flags,address)

	def run(self):
		start = time.time()
		while not self.halt:
			self.instr_count +=1
			#print self.instr_count
			#fetch instr
			instr = self.PC.advance()
			data = instr[1]
			#print "data", data,"\n"
			#part decode instr
			opcode,instr = self.part_decode_instr(instr)
			#print "opcode" ,opcode, "\n"
			#for i in xrange(16):
				#print "Register", i, self.Registers[i].value
			#print "\n"
			if opcode == 0: #halt
				self.halt = 1

			elif opcode >=1 and opcode <=16: #ALU operations

				instr = self.complete_decode_instr(instr,"R")
				self.ALU.operate(self.Registers[instr[0]],self.Registers[instr[1]],opcode-1,instr[2])

			elif opcode == 17: #move

				instr = self.complete_decode_instr(instr,"R")
				#print instr
				delete_source = instr[2]>>3 #extracting flag bits
				move_abs = (instr[2]>>2)&1
				overwrite = (instr[2]>>1)&1
				keep_dest_sign = instr[2]&1
				#print instr[0]
				#print instr[1]
				self.Registers[instr[0]].write(self.Registers[instr[1]].read(delete_source,move_abs),overwrite,keep_dest_sign)

			elif opcode == 18: #load
				#print hex(instr)
				instr = self.complete_decode_instr(instr,"A")
				#print instr
				delete_source = instr[2]>>3 #extracting flag bits
				load_abs = (instr[2]>>2)&1
				load_data = (instr[2]>>1)&1
				keep_dest_sign = instr[2]&1

				if not load_data:
					self.Registers[instr[0]].write(self.Memory.read(instr[3],delete_source,load_abs),False,keep_dest_sign)

				else:
					if load_abs:
						self.Registers[instr[0]].write((0,data[1]),False,keep_dest_sign)
					else:
						self.Registers[instr[0]].write(data,False,keep_dest_sign)
				#print "result of load:\t\t\t\t", self.Registers[instr[0]].value

			elif opcode == 19: #store

				instr = self.complete_decode_instr(instr,"A")
				delete_source = instr[2]>>3 #extracting flag bits
				store_abs = (instr[2]>>2)&1
				
				keep_dest_sign = instr[2]&1
				self.Memory.write(instr[3],self.Registers[instr[0]].read(delete_source,store_abs),keep_dest_sign)

			elif opcode == 20: #push
				instr = self.complete_decode_instr(instr,"A")

				push_address = instr[2]>>3 #extracting flag bits
				push_data = (instr[2]>>2)&1
				push_reg = (instr[2]>>1)&1
				push_abs = instr[2]&1

				stack_bus = 0
				if push_address:
					stack_bus = self.Memory.read(instr[3],False,False)
				elif push_data:
					stack_bus = data
				elif push_reg:
					stack_bus = self.Register[instr[0]].read(False,False)

				if push_abs:
					stack_bus = (0,stack_bus[1])
				self.Stack.push(stack_bus)
				stack_bus = 0

			elif opcode == 21: #pop
				instr = self.complete_decode_instr(instr,"A")
				pop_address = instr[2]>>3 #extracting flag bits

				pop_reg = (instr[2]>>1)&1
				pop_abs = instr[2]&1

				if pop_abs:
					stack_bus = (0,self.Stack.pop()[1])
				else:
					stack_bus = self.Stack.pop()

				if pop_reg:
					self.Registers[instr[0]].write(stack_bus,False,False)

				elif pop_address:
					self.Memory.write(instr[3],stack_bus,False,False)

			elif opcode == 22: #jump
				instr = self.complete_decode_instr(instr,"A")
				store = instr[2]>>3 #extracting flag bits
				jump_data = (instr[2]>>2)&1
				jump_reg = (instr[2]>>1)&1
				jump_abs = instr[2]&1

				temp_pos = (0,self.PC.pos) #for storing
				if jump_data:
					self.PC.jump(data,jump_abs)
				elif jump_reg:
					self.PC.jump(self.Registers[instr[0]].read(False,False),jump_abs)
				if store:
					self.Registers[7].write(temp_pos,False,False)

			elif opcode == 23: #goto
				instr = self.complete_decode_instr(instr,"A")
				store = instr[2]>>3 #extracting flag bits
				goto_data = (instr[2]>>2)&1
				goto_reg = (instr[2]>>1)&1
				include_index_register = instr[2]&1

				temp_pos = (0,self.PC.pos) #for storing

				if goto_data:
					self.PC.goto(data,include_index_register)

				elif goto_reg:
					self.PC.goto(self.Registers[instr[0]].read(False,False),include_index_register)

				if store:
					self.Registers[7].write(temp_pos,False,False)

			elif opcode == 24: #compare
				instr = self.complete_decode_instr(instr,"R")
				wipe_flags = instr[2]>>3 #extracting flag bits
				compare_abs = (instr[2]>>2)&1

				if wipe_flags:
					self.Registers[3].write((0,0),True,False) #clears flags
				if compare_abs:
					value1 = self.Registers[instr[0]].read(False,False)[1]
					value2 = self.Registers[instr[1]].read(False,False)[1]
				else: 
					value1 = self.Registers[instr[0]].read(False,False)
					value2 = self.Registers[instr[1]].read(False,False)
					value1 = value1[1]*((-1)**value1[0])
					value2 = value2[1]*((-1)**value2[0])

				if wipe_flags:
					self.Registers[3].write((0,0),True,False) #clears flags

				if value1 == value2:
					self.Registers[3].write((0,1<<7),False,False)

				elif value1 > value2:
					self.Registers[3].write((0,1<<9),False,False)

				elif value1 < value2:
					self.Registers[3].write((0,1<<8),False,False)

			elif opcode == 25: #conditional jump
				instr = self.complete_decode_instr(instr,"A")
				store = instr[2]>>3 #extracting flag bits
				jump_data = (instr[2]>>2)&1
				dont_clear_bit = (instr[2]>>1)&1
				jump_abs = instr[2]&1

				temp_pos = (0,self.PC.pos) #for storing
				if self.Registers[3].test(instr[0],dont_clear_bit):
					if jump_data:
						self.PC.jump(data,jump_abs)
					if store:
						self.Registers[7].write(temp_pos,False,False)

			elif opcode == 26: #conditional goto
				instr = self.complete_decode_instr(instr,"A")
				store = instr[2]>>3 #extracting flag bits
				goto_data = (instr[2]>>2)&1
				dont_clear_bit = (instr[2]>>1)&1
				include_index_register = instr[2]&1

				temp_pos = (0,self.PC.pos) #for storing
				if self.Registers[3].test(instr[0],dont_clear_bit):
					if goto_data:
						self.PC.goto(data,include_index_register)
					if store:
						self.Registers[7].write(temp_pos,False,False)

			elif opcode == 27: #output
				instr = self.complete_decode_instr(instr,"A")
				output_value = instr[2]>>3 #extracting flag bits
				output_address = (instr[2]>>2)&1
				output_data = (instr[2]>>1)&1
				output_register = instr[2]&1
				if output_address:
					self.Output.output(self.Memory.read(instr[3],False,False),output_value)
				elif output_data:
					self.Output.output(data,output_value)
				elif output_register:
					self.Output.output(self.Registers[instr[3]].read(False,False),output_value)

		end = time.time()

		print "Instructions processed: ", self.instr_count
		print "Time taken: ",end-start,"seconds"
		try:
			print "Speed: ", self.instr_count/(end-start), "ips"

		except ZeroDivisionError:
			print "happened too quickly to give accurate speed!"
		print "Register values: "
		for reg in self.Registers:
			print reg.value



#program = [
#(0,0x1282),(0,0x0000),
#(0,0x0175),(0,0x0000),
#(0,0x1170),(0,0x0000),
#(0,0x1878),(0,0x0000),
#(0,0x1984),(0,0x0002),
#(0,0x1604),(1,0x000a),
#(0,0x0000),(0,0x0000)
#]
#CPU = CPU(program)
#CPU.run()






