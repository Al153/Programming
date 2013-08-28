import time
import pygame #needed for GPU
import math # for sqrt in vectors
import Tkinter as tk


#Takes file input and feeds it to the CPU constructor
class Program:
    def __init__(self):
        error = 1
        while error:
            try:
                file_name = str(raw_input("Please enter file name: "))
                self.program_file = open(file_name)
                error = 0
            except IOError:
                try:
                    file_name += '.txt'
                    self.program_file = open(file_name)
                    error = 0
                except:print "File Name Error\n\nPlease try again"
    def extract_program(self):
        print "\nReading program from file",
        inPut = self.program_file.read()
        print " = Okay\nFormatting program",
        inPut = self.preprocess(inPut)
        self.program = self.hex_to_dec_stream(inPut)
        self.program_file.close()
        print " = Okay\n"
        return self.program
        
    def preprocess(self,string): #Removes spaces, punctuation etc.
        result = ''
        for i in range(len(string)):
            if string[i] in ('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'):#use capitals for Comments
                result+=string[i]
        return result
        
    def hex_to_dec_list(self,inPut):
        output = []
        for i in inPut:
            output.append(int(i,16))
        return output

    def hex_to_dec_stream(self,inPut):
        output = []
        for i in xrange(0,len(inPut),4):
            output.append(int(inPut[i:i+4],16))
        return output

# Class parts
class ALU:
    def __init__(self,flags):
        self.Flags = flags
    def operation(self,data,op):
        a = int(data>>16)
        b = int(data&65535)
        if op == 0: #ADD
            data = int((a + b)&65535)
            if a + b >= 2**16: self.Flags.set_bits(2**7)
        elif op == 1: #SUB
            data  = (a - b)&65535
            if a > b: self.Flags.set_bits(2**6)
        elif op == 2: #MUL
            data = int((a*b)&65535)
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
            data  = (b - a)&65535
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
            data = (a<<b)
        elif op == 15: #shift right
            data = (a>>b)&65535
            
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
        self.value = self.value&0xff
        self.value = (self.value^(value<<8))&65535
    def write_low(self,value):
        self.value = self.value&0xff00
        self.value = self.value^value
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
 
