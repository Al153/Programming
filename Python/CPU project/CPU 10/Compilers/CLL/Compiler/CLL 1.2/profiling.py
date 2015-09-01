import cProfile
import parser_generator
import sys

cProfile.run('parser_generator.generate_parser(sys.argv[1].split(".")[0],open(sys.argv[1]).read())')