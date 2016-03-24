#python code to generate a cll parser
import json
import sys

#uses premade json file to generate a CLL parser

	#jobs
	#- import and extract JSON parse file
	#- enumerate possible tokens and create #define directives for each one
	#- create either:
		# code to generate a data structure which contains the parse tables
		# hard coded cll functions
	#- produce some kind of tokeniser