class Vector_processing_unit:
    def __init__(self):
        self.Vector_accumulator = (Coord_register(8),Coord_register(8))
    def run(self,data,op):

        #vectors
        if op == 0:#scale vector up (multiply)
            check_value = self.Vector_accumulator[0].value
            self.Vector_accumulator[0].value *= data
            if self.Vector_accumulator[0].value >127:
                self.Vector_accumulator[0].value = 127
            elif self.Vector_accumulator[0].value < -128:
                self.Vector_accumulator[0].value = -128
            self.Vector_accumulator[1].value *= data
            if self.Vector_accumulator[1].value >127:
                self.Vector_accumulator[1].value = 127
            elif self.Vector_accumulator[1].value < -128:
                self.Vector_accumulator[1].value = -128
        elif op == 1:#scale vector down(divide)
            if data != 0:
                self.Vector_accumulator[0].value //= data
                self.Vector_accumulator[1].value //= data  
            else:
                self.Vector_accumulator[0].value = -128 # 0b11111111
                self.Vector_accumulator[1].value = -128
        elif op == 2:#add vector
            x = data>>8
            y = data&0xff
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_accumulator[0].value += x
            self.Vector_accumulator[1].value += y
            if self.Vector_accumulator[0].value >127:
                self.Vector_accumulator[0].value = 127
            elif self.Vector_accumulator[0].value < -128:
                self.Vector_accumulator[0].value = -128
            if self.Vector_accumulator[1].value >127:
                self.Vector_accumulator[1].value = 127
            elif self.Vector_accumulator[1].value < -128:
                self.Vector_accumulator[1].value = -128
        elif op == 3:#subtract vector
            x = data>>8
            y = data&0xff
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_accumulator[0].value -= x
            self.Vector_accumulator[1].value -= y
            if self.Vector_accumulator[0].value >127:
                self.Vector_accumulator[0].value = 127
            elif self.Vector_accumulator[0].value < -128:
                self.Vector_accumulator[0].value = -128
            if self.Vector_accumulator[1].value >127:
                self.Vector_accumulator[1].value = 127
            elif self.Vector_accumulator[1].value < -128:
                self.Vector_accumulator[1].value = -128
        elif op == 4:#find scalar(accumulator)
            self.write_vector_accumulator(int(math.sqrt(self.Vector_accumulator[0].value**2+self.Vector_accumulator[1].value**2)))
        elif op == 5:#find scalar(input)
            x = data>>8
            y = data&0xff
            if x >127: x -= 256
            if y > 127: y -= 256
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 6:#find vector(accumulator to input)
            x = data>>8
            y = data&0xff
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_accumulator[0].value = x - self.Vector_accumulator[0].value
            self.Vector_accumulator[1].value = y - self.Vector_accumulator[1].value
            if self.Vector_accumulator[0].value >127:
                self.Vector_accumulator[0].value = 127
            elif self.Vector_accumulator[0].value < -128:
                self.Vector_accumulator[0].value = -128
            if self.Vector_accumulator[1].value >127:
                self.Vector_accumulator[1].value = 127
            elif self.Vector_accumulator[1].value < -128:
                self.Vector_accumulator[1].value = -128
        elif op == 7: #find scalar(accumulator to input)
            x = data>>8
            y = data&0xff
            if x >127: x -= 256
            if y > 127: y -= 256
            self.write_vector_accumulator(int(math.sqrt((self.Vector_accumulator[0].value+ x)**2+(self.Vector_accumulator[1].value**2+y))))
        # Coords
        elif op == 8: #Multiply coords
            x = self.Vector_accumulator[0].value&0xff
            y = self.Vector_accumulator[1].value&0xff
            x*=data
            y*=data
            if x>255:
                x = 255
            if y>255:
                y = 255
            self.write_vector_accumulator((x<<8)+y)
        elif op == 9:#divide coords
            x = self.Vector_accumulator[0].value&0xff
            y = self.Vector_accumulator[1].value&0xff
            x//=data
            y//=data
            self.write_vector_accumulator((x<<8)+y)
        elif op == 10:#add coords
            x = self.Vector_accumulator[0].value&0xff
            y = self.Vector_accumulator[1].value&0xff
            x += data&0xff
            y += data>>8
            if x>255:
                x = 255
            if y>255:
                y = 255
            self.write_vector_accumulator((x<<8)+y)
        elif op == 11:#subtract coords
            x = self.Vector_accumulator[0].value&0xff
            y = self.Vector_accumulator[1].value&0xff
            x -= data&0xff
            y -= data>>8
            if x<0:
                x = 0
            if y<0:
                y = 0
            self.write_vector_accumulator((x<<8)+y)
        elif op == 12: #find scalar  from origin to stored value
            x = self.Vector_accumulator[0].value&0xff
            y = self.Vector_accumulator[1].value&0xff
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 13: #find scalar from origin to input
            x = data>>8
            y = data&0xff
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 14: # subtract coords from input 
            x = data &0xff
            y = data>>8
            x -= self.Vector_accumulator[0].value&0xff
            y -= self.Vector_accumulator[1].value&0xff
            if x<0:
                x = 0
            if y<0:
                y = 0
            self.write_vector_accumulator((x<<8)+y)
        elif op == 15: # find scalar from input to stored
            x = data>>8
            y = data&0xff
            x1 = self.Vector_accumulator[0].value&0xff
            y1 = self.Vector_accumulator[1].value&0xff
            self.write_vector_accumulator(int(math.sqrt((x-x1)**2+(y-y1)**2)))

    def write_vector_accumulator(self,bus):
        value1 = bus>>8
        value2 = bus&0xff
        if value1 >127: value1 -= 256
        if value2 > 127: value2 -= 256
        self.Vector_accumulator[0].value = value1
        self.Vector_accumulator[1].value = value2

    def read_vector_accumulator(self):
        return (self.Vector_accumulator[0].value&0xff)*256+(self.Vector_accumulator[1].value)&0xff

