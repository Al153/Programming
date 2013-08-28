# respond to a key without the need to press enter
import Tkinter as tk

class Input:
    def __init__(self):
        self.root = root = tk.Tk()
        self.root.bind_all('<Key>', self.keypress)
        # don't show the tk window
        self.root.withdraw()
        self.addr = 0

    def keypress(self,event):
        if event.char:
            x = event.char
        
            try:
                CPU.feed(ord(x),self.addr)
            except TypeError:
                CPU.feed(32,self.addr)
            #self.root.quit()
        else: CPU.feed(0,self.addr)
    def run(self):
        self.root.update()

class CPU:
    def feed(self,value,addr):
        print value, addr


CPU = CPU()
Input = Input()
#print "Begin"
for i in xrange(10000000):
    Input.run()
    if i%1000000 == 0:
        print i,"iterations"
Input.root.destroy()


