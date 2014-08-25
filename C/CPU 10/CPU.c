#include <stdio.h>
#include "memory_access.h"
#include "register_access.h"
#include "ALU.h"
#include "io.h"
#include "execution.h"


//C implementation of my CPU 10

int step(unsigned int *registers, unsigned char *MEMORY){   //returns halt, carries out game logic
	unsigned int instruction = 0;
	unsigned int address = 0;
	unsigned char decoded[4];

	unsigned char instr;
	unsigned char reg1;
	unsigned char reg2;
	unsigned char conditional;

	instruction = fetch_instruction(registers,MEMORY);
	address = fetch_address(registers,MEMORY);
	debug_instruction(decoded,instruction);

	instr = decoded[0];
	reg1 = decoded[1]&15;
	reg2 = decoded[2]&15;
	conditional = decoded[3];
	return execute(instr,reg1,reg2,conditional,address,registers,MEMORY);   //returned value is 1 if needs to return, otherwise false

}

int main(){
	int halt = 0;
	unsigned char MEMORY[1048576];

//set up variables
	static unsigned int registers[16] = {0,1};

	while (halt == 0){
		halt = step(registers,MEMORY);
	}
	return 0;
}






