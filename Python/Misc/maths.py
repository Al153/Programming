pi=3.1415926535
from math import *
n=2
operation = "go"
square = 1
circle = 2
elipse = 3
rectangle = 4
while operation != "stop":
    operation = (input("which shape do you want to find the area of? "))
    if operation == 1:
        print("area of a square")

        sidelength=float(input("side length = "))
        a = sidelength**2
        print("area = "+str(a))

    elif operation == 2:
        print("area of a circle")
        r = float(input("radius ="))
        a = pi*r**2
        print("area = "+str(a))

    elif operation == 3:
        
        print("area of an elipse")

        a=float(input("major radius A = "))
        b=float(input("maor radius B = "))
        area = pi*a*b
        print("area = "+str(area))
    elif operation == 4:
        print "area of a rectangle"
        a = float(input("side length a = "))
        b = float(input("side lengt b = "))
        area = a * b
        print ("area = " +str(area))
        


      
