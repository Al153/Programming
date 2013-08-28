import time
class ALUModel:
    flags = [0,0,0,0,0,0,0,0]
    def setFlags(self,newFlags):
        self.flags = newFlags
    def printFlags(self):
        return self.flags
    def ALUop(self,a,b,i):
    
        if i == 0: #ADD
            c = a + b
            if c > 255:
                self.flags [0] = 1
                c -= 256
        elif i == 1: #SUBRACT B from A
            c = a - b
            if c < 0:
                self.flags [0] = 1
                c -= 256
        elif i == 2: #Multiply
            c = (a*b)
            if c >= 256:
                self.flags [1] = 1
                c = c % 256        
        elif i == 3: #int Divide a/b
            if b == 0:
                self.flags [2] = 1
                c = 0
            else: c = a//b
        elif i == 4: # Modulo a mod b
            if b == 0:
                self.flags [2] = 1
                c = 0
            else: c = a%b    
        else:   #changes a and b to lists of individual bits
            sign = 0
            a1 = a #Original values
            b1 = b
            a = str(bin(a)[2:].zfill(8))
            b = str(bin(b)[2:].zfill(8))
            A = []
            B = []

            for j in range (8):
                if a [j] == '1':
                   A.append(True)
                else:A.append(False)
                if b [j] == '1':
                   B.append(True)
                else: B.append(False)
            a,b = A,B

            c = [0,0,0,0,0,0,0,0]
        
            if i == 5: # a AND b
                for j in range (8):
                    c[j] = a[j] and b[j]
                
            elif i == 6: #a OR b
                for j in range (8):
                    c[j] = a[j] or b[j]
            elif i == 7: #a XOR b
                for j in range (8):
                    c[j] = (a[j] and not b[j])or(b[j]and not a[j])
            elif i == 8: # Not a
                for j in range (8):
                    c[j] = not(a[j])
            elif i == 11: #ROTATE a by b ---------- wrong order due to time spent working out which functions to use
                b1 = b1 % 8
                for j in range (8):
                    c[j] = a[j-b1]
            elif i == 12: #PARITY a
                c = [0,0,0,0,0,0,0]
                count = 0
                for j in range (8):
                    if a[j] == 1:
                        count += 1
                c.append(counter%2)
            elif i == 13: #Shift a by b
                if b1<8 and b1> -8:
                    for j in range (8):
                        if j-b<0 or j-b>7: c[j] = False
                        else: c[j] = a[j-b]
                else: c = [0,0,0,0,0,0,0,0]
            elif i == 14:#FLIP a
                for j in range (8):
                    c[j] = a[7-j]
            elif i == 9: # NAND
                for j in range (8):
                    c[j] = not(a[j] and b[j])
            elif i == 10: # NOR
                for j in range (8):
                    c[j] = not(a[j] or b[j])
            elif i == 100: # XNOR
                for j in range (8):
                    c[j] = not(a[j] and not b[j])or(b[j]and not a[j])
            elif i == 15:
                c[0:4] = a[4:8]
                c[4:8] = a[0:4]
            #Converting a and b back to 0bXXXXXXX

            for j in range(8):
                if c[j]: c[j] = '1'
                else: c[j] = '0'
            
            c = ''.join(c)
            c = int(c,2)
        return c


class MemoryUnit:
    page = 0    
    def __init__(self,memoryChanges,totalPages):
        self.totalPages = totalPages
        self.memory = memoryChanges
        
    def changePage(self,newPage):
        self.page = newPage % len(memory)

    def readSingle(self,address):
        return(self.memory[self.page][address])
    
    def writeSingle(self,data,address):
        self.memory[self.page][address] = data
        
    def readMult(self,address1,address2):
        toReturn = []
        if address2 >= address1:
            for i in range(address1,address2 + 1):
                toReturn.append(self.memory[self.page][i])
        else: 
            for i in range (address1,256):
                toReturn.append(self.memory[self.page][i])
            for i in range (0,address2 +1):
                toReturn.append(self.memory[self.page][i])
        return(toReturn)
    def writeMult(self,address1,address2,data):
        if address2 >= address1:
            for i in range(address1,address2 + 1):
                self.memory[self.page][i] = data
        else: 
            for i in range (address1,256):
                self.memory[self.page][i] = data
            for i in range (0,address2 +1):
                self.memory[self.page][i] = data
        return(toReturn)
    def printMemory(self):
        print self.memory


    
