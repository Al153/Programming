<< ADD >>
Pop gp0
Pop gp1
ADD gp0 gp1
Push gp0

<< SUB >>
Pop gp0
Pop gp0
Pop gp1
SUB gp0 gp1
Push gp0

<< MUL>>
Pop gp0
Pop gp0
Pop gp1
MUL gp0 gp1
Push gp0

<< DIV >>
Pop gp0
Pop gp1
DIV gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
Push gp0

<< MOD >>
Pop gp0
Pop gp1
MOD gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
Push gp0

<< AND >>
Pop gp0
Pop gp1
AND gp0 gp1
Push gp0

<< OR >
Pop gp0
Pop gp1
OR gp0 gp1
Push gp0

<< XOR >>
Pop gp0
Pop gp1
XOR gp0 gp1
Push gp0

<< NOT >>
Pop gp0
Pop gp1
NOT gp0 gp1
Push gp0