// _____________ register access functions ________________
inline void write_registers(uint8_t addr,uint32_t data){
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

inline uint32_t read_registers(uint8_t addr){
	if(addr == 6){
		return registers[5];
	}
	else {
		return registers[addr];
	}
}