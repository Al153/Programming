#Signed and unsigned arithmetic

# ________________________ Binary operations ________________________
#________________________ Additive ________________________
<< ADD >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD
<storegp0>
<< SUB >>
<getgp1><getgp0>
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
<storegp0>
<< SHR >>
<getgp1><getgp0>
SHR gp0 gp1 														#SHIFT RIGHT
<storegp0>
<< SHL >> 	
<getgp1><getgp0> 
SHL gp0 gp1 														#SHIFT LEFT
<storegp0>
<< ADD char >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
<storegp0>
<< SUB char >>
<getgp1><getgp0>
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
<storegp0>
<< SHR char >>
<getgp1><getgp0>
AND gp0 @255 														#SHIFT RIGHT (CHARS)
SHR gp0 gp1
<storegp0>
<< SHL char >>
<getgp1><getgp0>
SHL gp0 gp1 														#SHIFT LEFT (CHARS)
AND gp0 @255
<storegp0>
<<junk>>
# ________________________ Multiplicative ________________________
<< MUL >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY
<storegp0>
<< DIV >>
<getgp1><getgp0>
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD >>
<getgp1><getgp0>
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND >>
<getgp0><getgp1>
AND gp0 gp1 														#AND
<storegp0>
<< OR >>
<getgp0><getgp1>
OR gp0 gp1 															#OR
<storegp0>
<< XOR >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR
<storegp0>
<< MUL char >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY (CHARS)
AND gp0 @255
<storegp0>
<< DIV char >>
<getgp1><getgp0>
AND gp0 @255 														#DIVIDE (CHARS)
AND gp1 @255
DIV gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD char >>
<getgp1><getgp0>
AND gp0 @255 														#MODULO (CHARS)
AND gp0 @255
MOD gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND char >>
<getgp0><getgp1>
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
<storegp0>
<< OR char >>
<getgp0><getgp1>
OR gp0 gp1 															#OR (CHARS)
AND gp0 @255
<storegp0>
<< XOR char >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR (CHARS)
AND gp0 @255
<storegp0>
<<junk>>

#_________________________ unary operators _________________________

<< NOT >>
<getgp0>
NOT gp0 															#NOT
<storegp0>
<< NOT char >>
<getgp0>
NOT gp0 															#NOT (CHAR)
AND gp0 @255
<storegp0>
<< unary SUB >>													
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT
SUB gp1 gp0 
Move gp1 gp0
Load Flags_reset @4294967287  
<storegp0>
<< unary SUB char >>														
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT (CHAR)
SUB gp1 gp0 
Move gp1 gp0
AND gp1 @255
Load Flags_reset @4294967287  
<storegp0>
<<junk>>

################### REPEAT FOR SIGNED ######################
# ________________________ Binary operations ________________________
#________________________ Additive ________________________
<< ADD signed >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD
<storegp0>
<< SUB signed >>
<getgp1><getgp0>
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
<storegp0>
<< SHR signed >>
<getgp1><getgp0>
SHR gp0 gp1 														#SHIFT RIGHT
<storegp0>
<< SHL signed >> 	
<getgp1><getgp0> 
SHL gp0 gp1 														#SHIFT LEFT
<storegp0>
<< ADD char signed >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
<storegp0>
<< SUB char signed >>
<getgp1><getgp0>
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
<storegp0>
<< SHR char signed >>
<getgp1><getgp0>
AND gp0 @255 														#SHIFT RIGHT (CHARS)
SHR gp0 gp1
<storegp0>
<< SHL char signed >>
<getgp1><getgp0>
SHL gp0 gp1 														#SHIFT LEFT (CHARS)
AND gp0 @255
<storegp0>
<<junk>>
# ________________________ Multiplicative ________________________
<< MUL signed >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY
<storegp0>
<< DIV signed >>
<getgp1><getgp0>
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD signed >>
<getgp1><getgp0>
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND signed >>
<getgp0><getgp1>
AND gp0 gp1 														#AND
<storegp0>
<< OR signed >>
<getgp0><getgp1>
OR gp0 gp1 															#OR
<storegp0>
<< XOR signed >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR
<storegp0>
<< MUL char signed >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY (CHARS)
AND gp0 @255
<storegp0>
<< DIV char signed >>
<getgp1><getgp0>
AND gp0 @255 														#DIVIDE (CHARS)
AND gp1 @255
DIV gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD char signed >>
<getgp1><getgp0>
AND gp0 @255 														#MODULO (CHARS)
AND gp0 @255
MOD gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND char signed >>
<getgp0><getgp1>
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
<storegp0>
<< OR char signed >>
<getgp0><getgp1>
OR gp0 gp1 															#OR (CHARS)
AND gp0 @255
<storegp0>
<< XOR char signed >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR (CHARS)
AND gp0 @255
<storegp0>
<<junk>>

#_________________________ unary operators _________________________

<< NOT signed >>
<getgp0>
NOT gp0 															#NOT
<storegp0>
<< NOT char signed >>
<getgp0>
NOT gp0 															#NOT (CHAR)
AND gp0 @255
<storegp0>
<< unary SUB signed >>													
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT
SUB gp1 gp0 
Move gp1 gp0
Load Flags_reset @4294967287  
<storegp0>
<< unary SUB char signed >>														
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT (CHAR)
SUB gp1 gp0 
Move gp1 gp0
AND gp1 @255
Load Flags_reset @4294967287  
<storegp0>
<<junk>>
