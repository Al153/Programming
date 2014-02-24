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

#def parse(string):
#
#    elements = find_elements(string)
#    print elements
#    if len(elements) == 3: #composite (sum, product etc)
#        if elements[1] == "+":
#            return sum(parse(elements[0]),parse(elements[2]))
#        elif elements[1] == "-":
#            return subtract(parse(elements[0]),parse(elements[2]))
#        elif elements[1] == "*":
#            return product(parse(elements[0]),parse(elements[2]))
#        elif elements[1] == "/":
#            return quotient(parse(elements[0]),parse(elements[2]))
#
#
#    else: #base function
#        if " " in elements[0]: #chain function
#
#            pass
#        else:
#            if elements[0] == "sin(x)":
#                return sin()
#            elif elements[0] == "cos(x)":
#                return cos()
#            elif elements[0][:4] == "log":
#                coefficient = 1
#
#
#
#def find_elements(string):
#    if string[0] == "(": #if string is composite:
#        bracket_count = 0
#        element = ''
#        elements = []
#        for char in string:
#            if char == "(": #opening of new element
#                bracket_count += 1
#                element += char
#
#            elif char == ")": #closing of element
#                bracket_count -= 1
#                element += char
#
#            elif char == " " and bracket_count == 0: #if space between elements
#                elements.append(element)
#                element = ''
#
#            else:
#                element += char
#
#        elements.append(element) #catch last element
#
#        return elements
#
#    else: #if string is just one element
#        return [string]
    

def differentiate(f): #differentiate f
    pointer = lookup_list.index(f) #finds the parent object of the function
    to_differentiate = function_list[pointer]  #creates a direct pointer to function

    if to_differentiate.type == "sum_function":
        return sum(
            differentiate(to_differentiate.f),
            differentiate(to_differentiate.g)
            )

    elif to_differentiate.type == "subtract_function":
        return sum(
            differentiate(to_differentiate.f),
            differentiate(to_differentiate.g)
            )

    elif to_differentiate.type == "product_function":

        return sum( #performs product_function rule
            product(differentiate(to_differentiate.f),to_differentiate.g),
            product(to_differentiate.f,differentiate(to_differentiate.g))
            )

    elif to_differentiate.type == "quotient_function":
        return quotient(
            subtract(
                product(differentiate(to_differentiate.f),to_differentiate.g),
                product(to_differentiate.f,differentiate(to_differentiate.g))
                ),
            product(to_differentiate.g,to_differentiate.g)
            )

    elif to_differentiate.type == "chain_function":
        return product( #h(x) = f(g(x)), h'(x) =  f'(g(x)) * g'(x) 
            chain(differentiate(to_differentiate.f),to_differentiate.g),
            differentiate(to_differentiate.g)
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

def deparse(function):
    """Convert a function to an equation string"""
    pointer = lookup_list.index(function) #finds the parent object of the function
    to_deparse = function_list[pointer]  #creates a direct pointer to function

    if to_deparse.type == "sum_function":
        return "("+deparse(to_deparse.f)+" + "+deparse(to_deparse.g) + ")"

    if to_deparse.type == "subtract_function":
        return "("+deparse(to_deparse.f)+" - "+deparse(to_deparse.g) + ")"

    if to_deparse.type == "product_function":
        return "("+deparse(to_deparse.f)+" * "+deparse(to_deparse.g) + ")"

    if to_deparse.type == "quotient_function":
        return "("+deparse(to_deparse.f)+" * "+deparse(to_deparse.g) + ")"

    if to_deparse.type == "chain_function":
        f = to_deparse.f
        g = to_deparse.g
        deparsed_g = deparse(g)
        return deparse(f).replace("x",deparsed_g) 


    if to_deparse.type == "polynomial_function":
        output_string = ''

        for power in to_deparse.trans_dict:
            if to_deparse.trans_dict[power] == 0:
                pass
            else:
                if to_deparse.trans_dict[power] == 1:
                    coefficient = ''
                elif to_deparse.trans_dict[power] == -1:
                    coefficient = '-'
                else: 
                    coefficient = str(to_deparse.trans_dict[power])

                if power == 0:
                    output_string += coefficient
                elif power == 1:
                    output_string += coefficient+"x"
                else:
                    output_string += coefficient+"x^"+str(power)
            
        return output_string
    if to_deparse.type == "exponential_function":
        a,b,c = to_deparse.base_coefficient,to_deparse.base,to_deparse.xcoefficient
        if b == math.e:
            return str(a)+"*"+"e^"+str(c)+"x"
        else:
            return str(a)+ "*" + str(b) + "^" + str(c)
    if to_deparse.type == "log_function":
        coefficient,N = to_deparse.coefficient,to_deparse.base
        if N == math.e:
            return str(coefficient)+"ln(x)"
        else:
            return str(coefficient)+"log"+ str(N)+"(x)"
    if to_deparse.type == "sin_function":
        return "sin(x)"
    if to_deparse.type == "cos_function":
        return "cos(x)"


f = chain(exponential(1,math.e,1),sin())

g = differentiate(f)
h = differentiate(g)


print "f(x) =", deparse(f)
print "\nf'(x) = ", deparse(g)
print "\nf''(x) = ", deparse(h)

print  "\n\n"
X = []
fx = []
gx = []
for x in xrange(1000):
    X.append(x/100.0)

    fx.append(f(x/100.0))
#   gx.append(g(x/100.0))
    gx.append(h(x/100.0))
    #print "x = ", x/100.0, "   f(x) = ", f(x/100.0), "   g(x) = ",g(x/100.0)



import matplotlib.pyplot as plt
import DiscreteFourierTransform

dx = DiscreteFourierTransform.transform(fx)
dxreal = []
dximag = []
for y in dx:
    dxreal.append((y/100).real)
    dximag.append((y/100).imag)

plt.legend(["y = f''(x)  " +  deparse(f), "y = real(DFT(f(x)))","y = imag(DFT(f(x)))"], loc = 'upper left')



fig = plt.figure()
fig.suptitle('f,f'', & dft(f)', fontsize=14, fontweight='bold')

ax = fig.add_subplot(111)
#fig.subplots_adjust(top=0.85)
ax.set_title('f(x) = e^sin(x)')

ax.set_xlabel('x')
ax.set_ylabel('y')

ax.plot(X,fx)
ax.plot(X,gx)
ax.plot(X,dxreal)
ax.plot(X,dximag)
ax.legend(["y = f(x)", "y = f''(x)  ", "y = real(DFT(f(x)))","y = imag(DFT(f(x)))"], loc = 'upper left')


plt.show()