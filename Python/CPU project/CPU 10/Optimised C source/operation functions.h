
int Halt(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	return 1;   		//halt
}

int Pass(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	return 0;   		//don't halt
}

int Move(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
						write_registers(registers,reg2,read_registers(registers,reg1));
	return 0;   		//don't halt
}

int Load(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	write_registers(registers,reg1,read_memory(address,MEMORY));
	return 0;
}

int Store(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	store_memory(address,read_registers(registers,reg1),MEMORY);
	return 0;   		//don't halt
}

int Compare_regs(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	registers[5] &=  4294967071; //clear flags for <>=
	unsigned int reg1_value = read_registers(registers,reg1); //get values
	unsigned int reg2_value = read_registers(registers,reg2);
	if (reg1_value > reg2_value){
		registers[5] |= 64;
	}
	else if (reg1_value == reg2_value){
		registers[5] |= 128;
	}
	else {
		registers[5] |= 32;
	}	
	return 0;   		//don't halt
}

int Compare_addr(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	registers[5] &=  4294967071; //clear flags for <>=
	address += read_registers(registers,reg2);
	unsigned int reg1_value = read_registers(registers,reg1); //get values
	unsigned int reg2_value = read_memory(address,MEMORY);
	if (reg1_value > reg2_value){
		registers[5] |= 64;
	}
	else if (reg1_value == reg2_value){
		registers[5] |= 128;
	}
	else {
		registers[5] |= 32;
	}
	return 0;   		//don't halt
}

int Out_reg(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	out_char(read_registers(registers,reg1));
	return 0;   		//don't halt
}

int Out_addr(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	out_char(read_memory(address,MEMORY));
	return 0;   		//don't halt
}

int Outd_reg(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	out_data(read_registers(registers,reg1));
	return 0;   		//don't halt
}

int Outd_addr(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	out_data(read_memory(address,MEMORY));
	return 0;   		//don't halt
}

int Load_byte(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	write_registers(registers,reg1,read_byte_memory(address,MEMORY));
	return 0;   		//don't halt
}

int Store_byte(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	store_byte_memory(address,read_registers(registers,reg1),MEMORY);
	return 0;   		//don't halt
}

int Load_word(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	write_registers(registers,reg1,read_word_memory(address,MEMORY)); 
	return 0;   		//don't halt
}

int Store_word(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	store_word_memory(address,read_registers(registers,reg1),MEMORY);
	return 0;   		//don't halt
}

int in_reg(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	write_registers(registers,reg1,input());
	return 0;   		//don't halt
}

int in_addr(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	store_memory(address,input(),MEMORY);
	return 0;   		//don't halt
}

int ALU_op_reg(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	unsigned int reg1_value = read_registers(registers,reg1); //get values
	unsigned int reg2_value = read_registers(registers,reg2);
	reg1_value = do_ALU_op(reg1_value,reg2_value,opcode,registers);
	write_registers(registers,reg1,reg1_value);
	return 0;   		//don't halt
}

int ALU_op_addr(unsigned char opcode, unsigned char reg1, unsigned char reg2, unsigned int *registers, unsigned char *MEMORY){
	register unsigned int address = fetch_address(registers,MEMORY);
	address += read_registers(registers,reg2);
	unsigned int reg1_value = read_registers(registers,reg1); //get values
	unsigned int reg2_value = read_memory(address,MEMORY);
	reg1_value = do_ALU_op(reg1_value,reg2_value,opcode&15,registers);
	write_registers(registers,reg1,reg1_value);
	return 0;
}

int (*CPU_OPS[50])(unsigned char, unsigned char, unsigned char, unsigned int *, unsigned char *) = {
	



	&Halt,
	&Pass,
	&Move,
	&Load,
	&Store,
	&Compare_regs,
	&Compare_addr,
	&Out_reg,
	&Out_addr,
	&Outd_reg,
	&Outd_addr,
	&Load_byte,
	&Store_byte,
	&Load_word,
	&Store_word,
	&Pass,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_reg,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&ALU_op_addr,
	&in_reg,
	&in_addr,
};

unsigned int execute(unsigned char instruction, unsigned char reg1, unsigned char reg2, unsigned char conditional, unsigned int *registers, unsigned char *MEMORY){
	reg1 = reg1&15;
	reg2 = reg2&15;
	int will_exe = get_conditional(registers,conditional);
	//printf("\nwill execute? {%u}\n",will_exe);
	if (will_exe){
		if (instruction<50){
			return CPU_OPS[instruction](instruction,reg1,reg2,registers,MEMORY);
		}
		else return 0;
	} else return 0;
}