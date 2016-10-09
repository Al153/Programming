//////////////////////////////////////////////////
//												//
// Compile at -O3 for 5x speed up 				//
//												//
//////////////////////////////////////////////////
#pragma GCC diagnostic ignored "-Wpedantic"

// Declaring frequently used values globally to avoid passing them
// may make them register values

#define MEMORY_SIZE 67108864  //26bits of address space for this implementation
#define MEMORY_LIMIT 67108863
unsigned int instruction;
unsigned char opcode;
unsigned char reg1;
unsigned char reg2;
unsigned char conditional;
unsigned int address;
unsigned char useImmediate;
unsigned char indexScale;
unsigned char signedMode;

unsigned char MEMORY[MEMORY_SIZE] = {0}; 					//setting up memory and registers
unsigned int registers[16] = {0,1};

#include <stdio.h>
#include <stdlib.h>


#include <sys/time.h>

#include "memory_access.h"
#include "register_access.h"
#include "ALU.h"
#include "io.h"
#include "execution.h"
#include "hardDisk.h"
#include "operation functions.h"


//C implementation of my CPU 10

int step(void){   //returns halt, carries out game logic
	fetch_instruction();
	opcode = (instruction&0x3f000000)>>24;
	reg1 =  ((instruction&0x000f0000)>>16); 
	reg2 =  ((instruction&0x00000f00)>>8);
	conditional = instruction&0xff;
	useImmediate = instruction>>31; // top bit
	indexScale = (instruction&0x00f00000)>>20;
	signedMode = (instruction>>30)&1;

	indexScale = indexScale?indexScale:1;
	return execute();   //returned value is 1 if needs to return, otherwise false
}

int debug_step(void){   //returns halt? values, carries out logic
	fetch_instruction();
	opcode = (instruction&0x3f000000)>>24;
	reg1 =  ((instruction&0x000f0000)>>16); 
	reg2 =  ((instruction&0x00000f00)>>8);
	conditional = instruction&0xff;
	useImmediate = instruction>>31; // top bit
	indexScale = (instruction&0x00f00000)>>20;
	signedMode = (instruction>>30)&1;
	indexScale = indexScale?indexScale:1;

	printf("\n%u|  ",registers[4]-8);  //prints out runtime data
	printf("%i   ", (int) opcode);
	printf("%i   ", (int) reg1);
	printf("%i   ", (int) reg2);
	printf("%i   ", (int) conditional);
	printf("%s\n", signedMode ? "signed" : "unsigned");

	printf(" address = %u", read_step_memory(registers[4]-4));
	if (useImmediate){
		printf("I  ");
	} else printf("A  ");
	getchar();

	int result =  execute();   //returned value is 1 if needs to return, otherwise false
	printf("gp0 = %u\n", registers[8]);
	return result;
}

void init_memory(char *name){
	//extracts  program from file and constucts memory using it
	char state;   //uses a state machine to switch between address and data
	unsigned char chr; 	//exctracted character
	FILE *fp = fopen(name, "rb");  //get file
	if (fp == NULL){ 				//check valid file
		printf("ERROR: Failed to open file \"%s\"\n",name);
		exit(1);
	}
	//file in format addr,addr,addr,addr,data,stop?
	state = 0;
	while (state != 6){   //parsing state machine, state of 6 ==> halt;
		fread(&chr,1,1,fp);
		if (state == 0){
			state = 1;
			address = chr;
		} else if (state == 1){
			state = 2;
			address = address << 8;
			address = address + chr;
		} else if (state == 2){
			state = 3;
			address = address << 8;
			address = address + chr;
		} else if (state == 3){
			state = 4;
			address = address << 8;
			address = address + chr;
		} else if (state == 4){
			state = 5;
			store_byte_memory(chr);
		} else if (state == 5){ //sixth byte is 1 for an EOF or 0 for continue
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
	int i;
	for (i = 0; i < 32;i++){printf("%u\t", (unsigned int)MEMORY[i]);}
}

int main(int argc, char *argv[]){
	int halt = 0;
	long count = 0;

	printf("initialising memory\n");
	init_memory(argv[1]);

	if (argc < 4){
		start_running();
		if (argc == 3){ // needs to load hard disk
			HD_LOADED = load_HD(argv[2]);
		} else { // no hard disk
			HD_LOADED = 0;
			HD_FILE = NULL;
		}

		while (halt == 0){
			count += 1; 					//counts number of instructions executed
			halt = step(); //executes 1 instruction
		}


		
	} else { //does a debug run - pauses between instructions etc
		HD_LOADED = load_HD(argv[3]);
		start_running_debug();
		if (argc == 4){	
			while (halt == 0){
				count += 1;
				halt = debug_step();
			}
		} else {
			int debug_threshold = atoi(argv[4]); //if a debug threshold of n is set, then executes n instructions before going into debug mode
			while (halt == 0 && count < debug_threshold){
				count += 1;
				halt = step();
			}
			while (halt == 0){
				count += 1;
				halt = debug_step();
			}
		}
	}
	get_running_stats();
	fclose(HD_FILE);
	return 0;
}