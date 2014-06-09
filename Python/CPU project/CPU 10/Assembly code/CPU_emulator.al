#Architecture of new CPU
#
#1 accumulator 	  
#16 index registers 8 bits
#256 bytes of RAM
#Havard architecture
#256 bytees of ROM
#Instr  Reg    A/D
#0000   0000   0000 0000
#
#
#Opcode
#0 		HLT
#1		LTA Loads literal value of A/D into ACC
#2		LTI Loads literal value of A/D into specified I register
#
#3		LDA Load ACC from memory, using I register as an index	
#4 		STA Store ACC to memory using I reg as an index
#
#5		MVT Move ACC to an I reg 
#6		MVF Move I reg to acc
#
#7		CMP compares ACC with address (indexed by I reg)
#
#8 		JMP Jump, Loads PC with A/D + Ireg
#9		JPE Jump if equal  
#a		JPG Jump if Greater
#b		JPL Jump if less
#
#c		ADD Adds ACC with value at address + I reg	
#d		AND
#e		NOT
#f      SHR
#
#
#Cycle
#
#Fetch instruction  		Load instr/reg byte from ROM
#increment PC       		PC +=1 (MOD 256)
#Fetch A/D          		Load A/D byte from ROm
#increment PC       		PC +=1 (MOD 256)
#decode instruction 		separate opcode and reg nybbles
#execute 		   		Call subroutine from list


Load PC CPU.main_cycle


Outd CPU_ACC %Ended_CPU_Action
Halt


#_______________________ definitition of parts _______________________
Byte_array Iregs 16 []
Byte_array RAM 256 []
Byte_array ROM 256 [16, 4, 64, 0, 16, 5, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

def CPU_PC gp1
def CPU_ACC gp2
def CPU_instr gp3
def CPU_AD gp4
def CPU_I gp5
def CPU_DAT1 gp6
def CPU_DAT2 gp7

int CPU.instr_lookup 	$CPU.HLT
int CPU.instr_lookup1   $CPU.LTA
int CPU.instr_lookup2	$CPU.LTI
int CPU.instr_lookup3 	$CPU.LDA

int CPU.instr_lookup4   $CPU.STA
int CPU.instr_lookup5	$CPU.MVT
int CPU.instr_lookup6 	$CPU.MVF
int CPU.instr_lookup7   $CPU.CMP

int CPU.instr_lookup8   $CPU.JMP
int CPU.instr_lookup9   $CPU.JPE
int CPU.instr_lookupa   $CPU.JPG
int CPU.instr_lookupb   $CPU.JPL

int CPU.instr_lookupc	$CPU.ADD
int CPU.instr_lookupd   $CPU.AND
int CPU.instr_lookupe   $CPU.NOT
int CPU.instr_lookupf   $CPU.SHR

#_________________ Cycle _________________

			#FETCH INSTRUCTION

			LoadByte CPU_instr ROM [CPU_PC] %CPU.main_cycle

			#INCREMENT PC

			ADD CPU_PC One
			AND CPU_PC @255 			#(mod 256)

			#FETCH A/D

			LoadByte CPU_AD ROM [CPU_PC]

			#INCREMENT PC

			ADD CPU_PC One
			AND CPU_PC @255 			#(mod 256)


			#DECODE INSTRUCTION

			Load CPU_I @15
			AND CPU_I CPU_instr
			SHR CPU_instr @2    # CPU_instr := opcode*4

			#EXECUTE

			Load PC CPU.instr_lookup [CPU_instr]

#_________________ Instructions _________________
Load PC Ended_CPU_Action 					%CPU.HLT   


Move CPU_AD CPU_ACC 	 					%CPU.LTA
Load PC CPU.main_cycle

StoreByte CPU_AD Iregs  					%CPU.LTI
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.LDA
AND CPU_AD @255          #(mod 256)
LoadByte CPU_ACC RAM [CPU_AD]
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.STA
AND CPU_AD @255          #(mod 256)
StoreByte CPU_ACC RAM [CPU_AD]
Load PC CPU.main_cycle

StoreByte CPU_ACC Iregs [CPU_I]			%CPU.MVT
Load PC CPU.main_cycle

LoadByte CPU_ACC Iregs [CPU_I]				%CPU.MVF
Load PC CPU.main_cycle

Move Zero Flags_reset  						%CPU.CMP    #wipes flags
ADD CPU_AD Iregs [CPU_I]
AND CPU_AD @255          #(mod 256)
LoadByte CPU_DAT1 RAM [CPU_AD]
Compare CPU_ACC CPU_DAT1
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.JMP
AND CPU_AD @255          #(mod 256)
Move CPU_AD CPU_PC
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.JPE
AND CPU_AD @255          #(mod 256)
if Equal then Move CPU_AD CPU_PC
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.JPG
AND CPU_AD @255          #(mod 256)
if Greater then Move CPU_AD CPU_PC
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.JPL
AND CPU_AD @255          #(mod 256)
if Less then Move CPU_AD CPU_PC
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.ADD
AND CPU_AD @255          #(mod 256)Ü
LoadByte CPU_DAT1 RAM [CPU_AD]
ADD CPU_ACC CPU_DAT1
AND CPU_ACC @255     
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.AND
AND CPU_AD @255          #(mod 256)
LoadByte CPU_DAT1 RAM [CPU_AD]
AND CPU_ACC CPU_DAT1    
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.NOT
XOR CPU_ACC @255  							#NOT (mod 256)  
Load PC CPU.main_cycle

ADD CPU_AD Iregs [CPU_I] 					%CPU.SHR
AND CPU_AD @255          #(mod 256)
LoadByte CPU_DAT1 RAM [CPU_AD]
SHR CPU_ACC CPU_DAT1  
Load PC CPU.main_cycle





#
#Line    Opcode   Ireg   A/D      Binary                 Byte1    Byte2
#0 		LTA      NULL   1        00010000 00000001      16       1
#2       STA      0      0        01000000 00000000      64       0
#4       LTA      NULL   255      00010000 11111111      16       255
#6       STA      0      1        01000000 00000001      64       0
#8       LTA      NULL   0        00010000 00000000      16       0
#
#10      ADD      0      0        11000000 00000000      192      0
#12      CMP      0      1        01110000 00000001      112      1
#14      JPL      0      10       10110000 00001010      176      10
#
#16 		HLT      NULL   0        00000000 00000000      0         0
#
#code = [16,1,64,0,16,255,64,0,16,0,192,0,112,1,176,10,0]

