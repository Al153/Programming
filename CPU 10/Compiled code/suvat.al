Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#math.hlib
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		
import Compilers\Forth\Headers\floating_point.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:initv:*theta main:initv:theta
			int main:initv:*vpointer main:initv:vpointer
			int main:initv:v_mag 0
			int main:initv:theta 0
			int main:initv:vpointer 0
			int main:initv:*v_mag main:initv:v_mag
			int main:main:*t main:main:t
			int main:main:*u main:main:u
			int main:main:*v main:main:v
			int main:main:*s main:main:s
			int main:main:*a main:main:a
			int main:main:*gen_string0 main:main:gen_string0
			int main:main:*gen_string1 main:main:gen_string1
			int main:main:*gen_string2 main:main:gen_string2
			int main:main:*gen_string3 main:main:gen_string3
			int main:main:*gen_string4 main:main:gen_string4
			int main:main:v_mag 536871042
			int main:main:theta 101355903
			int main:main:*v_mag main:main:v_mag
			str main:main:gen_string1 "
Vx = "
			int main:main:*theta main:main:theta
			int main:main:delta_t 51539574
			int main:main:*delta_t main:main:delta_t
			array main:main:a 2 [0, 2633351811]
			str main:main:gen_string0 "Theta = "
			str main:main:gen_string3 "
Sx = "
			str main:main:gen_string2 "
Vy = "
			str main:main:gen_string4 "
Sy = "
			array main:main:s 2 [0, 0]
			array main:main:u 2 [0, 0]
			int main:main:t 128
			array main:main:v 2 [0, 0]
			int main:get_S1:a 0
			int main:get_S1:*t main:get_S1:t
			int main:get_S1:t 0
			int main:get_S1:*a main:get_S1:a
			int main:update_suvat:delta_t 0
			int main:update_suvat:spointer 0
			int main:update_suvat:apointer 0
			int main:update_suvat:*spointer main:update_suvat:spointer
			int main:update_suvat:*delta_t main:update_suvat:delta_t
			int main:update_suvat:vpointer 0
			int main:update_suvat:*vpointer main:update_suvat:vpointer
			int main:update_suvat:*apointer main:update_suvat:apointer
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.initv
Push main:initv:*vpointer %main.initv
Load gp0 Forth.Pop
Goto Programstack.call
Push main:initv:*theta
Load gp0 Forth.Pop
Goto Programstack.call
Push main:initv:*v_mag
Load gp0 Forth.Pop
Goto Programstack.call
Push main:initv:v_mag
Push main:initv:theta
Load gp0 FP.sin
Goto Programstack.call
Load gp0 FP.Multiply
Goto Programstack.call
Push main:initv:vpointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop
Goto Programstack.call
Push main:initv:v_mag
Push main:initv:theta
Load gp0 FP.cos
Goto Programstack.call
Load gp0 FP.Multiply
Goto Programstack.call
Push main:initv:vpointer
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.get_S1
Push main:get_S1:*t %main.get_S1
Load gp0 Forth.Pop
Goto Programstack.call
Push main:get_S1:*a
Load gp0 Forth.Pop
Goto Programstack.call
Push main:get_S1:t
Load gp0 FP.Multiply
Goto Programstack.call
Push @127
Push main:get_S1:a
Push main:get_S1:t
Push main:get_S1:t
Load gp0 FP.Multiply
Goto Programstack.call
Load gp0 FP.Multiply
Goto Programstack.call
Load gp0 FP.Multiply
Goto Programstack.call
Load gp0 FP.Add
Goto Programstack.call
Load gp0 FP.Add
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push main:main:gen_string0 %main.main
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:theta
Load gp0 FP.display
Goto Programstack.call
Push main:main:v_mag
Push main:main:theta
Push main:main:*v
Load gp0 main.initv
Goto Programstack.call
Push main:main:gen_string1
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:v
Load gp0 FP.display
Goto Programstack.call
Push main:main:gen_string2
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:*v
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Load gp0 FP.display
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Push @1
Pop gp0 %FORTH.while0
if gp0 then {
Push main:main:*s
Push main:main:*v
Push main:main:*a
Push main:main:delta_t
Load gp0 main.update_suvat
Goto Programstack.call
Push main:main:s
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push @0
Load gp0 FP.Greater
Goto Programstack.call
Load PC FORTH.while0
}
Push main:main:gen_string3
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:s
Load gp0 FP.display
Goto Programstack.call
Push main:main:gen_string4
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:*s
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Load gp0 FP.display
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.get_v
Load gp0 FP.Multiply %main.get_v
Goto Programstack.call
Load gp0 FP.Add
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.update_suvat
Push main:update_suvat:*delta_t %main.update_suvat
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:*apointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:*vpointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:*spointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:spointer
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:vpointer
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:apointer
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:delta_t
Load gp0 main.get_S1
Goto Programstack.call
Push main:update_suvat:spointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:spointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:vpointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:apointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:delta_t
Load gp0 main.get_S1
Goto Programstack.call
Push main:update_suvat:spointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:vpointer
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:apointer
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:delta_t
Load gp0 main.get_v
Goto Programstack.call
Push main:update_suvat:vpointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:update_suvat:vpointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push main:update_suvat:apointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Push main:update_suvat:delta_t
Load gp0 main.get_v
Goto Programstack.call
Push main:update_suvat:vpointer
Push @4
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop
Goto Programstack.call
Return




