import math

#========================= Meta-functional classes =============================


#=============== special ============
class product_function:
    def __init__(self,f,g):
        #creates a product_function of two functions
        self.f,self.g = f,g
        self.type = "product_function"
    def function(self,x):
        return self.f(x)*self.g(x)

class quotient_function:
    def __init__(self,f,g):
        self.f,self.g = f,g
        self.type = "quotient_function"
    def function(self,x):
        return self.f(x)/float(self.g(x))

class sum_function:
    def __init__(self,f,g):
        #creates a function which is a sum_function of f and g
        self.f,self.g = f,g
        self.type = "sum_function"
        #print "creating sum_function",f,g
    def function(self,x):
        return self.f(x)+self.g(x)

class subtract_function:
    def __init__(self,f,g):
        self.f,self.g = f,g
        self.type = "subtract_function"
        #print "creating sum_function",f,g
    def function(self,x):
        return self.f(x)-self.g(x)        

class chain_function:
    def __init__(self,f,g):
        #create a function of f(g(x))
        self.f,self.g = f,g
        self.type = "chain_function"
    def function(self,x):
        return self.f(self.g(x))

#=========== Core ==============

class polynomial_function: #hidden polynomial_function class
    def __init__(self,input_dict):
        self.trans_dict = {}
        for power in input_dict:
            if input_dict[power] != 0:
                self.trans_dict[power] = input_dict[power]
        self.type = "polynomial_function"
    def function(self,x): #the function called
        result = 0
        for power in self.trans_dict:
            result += self.trans_dict[power]*(x**power)
        return result

class exponential_function: #f(x) = a*b^cx
    def __init__(self,a,b,c):
        self.base_coefficient, self.base, self.xcoefficient = a,b,c
        self.type = "exponential_function"
    def function(self,x):
        return self.base_coefficient*(self.base**(self.xcoefficient*x))

class log_function: #f(x) = logNx
    def __init__(self,coefficient,N):
        self.coefficient,self.base = coefficient, N
        self.type = "log_function"
    def function(self,x):
        return self.coefficient * math.log(x,self.base)

class sin_function:
    def __init__(self):
        self.type = "sin_function"
    def function(self,x):
        return math.sin(x)

class cos_function:
    def __init__(self):
        self.type = "cos_function"
    def function(self,x):
        return math.cos(x)

#===================================== Wrapper/constuctor functions =======================

def product(f,g):
    global function_list
    global lookup_list
    try:
        function_list.append(product_function(f,g))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(product_function(f,g))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def quotient(f,g):
    global function_list
    global lookup_list
    try:
        function_list.append(quotient_function(f,g))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(quotient_function(f,g))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def sum(f,g):
    global function_list
    global lookup_list
    try:
        function_list.append(sum_function(f,g))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(sum_function(f,g))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def subtract(f,g):
    global function_list
    global lookup_list
    try:
        function_list.append(subtract_function(f,g))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(subtract_function(f,g))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def chain(f,g):
    global function_list
    global lookup_list
    try:
        function_list.append(chain_function(f,g))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(chain_function(f,g))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def polynomial(input_dict):
    global function_list
    global lookup_list
    try:
        function_list.append(polynomial_function(input_dict))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(polynomial_function(input_dict))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def exponential(a,b,c):
    #f(x) = a*b^(c*x)
    global function_list
    global lookup_list
    try:
        function_list.append(exponential_function(a,b,c))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(exponential_function(a,b,c))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def log(coefficient,N):
    global function_list
    global lookup_list
    try:
        function_list.append(log_function(coefficient,N))
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(log_function(coefficient,N))
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def sin():
    global function_list
    global lookup_list
    try:
        function_list.append(sin_function())
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(sin_function())
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

def cos():
    global function_list
    global lookup_list
    try:
        function_list.append(cos_function())
    except NameError:
        function_list = [] #creates hidden lists
        lookup_list = []
        function_list.append(cos_function())
    pointer = len(function_list)-1
    lookup_list.append(function_list[pointer].function)
    return function_list[pointer].function

#========================= Transformation functions ===================

def differentiate(f): #differentiate f
    pointer = lookup_list.index(f) #finds the parent object of the function
    to_differentiate = function_list[pointer]  #creates a direct pointer to function

    if to_differentiate.type == "product_function":

        return sum( #performs product_function rule
            product(differentiate(to_differentiate.f),to_differentiate.g),
            product(to_differentiate.f,differentiate(to_differentiate.g))
            )


    elif to_differentiate.type == "sum_function":
        return sum(
            differentiate(to_differentiate.f),
            differentiate(to_differentiate.g)
            )

    elif to_differentiate.type == "subtract_function":
        return sum(
            differentiate(to_differentiate.f),
            differentiate(to_differentiate.g)
            )

    elif to_differentiate.type == "chain_function":
        return product( #h(x) = f(g(x)), h'(x) =  f'(g(x)) * g'(x) 
            chain(differentiate(to_differentiate.f),to_differentiate.g),
            differentiate(to_differentiate.g)
            )

    elif to_differentiate.type == "quotient_function":
        return quotient(
            subtract(
                product(differentiate(to_differentiate.f),to_differentiate.g),
                product(to_differentiate.f,differentiate(to_differentiate.g))
                ),
            product(to_differentiate.g,to_differentiate.g)
            )

    elif to_differentiate.type == "polynomial_function": #function is a polynomial_function
        dict_to_transform = to_differentiate.trans_dict
        new_dict = {}
        for power in dict_to_transform:
            coefficient = dict_to_transform[power]
            new_dict[power-1] = power*coefficient
        return polynomial(new_dict)

    elif to_differentiate.type == "exponential_function": #function is an exponential_function
        a,b,c = to_differentiate.base_coefficient,to_differentiate.base,to_differentiate.xcoefficient
        a = a*c*math.log(b) #as per chain_function rule
        return exponential(a,b,c)

    elif to_differentiate.type == "log_function":
        coefficient,N = to_differentiate.coefficient,to_differentiate.base
        new_coefficient = coefficient/math.log(N) # d/dx a logN(x) = a/ln(N)*1/x
        return polynomial({-1:new_coefficient})

    elif to_differentiate.type == "sin_function":
        return cos()

    elif to_differentiate.type =="cos_function":
        return product(polynomial({0:-1}),sin())


def parse(equation):



f = sin()
g = differentiate(f)
h = cos()

for x in xrange(1,10):
    print f(x), g(x),h(x)

