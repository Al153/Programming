// _____________ register access functions ________________
void write_registers(unsigned char addr,unsigned int data){
	if (addr > 1){ 				//checks not one and zero regs
		if (addr == 5){   		//flags set
			registers[5] |= data;
		}
		else if(addr == 6){ 	// flags reset
			registers[5] &= data; //flags reset
		}
		else{
			registers[addr] = data;
		}
	}
}

unsigned int read_registers(unsigned char addr){
	if(addr == 6){
		return registers[5];
	}
	else {
		return registers[addr];
	}
}