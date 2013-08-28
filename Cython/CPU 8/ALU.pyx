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
			valueA = regA.read(False,True)[1]
			valueB = regB.read(False,True)[1]
		else:
			valueA = regA.value[1]*((-1)**regA.value[0])
			valueB = regB.value[1]*((-1)**regB.value[0])
		#print regA.value,regB.value


		if opcode == 0:#add
			valueC = valueA+valueB
			if (self.flag_out.read(False,False)[1]>>15)*flag_array[0]:#if carry in is enabled
				valueC +=1
				self.flag_out.clear(0)

			if not flag_array[1]: #if carry out is enabled
				if valueC > 65535 or valueC < -65535:
					self.flag_out.write((0,1<<15),False,False)
					if valueC > 65535:
						valueC-=65536
					else:
						valueC+=65536

		elif opcode == 1:#subtract
			valueC = valueA-valueB
			if flag_array[0] and (self.flag_out.read(False,False)[1]>>14)&1:#if lending is allowed
				valueC-=1
				self.flag_out.clear(1)
			if flag_array[1] and valueC<0:#if borrow allowed
				valueC+=65536
				self.flag_out.write((0,1<<14),False,False)

		elif opcode == 2:#multiply
			valueC = valueA*valueB
			if not flag_array[0]:#if overflows
				if valueC>0:
					overflow = (0,valueC>>16)
				else:
					overflow = (1,abs(valueC)>>16)
				self.Output2.write(overflow,False,False)

			if not flag_array[1] and (valueC>65535 or valueC<65535):
				self.flag_out.write((0,1<<13),False,False)
			valueC = valueC&0xffff

		elif opcode == 3:#divide
			if valueB == 0:
				valueC = -65535
				if not flag_array[0]:
					self.flag_out.write((0,1<<12),False,False)
			else: valueC = valueA//valueB


		elif opcode == 4:#modulo
			if valueB == 0:
				valueC = 0
				if not flag_array[0]:
					self.flag_out.write((0,1<<12),False,False)
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
			valueC = ~(valueA&valueB)
		elif opcode == 10:#NOR
			valueC = ~(valueA|valueB)
		elif opcode == 11:#XNOR
			valueC = ~valueA^valueB
		else: #shift/rot
			valueA = regA.read(False,False)

			if opcode == 12:#Shift right
				if flag_array[0]:
					valueA = (valueA[0]<<16)+valueA[1]
					valueC =  (valueA>> valueB)&0x1ffff
					valueC = ((-1)**valueC&0x10000)*valueC&0xffff
				else:
					valueC = ((-1)**valueA[0])*((valueA[1]>>valueB)&0xffff)
			elif opcode == 13:#shift left
				if flag_array[0]:
					valueA = (valueA[0]<<16)+valueA[1]
					valueC =  (valueA<<valueB)&0x1ffff
					valueC = ((-1)**valueC&0x10000)*valueC&0xffff
				else:
					valueC = ((-1)**valueA[0])*((valueA[1]<<valueB)&0xffff)
					
			elif opcode == 14:#rot right
				if flag_array[0]:
					valueB = valueB%17
					valueA = (valueA[0]<<16)+valueA[1]
					valueC =  (valueA>>valueB)|(valueA<<(17-valueB))&0x1ffff
					valueC = ((-1)**valueC&0x10000)*valueC&0xffff
				else:
					valueB = valueB%16
					valueC = ((-1)**valueA[0])*(valueA>>valueB)|(valueA<<(16-valueB))&0x1ffff
			elif opcode == 15:#rotate left
				if flag_array[0]:
					valueB = valueB%17
					valueA = (valueA[0]<<16)+valueA[1]
					valueC =  (valueA<<valueB)|(valueA>>(17-valueB))&0x1ffff
					valueC = ((-1)**valueC&0x10000)*valueC&0xffff
				else:
					valueB = valueB%16
					valueC = ((-1)**valueA[0])*(valueA<<valueB)|(valueA>>(16-valueB))&0x1ffff

		if flag_array[3]: #output abs flag
			valueC = (0,abs(valueC))
		else:
			if valueC<0:
				valueC = (1,abs(valueC))
			else: 
				valueC = (0,valueC)
		self.Output1.write(valueC,False,False)

