cmake_minimum_required(VERSION 3.7)
project(10_2_IMD_Values_and_reg_optimisation)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        ALU.h
        CPU.c
        execution.h
        hardDisk.h
        io.h
        memory_access.h
        operation_functions.h
        register_access.h
        timing.h)

add_executable(10_2_IMD_Values_and_reg_optimisation ${SOURCE_FILES})