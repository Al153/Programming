import LR1_parser
import parser_generator

#parser_generator.generate_parser("CLL",'''
#<PROGRAM> ::= <block>
#<ELEMENTARY_TOKENS> ::= " " | "\t" | "\\n" | "(" | ")" | "@" | "$" | "+" | "-" | "*" | "/" | "%" | "|" | "^" | "& " | "~" | "<" | "=" | ">" | ";" | "," | "[" | "]"
#<IGNORE> ::= " " | "\t" | "\\n"
#
#<block> ::= <line> | <block> <line>
#<line> ::= <stmnt> ";"
#
#<stmnt> ::= <assignment> | <cntrl_flow> | <var_dec> | <fun_dec> | <other>
#
#<assignment> ::= <variable> "=" <expr>
#<cntrl_flow> ::= <if_stmnt> | <while_loop> | <for_loop>
#<var_dec> ::= <type> id 
#<fun_dec> ::= <type> id "(" <inargs> ")" <block> "end" | <type> id "(" ")" <block> "end"
#<other> ::= "return" <expr> | <fun_call>
#
#<inargs> ::= <type> id | <inargs> "," <type> id
#
#
#
#<variable> ::= id | <variable> "[" <expr> "]" | "[" <expr> "]"
#<const> ::= num | "$" id
#
#<expr> ::= <expr> <addop> <term> | <term> | <unary_op> <term>S
#<term> ::= <term> <mulop> <factor> | <factor>
#<factor> ::= <const> | <variable> | <fun_call> | "(" <expr> ")"
#
#<fun_call> ::= id "(" <args> ")" | id "(" ")"
#<args> ::= <args> "," <expr> | <expr>
#
#<addop> ::= "+" | "-"
#<mulop> ::= "*" | "/" | "%" | "^" | "|" | "&"
#<unary_op> ::= "~" | "-"
#
#
#
#
#
#<bool_expr> ::= "(" <bool_factor> ")" | "(" <comparison> ")"
#<for_bool_expr> ::= <bool_factor> | <comparison>
#
#<bool_factor> ::= <bool_expr> | <bool_factor> <boolop> <bool_expr> | <unary_boolop> <bool_expr>
#
#<comparison> ::= <expr> <comp_op> <expr> | <expr>
#
#<boolop> ::= "and" | "or" | "xor"
#<unary_boolop> ::= "not"
#
#<comp_op> ::= "=" "=" | "<" | ">" | <not_less> | <not_greater>
#<not_less> ::= ">" "=" | "=" ">"
#<not_greater> ::= "<" "=" | "=" "<"
#
#
#
#<if_stmnt> ::= "if" <bool_expr> "then" <block> "endif" | "if" <bool_expr> "then" <block> "else" <block> "endif"
#<while_loop> ::= "while" <bool_expr> "do" <block> "loop"
#<for_loop> ::= "for" "(" <assignment> "," <for_bool_expr> "," <assignment> ")" <block> "loop"
#
#<type> ::= "int" | "char" | "@" "int" | "@" "char"	| "array" num | "array" num "[" <array> "]" | "void"
#<array> ::= <array> "," num | num
#
#
#''')
local_parser = LR1_parser.Parser("CLL.parse")

fib_program = '''
int fib(int x)
	if ((x==0) or (x==1)) then
		return 1;
	else
		return fib(x-1) + fib(x-2);
	endif;
end;

void main()
	int i;
	for (i=0,i<10,i=i+1)
		print(fib(i));
	loop;
end;
'''
gcd = '''
print(gcd(34,56));


int gcd(int a,int b)
	while (a>0) do
		int c;
		c = b % a;
		b = a;
		a = c;
	loop;
	return b;
end;
'''

heapsort_program = '''
void heapsort(@int ptr, int length)
	build_heap(ptr,length);
	sort_heap(ptr,length);
end;

int parent(int index)
	return (index-1)/2;
end;

int lchild(int index)
	return 2*index+1;
end;

int rchild(int index)
	return 2*index+2;
end;

void build_heap(@int ptr, int length)
	int i;
	for (i = 1, i<length,i = i+1)
		sift_up(ptr,i);
	loop;
end;

void sift_up(@int ptr, int i)
	int j;
	j = parent(i);
	int jvalue;
	int ivalue;

	jvalue = ptr[j];
	ivalue = ptr[i];
	if (ivalue>jvalue) then
		ptr[i] = jvalue;
		ptr[j] = ivalue;
		sift_up(ptr,j);
	endif;
end;

void sort_heap(@int ptr, int length)
	int i;
	for (i=length-1, i>0, i = i-1)
		int temp;
		temp = ptr[0];
		ptr[0] = ptr[i];
		ptr[i] = temp;
		sift_down(ptr,0,i);
	loop;
end;

void sift_down(@int ptr,int start ,int limit)
	int j;
	int k;
	if (start<limit) then
		j = lchild(start);
		k = rchild(start);
		if (ptr[j]<ptr[k]) then
			j = k;
		endif;
		if (ptr[j]>ptr[start]) then
			k = ptr[start];
			ptr[start] = ptr[j];
			ptr[j] = k;
			sift_down(ptr,j,limit);
		endif;
	endif;
end;
'''




parse_tree = local_parser.parse(heapsort_program)

local_parser.print_parse_tree(parse_tree)