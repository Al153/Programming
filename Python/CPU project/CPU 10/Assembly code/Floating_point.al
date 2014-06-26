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

(-1)^sign*fraction*2^(exponent-127)