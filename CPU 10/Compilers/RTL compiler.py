RTL was a planned intermediate language before I developed CLL or forth
I scrapped it soon after

def RTL_to_AL_line(RTL):
	'''converts a line of RTL to assembly'''
	Function_list = {
		"INIT":RTL_init,#
		"ADD":RTL_ADD,#
		"SUB":RTL_SUB,#
		"MUL":RTL_MUL,#
		"DIV":RTL_DIV,#
		"MOD":RTL_MOD,#
		"AND":RTL_AND,#
		"OR":RTL_OR,#
		"XOR":RTL_XOR,#
		"NOT":RTL_NOT,#
		"NAND":RTL_NAND,#
		"NOR":RTL_NOR,#
		"XNOR":RTL_XNOR,#
		"SHL":RTL_SHL,#
		"SHR":RTL_SHR,#
		"ADDc":RTL_ADDC,#
		"SUBb":RTL_SUBC,#
		"int":RTL_int,#
		"char":RTL_char,#
		"array":RTL_array, #######################
		"char_array":RTL_char_array, #####################
		"goto":RTL_goto,
		"branch":RTL_branch,
		"call":RTL_Call,
		"return":RTL_return,
		"Push":RTL_Push,
		"Pop":RTL_Pop,
		"Move":RTL_Move,
		"Load":RTL_Load 
	}

	assembly = ''
	label = ''
	if RTL[1] == "|":
		assembly += "ptr "+RTL[0]+"\n" #create a pointer to sub routine
		label = '%' + RTL[0]+"\n"
		RTL = RTL[2:]

		assembly += Function_list[RTL[-1]](RTL)

		for i in xrange(len(assembly)):
			if assembly[i] == "\n":
				assembly = assembly[:i]+label+assembly[i+1:]
				return assembly


	else:
		return assembly + Function_list[RTL[-1]](RTL)
def RTL_init(RTL):
	return "int temp0 0\nint temp1 0"
	
def RTL_ADD(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nADD gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_SUB(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nSUB gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_MUL(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nMUL gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_DIV(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nDIV gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_MOD(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nMOD gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_AND(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nAND gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_OR(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nOR gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_XOR(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nXOR gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_NOT(RTL):
	return "Load gp0 @"+RTL[0]+"\nNOT gp0 gp1"+"\nStore gp0 @"+RTL[1]+ "\n"
def RTL_NAND(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nNAND gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_NOR(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nNOR gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_XNOR(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nXNOR gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_SHL(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nSHL gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_SHR(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nSHR gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_ADDc(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nADDc gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"
def RTL_SUBb(RTL):
	return "Load gp0 @"+RTL[0]+"\nLoad gp1 @"+RTL[1]+"\nSUBb gp0 gp1"+"\nStore gp0 @"+RTL[2]+ "\n"


def RTL_int(RTL):
	return "int "+RTL[0] + " " +RTL[1] + "\n" 
def RTL_char(RTL):
	return "char"+RTL[0] + " "+RTL[1] + "\n"

def RTL_array(RTL):
		
def RTL_char_array(RTL):

def RTL_goto(RTL):
	return "Load PC " + RTL[0] +"\n"

def RTL_branch(RTL):
	#[ var0 var1 Equal ] ptr0 else ptr1 Branch
	conditional_tokens = []
	for  i in xrange(1,len(RTL)):
		if RTL[i] == "]": break
		else:
			conditional_tokens.append(RTL[i])
	primary_address = RTL[-4]
	secondary_address = RTL[-2]
	if conditional_tokens[-1] == "if":
		return "Load gp0 @"+ conditional_tokens[0] +"\n if gp0 then Load PC @"+primary_address+"\nLoad PC @"+secondary_address+"\n"
	else:
		assembly = "Load gp0 @"+conditional_tokens[0]+"\nLoad gp1 @"+conditional_tokens[1]+"\nif "+conditional_tokens[-1]+"then Load PC @"
		assembly += primary_address + "\nLoad PC @"+secondary_address+"\n"
		return assembly

def RTL_Call(RTL):
	return "Load gp0 @"+RTL[0]+"\nGoto @Programstack.push\n"
def RTL_return(RTL):
	return "Load PC @Programstack.return"

def RTL_push(RTL):
	return "Load gp0 @"+RTL[0]+"\nGoto @Datastack.push"

def RTL_pop(RTL):
	return "Goto @Datastack.push\nStore gp0 @"+RTL[0]+"\n"



typical RTL clauses:


subroutine_name | var0 var1 var2 add

becomes 

ptr subroutine_name

Load gp0 @var0 %subroutine_name
Load gp1 @var1
ADD gp0 gp1 
Store gp0 @var2


or..

[ var0 var1 equals ] subroutine_name call

becomes 

Load gp0 @var0
Load gp1 @var1
Compare gp0 gp1 
if Equal then goto @subroutine_name

or ..

var0 value index load  				- index is optional

int value value
Load gp1 @index
Load gp0 @value [gp1]
Store gp0 @var0


or
var0 var1 index0 index1 move 		-indices optional

Load gp1 @index0
load gp2 @index1
Load gp0 @var0 [gp1]
Store gp0 @var1 [gp2]

________ RTL functions __________

___ Format ___



__ ALU __
ADD
SUB
.
.  			- ALU instrs
.
ADDc

__ declaritive __
int 			- creates primitive data_types as expected, but in RPN
array
char
char_array

__ moving around __
Load  			- Loads a variable with a constant value eg var 3 load means 
Move 			- sets the value of one variable to be the same as another

___ program flow __


goto 			- direct goto, no stack calls, no return
branch 			- conditional gotos
call 			- stores (pc + k) to program stack, where k is the offset of the return ie the difference between the current PC and after the called function
Return 			- Loads PC from top of program stack
Pop 			- takes data from the data stack
Push 			- puts data onto the data stack


___________ RTL modifiers ___________
__conditional__
Equal 			- for branching
Greater  		
Less
if


__pointers__
& 		-value at 		
* 		-address of