class Coord_register:
    def __init__(self,size):
        self.value = 0
    def write(self,value):
        self.value = value
    def read(self):
        return self.value
    def clear(self):
        self.value = 0
        
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
        self.Addr1.value = (self.Addr1.value + addr1)&0xff
    def jump_both(self,value):
        value1 = value>>8
        value2 = value&0xff
        self.jump(value1,value2)
    def jump_back_both(self,value):
        value1 = value>>8
        value2 = value&0xff
        self.back(value1,value2)
    def jump_back(self,addr1,addr2):
        self.Addr2.value -= addr2
        if self.Addr2.value <0:
            self.Addr2.value += 256
            self.Addr1.value -= 1
        self.Addr1.value = (self.Addr1.value - addr1)&0xff
    def step_back(self):
        self.Addr2.decrement()
        if self.Addr2.value == 255:
            self.Addr1.decrement()
        outaddr = self.Addr1.value*256 + self.Addr2.value
        out = self.Memory.memory[outaddr]
        return out

class GPU_mk1:
    def __init__(self):
        pass
    def start_up(self):
        pygame.init()
        self.Surface = pygame.display.set_mode((256,256))
        pygame.display.set_caption("Al's CPU 7: GPU Mk 1")
        self.PxArray = pygame.PixelArray(self.Surface)
        self.vector = [0,0] #takes 2's complement
        self.startpoint = [0,0]

    def toggle_pixel(self,x,y):
        
        if self.PxArray[x,255-y] == self.Surface.map_rgb((0, 0, 0)): self.PxArray[x,255-y] = (255,255,255)
        else: self.PxArray[x,255-y] = (0,0,0)

    def toggle_pixel_bus(self,coord):
        x = coord>>8
        y = coord&0xff
        if self.PxArray[x,255 - y] == self.Surface.map_rgb((0, 0, 0)): self.PxArray[x,255 - y] = (255,255,255)
        else: self.PxArray[x, 255 -y] = (0,0,0)
        
    def vector_line(self,coord):
        x = coord>>8
        y = coord&0xff
        pygame.draw.line(self.Surface,(255,255,255),(x,255-y),(x+self.vector[0],255 -(y+self.vector[1])))

    def set_vector(self,coord):
        self.vector = [coord>>8,coord&0xff]
        for i in xrange(2):
            if self.vector[i] >= 128: self.vector[i] -= 256
            
    def startpoint_line(self,coord):
        x = coord>>8
        y = coord&0xff
        pygame.draw.line(self.Surface,(255,255,255),(x,255-y),(self.startpoint[0],255 -(self.startpoint[1])))

    def set_startpoint(self,coord):
        self.startpoint =[coord>>8,coord&0xff]           
    def clear_screen(self):
        self.Surface.fill((0,0,0))
    def test_pixel(self,coord):
        x = coord>>8
        y = coord&0xff
        if self.PxArray[x,255 - y] == self.Surface.map_rgb((255,255,255)): return 1
    
    def update(self):
        pygame.display.update()
    def close(self):
        pygame.quit()

class Input:
    def __init__(self):
        self.root = tk.Tk()
        self.root.bind_all('<Key>', self.keypress)
        
        self.addr = 0

    def keypress(self,event):
        #print "detected"
        if event.char:
            x = event.char
            #print "detected"
            try:
                #print ord(x)
                CPU.Memory.write(self.addr,ord(x))
            except:
                CPU.Memory.write(self.addr,32)
            #self.root.quit()
        else: CPU.feed(0,self.addr)
    def run(self,addr):
        #print "detecting"
        self.addr = addr
        self.root.focus_set()
        #don't show the tk window
        #self.root.withdraw()
        
        self.root.update()

class Output:
    def __init__(self):
        self.output_buffer = ''
    def reset(self):
        self.output_buffer = ''
    def add_to_buffer(self,data):
        #print "adding to buffer"
        #print self.output_buffer
        self.output_buffer += chr(data&0xff)
    def flush(self):
        #print "flushing"
        print self.output_buffer
        self.reset()
        
        
        
            
