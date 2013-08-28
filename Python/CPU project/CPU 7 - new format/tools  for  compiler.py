class Packager:
    def __init__(self,hex_code):
        self.string = ''
        for code in hex_code:
            self.string += code
    def write_to_file(self):
        file_name = raw_input("Please enter a file name (without .txt):\n")
        file_name += ".txt"
        program_file = open(file_name,w)
        programfile.write(self.string)
        program_file.close()

class simple_compiler:
    def __init__(self,inCode):
        self.code = incode


    def chop(self):
        self.chopped_code = []
        section = []
        for i in self.code:
            if i == ";":
                self.chopped_code.append(section)
                self.section = []
            else:
                if i != "/t" and i != "\n":
                    self.section.append(i)
    def remove_comments(self):
        error = 1
        while error:
            try:
                for statement in self.chopped_code:

                error = 0
            except: self.chop()
