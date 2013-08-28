#Busy Beaver II
def str_list(a):
       b =[]
       for i in range(len(a)):
          c = a[i]
          b.append (str(c))
       return b
R,r =  1,1
L,l = -1,-1
HALT, Halt, halt = 'halt','halt','halt'
tape = [0,0,1,0,1,1,1,0,0,0,1,1,0,1,0,0,0,0]
program = (([halt,0,0],[halt,0,0]),([halt,0,0],[halt,0,0]))
#((<direction to move>,<to print>,<new state>))
done = 0
state = 0
pointer = 0
while done == 0:
    data = tape[pointer]
    stateTemp = program[state][data]
    
    
    if stateTemp[0] == 'halt':                     #Halt sequence
        print 'HALT'
        done = 1
    else:    
        printList = str_list(tape)
        state = stateTemp[2]
        tape[pointer] = stateTemp[1]
        stateTemp2 = str(stateTemp[1])
        stateTemp2 = '[' + stateTemp2 + ']' 
        printList[pointer] = stateTemp2
        
        pointer = pointer + stateTemp[0]
    
        if pointer == -1:               #Extensision of tape
            tape.append(0)
            for i in range (len(tape)-1):
                t = len(tape)-(i+1)
                tape[t] = tape[t-1]
            pointer = 0
            tape[0] = 0
        if pointer > (len(tape) -1):
            tape.append(0)
        go = raw_input()
        printList = ''.join(printList)
        print printList
    
    


