//________________ memory access functions ____________________
#define MEMORY_SIZE 1048575

void store_memory(unsigned int addr,unsigned int data,unsigned char *MEMORY){
	unsigned char data_bytes[4];
	data_bytes[3] = (unsigned char) data&255;
	data >>= 8;
	data_bytes[2] = (unsigned char) data&255;
	data >>= 8;
	data_bytes[1] = (unsigned char) data&255;
	data >>= 8;
	data_bytes[0] = (unsigned char) data&255;
	int i;
	for (i = 0; i <4 ; i++){
		MEMORY[(addr + i)&MEMORY_SIZE] = data_bytes[i];
	}
	

}

void store_word_memory(unsigned int addr,unsigned int data, unsigned char *MEMORY){
	unsigned char data_bytes[2];
	data_bytes[1] =(unsigned char) data&255;
	data >>= 8;
	data_bytes[0] = (unsigned char) data&255;
	int i;
	for ( i = 0; i <2 ; i++){
		MEMORY[(addr + i)&MEMORY_SIZE] = data_bytes[i];
	}
}

void store_byte_memory(unsigned int addr, unsigned int data, unsigned char *MEMORY){
	MEMORY[addr&MEMORY_SIZE] = (unsigned char)data&255;
};




unsigned int read_memory(unsigned int addr, unsigned char *MEMORY){
	unsigned int to_return = 0;
	int i;
	for (i = 0; i<4;i++){
		to_return <<= 8;
		to_return += (unsigned int) MEMORY[(addr+i)&MEMORY_SIZE];
	}
	return to_return;
}

unsigned int read_word_memory(unsigned int addr, unsigned char *MEMORY){
	unsigned int to_return = 0;
	int i;
	for ( i = 0; i<2;i++){
		to_return <<= 8;
		to_return += (unsigned int) MEMORY[(addr+i)&MEMORY_SIZE];
	}
	return to_return;
}

unsigned int read_byte_memory(unsigned int addr, unsigned char *MEMORY){
	unsigned int to_return = 0;
	to_return = (unsigned int) MEMORY[addr&MEMORY_SIZE]; 
	return to_return;
}
