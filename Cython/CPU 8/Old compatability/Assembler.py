#assembly instruction format: <Opcode> <operand1> {operand2} [flags]
#<compulsory> {not used in V-type instruction (e.g. goto)} [optional]

#e.g.:
#LOD gp2 10   @ldd
#ADD gp1 one
#MOV gp1 acc
#CMP gp1 gp2
#CJP E   2    @jd
#JMP -10      @jd
#HLT 

#register key:
#           acc - accumulator
#           ext - extended register
#           ind - index register
#           flg - flag register
#           zro - zero register
#           one - = one
#           ons - = all ones
#           gp0...gp8 - general purpose registers

#condition key:

#           C = Carry
#           B = borrow
#           O = MUL overflow
#           D = Divide by zero

#           S = Stack overflow
#           s = Stack empty
#           G = greater than
#           L = Less than

#           E = Equals
#           N0 = dummy
#           N1 = dummy
#           N2 = dummy

#           N3 = dummy
#           N4 = dummy
#           N5 = dummy
#           N6 = dummy




#import sys #for quitting
import pickle #for storing list objects


def write(file_name,program):
    print program
    file_name = file_name[:-4]
    file_name += ".macode"
    program_file = open(file_name,"w")
    pickle.dump(program, program_file)

def extract_program():
    error = 1
    while error:
        try:
            file_name = str(raw_input("Please enter file name: "))
            program_file = open(file_name)
            error = 0
        except IOError:
            try:
                file_name += '.txt'
                program_file = open(file_name)
                error = 0
            except:print "File Name Error\n\nPlease try again"
    return (program_file,file_name)

def tokenize(program_file):
    tokens = []
    data = 0
    for line in program_file:
        commented = 0
        line_tokens = []
        current_token = ""
        if data == 2:
            line_tokens = ["data"]
            #print "data detected"
        for character in line:
            if not commented:
                if data == 1:
                    if character == "{":
                        data = 2
                    else:
                        data = 0

                if data == 2:
                    if character == "}":
                        data = 0
                if character != " " and character != "\t" and character != "{" and character != "}":
                    if character != "\n":
                        if character == "#":
                            commented = 1
                        else:
                            current_token += character
                else:
                    if current_token != "":
                        line_tokens.append(current_token)
                    current_token = ""
        if current_token != "" and current_token != "\t":
            line_tokens.append(current_token)
        if line_tokens == [] or line_tokens == ["data"] or line_tokens == ["{"] or line_tokens == ["}"] or line_tokens == ["data","{"] :
            pass
        else:
            tokens.append(line_tokens)
    print tokens
    return tokens
    
