// __________________ ALU _____________________________

void ADD(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int flags = 0;
	unsigned int result = r1_value + r2_value;
	if (result < r1_value){	//if there is a carry
		flags = 16;
	} else flags = 0;
	to_return[0] = result;
	to_return[2] = flags;
}

void SUB(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = r1_value - r2_value;
	unsigned int flags = 0;
	if (result > r1_value){ 	//if there is a borrow
		flags = 8;
	} else flags = 0;
	to_return[0] = result;
	to_return[2] = flags;
}

void MUL(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned long long long_result = (unsigned long long)r1_value * (unsigned long long)r2_value;
	unsigned int result = long_result & 4294967295;
	unsigned int top_of_result = (unsigned int) (long_result>>32);
	to_return[0] = result;
	to_return[1] = top_of_result;
	to_return[2] = 0;
}

void DIV(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int flags = 0;
	unsigned int result;
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

void MOD(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int flags = 0;
	unsigned int result;
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

void AND(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = r1_value & r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void OR(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = r1_value | r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void XOR(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = r1_value ^ r2_value;
	to_return[0] = result;
	to_return[2] = 0;
}

void NOT(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	to_return[0] = r1_value^0xffffffff;
	to_return[2] = 0;
}

void NAND(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = (r1_value & r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void NOR(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = (r1_value | r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void XNOR(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result = (r1_value ^ r2_value) ^ 4294967295;
	to_return[0] = result;
	to_return[2] = 0;
}

void SHL(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result;
	if (r2_value < 32){
		result = (r1_value << r2_value)&4294967295;
	} else {
		result = 0;
	}
	to_return[0] = result;
	to_return[2] = 0;
}

void SHR(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int result;
	if (r2_value < 32){
		result = (r1_value >> r2_value)&4294967295;
	} else {
		result = 0;
	}
	to_return[0] = result;
	to_return[2] = 0;
}

void ADDc(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int flags = 0;
	unsigned int result = r1_value + r2_value + 1;
	if (result < r1_value){	//if there is a carry
		flags = 16;
	}

	to_return[0] = result;
	to_return[2] = flags;
}

void SUBb(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value){
	unsigned int flags = 0;	
	unsigned int result = r1_value - r2_value - 1;
	if (result > r1_value){ 	//if there is a borrow
		flags = 8;
	}
	to_return[0] = result;
	to_return[2] = flags;
}

void (*ALU_OPS[16])(unsigned int *,unsigned int,unsigned int) = {&ADD,&SUB,&MUL,&DIV,&MOD,&AND,&OR,&XOR,&NOT,&NAND,&NOR,&XNOR,&SHL,&SHR,&ADDc,&SUBb};

void ALU_op(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value, unsigned char opcode){ //need to pass an array to the function
	ALU_OPS[opcode](to_return,r1_value,r2_value);
}