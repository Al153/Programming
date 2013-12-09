import time
a = 10
b = 11
c = 12
d = 13
e = 14
f = 15

accumulator = 0

memory = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
thread = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],
          [0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
halt = 0
normal = 0     #normal: the pointer increments 1 every step 
jump = 1       #jump: the pointer is moved to a new position, it does not change in the next step, then state is reset to normal
skip = 2       #skip: the pointer advances to the next "end" command, increments by 1 then state is reset to normal
start = 3
pCPointer = 0

state = start
while not halt:
    if state == normal: #PC changer state machine
        pCPointer += 1
        pCPointer = pCPointer % 16
    elif state == skip:
        skipCount = 1
        while skipCount != 0:
            pCPointer += 1
            pCPointer = pCPointer % 16
            if thread[pCPointer] == 14:
                skipCount -= 1
            if thread[pCPointer] > 8 and thread[pCPointer] < 14:
                skipCount += 1
        pCPointer += 1
        pCPointer = pCPointer % 16
        state = normal
    elif state == jump: state = normal
    elif state == start: state = normal
    
    instr = thread[pCPointer]
    IMD1 = instr[1]%16
    IMD2 = instr[2]%16
    instr = instr[0]%16
    if instr == 0: #add addr1 + addr2
        IMD1= memory[IMD1]
        IMD2= memory[IMD2]
        accumulator = (IMD1+IMD2)%16
    elif instr == 1: #shift addr1 by addr2
        IMD1= memory[IMD1]
        IMD2= memory[IMD2]
        IMD1 = str(bin(IMD1)[2:].zfill(4))
        c = [0,0,0,0]
        if IMD2<4 and IMD2> -4:
                for j in range (4):
                    if j - IMD2 <0 or j - IMD2>7: c[j] = False
                    else: c[j] = int(IMD1[j - IMD2])
        else: c = [0,0,0,0]
        for j in range(4):
            if c[j]: c[j] = '1'
            else: c[j] = '0'
            
        c = ''.join(c)
        accumulator = int(c,2)
        
            
    elif instr == 2: #NAND addr1 + addr2
        IMD1= memory[IMD1]
        IMD2= memory[IMD2]
        IMD1 = str(bin(IMD1)[2:].zfill(4))
        IMD2 = str(bin(IMD2)[2:].zfill(4))
        for j in range (4):
                c[j] = not(a[j] and b[j])
        for j in range(4):
            if c[j]: c[j] = '1'
            else: c[j] = '0'
            
        c = ''.join(c)
        accumulator = int(c,2)
    elif instr == 3: #jump to addr1
        pCPointer = memory[IMD1]
        state = jump
    elif instr == 4: #jump by addr1
        pCPointer = (pCPointer + memory[IMD1])%16
        state = jump
    elif instr == 5: #jump to IMD1
        pCPointer = IMD1
        state = jump
    elif instr == 6: #jump by IMD1
        pCPointer = (pCPointer + IMD1)%16
    elif instr == 7: #load accumulator into addr1
        memory[IMD1] = accumulator
    elif instr == 8: #load IMD2 into add1
        memory[IMD1] = IMD2
    elif instr == 9: #if add1 = add2
        if memory[IMD1] != memory[IMD2]:
            state = skip
    elif instr == a: #if add1 > add2
        if memory[IMD1] < memory[IMD2]:
            state = skip
    elif instr == b: #if add1 = IMD 2
        if memory[IMD1] != IMD2:
            state = skip
    elif instr == c: #if add1 > IMD 2
        if memory[IMD1]<IMD2:
            state = skip
    elif instr == d: #if add1 < IMD 2
        if memory[IMD1]<IMD2:
            state = skip
    elif instr == e: #ignore e (end if)
        state = normal

    else: halt = 1 #halt
    
