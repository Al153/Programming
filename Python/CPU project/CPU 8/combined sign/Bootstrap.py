import CPU
import json
class Program:
    def __init__(self):
        error = 1
        while error:
            try:
                file_name = str(raw_input("Please enter file name: "))
                self.program_file = open(file_name)
                error = 0
            except IOError:
                try:
                    file_name += '.aml'
                    self.program_file = open(file_name)
                    error = 0
                except:print "File Name Error\n\nPlease try again"
    def create_and_run(self):
        self.program = json.loads(self.program_file.read())
        self.CPU = CPU.CPU(self.program)
        print "\n\nCPU object created\n\n"
        go = str(raw_input("Press enter to begin\n\n"))

        self.CPU.run()


program = Program()
program.create_and_run()
go = raw_input("Press enter to close")