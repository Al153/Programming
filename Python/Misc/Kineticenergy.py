print ("this program calculates the kinetic energy of an object")
m_string=input("Enter object's mass in kg")
m=float(m_string)
v_string=input("enter the object's speed in M/s")
v=float(v_string)

e=0.5*m*v**2

print("the object has "+str(e)+"joules of kinetic energy")

