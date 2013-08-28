#Universal Turing Machine I
def str_list(a):
       b =[]
       for i in range(len(a)):
          c = a[i]
          b.append (str(c))
       return b

def parse (program): #Checks program
       parsed = True
       check = 0
       if isinstance(program,list)or isinstance(program,tuple):     #Checks instruction is in list or tuple format
              for i in range (len(program) ):
                     tempStorage = program[i]
                     if isinstance (tempStorage, list) or isinstance(tempStorage,tuple):            #checks instructions for each state are seperated using lists
                        print 'State ' + str(i) + ' parsed'
                        length = len(tempStorage)
                        if length < 2:
                            print 'Parsing failed: check there are two or more entries for state ' +str(i) # checks there are a legitimate number of inputs for each state
                            parsed = False
                            break
                        else:
                            for j in range (len(tempStorage)):
                               stateInst = tempStorage [j-1]
                               if len(stateInst) != 3:
                                   print 'Parsing failed: check there are exactly three entries for state ' + str(i) + ' for input ' + str(j)
                                   parsed = False
                                   break
                                   break
                               else:
                                    for k in range (2):
                                        if not isinstance(stateInst[k], int):
                                            print 'Parsing failed: check entries for state ' + str(i) + 'for input ' +str(j)
                                            parsed = False
                                            break
                                        
                        
                     else:
                         parsed = False
                         print "Parse failed: check instructions for state " +str(i) + " are enclosed in a list or tuple"
                         break

       else:
           parsed = False
           print '''

Parsing failed: check pogram is enclosed in a list or tuple'''
       if parsed:
            print 'Parsing program completed'
       return (parsed)

def parseTape(tape):
    if isinstance(tape, list): 
        parsed = True
        print 'Parsing tape completed'
    elif isinstance(tape, tuple):
        tape = list(tape)
        parsed = True
        print 'parsing tape completed'
    else:
        print '''
Parsing failed: check tape is a list'''
     
        parsed = False
    return (parsed, tape)           
		
        
    
R,r =  1, 1                  #defining commands
L,l = -1,-1
HALT, Halt, halt = -2,-2,-2

#Start
print(''' Welcome to Al's Turing machine 1.1.0.

In this machine, programs are written in the form:
(
<state 0>([D0,P0,S0],[D1,P1,S1]),
<state 1>([D0,P0,S0],[D1,P1,S1]),
<state 2>([D0,P0,S0],[D1,P1,S1]),
<state 3>([D0,P0,S0],[D1,P1,S1])
...
)
The areas bracketted <> are not to be written, they are only for clarification.
Dn = Direction to move pointer for next step.    (L/R/Halt)
Pn = Bit to print in current pointer position.   (0/1)
Sn = New state                                   (Natural Number)

n = bit read by pointer in current position      (Do not write in program
                                                  or machine will misbehave)


Tape written in form:
 [<bits seperated by commas>]

 This can be of any length, as long as it is at least one bit.
 The program will extend the tape if pointer moves off either end (NOTE -
 The bits added to either end will all ways be zero, so '1' you wish to be
 present on the starting tape must be typed in.)

 eg. [0,1,0,1,1,1,1]


''')
finished = 0
while not finished:
       program = input('''

Write program here: ''')
       tape = input("Write tape values here: ")
       pointer = str(raw_input('Initial pointer position (leave blank for pointer = 0): '))
                          
       state = 0
       done1 = 0
       parseReport1 = parse(program)
       parseReport2 = parseTape(tape)
       tape = parseReport2[1]
       if parseReport1 and parseReport2[0]:
           done = 0
           print '''Press ENTER to begin \nType 'Quit' to cancel machine operation''' 
       else:
           done = 1

       if pointer == '':    #generates initial pointer position
              pointer = 0
       else: pointer = int(pointer)

       while done == 0:     #Loops program till halt
              data = tape[pointer]
              stateTemp = program[state][data] #Reading Program 
    
    
              if stateTemp[0] == -2:                     #Halt sequence
                      print 'HALT'
                      done = 1
              else:
                      state = stateTemp[2]
                      tape[pointer] = stateTemp[1]             #Generating printout
                      printList = str_list(tape)
                      stateTemp2 = str(stateTemp[1])
                      stateTemp2 = '[' + stateTemp2 + ']' 
                      printList[pointer] = stateTemp2
        
                      pointer = pointer + stateTemp[0]         #moving on pointer
    
                      if pointer == -1:               #Extension of tape
                          tape.append(0)
                          for i in range (len(tape)-1):
                              t = len(tape)-(i+1)
                              tape[t] = tape[t-1]
                          pointer = 0
                          tape[0] = 0
                      if pointer > (len(tape) -1):
                          tape.append(0)
                      go = raw_input()
                      if go == 'QUIT' or go == 'Quit' or go == 'quit':
                          done = 1
                      printList = ''.join(printList)
                      print printList
         
       print ('''                                       


Program halted.

Select Next operation:

1 --- New turing machine Program 
2 --- Quit
''')
       error = 1
       while error:                              #End of program sequence
                     nextAction = raw_input('Selection = ')
                     if nextAction != '':
                         nextAction = int(nextAction)
                         if nextAction == 1:
                                error = 0
                         elif nextAction == 2:
                                error = 0
                                finished = 1
                                print "\n \n QUITTING"
                     if error:
                         print 'Didn\'t catch that, please try again'
                     
       