class CPU:
    def __init__(self,memory_to_load):
        self.Flags = Register(16)
        self.ALU = ALU(self.Flags)
        self.Address_register = Register(8)
        self.Accumulator = Register(16)
        self.Stack = Stack(64,self.Flags)
        self.Memory = Memory(memory_to_load)
        self.GPU = GPU_mk1()
        self.PC = PC(self.Memory)
        self.VPU = Vector_processing_unit()
        self.instr_count = 0
        self.context = [[0,0,0,0,0,[]]]*4 #Acc, Pc1 Pc2, addr, flags, stack
        self.Output = Output()
        self.input_on = 0
    def change_context(self,context_no):
        temp = [self.Accumulator.value, self.PC.Addr1.value, self.PC.Addr2.value, self.Address_register.value, self.Flags.value,self.Stack.stack]
        self.Accumulator.value, self.PC.Addr1.value, self.PC.Addr2.value, self.Address_register.value, self.Flags.value,self.Stack.stack = self.context[context_no][0],self.context[context_no][1],self.context[context_no][2],self.context[context_no][3],self.context[context_no][4],self.context[context_no][5]
        self.context[context_no] = list(temp)
    def new_context(self,context_no,source):
        self.context[context_no] = [0,source>>8,source&0xff,0,0,[]]
    def feed(self,value,addr):
        #print value
        self.Memory.write(addr,value)
    def startInput(self):
        self.Input = Input()

    def run(self):
        while 1:
            self.instr_count += 1
            instr = self.PC.step()
            parameter = instr&0xff
            instr = instr >>8
            out = (instr,parameter)
            #print hex(instr)
            if instr == 0: #halt
                return parameter
            elif instr <= 32: #ALU operations
                #print "adding"
                instr -= 1
                ALUop = instr % 16
                if instr <= 15:
                    self.Accumulator.write(self.ALU.operation((self.Accumulator.value<<16)+self.Memory.read((self.Address_register.read()<<8)+parameter),ALUop))
                else:#Write to the ACC      The result of the ALU operating on the value of the accumulator and data or data read from the address indicated
                    self.Accumulator.write(self.ALU.operation((self.Accumulator.value<<16)+parameter,ALUop))        
            elif instr == 33: #write accumulator from address
                self.Accumulator.write(self.Memory.read((self.Address_register.read()<<8)+parameter))            
            elif instr == 34: #write accumulator high byte from bits in data
                self.Accumulator.write_high(parameter)
            elif instr == 35: #write accumulator low byte from bits in data
                self.Accumulator.write_low(parameter)
            elif instr == 36:#clear accumulator
                self.Accumulator.clear()
            elif instr == 37: #read accumulator to address
                self.Memory.write((self.Address_register.read()<<8)+parameter,self.Accumulator.read())
            elif instr == 38: #read flags to high byte of memory at address
                self.Memory.write((self.Address_register.read()<<8)+parameter,self.Flags.value<<8)
            elif instr == 39: #read flags to low byte of memory at address
                self.Memory.write((self.Address_register.read()<<8)+parameter,self.Flags.value)
            elif instr == 40: #read flags to high byte of accumulator
                self.Accumulator.write(self.Flags.value<<8)
            elif instr == 41: #read flags to low byte of accumulator
                self.Accumulator.write(self.Flags.value)
            elif instr == 42: #write address reg from high byte of memory at address
                self.Address_register.write(self.memory.read((self.Address_register.read()<<8)+parameter)>>8)
            elif instr == 43: #write address reg from low byte of memory at address
                self.Address_register.write(self.memory.read((self.Address_register.read()<<8)+parameter))
            elif instr == 44: #write address reg from parameter
                self.Address_register.write(parameter)
            elif instr == 45: #write address reg from high byte of accumulator
                self.Address_register.write(self.Accumulator.value>>8)
            elif instr == 46: #write address reg from low byte of accumulator
                self.Address_register.write(self.Accumulator.value)
            elif instr == 47: #read address reg to high byte of memory at address
                self.Memory.write((self.Address_register.read()<<8)+parameter,self.Address_register.value<<8)
            elif instr == 48: #read address reg to low byte of memory at address
                self.Memory.write((self.Address_register.read()<<8)+parameter,self.Address_register.value)
            elif instr == 49: #read address reg to accumulator high byte
                self.Accumulator.write(self.Address_register.value<<8)
            elif instr == 50: #read address reg to accumulator low
                self.Accumulator.write(self.Address_register.value)
            elif instr == 51: # declare label
                pass
            elif instr == 52: #goto label
                to_search_for = (51<<8)+parameter
                to_test = 0
                current = (self.PC.Addr1.value,self.PC.Addr2.value)
                while to_test != to_search_for:
                    to_test = self.PC.step()
                    if (self.PC.Addr1.value,self.PC.Addr2.value) == current:
                        out = (0,256)
            elif instr == 53: #return to label
                to_search_for = (51<<8)+parameter
                to_test = 0
                current = (self.PC.Addr1.value,self.PC.Addr2.value)
                while to_test != to_search_for:
                    to_test = self.PC.step_back()
                    if (self.PC.Addr1.value,self.PC.Addr2.value) == current:
                        out = (0,256)
            elif instr == 54: #goto in address
                self.PC.fullgoto(self.Address_register.value,self.Memory.read((self.Address_register.value<<8)+parameter))
            elif instr == 55: #goto in accumulator
                self.PC.fullgoto(self.Accumulator.value>>8,self.Accumulator.value&0xff)
            elif instr == 56: #goto data
                self.PC.partgoto(parameter)
            elif instr == 57: #jump forward by value in address
                self.PC.jump_both(self.Memory.read((self.Address_register.value<<8)+parameter))
            elif instr == 58: #jump forward by data
                self.PC.jump(0,parameter)
            elif instr == 59: #jump back by value in address
                self.PC.jump_back_both(self.Memory.read((self,Address_register.value<<8)+parameter+1))
            elif instr  == 60: #jump back by data
                #print "jumping"
                self.PC.jump_back(0,1)
                self.PC.jump_back(0,parameter)
            elif instr >=61 and instr <= 79:
                skip = 0
                if instr == 61: #if accumulator = memory in address
                    if self.Accumulator.value != self.Memory.read((self.Address_register.value<<8)+parameter):
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
#                               Flags       or  comp                                                        NOT() (XOR 111..)
                        if (self.Flags.value|((self.Memory.read(self.Address_register.value*256+parameter)>>8)^255)) != 255:
                            skip = 1                 
                    if instr == 68:#comp = address low byte
                        if (self.Flags.value|((self.Memory.read(self.Address_register.value*256+parameter)&0xff)^255)) != 255:
                            skip = 1
                    if instr == 69: # comp = accumulator high byte
                        if (self.Flags.value|((self.Accumulator.value>>8)^255)) != 255:
                            skip = 1
                    if instr == 70: # comp = accumulator low byte
                        if (self.Flags.value|(self.Accumulator.value&0xff)^255) != 255:
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
                    if self.Address_register.value != self.Memory.read(self.Address_register.value*256+parameter)>>8:
                        skip = 1
                elif instr == 77: #if address register = low byte of memory from address
                    if self.Address_register.value != self.Memory.read(self.Address_register.value*256+parameter)&0xff:
                        skip = 1
                elif instr == 78: #if address register = high byte of accumulator
                    if self.Address_register.value != self.Accumulator.value>>8:
                        skip = 1
                elif instr == 79: #if address register = low byte of accumulator
                    if self.Address_register.value != self.Accumulator.value&0xff:
                        skip = 1
                if skip:
                    skip_count = 1
                    while skip_count:
                        to_test = self.PC.step()>>8
                        if to_test == 80:
                            skip_count -= 1
                        elif (to_test >= 61 and to_test <= 79) or (to_test >= 120 and to_test <= 123):
                            skip_count += 1
                        if self.PC.Addr1.value == 0 and self.PC.Addr2.value == 0:
                            return 257 # breaks because of no end if
            elif instr == 80: #end if
                pass
            elif instr == 81: #clear flags
                self.Flags.clear()
            elif instr == 82: #toggle flags with high byte from memory at address
                self.Flags.set_bits(self.Memory.read(self.Address_register.value*256+parameter)>>8)
            elif instr == 83: #toggle flags with high byte from memory at address
                self.Flags.set_bits(self.Memory.read(self.Address_register.value*256+parameter)&0xff)
            elif instr == 84: #toggle flags with data
                self.Flags.set_bits(parameter)
            elif instr == 85: #toggle flags from high byte of accumulator
                self.Flags.set_bits(self.Accumulator.value>>8)
            elif instr == 86: #toggle flags from low byte of accumulator
                self.Flags.set_bits(self.Accumulator.Value&0xff)
            elif instr == 87: #push to stack from accumulator
                self.Stack.push(self.Accumulator.value)
            elif instr == 88: #push to stack from memory at address
                self.Stack.push(self.Memory.read(self.Address_register.value*256+parameter))
            elif instr == 89: #Push to stack from memory at address in accumulator
                self.Stack.push(self.Memory.read(self.Accumulator.value))
            elif instr == 90: #pop stack to accumulator
                self.Accumulator.write(self.Stack.pop())
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
            elif instr == 96: #start GPU
                self.GPU.start_up()
                self.Flags.set_bits(1)
            elif instr == 97:#Update screen
                try:self.GPU.update()
                except: pass
            elif instr == 98:#clear screen
                try:self.GPU.clear_screen()
                except: pass
            elif instr == 99:#Turn off GPU + screen
                try:
                    self.GPU.close()
                    self.Flags.set_bits(1)
                except: pass
            elif instr == 100:#toggle pixel accumulator
                try:self.GPU.toggle_pixel_bus(self.Accumulator.value)
                except: pass
            elif instr == 101:#toggle pixel address
                try:self.GPU.toggle_pixel_bus(self.Memory.read(self.Address_register.value*256+parameter))
                except: pass
            elif instr == 102:#toggle pixel address in accumulator
                try:self.GPU.toggle_pixel_bus(self.Memory.read(self.Accumulator.value))
                except: pass
            elif instr == 103:#toggle pixel from stack
                try:self.GPU.toggle(self.Stack.pop())
                except: pass
            elif instr == 104: #draw Vector line from accumulator
                try:self.GPU.vector_line(self.Accumulator.value)
                except: pass
            elif instr == 105: #draw vector line from address
                try:self.GPU.vector_line(self.Memory.read(self.Address_register.value*256+parameter))
                except: pass
            elif instr == 106: # draw vector line from address in accumulator
                try:self.GPU.vector_line(self.Memory.read(self.Accumulator.value))
                except: pass
            elif instr == 107: # draw vector line from stack
                try:self.GPU.vector_line(self.Stack.pop())
                except: pass
            elif instr == 108: #draw point to point line from accumulator
                try:self.GPU.startpoint_line(self.Accumulator.value)
                except: pass
            elif instr == 109: #draw point to point line from address
                try:self.GPU.startpoint_line(self.Memory.read(self.Address_register.value*256+parameter))
                except: pass
            elif instr == 110: #draw point to point line from address in accumulator
                try:self.GPU.startpoint_line(self.Memory.read(self.Accumulator.value))
                except: pass
            elif instr == 111: #draw point to point line from stack
                try:self.GPU.startpoint_line(self.Stack.pop())
                except: pass
            elif instr == 112: # set GPU vector from accumulator
                try:self.GPU.set_vector(self.Accumulator.value)
                except: pass
            elif instr == 113: #set GPU vector from address
                try:self.GPU.set_vector(self.Memory.read(self.Address_register.value*256+parameter))
                except: pass
            elif instr == 114: #set GPU vector from address in accumulator
                try:self.GPU.set_vector(self.Memory.read(self.Accumulator.value))
                except: pass
            elif instr == 115: #set GPU vector from stack
                try:self.GPU.set_vector(self.Stack.pop())
                except: pass
            elif instr == 116: #set GPU startpoint from accumulator
                try:self.GPU.set_startpoint(self.Accumulator.value)
                except: pass
            elif instr == 117: # set GPU startpoint from address
                try:self.GPU.set_startpoint(self.Memory.read(self.Address_register.value*256+parameter))
                except: pass
            elif instr == 118: #set GPU startpoint from address in accumulator
                try:self.GPU.set_startpoint(self.Memory.read(self.Accumulator.value))
                except: pass
            elif instr == 119: #set GPU startpoint from stack
                try:self.GPU.set_startpoint(self.Stack.pop())
                except: pass
            elif instr >= 120 and instr <= 123: # test pixel
                try:
                    skip = 0
                    if instr == 120: #test pixel from accumulator
                        if not self.GPU.test_pixel(self.Accumulator.value): skip = 1
                    elif instr == 121: #test pixel from address
                        if not self.GPU.test_value(self.Memory.read(self.Address_register.value*256+parameter)): skip = 1
                    elif instr == 122: #test pixel from address in accumulator
                        if not self.GPU.test_value(self.Memory.read(self.Accumulator.value)):skip = 1
                    elif instr == 123: #test pixel from stack
                        if not self.GPU.test_value(self.Stack.pop): skip = 1 
                    if skip:
                        skip_count = 1
                        while skip_count:
                            to_test = self.PC.step()>>8
                            if to_test == 80:
                                skip_count -= 1
                            elif (to_test >= 61 and to_test <= 79) or (to_test >= 120 and to_test <= 123):
                                skip_count += 1
                            if self.PC.Addr1.value == 0 and self.PC.Addr2.value == 0:
                                return 257 # halts because of no end if

                except: pass
        # Vector instrs
            elif instr == 124: # set vector accumulator
                self.VPU.write_vector_accumulator(self.Accumulator.value)
            elif instr == 125: #read vector accumulator
                self.Accumulator.write(self.VPU.read_vector_accumulator())
            elif instr >= 126 and instr <= 141:
                instr = instr %126
                self.VPU.run(self.Accumulator.value,instr)


        
            elif instr == 142: #write PC position to accumulator
                self.Accumulator.write(self.PC.Addr1.value*256+self.PC.Addr2.value)


            elif instr == 143: #switch context 0
                self.change_context(0)
            elif instr == 144: #switch context 1
                self.change_context(1)
            elif instr == 145: #switch context 2
                self.change_context(2)
            elif instr == 146: #switch context 3
                self.change_context(3)
            elif instr == 147: #new context 0
                self.new_context(0,self.Accumulator.value)
            elif instr == 148: #new context 1
                self.new_context(1,self.Accumulator.value)
            elif instr == 149: #new context 2
                self.new_context(2,self.Accumulator.value)
            elif instr == 150: #new context 3 
                self.new_context(3,self.Accumulator.value)

            elif instr == 151: #input to address
                if not self.input_on:
                    self.startInput()
                    self.input_on = 1
                self.Input.run((self.Address_register.value<<8)+parameter)
            elif instr == 152: #input to address in Accumulator
                if not self.input_on:
                    self.startInput()
                    self.input_on = 1
                self.Input.run(self.Accumulator.value)
            elif instr == 153: #output from address
                self.Output.add_to_buffer(self.Memory.read(self.Address_register.value<<8)+parameter)
            elif instr == 154: #output from accumulator
                self.Output.add_to_buffer(self.Accumulator.value)
            elif instr == 155: #output data
                self.Output.add_to_buffer(parameter)
            elif instr == 156: #flush ouptut
                self.Output.flush()
            elif instr == 157: #reset_output
                self.Output.reset()
            else: return instr,parameter

    
Program = Program()
program = Program.extract_program()
CPU = CPU(program)
begin = raw_input("Press enter to begin")
start = time.time()
output = CPU.run()
end = time.time()
print "Program ended"
print "exit code:",output
print "Time taken:",end-start
print "Number of operations:", CPU.instr_count
print "Speed:", CPU.instr_count/float(end-start), 'ips'
print "Memory (lines 0 - 15):\n"
for value in CPU.Memory.memory[:15]:
    print hex(value),
i = raw_input("\n\nPress enter to close")
