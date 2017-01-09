//________________ memory access functions ____________________

inline uint32_t bswap_32(uint32_t a){ //swaps from little endian to big endian and vice versa
	return ((a>>24)&0xff) | // move byte 3 to byte 0
                    ((a<<8)&0xff0000) | // move byte 1 to byte 2
                    ((a>>8)&0xff00) | // move byte 2 to byte 1
                    ((a<<24)&0xff000000 );// byte 0 to byte 3
}

inline unsigned short bswap_16(unsigned short a){ //swaps from little endian to big endian and vice versa
	return ((a&0xff)<<8)|((a&0xff00)>>8);
}


void store_memory(uint32_t data){
	if (useImmediate) return;
	uint32_t *int_MEM = (uint32_t *)(MEMORY + (address&MEMORY_LIMIT));
	if (__builtin_expect(address+3>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	*int_MEM = bswap_32(data);
}

void store_word_memory(uint32_t data){
	if (useImmediate) return;
	unsigned short *word_MEM = (unsigned short *)(MEMORY + (address&MEMORY_LIMIT));
	if( __builtin_expect(address+1>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	*word_MEM = bswap_16((unsigned short) data);
}

void store_byte_memory(uint32_t data){
	if (useImmediate) return;
	if (__builtin_expect(address>MEMORY_LIMIT,0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	MEMORY[address&MEMORY_LIMIT] = (uint8_t)data&255;
};




uint32_t read_memory(void){ //reads an uint32_t from memory
	if (useImmediate) return address;
	uint32_t *int_MEM = (uint32_t *) (MEMORY + (address&MEMORY_LIMIT));
	if (__builtin_expect(address+3>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	return bswap_32(*int_MEM);
}

uint32_t read_step_memory(uint32_t addr){ //reads an uint32_t from memory using the passed address. This is used to fetch parts of the instruction
	uint32_t *int_MEM = (uint32_t *) (MEMORY + (addr&MEMORY_LIMIT));
	if (__builtin_expect(addr+3>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",addr);
		exit(1);
	}
	return bswap_32(*int_MEM);
}

uint32_t read_word_memory(void){ //reads a 16 bit word from memory
	if (useImmediate) return address&0xffff;
	unsigned short *word_MEM = (unsigned short *) (MEMORY + (address&MEMORY_LIMIT));
	if (__builtin_expect(address+1>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	return bswap_16((uint32_t) *word_MEM);
}

uint32_t read_byte_memory(void){ //reads an 8 bit byte from memory
	if (useImmediate) return address&0xff;
	if (__builtin_expect(address+3>MEMORY_LIMIT, 0)){
		printf("ADDRESS OVERFLOW: %u\n",address);
		exit(1);
	}
	return (uint32_t) MEMORY[address&MEMORY_LIMIT]; 
}
