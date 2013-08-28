print("Temperature conversion")
print("to convert from celsius, type '1' into the operation picker.")
print("For conversion from fahrenheit, type '2'")
n=2
while n==2:
    op = float(input("operation: "))
    if op == 1:
               c=float(input("celsius value = "))
               f=c*9/5+32
               print(str(c)+" degrees celsius is "+str(f)+" degrees fahrenheit")
    elif op == 2:
            f=float(input("fahrenheit value = "))
            c = (f-32)*5/9
            print(str(f)+" degrees fahrenheit is "+str(c)+" degrees celsius")
    n=2
               
    
