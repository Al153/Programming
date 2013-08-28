import random



def gen_rotor(length):
    sequence = []
    for i in range (length):
        r = random.randint(0,1)
        sequence.append(r)
    return sequence




print gen_rotor(547)




