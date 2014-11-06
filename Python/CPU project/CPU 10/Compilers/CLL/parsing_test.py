import LR1_parser
import parser_generator

#parser_generator.generate_parser("CLL",'''
#<PROGRAM> ::= <block>
#<ELEMENTARY_TOKENS> ::= " " | "\t" | "\\n" | "(" | ")" | "@" | "$" | "+" | "-" | "*" | "/" | "%" | "|" | "^" | "& " | "~" | "<" | "=" | ">" | ";" | ","
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
#<fun_dec> ::= <type> id "(" inargs ")" <block> "end" | <type> id "(" ")" <block> "end"
#<other> ::= "return" <expr> | <fun_call>
#
#<inargs> ::= <type> id | <inargs> "," <type> id
#
#
#
#<variable> ::= id | variable "[" <expr> "]" | "[" <expr> "]"
#<const> ::= int | "$" id
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
#<for_loop> ::= "for" "(" <assignment "," <for_bool_expr> "," <assignment> ")" <block> "loop"
#
#<type> ::= "int" | "char" | "array" int | "array" int "[" <array> "]" | "void"
#<array> ::= <array> "," int | int
#
#
#''')
local_parser = LR1_parser.Parser("CLL.parse")
parse_tree = local_parser.parse('''
a = b + c;
while (a > 3) do
	d = a+b/c;
loop;
return a;
''')

local_parser.print_parse_tree(parse_tree)