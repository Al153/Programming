import CPU
import json
import time
import sys

def run():
	flags = []
	for token in sys.argv:
		if token[0] == '-':
			flags.append(token)
	print "\nImporting Machine Code = ",
	machine_code = load_code()
	print "Done"
	print "\n\nCreating CPU object = ",
	CPU_instance = CPU.CPU(machine_code)
	print "Done"
	print "\n\n_____________________ Beginning execution _____________________"
	start = time.time()
	if "-d" in flags:
		try:
			start = int(sys.argv[-1])
		except:
			start = 0
		CPU_instance.debug_run(start)
	else:
		CPU_instance.run()
	end = time.time()

	print "\n_____________________ Halted __________________________________"
	print "executed ",CPU_instance.instruction_count,"instructions in ",end - start, "seconds, at ",CPU_instance.instruction_count/(end-start) if end-start != 0 else "Too fast","I/s"
	print "Registers as follows:"
	print_registers(CPU_instance)


def print_registers(CPU_instance):
	register_names = ["Zero","One","Accumulator","Jump","PC","Flags_set","Flags_reset","Stack_pointer","gp0","gp1","gp2","gp3","gp4","gp5","gp6","gp7"]
	for i in xrange(16):
		print register_names[i], CPU_instance.Registers.registers[i].data



def load_code():
	try:
		return integer_keys(json.loads(open(sys.argv[1]).read()))
	except IOError:
		try:
			return integer_keys(json.loads(open('Machine code\\' + sys.argv[1]).read()))
		except IOError:
			print "Error: Could not find file",sys.argv[1]
			quit()

def integer_keys(input_dict):
	output_dict = {}
	for key in input_dict:
		output_dict[int(key)] = input_dict[key]
	return output_dict
run()