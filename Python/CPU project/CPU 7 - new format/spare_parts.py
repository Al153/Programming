#Existing parts
class ALU:
    def __init__(self,flags):
        self.Flags = flags
    def operation(self,data,op):
        a = int(data//(2**16))
        b = int(data%(2**16))
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
        self.value = self.value^value
    def clear(self):
        self.value = 0



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

#New parts:
import pygame #needed for GPU
    
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
        x = coord//256
        y = coord%256
        if self.PxArray[x,255 - y] == self.Surface.map_rgb((0, 0, 0)): self.PxArray[x,255 - y] = (255,255,255)
        else: self.PxArray[x, 255 -y] = (0,0,0)
        
    def vector_line(self,coord):
        x = coord//256
        y = coord%256
        pygame.draw.line(self.Surface,(255,255,255),(x,255-y),(x+self.vector[0],255 -(y+self.vector[1])))

    def set_vector(self,coord):
        self.vector = [coord//256,coord%256]
        for i in xrange(2):
            if self.vector[i] >= 128: self.vector[i] -= 256
            
    def startpoint_line(self,coord):
        x = coord//256
        y = coord%256
        pygame.draw.line(self.Surface,(255,255,255),(x,255-y),(self.startpoint[0],255 -(self.startpoint[1])))

    def set_startpoint(self,coord):
        self.startpoint =[coord//256,coord%256]           
    def clear_screen(self):
        self.Surface.fill((0,0,0))
    
    def update(self):
        pygame.display.update()
    def close(self):
        pygame.quit()


class ExtDrive:
    pass

class IO_port:
    pass
class Network_port:
    pass
class Sever_Network_Port:
    pass


class Coord_register:
    def __init__(self,size):
        self.value = 0
    def write(self,value):
        self.value = value
    def read(self):
        return self.value
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


    
import math # for sqrt in vectors 
class Vector_processing_unit:
    def __init__(self):
        self.Vector_accumulator = (Coord_register(8),Coord_register(8))
    def run(self,data,op):

        #vectors
        if op == 0:#scale vector up (multiply)
            check_value = self.Vector_accumulator[0].value
            self.Vector_acummulator[0].value *= data
            if self.Vector_accumulator[0].value >127:
                self.Vector_accumulator[0].value = 127
            elif self.Vector_accumulator[0].value < -128:
                self.Vector_accumulator[0].value = -128
            self.Vector_acummulator[1].value *= data
            if self.Vector_accumulator[1].value >127:
                self.Vector_accumulator[1].value = 127
            elif self.Vector_accumulator[1].value < -128:
                self.Vector_accumulator[1].value = -128
        elif op == 1:#scale vector down(divide)
            if data != 0:
                self.Vector_acummulator[0].value //= data
                self.Vector_acummulator[1].value //= data  
            else:
                self.Vector_acummulator[0].value = -128 # 0b11111111
                self.Vector_acummulator[1].value = -128
        elif op == 2:#add vector
            x = data//256
            y = data%256
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_acummulator[0].value += x
            self.Vector_acummulator[1].value += y
            if self.Vector_acummulator[0].value >127:
                self.Vector_acummulator[0].value = 127
            elif self.Vector_acummulator[0].value < -128:
                self.Vector_acummulator[0].value = -128
            if self.Vector_acummulator[1].value >127:
                self.Vector_acummulator[1].value = 127
            elif self.Vector_acummulator[1].value < -128:
                self.Vector_acummulator[1].value = -128
        elif op == 3:#subtract vector
            x = data//256
            y = data%256
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_acummulator[0].value -= x
            self.Vector_acummulator[1].value -= y
            if self.Vector_acummulator[0].value >127:
                self.Vector_acummulator[0].value = 127
            elif self.Vector_acummulator[0].value < -128:
                self.Vector_acummulator[0].value = -128
            if self.Vector_acummulator[1].value >127:
                self.Vector_acummulator[1].value = 127
            elif self.Vector_acummulator[1].value < -128:
                self.Vector_acummulator[1].value = -128
        elif op == 4:#find scalar(accumulator)
            self.write_vector_accumulator(int(math.sqrt(self.Vector_accumulator[0].value**2+self.Vector_accumulator[1].value**2)))
        elif op == 5:#find scalar(input)
            x = data//256
            y = data%256
            if x >127: x -= 256
            if y > 127: y -= 256
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 6:#find vector(accumulator to input)
            x = data//256
            y = data%256
            if x >127: x -= 256
            if y > 127: y -= 256
            self.Vector_acummulator[0].value = x - self.Vector_acummulator[0].value
            self.Vector_acummulator[1].value = y - self.Vector_acummulator[1].value
            if self.Vector_acummulator[0].value >127:
                self.Vector_acummulator[0].value = 127
            elif self.Vector_acummulator[0].value < -128:
                self.Vector_acummulator[0].value = -128
            if self.Vector_acummulator[1].value >127:
                self.Vector_acummulator[1].value = 127
            elif self.Vector_acummulator[1].value < -128:
                self.Vector_acummulator[1].value = -128
        elif op == 7: #find scalar(accumulator to input)
            x = data//256
            y = data%256
            if x >127: x -= 256
            if y > 127: y -= 256
            self.write_vector_accumulator(int(math.sqrt((self.Vector_accumulator[0].value+ x)**2+(self.Vector_accumulator[1].value**2+y))))
        # Coords
        elif op == 8: #Multiply coords
            x = self.Vector_acummulator[0].value%256
            y = self.Vector_acummulator[1].value%256
            x*=data
            y*=data
            if x>255:
                x = 255
            if y>255:
                y = 255
            self.write_vector_accumulator(x*256+y)
        elif op == 9:#divide coords
            x = self.Vector_acummulator[0].value%256
            y = self.Vector_acummulator[1].value%256
            x//=data
            y//=data
            sel.write_vector_accumulator(x*256+y)
        elif op == 10:#add coords
            x = self.Vector_acummulator[0].value%256
            y = self.Vector_acummulator[1].value%256
            x += data%256
            y += data//256
            if x>255:
                x = 255
            if y>255:
                y = 255
            self.write_vector_accumulator(x*256+y)
        elif op == 11:#subtract coords
            x = self.Vector_acummulator[0].value%256
            y = self.Vector_acummulator[1].value%256
            x -= data%256
            y -= data//256
            if x>0:
                x = 0
            if y>0:
                y = 0
            self.write_vector_accumulator(x*256+y)
        elif op == 12: #find scalar  from origin to stored value
            x = self.Vector_acummulator[0].value%256
            y = self.Vector_acummulator[1].value%256
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 13: #find scalar from origin to input
            x = data//256
            y = data%256
            self.write_vector_accumulator(int(math.sqrt(x**2+y**2)))
        elif op == 14: # subtract coords from input 
            x = data %256
            y = data//256
            x -= self.Vector_acummulator[0].value%256
            y -= self.Vector_acummulator[1].value%256
            if x>0:
                x = 0
            if y>0:
                y = 0
            self.write_vector_accumulator(x*256+y)
        elif op == 15: # find scalar from input to stored
            x = data//256
            y = data%256
            x1 = self.Vector_acummulator[0].value%256
            y1 = self.Vector_acummulator[1].value%256
            self.write_vector_accumulator(int(math.sqrt((x-x1)**2+(y-y1)**2)))

    def write_vector_accumulator(self,bus):
        value1 = bus//256
        value2 = bus%256
        if value1 >127: value1 -= 256
        if value2 > 127: value2 -= 256
        self.Vector_accumulator[0].value = value1
        self.Vector_accumulator[1].value = value2

    def read_vector_accumulator(self):
        return (self.Vector_accumulator[0].value%256)*256+self.Vector_accumulator[1].value%256



GPU = GPU_mk1()
i = raw_input("press enter to continue")
GPU.start_up()
r = 100
a = 128
b = 128
r = r**2
for x in xrange(256):
    for y in xrange(256):
        if r - (x-a)**2 < (y-b)**2:
            GPU.toggle_pixel(x,y)
    GPU.update()

i = raw_input("Press enter to continue")
GPU.clear_screen()
GPU.update()

i = raw_input("Press enter to continue")
r = 100
a = 128
b = 128
r2 = r*r
for x in range(256):
    x1 = (x - a)**2
    x1 = r2 - x1
    if x1<0:
        for y in range(256):
            GPU.toggle_pixel(x,y)
    else:
        for y in range(256):
            if x1 < (y-b)**2:
                GPU.toggle_pixel(x,y)
    GPU.update()
    

    
