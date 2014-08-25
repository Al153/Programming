Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			array global:global:RC4_array 256 []
			int global:global:*j global:global:j
			int global:global:i 0
			int global:global:*RC4_array global:global:RC4_array
			int global:global:j 0
			int global:global:*key global:global:key
			int global:global:*i global:global:i
			str global:global:key "hello"
			int main:init_key:current_addr 0
			int main:init_key:*current_addr main:init_key:current_addr
			int main:init_key:*next_addr main:init_key:next_addr
			int main:init_key:start_addr 0
			int main:init_key:next_addr 0
			int main:init_key:*start_addr main:init_key:start_addr
			int main:key_char:current_addr 0
			int main:key_char:*current_addr main:key_char:current_addr
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.init_key
Load gp0 Forth.dup %main.init_key
Goto Programstack.call
Push main:init_key:*start_addr
Load gp0 Forth.Pop
Goto Programstack.call
Push main:init_key:*next_addr
Load gp0 Forth.Pop
Goto Programstack.call
Push main:init_key:next_addr
Pop gp0 %FORTH.while0
if gp0 then {
Push main:init_key:next_addr
Push main:init_key:*current_addr
Load gp0 Forth.Pop
Goto Programstack.call
Push main:init_key:current_addr
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Push main:init_key:*next_addr
Load gp0 Forth.Pop
Goto Programstack.call
Push main:init_key:next_addr
Load PC FORTH.while0
}
Push main:init_key:start_addr
Push main:key_char:*current_addr
Load gp0 Forth.Pop
Goto Programstack.call
Push main:init_key:start_addr
Push main:init_key:*current_addr
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.init_array
Push @256 %main.init_array
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push @1
Pop gp0 %FORTH.while1
if gp0 then {
Load gp0 main.i--
Goto Programstack.call
Push global:global:i
Push global:global:*RC4_array
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop_byte
Goto Programstack.call
Push global:global:i
Load PC FORTH.while1
}
Return





#<FORTH COMPILER: Assembly generated for word: main.i--
Push global:global:i %main.i--
Push @1
Load gp0 Forth.SUB
Goto Programstack.call
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.i++
Push global:global:i %main.i++
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.KSA
Push @0 %main.KSA
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push @0
Push global:global:*j
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 main.init_key
Goto Programstack.call
Load gp0 main.init_array
Goto Programstack.call
Push @1
Pop gp0 %FORTH.while2
if gp0 then {
Load gp0 main.update_j
Goto Programstack.call
Load gp0 main.swap_array
Goto Programstack.call
Load gp0 main.i++
Goto Programstack.call
Push global:global:i
Push @256
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while2
}
Push @0
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push @0
Push global:global:*j
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.update_j
Push global:global:j %main.update_j
Push global:global:*RC4_array
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 main.key_char
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.as_byte
Goto Programstack.call
Push global:global:*j
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.swap_array
Push global:global:*RC4_array %main.swap_array
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push global:global:*RC4_array
Push global:global:j
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push global:global:*RC4_array
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop_byte
Goto Programstack.call
Push global:global:*RC4_array
Push global:global:j
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop_byte
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.as_byte
Push @255 %main.as_byte
Load gp0 Forth.AND
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push global:global:key %main.main
Load gp0 main.KSA
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.key_char
Push main:key_char:current_addr %main.key_char
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:key_char:current_addr
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push main:key_char:*current_addr
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.generate
Load gp0 main.i++ %main.generate
Goto Programstack.call
Push global:global:i
Load gp0 main.as_byte
Goto Programstack.call
Push global:global:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push global:global:j
Push global:global:*RC4_array
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.as_byte
Goto Programstack.call
Push global:global:*j
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 main.swap_array
Goto Programstack.call
Push global:global:*RC4_array
Load gp0 Forth.dup
Goto Programstack.call
Push global:global:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push global:global:*RC4_array
Push global:global:j
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Return




