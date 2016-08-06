//////////////////////////////////////////////////
//												//
// Compile at -O3 for 5x speed up 				//
//												//
//////////////////////////////////////////////////
#pragma GCC diagnostic ignored "-Wpedantic"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/time.h>

#include "memory_access.h"
#include "register_access.h"
#include "ALU.h"
#include "io.h"
#include "execution.h"
#include "hardDisk.h"
#include "operation functions.h"


//C implementation of my CPU 10
// This version includes a hard disk and instructions for accessing it.
// It also implements immediate mode addressing - load instructions use the calculated address as the disk information
// (although in reality this is slower than preloading variables with the values due to the host's branch prediction faults )

int step(unsigned int *registers, unsigned char *MEMORY){   //returns halt, carries out game logic
	register unsigned int instruction = fetch_instruction(registers,MEMORY);
	register unsigned char 	instr = ((instruction&0x7f000000)>>24);
	register unsigned char useIMD = ((instruction&0x80000000)>>24);
	register unsigned char 	reg1 =  ((instruction&0x000f0000)>>16); 
	register unsigned char 	reg2 =  ((instruction&0x00000f00)>>8);
	register unsigned char 	conditional = instruction&0xff;

	return execute(instr,reg1,reg2,conditional,registers,MEMORY,useIMD);   //returned value is 1 if needs to return, otherwise false
}

int debug_step(unsigned int *registers, unsigned char *MEMORY){   //returns halt? values, carries out logic
	unsigned int  	instruction = fetch_instruction(registers,MEMORY); 
	register unsigned char 	instr = ((instruction&0x7f000000)>>24);
	register unsigned char useIMD = ((instruction&0x80000000)>>24);
	register unsigned char 	reg1 =  ((instruction&0x000f0000)>>16); 
	register unsigned char 	reg2 =  ((instruction&0x00000f00)>>8);
	register unsigned char 	conditional = instruction&0xff;

	printf("\n%u|  ",registers[4]-8);  //prints out runtime data
	printf("%i   ", (int) instr);
	printf("%i   ", (int) reg1);
	printf("%i   ", (int) reg2);
	printf("%i   ", (int) conditional);

	printf(" address = %u", read_memory(registers[4]-4,MEMORY,0));
	getchar();

	int result =  execute(instr,reg1,reg2,conditional,registers,MEMORY,useIMD);   //returned value is 1 if needs to return, otherwise false
	printf("gp0 = %u\n", registers[8]);
	return result;
}

void init_memory(unsigned char *MEMORY, char *name){
	//extracts  program from file and constucts memory using it
	char state;   //uses a state machine to switch between address and data
	unsigned int address;
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
			store_byte_memory(address,chr,MEMORY,0);
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

void dumpMemory(unsigned char *MEMORY){
	int i;
	for (i = 0; i < 32;i++){printf("%u\t", (unsigned int)MEMORY[i]);}
}

int main(int argc, char *argv[]){
	static unsigned char MEMORY[MEMORY_SIZE] = {0}; 					//setting up memory and registers
	unsigned int registers[16] = {0,1};
	int halt = 0;
	long count = 0;

	//______ Timing variables _____
	struct timeval begin;
	struct timeval end;
	long seconds_elapsed;
	long useconds_elapsed;
	double time_elapsed;
	double instructions_per_second;

	printf("initialising memory\n");
	init_memory(MEMORY,argv[1]);

	if (argc < 4){
		if (argc == 3){ // needs to load hard disk
			HD_LOADED = load_HD(argv[2]);
		} else { // no hard disk
			HD_LOADED = 0;
			HD_FILE = NULL;
		}
		printf("______________________ running ______________________\n");
		gettimeofday(&begin,NULL); //uses this to work out running time
		while (halt == 0){
			count += 1; 					//counts number of instructions executed
			halt = step(registers,MEMORY); //executes 1 instruction
		}
		gettimeofday(&end,NULL);

		seconds_elapsed = (end.tv_sec - begin.tv_sec); //calculates running time
		useconds_elapsed = end.tv_usec - begin.tv_usec;  //microseconds
		time_elapsed = (double)seconds_elapsed + ((double)useconds_elapsed)/1000000;
		instructions_per_second = count/time_elapsed;  //speed of operation
		printf("\n______________________ Execution halted ______________________\n");
		printf("executed %u instructions in ",count);
		printf("%lf seconds ", time_elapsed);
		if (time_elapsed > 0.0001){
			printf("at %lf ips\n", instructions_per_second);
		}
	} else { //does a debug run - pauses between instructions etc
		HD_LOADED = load_HD(argv[3]); 
		if (argc == 4){	

			printf("______________________ running Debug ______________________\n");
			gettimeofday(&begin,NULL);
			while (halt == 0){
				count += 1;
				halt = debug_step(registers,MEMORY);
			}
			gettimeofday(&end,NULL);	

			seconds_elapsed = (end.tv_sec - begin.tv_sec); //(double) (end.tv_usec - begin.tv_usec)/1000000 + 
			useconds_elapsed = end.tv_usec - begin.tv_usec;
			time_elapsed = (double)seconds_elapsed + ((double)useconds_elapsed)/1000000;
			instructions_per_second = count/time_elapsed; 
			printf("\n______________________ Execution halted ______________________\n");
			printf("executed %u instructions in ",count);
			printf("%lf seconds ", time_elapsed);
			if (time_elapsed > 0.0001){
				printf("at %lf ips\n", instructions_per_second);
				}
		} else {
			int debug_threshold = atoi(argv[4]); //if a debug threshold of n is set, then executes n instructions before going into debug mode

			printf("______________________ running Debug ______________________\n");
			gettimeofday(&begin,NULL);
			while (halt == 0 && count < debug_threshold){
				count += 1;
				halt = step(registers,MEMORY);
			}
			while (halt == 0){
				count += 1;
				halt = debug_step(registers,MEMORY);
			}
			gettimeofday(&end,NULL);	

			seconds_elapsed = (end.tv_sec - begin.tv_sec);
			useconds_elapsed = end.tv_usec - begin.tv_usec;
			time_elapsed = (double)seconds_elapsed + ((double)useconds_elapsed)/1000000;
			instructions_per_second = count/time_elapsed; 
			printf("\n______________________ Execution halted ______________________\n");
			printf("executed %u instructions in ",count);
			printf("%lf seconds ", time_elapsed);
			if (time_elapsed > 0.0001){
				printf("at %lf ips\n", instructions_per_second);
				}
		}
	}
	fclose(HD_FILE);
	return 0;
}