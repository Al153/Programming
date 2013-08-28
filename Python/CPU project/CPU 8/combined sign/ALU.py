class ALU:
	def __init__(self,accumulator,extended_register,flag_register):
		self.Output1 = accumulator
		self.Output2 = extended_register
		self.flag_out = flag_register
	def operate(self,regA,regB,opcode,flags):
		flag_array = []
		for i in xrange(4):
			flag_array.insert(0,flags&1)
			flags >>= 1

		if flag_array[2]: #abs in flag
			valueA = regA.read(False,True)
			valueB = regB.read(False,True)
		else:
			valueA = regA.value
			valueB = regB.value
		#print regA.value,regB.value


		if opcode == 0:#add
			valueC = valueA+valueB
			if (self.flag_out.read(False,False)>>15)*flag_array[0]:#if carry in is enabled
				valueC +=1
				self.flag_out.clear(0)

			if not flag_array[1]: #if carry out is enabled
				if valueC > 65535 or valueC < -65535:
					self.flag_out.write(1<<15,False,False)
					if valueC > 65535:
						valueC-=65536
					else:
						valueC+=65536

		elif opcode == 1:#subtract
			valueC = valueA-valueB
			if flag_array[0] and (self.flag_out.read(False,False)>>14)&1:#if lending is allowed
				valueC-=1
				self.flag_out.clear(1)
			if flag_array[1] and valueC<0:#if borrow allowed
				valueC+=65536
				self.flag_out.write(1<<14,False,False)

		elif opcode == 2:#multiply
			valueC = valueA*valueB
			if not flag_array[0]:#if overflows
				overflow = valueC>>16
				self.Output2.write(overflow,False,False)

			if not flag_array[1] and (valueC>65535 or valueC<65535):
				self.flag_out.write(1<<13,False,False)
			valueC = valueC&0xffff

		elif opcode == 3:#divide
			if valueB == 0:
				valueC = -65535
				if not flag_array[0]:
					self.flag_out.write(1<<12,False,False)
			else: valueC = valueA//valueB


		elif opcode == 4:#modulo
			if valueB == 0:
				valueC = 0
				if not flag_array[0]:
					self.flag_out.write(1<<12,False,False)
			else: valueC = valueA%valueB


		elif opcode == 5:#AND
			valueC = valueA&valueB
		elif opcode == 6:#OR
			valueC = valueA|valueB
		elif opcode == 7:#XOR
			valueC = valueA^valueB
		elif opcode == 8:#NOT
			valueC = ~valueA
		elif opcode == 9:#NAND
			valueC = (valueA&valueB)^0xffff
		elif opcode == 10:#NOR
			valueC = (valueA|valueB)^0xffff
		elif opcode == 11:#XNOR
			valueC = (valueA^valueB)^0xffff

			if opcode == 12:#Shift right
				if flag_array[0]:
					
					if valueA >0:
						valueA = 0x10000 + abs(valueA)
					valueC =  (valueA >> valueB)
					if valueC&0x10000:
						valueC = -(valueC&0xffff)
				else:
					if valueA<0:
						valueC = -((abs(valueA)>>valueB)&0xffff)
					else:
						valueC = (abs(valueA)>>valueB)&0xffff


			elif opcode == 13:#shift left
				if flag_array[0]:
					
					if valueA >0:
						valueA = 0x10000 + abs(valueA)
					valueC =  (valueA << valueB)
					if valueC&0x10000:
						valueC = -(valueC&0xffff)
				else:
					if valueA<0:
						valueC = -((abs(valueA)<<valueB)&0xffff)
					else:
						valueC = (abs(valueA)<<valueB)&0xffff

##got to here
					
			elif opcode == 14:#rot right
				if flag_array[0]:
					valueB = valueB%17
					if valueA >0:
						valueA = 0x10000 + abs(valueA)
					valueC =  (valueA>>valueB)|(valueA<<(17-valueB))&0x1ffff
					if valueC&0x10000:
						valueC = -(valueC&0xffff)
					
				else:
					valueB = valueB%16
					if valueA<0:
						valueC = -((abs(valueA)>>valueB)|(abs(valueA)<<(16-valueB))&0xffff)
					else:
						valueC = ((abs(valueA)>>valueB)|(abs(valueA)<<(16-valueB)))&0xffff

			elif opcode == 15:#rotate left
				if flag_array[0]:
					valueB = valueB%17
					if valueA >0:
						valueA = 0x10000 + abs(valueA)
					valueC =  (valueA<<valueB)|(valueA>>(17-valueB))&0x1ffff
					if valueC&0x10000:
						valueC = -(valueC&0xffff)
					
				else:
					valueB = valueB%16
					if valueA<0:
						valueC = -((abs(valueA)<<valueB)|(abs(valueA)>>(16-valueB))&0xffff)
					else:
						valueC = ((abs(valueA)<<valueB)|(abs(valueA)>>(16-valueB)))&0xffff


		if flag_array[3]: #output abs flag
			valueC = abs(valueC)
		self.Output1.write(valueC,False,False)