class Instruction:
#does:
    #resolve opcode into 8bit opcode
    #resolve flags and turn into a 4bit flags code
    #resolve either address + reg or regs, or condition + address
    #compile into two word instruction


    def __init__(self,tokens,instrcount):
        self.op_lookup = {
            "data":-1,
            "HLT":0,
            "ADD":1,
            "SUB":2,
            "MUL":3,
            "DIV":4,
            "MOD":5,
            "AND":6,
            "ORR":7,
            "XOR":8,
            "NOT":9,
            "NND":10,
            "NOR":11,
            "XNR":12,
            "SHR":13,
            "SHL":14,
            "ROR":15,
            "ROL":16,
            "MOV":17,
            "LOD":18,
            "STR":19,
            "PUS":20,
            "POP":21,
            "JMP":22,
            "GTO":23,
            "CMP":24,
            "CJP":25,
            "CGT":26}
        self.op_attributes = [   #Type, Flags     #type can be "h" - halt, "r" - register based, "c" -cond, "a" -address based, "v" = may not take register or addr input
                    ["h",["N","N","N","N"]],    #halt
                    ["r",["cin","cout","ain","aout"]],   #add
                    ["r",["all","cfb","ain","aout"]],    #subtract
                    ["r",["noe","nof","ain","aout"]],  #multiply
                    ["r",["ndf","N","ain","aout"]],    #divide
                    ["r",["ndf","N","ain","aout"]],  #mod
                    ["r",["N","N","ain","aout"]],    #and
                    ["r",["N","N","ain","aout"]],  #or
                    ["r",["N","N","ain","aout"]],    #xor
                    ["r",["N","N","ain","aout"]],    #not
                    ["r",["N","N","ain","aout"]],  #nand
                    ["r",["N","N","ain","aout"]],    #nor
                    ["r",["N","N","ain","aout"]],  #xnor
                    ["r",["ins","N","ain","aout"]],    #shift right
                    ["r",["ins","N","ain","aout"]],  #shift left
                    ["r",["ins","N","ain","aout"]],    #rotate right
                    ["r",["ins","N","ain","aout"]],  #rotate left
                    ["r",["des","mova","ovwr","kds"]],    #move
                    ["a",["des","lda","ldd","kds"]],  #load
                    ["a",["des","sta","N","kds"]],    #store
                    ["v",["puad","pud","pur","puab"]],  #push
                    ["v",["poad","N","por","poab"]],    #pop
                    ["v",["str","jd","jr","jab"]],  #jump
                    ["v",["str","gd","gr","iid"]],    #goto
                    ["r",["wf","ab","N","N"]],  #compare
                    ["c",["str","jd","dcf","jab"]],    #conditional jump
                    ["c",["str","gd","dcf","iid"]],  #conditional goto


                    ["d",["N","N","N","N"]] #data
                   ] 
        self.register_lookup = {
                "acc": 0,
                "ext": 1,
                "ind": 2,
                "flg": 3,
                "zro": 4,
                "one": 5,
                "ons": 6,
                "jmp": 7,
                "gp0": 8,
                "gp1": 9,
                "gp2": 10,
                "gp3": 11,
                "gp4": 12,
                "gp5": 13,
                "gp6": 14,
                "gp7": 15
                }
        self.condition_lookup = {
            "C":0,
            "B":1,
            "O":2,
            "D":3,
            "S":4,
            "s":5,
            "G":6,
            "L":7,
            "E":8,
            "N0":9,
            "N1":10,
            "N2":11,
            "N3":12,
            "N4":13,
            "N5":14,
            "N6":15}


        self.op = tokens[0]
        #print self.op
        try:
            self.opcode = self.op_lookup[self.op]
            del(tokens[0])
            error = 0 #error not really needed
            #print self.opcode
        except KeyError:
            try:
                int(self.op)
                self.opcode = -1
                error = 0
            except:
                print"Unrecognised instruction: ", self.op, "Line:", instrcount
                quit()
        if not error:

            self.attributes = self.op_attributes[self.opcode]
            #print self.attributes
            self.type = self.attributes[0]
            self.flags = []
            if self.type == "h":
                self.instruction = ((0,0),(0,0))
            else:
                #print "Tokens in:",tokens
                flag_marker = []
                for token in tokens: #gathering flags
                    #print "token being tested:",token
                    if "@" in token:
                        self.flags.append(token[1:])
                        flag_marker.append(token)
                for i in flag_marker:
                    tokens.remove(i)
                    
                #print self.flags
                indices = []
                for flag in self.flags: #resolving flags
                    try:
                        index = 3 - self.attributes[1].index(flag)
                        if not (index in indices):
                            indices.append(index)
                    except ValueError:
                        print "bad flag: ", flag, "Line:", instrcount
                        quit()
                self.flag_value = 0
                for index in indices: #creating a value for the flags
                    self.flag_value += 1<<index

                if self.type == "r":
                    if len(tokens) != 2:
                        if self.op == "NOT":#not instruction only takes one register input
                            reg1 = self.register_lookup[tokens[0]]
                            reg2 = 0
                            instr1 = (self.opcode<<8)+(reg1<<4)+reg2
                            instr2 = self.flag_value<<12
                            self.instruction = [(0,instr1),(0,instr2)]
                            
                        else: #not instruction only takes one register input
                            print "Error: wrong number of operands for a register instruction: ", len(tokens), "Line:", instrcount
                            quit()
                    else:
                        reg1 = self.register_lookup[tokens[0]]
                        reg2 = self.register_lookup[tokens[1]]
                        instr1 = (self.opcode<<8)+(reg1<<4)+reg2
                        instr2 = self.flag_value<<12
                        self.instruction = [(0,instr1),(0,instr2)]

                
                elif self.type == "a":
                    if len(tokens) != 2:
                        print "Error: wrong number of operands for a load/store instruction: ", len(tokens), self.op, "Line:", instrcount
                        quit()
                    else:
                        reg = self.register_lookup[tokens[0]]
                        instr1 = (0,(self.opcode<<8)+(reg<<4)+self.flag_value)
                        try:
                            address = int(tokens[1])
                        except:
                            print "Error: load/store operation must have an integer address/data: ", tokens[1], self.op, "Line:", instrcount
                            quit()
                        if address < 0:
                            address_sign = 1
                        else:
                            address_sign = 0
                        instr2 = (address_sign,abs(address))
                        self.instruction = [instr1,instr2]

                
                elif self.type == "c":
                    if len(tokens) != 2:
                        print "Error: wrong number of operands for a conditional instruction: ", len(tokens), self.op, "Line:", instrcount
                        quit()
                    else:
                        try:
                            condition = self.condition_lookup[tokens[0]]
                        except KeyError:
                            print "Error: non existant condition for conditional operation: ",tokens[0], "Line:", instrcount
                            quit()
                        instr1 = (0,(self.opcode<<8)+(condition<<4)+self.flag_value)
                        try:
                            address = int(tokens[1])
                        except:
                            print "Error: conditional operation must have an integer address/data: ", tokens[1], self.op, "Line:", instrcount
                            quit()
                        if address < 0:
                            address_sign = 1
                        else:
                            address_sign = 0
                        instr2 = (address_sign,abs(address))
                        self.instruction = [instr1,instr2]                        


                elif self.type == "v":
                    if len(tokens)!=1:
                        print "Error: wrong number of operands: ",len(tokens), self.op, "Line:", instrcount
                        quit()
                    else:
                        try:
                            reg = self.register_lookup[tokens[0]]
                            instr1 = (0,(self.opcode<<8)+(reg<<4)+self.flag_value)
                            instr2 = (0,0)
                            self.instruction = [instr1,instr2]
                        except KeyError:
                            try:
                                address = int(tokens[0])
                            except:
                                print "Error: operation must have an integer address/data: ", tokens[0], self.op, "Line:", instrcount
                                quit()
                            if address < 0:
                                address_sign = 1
                            else:
                                address_sign = 0
                            instr1 = (0,(self.opcode<<8)+self.flag_value)
                            instr2 = (address_sign,abs(address))
                            self.instruction = [instr1,instr2]
                

                elif self.type == "d": #data:
                    if len(tokens) != 1:
                        print "Error, data statements must contain only one piece of data.", "Line:", instrcount
                        quit()
                    else:
                        sign = 0
                        data = int(tokens[0])
                        if data < 0:
                            sign = 1
                            data = abs(data)
                        self.instruction = [(sign,data)]


program = extract_program()
file_name = program[1]
program = program[0]
token_list = tokenize(program)
program = []
instrcount = 0
for group in token_list:
    Operation = Instruction(group,instrcount)
    program += Operation.instruction
    instrcount += 2
write(file_name,program)

#op definition:
                



