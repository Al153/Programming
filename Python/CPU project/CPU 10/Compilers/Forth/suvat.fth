using math.hlib
using std.hlib

array s 2 [0f, 0f]
array v 2 [0f, 0f]
array a 2 [0f, -9.81f]

int delta_t 0.001f
int t 0f
int theta  0.5235987756f
int v_mag 5f

"Theta = " ECHO theta .f
v_mag theta *v initv 
"Vx = " ECHO v .f
*v 4 + PUSH .f CR

*s *v *a delta_t update_suvat

*s 4 + PUSH while 
	*s *v *a delta_t update_suvat
	*s 4 + PUSH
loop
s .f






: initv
	int vpointer 0
	int theta 0
	int v_mag 0
	*vpointer POP *theta POP *v_mag POP

	v_mag theta sin DUP "sin theta = " ECHO .f f* vpointer 4 + POP
	v_mag theta cos DUP "cos theta = " ECHO .f f* vpointer POP
;

: update_suvat
	int spointer 0 int vpointer 0 int apointer 0 int delta_t 0
	*delta_t POP *apointer POP *vpointer POP *spointer POP

	vpointer PUSH delta_t f* apointer PUSH DUP f* delta_t f* f+ spointer PUSH f+ spointer POP   #set new s values
	vpointer 4 + PUSH delta_t f* apointer 4 + PUSH DUP f* delta_t f* f+ spointer 4 + PUSH f+ spointer POP

	#set new
	vpointer PUSH apointer PUSH delta_t f* f+ vpointer POP
	vpointer 4 + PUSH apointer 4 + PUSH delta_t f* f+ vpointer 4 + POP
;