class ProgramCounter:
    command_count = 0
    state = 'start'
    clear0 = 0
    clear1 = 0
    clear2 = 0
    regs = [0,0,0,0]
    pCPointer = 0
    halt = 0
    def __init__(self,thread,hz):
        self.thread = thread
        self.threadlength = len(thread)
        if hz: self.clockDelay = 1/hz
        else: self.clockDelay = 0

    def list_to_int(self,myList):
        myList2 = []
        for i in range (len (myList)):
            myList2.append(str(myList[i]))
        myList2 =''.join(myList2)
        myList = int(myList2,2)
        return myList
        
    def run(self):
        self.command_count += 1
        ignore = 0
        pCPointer = self.pCPointer
        if self.clear0:
            ALU.flags[0] = 0
            self.clear0 = 0
        if self.clear1:
            ALU.flags[1] = 0
            self.clear1 = 0
        if self.clear2:
            ALU.flags[2] = 0
            self.clear = 0
        if self.clockDelay:
            time.sleep(self.clockDelay) #speed controller
        if self.state == 'normal': #PC changer self.state machine
            pCPointer += 1
            pCPointer = pCPointer %self.threadlength
        elif self.state == 'skip':
            skipCount = 1
            while skipCount != 0:
                pCPointer += 1
                pCPointer = pCPointer % self.threadlength
                if ignore:
                    ignore = 0
                    pCPointer += 1
                
                if self.thread[pCPointer] == 147:
                    skipCount -= 1
                if self.thread[pCPointer] > 72 and self.thread[pCPointer] < 147:
                    if (self.thread[pCPointer] >=113 and self.thread[pCPointer]<=122)or self.thread[pCPointer]>=139:
                        ignore = 1
                        skipCount += 1
                    else:
                        skipCount += 1
                        #print self.thread[pCPointer]
            pCPointer += 1
            pCPointer = pCPointer % self.threadlength
            self.state = 'normal'
        elif self.state == 'jump': self.state = 'normal'
        elif self.state == 'start': self.state = 'normal'
        #if event.type == pygame.QUIT:
        #halt = 1
        if ALU.flags[0]: #flags clear sequence
            self.clear0 = 1
        if ALU.flags[1]:
            self.clear1 = 1
        if ALU.flags[2]:
            self.clear2 = 1
        instr = self.thread[pCPointer]%256
     
        #print 'PC', pCPointer, 'INSTR' , instr 
        #print 'regs', self.regs, 'page', Memory.page

        if instr >= 0 and instr <64: #ALU commands
            aluInstr = instr // 4   # - picks ALU command
            reg1 = self.regs[instr % 4]  # - picks first register
            pCPointer += 1
            pCPointer = pCPointer % self.threadlength
            reg2 = self.thread[pCPointer] % 4 #- picks second register
            reg2 = self.regs[reg2]
            quotient = ALU.ALUop(reg1,reg2,aluInstr)
            self.regs[instr % 4] = quotient % 256
        elif instr >= 64 and instr <68: #change page
            Memory.changePage(self.regs[instr%64])
        
        
        elif instr >= 68 and instr < 149: #Flow control
            if instr >= 68 and instr <73: #Jump
                if instr >= 68 and instr <= 71: #jump from reg
                    reg1 = instr % 4
                    reg1 = self.regs[reg1]
                
                else: #jump from IMD
                    pCPointer = (pCPointer+1)%self.threadlength
                    reg1 = thread[pCPointer]
                reg2 = pCPointer//256
                pCPointer = reg2*256+reg1
                self.state = 'jump'
            elif instr > 72 and instr <147: #if clauses
                if instr >= 73 and instr <= 92: #if = regs
                    instr = instr % 73
                    reg1 = instr // 4
                    reg2 = instr % 4
                    if reg1 == 4:
                        reg1 = self.list_to_int(ALU.flags)
                    else: reg1 = self.regs[reg1]
                    reg2 = self.regs[reg2]
                    if reg1 != reg2:
                        self.state = 'skip'
                
                elif instr >= 93 and instr <= 112: #if =/= regs
                    instr = instr % 93
                    reg1 = instr // 4
                    reg2 = instr % 4
                    if reg1 == 4:
                        reg1 = self.list_to_int(ALU.flags)
                    else: reg1 = self.regs[reg1]
                    reg2 = self.regs[reg2]
                    if reg1 == reg2:
                        self.state = 'skip'
    
                elif instr >= 123 and instr <= 138: # if < regs
                    instr = instr % 123
                    reg1 = instr // 4
                    reg2 = instr % 4
                    reg1 = self.regs[reg1]
                    reg2 = self.regs[reg2]
                    if reg1 >= reg2:
                        self.state = 'skip'   
    
                elif instr >= 113 and instr <= 117: # if = reg k
                    reg1 = instr % 113
                    pCPointer += 1
                    pCPointer = pCPointer % self.threadlength
                    reg2 = self.thread[pCPointer]
                    if reg1 == 4:
                        reg1 = self.list_to_int(ALU.flags)
                    else: reg1 = self.regs[reg1]
                    if reg1 != reg2:
                        self.state = 'skip'
    
                elif instr >= 118 and instr <= 122: # if =/= reg k
                    reg1 = instr % 118
                    pCPointer += 1
                    pCPointer = pCPointer % self.threadlength
                    reg2 = self.thread[pCPointer]
                    if reg1 == 4:
                        reg1 = self.list_to_int(ALU.flags)
                    else: reg1 = self.regs[reg1]
                    if reg1 == reg2:
                        self.state = 'skip'

                elif instr >= 139 and instr <= 142: # if < reg k
                    reg1 = instr % 139
                    pCPointer += 1
                    pCPointer = pCPointer % self.threadlength
                    reg2 = self.thread[pCPointer]
                    reg1 = self.regs[reg1]
                    if reg1 >= reg2:
                        self.state = 'skip'
    
                elif instr >= 143 and instr <= 146: # if > reg k
                    reg1 = instr % 143
                    pCPointer += 1
                    pCPointer = pCPointer % self.threadlength
                    reg2 = self.thread[pCPointer]
                    reg1 = self.regs[reg1]
                    if reg1 <= reg2:
                        self.state = 'skip'
    
            elif instr == 148:#halt
                self.halt = 1
                print 'HALT'
                  
        elif instr >= 149 and instr < 231: #Memory/register control
            if instr >= 149 and instr <= 212: #Registers
                if instr >= 149 and instr <= 164: #load reg (reg address)
                    instr = instr %149
                    reg1 = instr // 4
                    reg2 = instr % 4
                    reg2 = self.regs[reg2]
                    self.regs[reg1] = Memory.readSingle(reg2)
                elif instr >= 165 and instr <= 168: #load reg (IMD address)
                    reg1 = instr % 165
                    pCPointer = (pCPointer +1) % self.threadlength
                    reg2 = self.thread[pCPointer]
                    self.regs[reg1] = Memory.readSingle(reg2)
                elif instr >= 169 and instr <= 172: # load reg (IMD data)
                    reg1 = instr % 169
                    pCPointer = (pCPointer + 1) % self.threadlength
                    self.regs[reg1] = self.thread[pCPointer]
                elif instr >= 173 and instr <=188: #write from reg (reg address)
                    instr = instr % 173
                    reg1 = instr //4
                    reg1 = self.regs[reg1]
                    reg2 = instr % 4
                    reg2 = self.regs[reg2]
                    Memory.writeSingle(reg1,reg2)
                elif instr >= 189 and instr <= 192: #write from reg (IMD address)
                    reg1 = instr %189
                    reg1 = self.regs[reg1]
                    pCPointer = (pCPointer + 1) %self.threadlength
                    reg2 = self.thread[pCPointer]
                    Memory.writeSingle(reg1,reg2)
                else: #copy self.regs (reg2 <= reg1)
                    instr = instr % 193
                    reg1 = instr // 4
                    reg2 = instr % 4
                    if reg1 == 4:
                        reg1 = self.list_to_int(ALU.flags)
                    else: reg1 = self.regs[reg1]
                    self.regs[reg2] = reg1
            else:                                   #Full jumps
                if instr >= 213 and instr <= 188:  #Jump regs
                    instr = instr%213
                    reg1 = regs[instr//4]
                    reg2 = regs[instr%4]
                    pCPointer = reg1*256+reg2
                    self.state = 'jump'
                elif instr == 229: #Jump IMD1 + IMD2
                    pCPointer = (pCPointer + 1)%self.threadlength
                    reg1 = thread[pCPointer]
                    pCPointer = (pCPointer + 1)%self.threadlength
                    reg2 = thread[pCPointer]
                    pCPointer = reg1*256+reg2
                    self.state = 'jump'
                else:               #save full PC ADDR1, ADDR2
                    reg1 = pCPointer//256
                    reg2 = pCPointer%256
                    pCPointer = (pCPointer +1)%self.threadlength
                    memory.writeSingle(reg1,self.thread[pCPointer])                    
                    pCPointer =(pCPointer +1)%self.threadlength
                    memory.writeSingel(reg2,self.thread[pCPointer])
                
        elif instr >= 231 and instr < 256: #Execution control
            if instr >= 231 and instr <= 234: #save pc to reg
                instr = instr % 231
                self.regs[instr] = pCPointer%256
            elif instr >= 235 and instr <=238: #load exe from reg
                instr = instr % 235
                if pCPointer < self.threadlength - 1:
                    self.thread[pCPointer + 1] = self.regs[instr]
                else:
                    if self.threadlength == 65536:
                        self.thread[0]=self.regs[instr]
                    else:
                        self.thread.append(self.regs[instr])
                        self.threadlength += 1
                    
            elif instr == 239: # load exe IMD (add1:addr2)
                pCPointer = (pCPointer + 1) %self.threadlength
                reg1 = self.thread[pCPointer]
                pCPointer = (pCPointer + 1) %self.threadlength
                reg2 = self.thread[pCPointer]
                pointer = pCPointer +1
                if reg2 >= reg1:
                    for i in range(reg1,reg2 + 1):
                        j = i - reg1
                        if pointer + j < self.threadlength:
                            self.thread[pointer + j] = Memory.readSingle(i)
                        else:
                            if self.threadlength == 65536:
                                self.thread[0] = Memory.readSingle(i)
                            else:
                                self.thread.append(Memory.readSingle(i))
                                self.threadlength +=1
                else:
                    for i in range (reg1,256):
                        j = i - reg1
                        if pointer + j < self.threadlength:
                            self.thread[pointer + j] = Memory.readSingle(i)
                        else:
                            if self.threadlength == 65536:
                                self.thread[0] = Memory.readSingle(i)
                            else:
                                self.thread.append(Memory.readSingle(i))
                                self.threadlength +=1
                    for i in range (reg2 +1):
                        if pointer + j < self.threadlength:
                            self.thread[pointer + i] = Memory.readSingle(i)
                        else:
                            if self.threadlength == 65536:
                                self.thread[0] = Memory.readSingle(i)
                            else:
                                self.thread.append(Memory.readSingle(i))
                                self.threadlength +=1
                    
            else:                       #load exe self.regs addr
                instr = instr %240
                reg1 = instr // 4
                reg2 = instr % 4
                reg1 = self.regs[reg1]
                reg2 = self.regs[reg2]
                pointer = pCPointer +1
                if reg2 >= reg1:
                    for i in range(reg1,reg2 + 1):
                        self.thread[(pointer + i)%256] = Memory.readSingle(i)
                else: 
                    for i in range (reg1,256):
                        self.thread[(pointer + i)%256] = Memory.readSingle(i)
                    for i in range (reg2 +1):
                        self.thread[(pointer + i)%256] = Memory.readSingle(i)
        self.pCPointer = pCPointer

memoryToLoad = [
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ,
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
]
thread = [169,2,170,107,8,1,170,2,189,15,190,0,169,0,170,100,189,16,190,17,231,
          170,7,0,1,189,18,165,16,166,17,124,171,1,0,2,189,16,165,0,170,16,12,1,
          189,1,165,0,16,1,189,2,165,1,166,2,8,0,9,1,189,3,190,4,165,1,166,2,8,
          1,0,0,117,128,166,3,171,16,1,2,190,3,147,60,0,189,1,170,240,171,15,20,
          1,189,2,165,1,20,2,166,2,167,3,168,4,1,3,117,128,172,1,2,3,147,0,2,
          189,0,190,1,172,255,167,15,170,1,19,2,3,1,19,2,232,169,15,1,0,190,3,165,
          0,166,1,16,2,17,2,118,0,171,1,4,2,1,3,167,15,17,2,167,3,70,147,190,0,
          165,16,166,0,171,20,0,2,177,165,18,68,147,148]
newthread = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
print len(thread)
   

ALU = ALUModel()
Memory = MemoryUnit(memoryToLoad,16)
PC = ProgramCounter(thread,0)

start_time = time.time()
while not PC.halt:
    PC.run()
print 'Time taken', time.time() - start_time
print 'No. of instructions:', PC.command_count
