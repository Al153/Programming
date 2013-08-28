#Al's compiler

class Lookup:
        def __init__(self,lookupTable):
                self.lookupTable = lookupTable
        def lookup(self,searchTerm):
                result = self.lookupTable[searchTerm]
                return result

lookupTable = {'ADD':0,'SUB':4,'MUL':8,'DIV':12,'MOD':16,'AND':20,'OR':24,'XOR':28,'NOT':32,
          'NAND':36,'NOR':40,'ROT':44,'PAR':48,'SHIFT':52,'FLIP':56,'SWITCH':60,'PAGE':64,
          'JMP':68,'IF':73,'ENDIF':147,'HALT':148,'LOAD':149,'WRITE':173,'COPY':193,'COPYMEM':213,
          'WIPE':214,'SAVEPC':231,'EXE':235}

lookupmachine = Lookup(lookupTable)

source = str(raw_input("Source code here: "))

sourceList = []
current = []
current1 =[]
for i in range(len(source)):
	pointed = source[i]
	if pointed == ';':
		current = ''.join(current)
		sourceList.append(current)
		current = []
		print 'end of statement', sourceList
	else:
		current.append(pointed)
		print current
#for i in range(ken(sourceList)):
print sourceList
current = []
for i in range(len(sourceList)):
        section = sourceList[i]
        newSection = []
        for j in range(len(section)):
                pointed = section[j]
                if pointed == ':':
                        ''.join(current)
                        newSection.append(current)
                        current = []
                else:current.append(pointed)
        current = ''.join(current)
        newSection.append(current)
        current = []
        sourceList[i] = newSection
print 'sourceList',sourceList

        
