import time

#Processes input from a a hex stream to a decimal stream
#Not critical to CPU operation and is not part of the CPU
def hex_to_dec_list(inPut):
    output = []
    for i in inPut:
        output.append(int(i,16))
    return output

def hex_to_dec_stream(inPut):
    output = []
    for i in xrange(0,len(inPut),4):
        output.append(int(inPut[i:i+4],16))
    return output

# Class parts
class ALU:
    def __init__(self,flags):
        self.Flags = flags
    def operation(self,data,op):
        a = data//(2**16)
        b = data%(2**16)
        if op == 0: #ADD
            data = int((a + b)%(2**16))
            if a + b >= 2**16: self.Flags.set_bits(2**7)
        elif op == 1: #SUB
            data  = (a - b)%(2**16)
            if a > b: self.Flags.set_bits(2**6)
        elif op == 2: #MUL
            data = int((a*b)%2**16)
            if a*b>=2**16: self.Flags.set_bits(2**5)
        elif op == 3: #DIV
            if b != 0: data = a//b
            else:
                data = 0
                self.Flags.set_bits(2**4)
        elif op == 4: #MOD
            if b != 0: data = a%b
            else:
                data = 0
                self.Flags.set_bits(2**4)
        elif op == 5: #rev SUB
            data  = (b - a)%(2**16)
            if a < b: negative = 1
        elif op == 6: #rev DIV
            if a != 0: data = b//a
            else: data,div_by_zero = 0,1
        elif op == 7: #rev MOD
            if a != 0: data = b%a
            else: data,div_by_zero = 0,1
        elif op == 8: #AND
            data = a&b
        elif op == 9: #OR
            data = a|b
        elif op == 10: #XOR
            data = a^b
        elif op == 11: #NOT
            data = a^65535
        elif op == 12: #NAND
            data = (a&b)^65535
        elif op == 13: #NOR
            data = (a|b)^65535
        elif op == 14: #shift left
            data = a<<b
        elif op == 15: #shift right
            data = a>>b
            
        return data
    
