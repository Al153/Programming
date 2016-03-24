#Steps

# - input taker
#	- stdio, very large string array

# - tokenizer
#	- creates linked list of tokens, each contained in original text in place
#	- needs to account for arrays, strings, comments etc

# - word detector
#	- adds another layer of linked lists for words
#	- list of (lists of (tokens))

# - variable sorter
#	- create variable space for words - has a heap of space (like a stack, so an array and a pointer which moves through it as storage is created)
#	- deal with pushes

# - word sorter
#	- deal with word calls

# - code generator
#	-generates machine code