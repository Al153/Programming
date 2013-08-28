import random
p=0
q=0
rock = 1
paper = 2
scissors = 3
i = int(input("first to? "))
while p < i and q < i:
    my_list = ["rock","paper","scissors"]
    r = random.randrange(3)
    ai = my_list[r]
    ui = int(input("rock, paper, scissors! "))
    print ("computer chose "+str(ai))
    r += 1
    if ui == 1:
            if r == 3:
                print("you won!")
                p += 1
            elif r == 2:
                print("computer won!")
                q += 1
            else:
                print("it's a draw!")
    elif ui == 2:
            if r == 1:
                print("you won! ")
                p += 1
            elif r == 3:
                print("computer won! ")
                q += 1
            else:
                print("it's a draw!")
    else:
                if r == 2:
                      print("you won!")
                      p += 1
                elif r == 1:
                    print("computer won!")
                    q += 1
                else:
                    print("it's a draw!")
    print("your score: "+str(p))
    print("computer's score: " +str(q))
if p ==  i:
    print("you win!")
else:
    print ("computer wins!")
                
