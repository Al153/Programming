import math
import matplotlib.pyplot as plt
from Functions import *
def transform(input_array):
    output_array = [] #an output array 
    N = len(input_array) #size of input array
    omega = math.e**(-2*complex(0,1)*math.pi/N) #used to calculate root of unity  
    for k in xrange(N):
        output_array.append(0)
        for n in xrange(N):
            root_of_unity = omega**(k*n)
            output_array[k]+=input_array[n]*root_of_unity
    return output_array

def sin(n):
    output_array = []
    step = 2*math.pi/n
    theta = 0
    theta_array = []
    for i in xrange(n):
        theta_array += [theta]
        output_array.append(math.sin(theta))
        theta += step

    return theta_array,output_array

def real_and_imag(array):
    reals = []
    imaginaries = []
    for complex_number in array:
        reals.append(complex_number.real)
        imaginaries.append(complex_number.imag)
    return reals,imaginaries

def nCr(n,r):
    n,r = int(n),int(r)
    end = n-r
    result = 1
    while n > end:
        result *= n
        n -= 1
    result = result/math.factorial(r)
    return result
  
def binomial(n,p,q):
    x = range(0,n+1,1)
    output = []
    for r in x:
        output.append(nCr(n,r)*(p**r)*(q**(n-r)))
    return x,output

x = [
    0.17678,
    0.70711,
    0.82322,
    0.95711,
    -0.17678,
    -0.70811,
    -0.82322,
    -0.95711
    ]


f = function({3:1, 2:-3, 1:2})
print f
x,fx = [],[]
for i in xrange(21):
    x.append(i/10.0)
    fx.append(f(i/10.0))
#x,fx = binomial(10,5,5)
plt.plot(x,fx)

dft = transform(fx)
real = real_and_imag(dft)[0]
imaginary = real_and_imag(dft)[1]


plt.plot(x,real, "rx", linewidth = 0)
plt.plot(x,imaginary, "b+", linewidth = 0)

plt.legend(["y = f(x)","y = real(DFT(f(x)))","y = imag(DFT(f(x))) "], loc = 'upper left')

plt.show()