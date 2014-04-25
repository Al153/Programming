Array list



#_____________ Heapsort _______________
def i gp0
def A gp1
def l gp2
def r gp3
def largest gp4
def index gp5
def parent gp6
def flags_temp
# . . . i A ==> . . . A

Pop A %Heapify
Pop i 
Call Heapsort.left
Call Heapsort.right









Load l @2 %Heapsort.left
MUL l i
Return

Load r @2 %Heapsort.right
MUL r i
ADD r One
Return

Move i parent %Heapsort.parent
SHR parent One
Return