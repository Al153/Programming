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
#ax.plot(X,dxreal)
#ax.plot(X,dximag)
ax.legend(["y = f(x)", "y = f''(x)  ", "y = real(DFT(f(x)))","y = imag(DFT(f(x)))"], loc = 'upper left')


plt.show()