class Register:
    def __init__(self,size):
        self.value = 0
        self.size = 2**size
    def write(self,value):
        self.value = value%self.size
    def read(self):
        return self.value
    def set_bits(self,bits_to_toggle):
        self.value = self.value^bits_to_toggle
    def increment(self):
        self.value += 1
        self.value = self.value%self.size
    def decrement(self):
        self.value -= 1
        self.value = self.value%self.size
    def write_high(self,value):
        self.value = self.value%256
        self.value = (self.value^value*256)%65536
    def write_low(self,value):
        self.value = (self.value//256)*256
        self.value = (self.value^value)%256
    def clear(self):
        self.value = 0
    
        
class Stack:
    def __init__(self,size,flags):
        self.limit = size
        self.stack = []
        self.Flags = flags
    def push(self,value):
        stack_overflow = 0
        self.stack.append(value)
        if len(self.stack) == self.limit:
            del(self.stack[0])
            self.Flags.set_bits(2**3)
    def pop(self):
        stack_empty = 0
        try:
            out = self.stack.pop()
        except IndexError: out = 0
        if len(self.stack) == 0:
            self.Flags.set_bits(2**2)
        return out

class Memory:
    def __init__(self,memory_to_load):
        self.memory = memory_to_load + [0]*(65536 - len(memory_to_load))
    def write(self,address,data):
        self.memory[address] = data
    def read(self,address):
        return self.memory[address]
        
class PC:
    def __init__(self,memory):
        self.Memory = memory
        self.Addr1 = Register(8)
        self.Addr2 = Register(8)
    def step(self):
        outaddr = self.Addr1.value*256 + self.Addr2.value
        out = self.Memory.memory[outaddr]
        self.Addr2.increment()
        if self.Addr2.value == 0:
            self.Addr1.increment()
        return out
    def fullgoto(self,addr1,addr2):
        self.Addr1.write(addr1)
        self.Addr2.write(addr2)
    def partgoto(self,addr2):
        self.Addr2.write(addr2)
    def jump(self,addr1,addr2):
        self.Addr2.value += addr2
        if self.Addr2.value >255:
            self.Addr2.value -= 256
            self.Addr1.value+=1
        self.Addr1.value = (self.Addr1.value + addr1)%256
    def jump_both(self,value):
        value1 = value//256
        value2 = value%256
        self.jump(value1,value2)
    def jump_back_both(self,value):
        value1 = value//256
        value2 = value%256
        self.back(value1,value2)
    def jump_back(self,addr1,addr2):
        self.Addr2.value -= addr2
        if self.Addr2.value <0:
            self.Addr2.value += 256
            self.Addr1.value -= 1
        self.Addr1.value = (self.Addr1.value - addr1)%256
    def step_back(self):
        self.Addr2.decrement()
        if self.Addr2.value == 255:
            self.Addr1.decrement()
        outaddr = self.Addr1.value*256 + self.Addr2.value
        out = self.Memory.memory[outaddr]
        return out
        
        
        
        
            
class CPU:
    def __init__(self,memory_to_load):
        self.Flags = Register(16)
        self.ALU = ALU(self.Flags)
        self.Address_register = Register(8)
        self.Accumulator = Register(16)
        self.Stack = Stack(32,self.Flags)
        self.Memory = Memory(memory_to_load)
        self.PC = PC(self.Memory)
        self.instr_count = 0
    def run(self):
        self.instr_count += 1
        instr = self.PC.step()
        parameter = instr%256
        instr = instr //256
        out = (instr,parameter)
        if instr == 0: #halt
            pass
        elif instr <= 32: #ALU operations
            #print "adding"
            instr -= 1
            ALUop = instr % 16
            if instr <= 15:
                self.Accumulator.write(self.ALU.operation(self.Accumulator.value*65536+self.Memory.read(self.Address_register.read()*256+parameter),ALUop))
            else:#Write to the ACC      The result of the ALU operating on the value of the accumulator and data or data read from the address indicated
                self.Accumulator.write(self.ALU.operation(self.Accumulator.value*65536+parameter,ALUop))        
        elif instr == 33: #write accumulator from address
            self.Accumulator.write(self.Memory.read(self.Address_register.read()*256+parameter))            
        elif instr == 34: #write accumulator high byte from bits in data
            self.Accumulator.write_high(parameter)
        elif instr == 35: #write accumulator low byte from bits in data
            self.Accumulator.write_low(parameter)
        elif instr == 36:#clear accumulator
            self.Accumulator.clear()
        elif instr == 37: #read accumulator to address
            self.Memory.write(self.Address_register.read()*256+parameter,self.Accumulator.read())
        elif instr == 38: #read flags to high byte of memory at address
            self.Memory.write(self.Address_register.read()*256+parameter,self.Flags.value*256)
        elif instr == 39: #read flags to low byte of memory at address
            self.Memory.write(self.Address_register.read()*256+parameter,self.Flags.value)
        elif instr == 40: #read flags to high byte of accumulator
            self.Accumulator.write(self.Flags.value*65536)
        elif instr == 41: #read flags to low byte of accumulator
            self.Accumulator.write(self.Flags.value)
        elif instr == 42: #write address reg from high byte of memory at address
            self.Address_register.write(self.memory.read(self.Address_register.read()*256+parameter)//256)
        elif instr == 43: #write address reg from low byte of memory at address
            self.Address_register.write(self.memory.read(self.Address_register.read()*256+parameter))
        elif instr == 44: #write address reg from parameter
            self.Address_register.write(parameter)
        elif instr == 45: #write address reg from high byte of accumulator
            self.Address_register.write(self.Accumulator.value//256)
        elif instr == 46: #write address reg from low byte of accumulator
            self.Address_register.write(self.Accumulator.value)
        elif instr == 47: #read address reg to high byte of memory at address
            self.Memory.write(self.Address_register.read()*256+parameter,self.Address_register.value*256)
        elif instr == 48: #read address reg to low byte of memory at address
            self.Memory.write(self.Address_register.read()*256+parameter,self.Address_register.value)
        elif instr == 49: #read address reg to accumulator high byte
            self.Accumulator.write(self.Address_register.value*256)
        elif instr == 50: #read address reg to accumulator low
            self.Accumulator.write(self.Address_register.value)
        elif instr == 51: # declare label
            pass
        elif instr == 52: #goto label
            to_search_for = 51*256+parameter
            to_test = 0
            current = (self.PC.Addr1.value,self.PC.Addr2.value)
            while to_test != to_search_for:
                to_test = self.PC.step()
                if (self.PC.Addr1.value,self.PC.Addr2.value) == current:
                    out = (0,256)
        elif instr == 53: #return to label
            to_search_for = 51*256+parameter
            to_test = 0
            current = (self.PC.Addr1.value,self.PC.Addr2.value)
            while to_test != to_search_for:
                to_test = self.PC.step_back()
                if (self.PC.Addr1.value,self.PC.Addr2.value) == current:
                    out = (0,256)
        elif instr == 54: #goto in address
            self.PC.fullgoto(self.Address_register.value,self.Memory.read(self.Address_register.value*256+parameter))
        elif instr == 55: #goto in accumulator
            self.PC.fullgoto(self.Accumulator.value//256,self.Accumulator.value%256)
        elif instr == 56: #goto data
            self.PC.partgoto(parameter)
        elif instr == 57: #jump forward by value in address
            self.PC.jump_both(self.Memory.read(self.Address_register.value*256+parameter))
        elif instr == 58: #jump forward by data
            self.PC.jump(0,parameter)
        elif instr == 59: #jump back by value in address
            self.PC.jump_back_both(self.Memory.read(self,Address_register.value*256+parameter+1))
        elif instr  == 60: #jump back by data
            self.PC.jump_back(0,1)
            self.PC.jump_back(0,parameter)
        elif instr >=61 and instr <= 79:
            skip = 0
            if instr == 61: #if accumulator = memory in address
                if self.Accumulator.value != self.Memory.read(self.Address_register.value*256+parameter):
                    skip = 1
            elif instr == 62: #iff accumulator = data
                if self.Accumulator.value != parameter:
                    skip = 1
            elif instr == 63:#if accumulator > memory in address
                if self.Accumulator.value <= self.Memory.read(self.Address_register.value*256+parameter):
                    skip = 1
            elif instr == 64:#if accumulator > data
                if self.Accumulator.value <= parameter:
                    skip = 1
            elif instr == 65: #if accumulator < memory in address
                if self.Accumulator.value >= self.Memory.read(self.Address_register.value*256+parameter):
                    skip = 1
            elif instr == 66: #if accumulator < data
                if self.Accumulator.value >= parameter:
                    skip = 1
            elif instr >= 67 and instr <= 71: #if flags = bitwise through comp value
                # cycles comparison value bits, if for each bit in comp value which is high the corresponding flag bit is high, then it
                #goes through
                #equivalent to (flags or not comp)
                if instr == 67: #comp = address high byte
#                           Flags       or  comp                                                        NOT() (XOR 111..)
                    if (self.Flags.value|((self.Memory.read(self.Address_register.value*256+parameter)//256)^255)) != 255:
                        skip = 1                 
                if instr == 68:#comp = address low byte
                    if (self.Flags.value|((self.Memory.read(self.Address_register.value*256+parameter)%256)^255)) != 255:
                        skip = 1
                if instr == 69: # comp = accumulator high byte
                    if (self.Flags.value|((self.Accumulator.value//256)^255)) != 255:
                        skip = 1
                if instr == 70: # comp = accumulator low byte
                    if (self.Flags.value|(self.Accumulator.value%256)^255) != 255:
                        skip = 1
                if instr == 71: # comp = data
                    if (self.Flags.value|(parameter^255)) != 255:
                        skip = 1
                
                

            elif instr == 72: #if PC position = memory from address
                if self.PC.Addr1*256 +self.PC.Addr2 != self.Memory.read(self.Address_register.value*256+parameter):
                    skip = 1
            elif instr == 73: #if PC position high byte = data
                if self.PC.Addr1 != parameter:
                    skip = 1
            elif instr == 74: #if PC position low byte = data
                if self.PC.Addr2 != parameter:
                    skip = 1
            elif instr == 75: #if PC position = accumulator
                if self.PC.Addr1*256 +self.PC.Addr2 != self.Accumulator.value:
                    skip = 1
            elif instr == 76: #if address register = high byte of memory from address
                if self.Address_register.value != self.Memory.read(self.Address_register.value*256+parameter)//256:
                    skip = 1
            elif instr == 77: #if address register = low byte of memory from address
                if self.Address_register.value != self.Memory.read(self.Address_register.value*256+parameter)%256:
                   skip = 1
            elif instr == 78: #if address register = high byte of accumulator
                if self.Address_register.value != self.Accumulator.value//256:
                    skip = 1
            elif instr == 79: #if address register = low byte of accumulator
                if self.Address_register.value != sel.Accumulator.value%256:
                    skip = 1
            if skip:
                skip_count = 1
                while skip_count:
                    to_test = self.PC.step()//256
                    if to_test == 80:
                        skip_count -= 1
                    elif to_test >= 61 and to_test <= 79:
                        skip_count += 1
                    if self.PC.Addr1.value == 0 and self.PC.Addr2.value == 0:
                        out = (0,257) # breaks because of no end if
        elif instr == 80: #end if
            pass
        elif instr == 81: #clear flags
            self.Flags.clear()
        elif instr == 82: #toggle flags with high byte from memory at address
            self.Flags.set_bits(self.Memory.read(self.Address_register.value*256+parameter)//256)
        elif instr == 83: #toggle flags with high byte from memory at address
            self.Flags.set_bits(self.Memory.read(self.Address_register.value*256+parameter)%256)
        elif instr == 84: #toggle flags with data
            self.Flags.set_bits(parameter)
        elif instr == 85: #toggle flags from high byte of accumulator
            self.Flags.set_bits(self.Accumulator.value//256)
        elif instr == 86: #toggle flags from low byte of accumulator
            self.Flags.set_bits(self.Accumulator.Value%256)
        elif instr == 87: #push to stack from accumulator
            self.Stack.push(self.Accumulator.value)
        elif instr == 88: #push to stack from memory at address
            self.Stack.push(self.Memory.read(self.Address_register.value*256+parameter))
        elif instr == 89: #Push to stack from memory at address in accumulator
            self.Stack.push(self.Memory.read(self.Accumulator.value))
        elif instr == 90: #pop stack to accumulator
            self.Accumulator.write(self.Stack.pop)
        elif instr == 91: #pop stack to address
            self.Memory.write(self.Address_register.value*256+parameter,self.Stack.pop())
        elif instr == 92: #pop stack to address in accumulator
            self.Memory.write(self.Accumulator.value,self.Stack.pop())
        elif instr == 93: #write accumulator to address B in address in parameter
            self.Memory.write(self.Memory.read(self.Address_register.value*256+parameter),self.Accumulator.value)
        elif instr == 94: #read from address B at address in parameter to accumulator
            self.Accumulator.write(self.Memory.read(self.Memory.read(self.Address_register.value*256+parameter)))
        elif instr == 95: #Accumulator fetch: memory at address in accumulator is written to the accumulator
            self.Accumulator.write(self.Memory.read(self.Accumulator.value))

        
        return out

program = ['3e0a','0000','5000','210d','040e','010e','1402','250e','210c','1101','250c','3800','0000','ffff','0002']
program = hex_to_dec_list(program)
CPU = CPU(program)
start = time.time()
output = CPU.run()
while output[0] != 0:
    output = CPU.run()
end = time.time()
print "exit code:",output[1]
print "Time taken:",end-start
print "Number of operations:", CPU.instr_count
print CPU.Memory.memory[:15]
