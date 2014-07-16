#Implementation of single precision floating point operations in assembly

Struct Float sign exponent fraction
	Byte sign sign
	Byte exponent exponent
	int fraction fraction
end Struct


Scope float_to_Dword

#takes a float object and converts it into a dword representing that float
#. . . float_pointer ==> . . . Dword

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3

						Pop floatpointer		%float_to_Dword
						LoadByte sign 0 [floatpointer]
						LoadByte exponent 1 [floatpointer]
						Load fraction 2 [floatpointer]

						SHL exponent @23                            #  0eeeeee e0000000 00000000 00000000
						AND fraction @8388607 						#gets bottom 23bits of fraction
						ADD exponent fraction                       # 0eeeeee efffffff ffffffff ffffffff 

						if sign then ADD exponent  @2147483648      #2**31, so adds in sign bit

						Push exponent
						Return

Scope Dword_to_float
	
#takes a pointer to an empty float object and converts a dword to become that float
#. .  . floatpointer Dword ==> . . . floatpointer

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3
		def Dword gp4
		

		Pop Dword %Dword_to_float
		Pop floatpointer
		
		Load fraction @8388607      #00000000 01111111 11111111 11111111
		AND fraction Dword    #extracts bottom 23 bits
		
		SHR Dword @23         #shifts down
		Load exponent @255    # 00000000 00000000 00000000 11111111
		AND exponent Dword    #extracts next 8 bits 
		
		SHR Dword @8          #removes 8 bits
		Move Zero sign        #resets sign 
		if Dword then Move One sign  #adds sign if needed 


		StoreByte sign 0 [floatpointer]
		StoreByte exponent 1 [floatpointer]
		Store fraction 2 [floatpointer]

		Return


Scope Multiply


#Multiplies two floats stored in float_objects

s1*f1*2**(e1-127) * s2*f2*2**(e2-127) = (s1^s2) *f1*f2 *2**(e1+e2 -256)

 #. . . f1 fp2 fp3 ==> . . . fp3    #fp3 is the result of the Multiply
		def fp1 gp1
		def fp2 gp2
		def fp3 gp3

		Pop fp3
		Pop fp2
		Pop fp1


		#sign is XOR of input signs

		LoadByte gp4 0 [fp1]   
		LoadByte gp5 0 [fp2]
		XOR gp4 gp5
		StoreByte gp4 0 [fp3]

		#Basis of exponent is sum of other two except with 127 subtracted to counteract two lots of
		LoadByte gp4 1 [fp1]
		LoadByte gp5 1 [fp2]

		ADD gp4 gp5
		SUB gp4 @127

		Load gp5 2 [fp1]
		Load gp6 2 [fp2]
		MUL gp5 gp6




Move Acc gp6
Copmare gp6 