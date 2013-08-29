#find - replace syntax: find <expression> replace <expression>

#<> denotes a variable, can be anything and is constant throughout tranformation
#"" denotes a string, which is the target for the macro

#eg 'find "if" <x> "==" <y> "then goto" <z> replace "CMP" <x> <y> "@wf" "\n" "CGT" "E" <z>'
#will replace "if acc == ind then goto %if_equal"
#with "CMP acc ind @wf
#		CGT E %if_equal" 






def find_rules(tokens):
	for line in tokens:
		if line[0] == "find"