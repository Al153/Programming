import PyfthTools
import Tokenizer
import sys

Pyfth_instance = PyfthTools.Pyfth()
pyfth_file_name = sys.argv[1]

if pyfth_file_name[-6:] != ".pyfth":
	pyfth_file_name += ".pyfth"
pyfth_file = open(pyfth_file_name)

pyfth_file_tokens = Tokenizer.tokenize(pyfth_file)
Pyfth_instance.input_tokens(pyfth_file_tokens)
Pyfth_instance.run()