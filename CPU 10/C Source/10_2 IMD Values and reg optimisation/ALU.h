// __________________ ALU _____________________________

void ADD(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t flags = 0;
	uint32_t result = r1_value + r2_value;
	if (result < r1_value){	//if there is a carry
		flags = 16;
	} else flags = 0;
	to_return[0] = result;
	to_return[2] = flags;
}

void SUB(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = r1_value - r2_value;
	uint32_t flags = 0;
	if (result > r1_value){ 	//if there is a borrow
		flags = 8;
	} else flags = 0;
	to_return[0] = result;
	to_return[2] = flags;
}

void MUL(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint64_t long_result = (uint64_t)r1_value * (uint64_t)r2_value;
	uint32_t result = long_result & 4294967295;
	uint32_t top_of_result = (uint32_t) (long_result>>32);
	to_return[0] = result;
	to_return[1] = top_of_result;
	to_return[2] = 0;
}

void DIV(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t flags = 0;
	uint32_t result;
	if  (r2_value == 0){ 	//division by 0
		flags = 4;
		result = 4294967295;	
	}
	else {
		result = r1_value/r2_value;
		flags = 0;
	}
	to_return[0] = result;
	to_return[2] = flags;
}

void MOD(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t flags = 0;
	uint32_t result;
	if (r2_value == 0){
		flags = 4;
		result = 0;
	}
	else {
		result = r1_value % r2_value;
	}
	to_return[0] = result;
	to_return[2] = flags;
}

void AND(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = r1_value & r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void OR(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = r1_value | r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void XOR(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = r1_value ^ r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void NOT(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	to_return[0] = r1_value^0xffffffff;
	to_return[2] = 0;
}

void NAND(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = (r1_value & r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void NOR(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = (r1_value | r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void XNOR(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result = (r1_value ^ r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void SHL(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result;
	if (r2_value < 32){
		result = (r1_value << r2_value)&4294967295;
	} else {
		result = 0;
	}
	to_return[0] = result;
	to_return[2] = 0;
}

void SHR(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t result;
	if (r2_value < 32){
		result = (r1_value >> r2_value)&4294967295;
	} else {
		result = 0;
	}
	to_return[0] = result;
	to_return[2] = 0;
}

void ADDc(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t flags = 0;
	uint32_t result = r1_value + r2_value + 1;
	if (result < r1_value){	//if there is a carry
		flags = 16;
	}

	to_return[0] = result;
	to_return[2] = flags;
}

void SUBb(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value){
	uint32_t flags = 0;	
	uint32_t result = r1_value - r2_value - 1;
	if (result > r1_value){ 	//if there is a borrow
		flags = 8;
	}
	to_return[0] = result;
	to_return[2] = flags;
}

void (*ALU_OPS[16])(uint32_t *,uint32_t,uint32_t) = {&ADD,&SUB,&MUL,&DIV,&MOD,&AND,&OR,&XOR,&NOT,&NAND,&NOR,&XNOR,&SHL,&SHR,&ADDc,&SUBb};

void ALU_op(uint32_t *to_return, uint32_t r1_value, uint32_t r2_value, uint8_t opcode){ //need to pass an array to the function
	ALU_OPS[opcode](to_return,r1_value,r2_value);
}