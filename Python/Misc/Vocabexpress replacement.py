class system:
    def __init__(self):

    def createUser(self)
        name = str(raw_input("Please enter your name "))
        password = str(raw_input("Please enter your password "))
        password_check = str(raw_input("Please retype your password "))
        done = 0
        while not done:
            if password != password_check:
                print "Passwords do not match"
                password = str(raw_input("Please enter your password "))
                password_check = str(raw_input("Please retype your password "))
            else: done = 1
        

class profile:
    def __init__(self,name,password):
        self.name =
