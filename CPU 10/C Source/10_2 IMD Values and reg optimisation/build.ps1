param([String] $mode="real", [String] $pFile='".\c machine code\benchmark2.cml"')

    if ($mode -eq "test"){
        gcc -O3 "C:\dev\Programming\CPU 10\C Source\10_2 IMD Values and reg optimisation\cpu.c" -o .\CEmuTest.exe -std=c99    #(for testing)
    } elseif ($mode -eq "profile"){
        gcc -O3 -pg "C:\dev\Programming\CPU 10\C Source\10_2 IMD Values and reg optimisation\cpu.c" -o .\CEmuProf.exe -std=c99 
        & .\CEmuProf.exe $pFile
        gprof CEmuProf.exe gmon.out > analysis.txt
    } else {
        gcc -Wall -O3 "C:\dev\Programming\CPU 10\C Source\10_2 IMD Values and reg optimisation\CPU.c" -o .\CEmu.exe -std=c99        # (for real)
    }
    



# to do profiling:
# 
# gcc -O3 -pg "C Source\IMD Values and reg optimisation" -o CEmuTest.exe
 # then run the emulator
# gprof CEmuTest.exe gmon.out > analysis.txt