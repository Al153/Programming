from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("CPU", ["CPU.pyx"])]
)
setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("memory", ["memory.pyx"])]
)

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("ALU", ["ALU.pyx"])]
)

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("register", ["register.pyx"])]
)

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("stack", ["stack.pyx"])]
)
setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("ProgramCounter", ["ProgramCounter.pyx"])]
)
setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("OutputUnit", ["OutputUnit.pyx"])]
)