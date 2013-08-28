'Busy beaver'

universe = ['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.',
            '.','.','.','.','.']
state = 'a'
done = 0
pointer = 12

while not done:
    high_light = universe[pointer]
    if state == 'a':
        if high_light == '1':
            universe[pointer] = '.'
            pointer += 1
            state = 'b'
        else:
            universe[pointer] = '1'
            pointer -= 1
            state = 'a'
    elif state == 'b':
        if high_light == '1':
            universe[pointer] = '.'
            pointer -= 1
            state = 'a'
        else:
            universe [pointer] = '1'
            pointer += 1
            state = 'c'
    else:
        if high_light == '1':
            universe[pointer] = '1'
            pointer -= 1
            state = 'b'
        else:
            done = 1
    toprint = ' '.join(universe)
    print toprint
    pointer = pointer%22
