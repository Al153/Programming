import time

def tobase26(integer):
    if integer == 0:
        return [0]
    answer = []
    while integer > 0:
        answer.append(integer%26)
        integer = integer//26
    if len(answer)>1:
        answer.reverse()
    return answer

while True:
    try:
        keylength = int(raw_input("Enter the keylength: "))
        break
    except ValueError:
        pass
start = time.time()
key = 0
key_array = []
while key < 26**keylength:
    key_array.append(key)
    key += 1
toprint = ''
for i in key_array:
    toprint += str(tobase26(i))
print toprint
print time.time()-start
