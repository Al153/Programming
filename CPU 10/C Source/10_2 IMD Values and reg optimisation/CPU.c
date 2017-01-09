//////////////////////////////////////////////////
//												//
// Compile at -O3 for 5x speed up 				//
//												//
//////////////////////////////////////////////////
// #pragma GCC diagnostic ignored "-Wpedantic"


//C implementation of my CPU 10


#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>

// Declaring frequently used values globally to avoid passing them
// may make them register values

#define MEMORY_SIZE 67108864  //26bits of address space for this implementation
#define MEMORY_LIMIT 67108863
uint32_t instruction;
uint8_t opcode;
uint8_t reg1;
uint8_t reg2;
uint8_t conditional;
uint32_t address;
uint8_t useImmediate;

uint8_t MEMORY[MEMORY_SIZE] = {0}; 					//setting up memory and registers
uint32_t registers[16] = {0,1};


#include "memory_access.h"
#include "register_access.h"
#include "ALU.h"
#include "io.h"
#include "execution.h"
#include "hardDisk.h"
#include "operation functions.h"
#include "timing.h"





inline void decode(void){
	opcode = (instruction&0x7f000000)>>24;
	reg1 =  ((instruction&0x000f0000)>>16); 
	reg2 =  ((instruction&0x00000f00)>>8);
	conditional = instruction&0xff;
	useImmediate = instruction>>31; // top bit
}

inline uint32_t step(void){   //returns halt, carries out logic
	fetch_instruction();
	decode();
	return execute();   //returned value is 1 if needs to return, otherwise false
}

uint32_t debug_step(void){   //returns halt? values, carries out logic
	fetch_instruction();
	decode();

	printf("\n%u|  ",registers[4]-8);  //prints out runtime data
	printf("%i   ", (uint32_t) opcode);
	printf("%i   ", (uint32_t) reg1);
	printf("%i   ", (uint32_t) reg2);
	printf("%i   ", (uint32_t) conditional);

	printf(" address = %u", read_step_memory(registers[4]-4));
	if (useImmediate){
		printf("I  ");
	} else printf("A  ");
	getchar();

	uint32_t result =  execute();   //returned value is 1 if needs to return, otherwise false
	printf("gp0 = %u\n", registers[8]);
	return result;
}

void init_memory(char *name){
	//extracts  program from file and constucts memory using it
	char state;   //uses a state machine to switch between address and data
	uint8_t chr; 	//exctracted character
	FILE *fp = fopen(name, "rb");  //get file
	if (fp == NULL){ 				//check valid file
		printf("ERROR: Failed to open file \"%s\"\n",name);
		exit(1);
	}
	//file in format addr,addr,addr,addr,data,stop?
	state = 0;
	while (state != 6){   //parsing state machine, state of 6 ==> halt;
		switch(state){
			case 0:
				fread(&chr,1,1,fp);
				state = 1;
				address = chr;
			case 1:
				fread(&chr,1,1,fp);
				state = 2;
				address = address << 8;
				address = address + chr;
			case 2:
				fread(&chr,1,1,fp);
				state = 3;
				address = address << 8;
				address = address + chr;
			case 3:
				fread(&chr,1,1,fp);
				state = 4;
				address = address << 8;
				address = address + chr;
			case 4:
				fread(&chr,1,1,fp);
				state = 5;
				store_byte_memory(chr);
			case 5:	//sixth byte is 1 for an EOF or 0 for continue
				fread(&chr,1,1,fp);
				if (chr == 1){
					state = 6;
				} else if (chr == 0){
					state = 0;
				} else{
					exit(1);
				}
		}
	}
	fclose(fp);
}

void dumpMemory(void){
	uint32_t i;
	for (i = 0; i < 32;i++){printf("%u\t", (uint32_t)MEMORY[i]);}
}



int main(int argc, char *argv[]){
	uint32_t halt = 0;

	printf("initialising memory\n");
	init_memory(argv[1]);

	if (argc < 4){
		if (argc == 3){ // needs to load hard disk
			HD_LOADED = load_HD(argv[2]);
			printf("Tried to load HD.\n");
			if (HD_LOADED) {
				printf("Success\n");
			}
		} else { // no hard disk
			HD_LOADED = 0;
			HD_FILE = NULL;
		}
		doStart();
		while (halt == 0){
			count += 1; 					//counts number of instructions executed
			halt = step(); //executes 1 instruction
		}
		doEnd();
	} else { //does a debug run - pauses between instructions etc
		HD_LOADED = load_HD(argv[3]); 
		if (argc == 4){	
			doStartDebug();
			while (halt == 0){
				count += 1;
				halt = debug_step();
			}
			doEnd();
		} else {
			uint32_t debug_threshold = atoi(argv[4]); //if a debug threshold of n is set, then executes n instructions before going into debug mode
			doStartDebug();
			while (halt == 0 && count < debug_threshold){
				count += 1;
				halt = step();
			}
			while (halt == 0){
				count += 1;
				halt = debug_step();
			}
			doEnd();
		}
	}
	fclose(HD_FILE);
	return 0;
}