def qtl():
    while True:
        try:
            tol = int(raw_input("Enter tolerance: "))
            if tol < 1:
                print "Invalid input."
            else:
                break
        except ValueError:
            print "Invalid input."
    return tol

def arr(txt):
    arr,sym,pos = [],[],[]
    for gly in range(len(txt)):
        if 96 < ord(txt[gly]) < 123:
            arr += [ord(txt[gly])]
        elif 64 < ord(txt[gly]) < 91:
            arr += [ord(txt[gly+32])]
            sym += [128]; pos += [gly]
        else:
            sym += [ord(txt[gly])]; pos += [gly]
    return [arr,sym,pos]

def itr(arr,sft):
    mod = []
    for var in range(len(arr)):
        mod += [arr[var] + sft]
        if mod[var] > 122:
            hld = mod.pop(var) - 26
            mod.insert(var,hld)
    return mod

def txt(arr,sym,pos):
    for var in range(len(pos)):
        if sym[var] == 128:
            hld = arr.pop(pos[var]) - 32
            arr.insert(pos[var],hld)
        else:
            arr.insert(pos[var],sym[var])
    txt = ''
    for var in arr:
        txt += chr(var)
    return txt

def conchk(txt,tol):
    pos = [-1]
    for var in range(len(txt)):
        for vow in [97,101,105,111,117]:
            if txt[var] == vow:
                pos += [var]
    pos += [len(txt)]; dif,hld = [],0
    for var in range(len(pos)-1):
        dif += [pos[var+1] - pos[var] - 1]
    for vlu in dif:
        if vlu > tol:
            hld = 1
            break
    return hld

ctx = raw_input('Enter text: ')
tol = qtl()
hld = arr(ctx)
for sft in range(26):
    arr = itr(hld[0],sft)
    if conchk(arr,tol) == 0:
        print txt(arr,hld[1],hld[2])
