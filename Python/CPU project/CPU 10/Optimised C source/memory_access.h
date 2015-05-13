//________________ memory access functions ____________________
#define MEMORY_SIZE 67108864
#define MEMORY_LIMIT 67108863
#include <stdint.h>

unsigned int bswap_32(unsigned int a){
	return ((a>>24)&0xff) | // move byte 3 to byte 0
                    ((a<<8)&0xff0000) | // move byte 1 to byte 2
                    ((a>>8)&0xff00) | // move byte 2 to byte 1
                    ((a<<24)&0xff000000 );// byte 0 to byte 3
}

unsigned short bswap_16(unsigned short a){
	return ((a&0xff)<<8)|((a&0xff00)>>8);


}


void store_memory(unsigned int addr,unsigned int data,unsigned char *MEMORY){
	unsigned char data_bytes[4];
	unsigned int *int_MEM = MEMORY + addr;
	if (addr+3>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
	}
	*int_MEM = bswap_32(data);
}

void store_word_memory(unsigned int addr,unsigned int data, unsigned char *MEMORY){
	unsigned short *word_MEM = MEMORY + addr;
	if (addr+1>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
	}
	*word_MEM = bswap_16((unsigned short) data);
}

void store_byte_memory(unsigned int addr, unsigned int data, unsigned char *MEMORY){
	if (addr>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
	}
	MEMORY[addr&MEMORY_LIMIT] = (unsigned char)data&255;
};




unsigned int read_memory(unsigned int addr, unsigned char *MEMORY){
	//printf("%u : ", MEMORY);
	//printf("%u : ",addr);
	unsigned int *int_MEM = MEMORY + addr;
	if (addr+3>MEMORY_LIMIT){
		printf("ADDRESS OVERFLOW: %u\n",addr);
	}
	//printf("%u\n",*int_MEM);
	return bswap_32(*int_MEM);
}

unsigned int read_word_memory(unsigned int addr, unsigned char *MEMORY){
	unsigned short *word_MEM = MEMORY + addr;
	return bswap_16((unsigned int) *word_MEM);
}

unsigned int read_byte_memory(unsigned int addr, unsigned char *MEMORY){
	return (unsigned int) MEMORY[addr&MEMORY_LIMIT]; 
}
