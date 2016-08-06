//________________ memory access functions ____________________
#define MEMORY_SIZE 67108864  //26bits of address space
#define MEMORY_LIMIT 67108863
#include <stdint.h>

unsigned int bswap_32(unsigned int a){ //swaps from little endian to big endian and vice versa
	return ((a>>24)&0xff) | // move byte 3 to byte 0
                    ((a<<8)&0xff0000) | // move byte 1 to byte 2
                    ((a>>8)&0xff00) | // move byte 2 to byte 1
                    ((a<<24)&0xff000000 );// byte 0 to byte 3
}

unsigned short bswap_16(unsigned short a){ //swaps from little endian to big endian and vice versa
	return ((a&0xff)<<8)|((a&0xff00)>>8);
}


void store_memory(unsigned int addr,unsigned int data,unsigned char *MEMORY, char useIMD){
	if (useIMD) return;
	unsigned int *int_MEM =(unsigned int *)(MEMORY + addr);;
	if (addr+3>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	*int_MEM = bswap_32(data);
}

void store_word_memory(unsigned int addr,unsigned int data, unsigned char *MEMORY, char useIMD){
	if (useIMD) return;
	unsigned short *word_MEM = (unsigned short *)(MEMORY + addr);;
	if (addr+1>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	*word_MEM = bswap_16((unsigned short) data);
}

void store_byte_memory(unsigned int addr, unsigned int data, unsigned char *MEMORY, char useIMD){
	if (useIMD) return;
	if (addr>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	MEMORY[addr&MEMORY_LIMIT] = (unsigned char)data&255;
};




unsigned int read_memory(unsigned int addr, unsigned char *MEMORY, char useIMD){ //reads an int from memory
	if (useIMD) return addr;
	unsigned int *int_MEM = (unsigned int *)(MEMORY + addr);
	if (addr+3>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	return bswap_32(*int_MEM);
}

unsigned int read_word_memory(unsigned int addr, unsigned char *MEMORY, char useIMD){ //reads a 16 bit word from memory
	if (useIMD) return addr;
	unsigned short *word_MEM = (unsigned short *)(MEMORY + addr);
	if (addr+1>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	return bswap_16((unsigned int) *word_MEM);
}

unsigned int read_byte_memory(unsigned int addr, unsigned char *MEMORY, char useIMD){ //reads an 8 bit byte from memory
	if (useIMD) return addr;
	if (addr>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	return (unsigned int) MEMORY[addr]; 
}
