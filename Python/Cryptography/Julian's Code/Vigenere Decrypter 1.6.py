import time
def extspc(itext):
    otext = []
    for char in itext:
        otext.append(char)
    spccnt = otext.count(" ")
    posspc = []
    for itertn in range(otext.count(" ")):
        posspc.append(otext.index(" "))
        otext.remove(" ")
    return [otext, posspc]

def arrtxt(itext,key):
    otext = []
    for char in itext:
        otext.append(ord(char))
    if len(itext) % len(key) != 0:
        otext += -len(itext) % len(key) *[0]
    return otext

def mkmtrx(txt,key):
    hgt = len(txt) // len(key)
    if len(txt) % len(key) != 0:
        hgt += 1
    mtx = [hgt*[0] for var in range(len(key))]
    for col in range(hgt):
        for row in range(len(key)):
            mtx[row][col] = txt.pop(0)
    return mtx

def ncrypt(matrix,key):
    kcrypt = []
    for char in key:
        kcrypt.append(ord(char)-97)
    for row in range(len(key)):
        for col in range(len(matrix[0])):
            matrix[row][col] += kcrypt[row]
            if matrix[row][col] > 122:
                matrix[row][col] -= 26
    return matrix

def dcrypt(matrix,key):
    kcrypt = []
    for char in key:
        kcrypt.append(ord(char)-97)
    for row in range(len(key)):
        for col in range(len(matrix[0])):
            matrix[row][col] -= kcrypt[row]
            if matrix[row][col] < 97:
                matrix[row][col] += 26
    return matrix

def revarr(matrix):
    txt = []
    for col in range(len(matrix[0])):
        for row in range(len(matrix)):
            txt.append(matrix[row].pop(0))
    return txt

def cutarr(arr,txt):
    for cnt in range(len(arr) - len(txt)):
        arr.pop()
    return arr

def insspc(arr,spc):
    while len(spc) != 0:
        arr.insert(spc.pop(),32)
    str = ""
    for ltr in arr:
        str = str + chr(ltr)
    return str

xcrypt = raw_input("Do you want to encrypt [n] or decrypt [d] ? ")
cprtxt = raw_input("Enter text: ")
key = raw_input("Enter key: ")
start = time.time()
ctmtrx = mkmtrx(arrtxt(extspc(cprtxt).pop(0),key),key)
if xcrypt == "n":
    ptmtrx = ncrypt(ctmtrx,key)
elif xcrypt == "d":
    ptmtrx = dcrypt(ctmtrx,key)
txtarr = revarr(ptmtrx)
trcarr = cutarr(txtarr,extspc(cprtxt).pop(0))
plntxt = insspc(trcarr,extspc(cprtxt).pop())
end = time.time()
print end - start1
print plntxt
