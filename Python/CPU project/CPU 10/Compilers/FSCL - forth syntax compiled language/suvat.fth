using math.hlib
using std.hlib

array s 2 [0f, 0f]
array u 2 [0f, 0f]
array v 2 [0f, 0f]
array a 2 [0f,-9.81f]

int delta_t 0.001f
int t 1f
int theta  0.5235987756f
int v_mag 5f

"Theta = " ECHO theta .f
v_mag theta *v initv 
"\nVx = " ECHO v .f
"\nVy = " ECHO *v 4 + PUSH .f CR CR
1 while	
	*s *v *a delta_t update_suvat
	s 4 + PUSH -0.0f f> 
loop
"\nSx = " ECHO s .f
"\nSy = " ECHO *s 4 + PUSH .f CR







: initv
	int vpointer 0
	int theta 0
	int v_mag 0
	*vpointer POP *theta POP *v_mag POP

	v_mag theta sin f* 			vpointer 4 + POP
	v_mag theta cos f* 			vpointer POP
;

: update_suvat
	int spointer 0 int vpointer 0 int apointer 0 int delta_t 0
	*delta_t POP *apointer POP *vpointer POP *spointer POP

	spointer PUSH  vpointer PUSH apointer PUSH delta_t get_S1 spointer POP   #set new s values
	spointer 4 + PUSH vpointer 4 + PUSH  apointer 4 + PUSH delta_t get_S1 spointer 4 + POP

	#set new
	vpointer PUSH apointer PUSH	delta_t get_v vpointer POP
	vpointer 4 + PUSH apointer 4 + 	delta_t get_v vpointer 4 + POP
;

: get_S1 
	int a 0
	int t 0

	#s0 u a t ==> s1
	*t POP *a POP
	t f* 0.5f a t t f* f* f* f+ f+ 
;

: get_v f* f+ ; #u a t ==> v
