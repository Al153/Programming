// function for every opcode in the CPU's instruction set
#define CONTINUE return 0;   		//don't halt
# define HALT return 1;   		//halt


int Halt(void){
	HALT
}

int Pass(void){
	CONTINUE
}

int Move(void){
	write_registers(reg2,read_registers(reg1));
	CONTINUE
}

int Load(void){
	fetch_address();
	address += read_registers(reg2);
	write_registers(reg1,read_memory());
	return 0;
}

int Store(void){
	fetch_address();
	address += read_registers(reg2);
	store_memory(read_registers(reg1));
	CONTINUE
}

int Compare_regs(void){
	registers[5] &=  4294967071; //clear flags for <>=
	unsigned int reg1_value = read_registers(reg1); //get values
	unsigned int reg2_value = read_registers(reg2);
	if (reg1_value > reg2_value){
		registers[5] |= 64;
	}
	else if (reg1_value == reg2_value){
		registers[5] |= 128;
	}
	else {
		registers[5] |= 32;
	}	
	CONTINUE
}

int Compare_addr(void){
	fetch_address();
	registers[5] &=  4294967071; //clear flags for <>=
	address += read_registers(reg2);
	unsigned int reg1_value = read_registers(reg1); //get values
	unsigned int reg2_value = read_memory();
	if (reg1_value > reg2_value){
		registers[5] |= 64;
	}
	else if (reg1_value == reg2_value){
		registers[5] |= 128;
	}
	else {
		registers[5] |= 32;
	}
	CONTINUE
}

int Out_reg(void){
	out_char(read_registers(reg1));
	CONTINUE
}

int Out_addr(void){
	fetch_address();
	address += read_registers(reg2);
	out_char(read_memory());
	CONTINUE
}

int Outd_reg(void){
	out_data(read_registers(reg1));
	CONTINUE
}

int Outd_addr(void){
	fetch_address();
	address += read_registers(reg2);
	out_data(read_memory());
	CONTINUE
}

int Load_byte(void){
	fetch_address();
	address += read_registers(reg2);
	write_registers(reg1,read_byte_memory());
	CONTINUE
}

int Store_byte(void){
	fetch_address();
	address += read_registers(reg2);
	store_byte_memory(read_registers(reg1));
	CONTINUE
}

int Load_word(void){
	fetch_address();
	address += read_registers(reg2);
	write_registers(reg1,read_word_memory()); 
	CONTINUE
}

int Store_word(void){
	fetch_address();
	address += read_registers(reg2);
	store_word_memory(read_registers(reg1));
	CONTINUE
}

int in_reg(void){
	write_registers(reg1,input());
	CONTINUE
}

int in_addr(void){
	fetch_address();
	address += read_registers(reg2);
	store_memory(input());
	CONTINUE
}

int ALU_op_reg(void){
	unsigned int reg1_value = read_registers(reg1); //get values
	unsigned int reg2_value = read_registers(reg2);
	reg1_value = do_ALU_op(reg1_value,reg2_value,opcode&15);
	write_registers(reg1,reg1_value);
	CONTINUE
}

int ALU_op_addr(void){
	fetch_address();
	address += read_registers(reg2);
	unsigned int reg1_value = read_registers(reg1); //get values
	unsigned int reg2_value = read_memory();
	reg1_value = do_ALU_op(reg1_value,reg2_value,opcode&15);
	write_registers(reg1,reg1_value);
	return 0;
}

int HD_seek_reg(void){ 
	unsigned int EOF_flag = DiskSeekABSOLUTE(read_registers(reg1));
	if (EOF_flag>0) write_registers(5,256); // writes EOF_flag code (256) to flags
	return 0;
}

int HD_seek_addr(void){
	fetch_address();
	address += read_registers(reg2);
	unsigned int EOF_flag = DiskSeekABSOLUTE(read_memory());
	if (EOF_flag>0) write_registers(5,256); // writes EOF_flag code (256) to flags
	return 0;
}

int HD_read(void){
	fetch_address();
	address += read_registers(reg2);
	unsigned int EOF_flag = LoadFromDisk(address,read_registers(reg1)); // reg1 is the length of data to read, address is the memory address to read to 
	if (EOF_flag>0) write_registers(5,256); // writes EOF_flag code (256) to flags
	return 0;
}
int HD_write(void){
	fetch_address();
	address += read_registers(reg2);
	unsigned int EOF_flag = StoreToDisk(address,read_registers(reg1)); // reg1 is the length of data to read, address is the memory address to write from 
	if (EOF_flag>0) write_registers(5,256); // writes EOF_flag code (256) to flags
	return 0;
}



int (*CPU_OPS[54])() = {
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
	&HD_seek_reg,
	&HD_seek_addr,
	&HD_read,
	&HD_write,
};

unsigned int execute(){
	//executes a single instruction
	reg1 = reg1&15; //gets register addresses
	reg2 = reg2&15;
	int will_exe = get_conditional(); //tests the conditional byte of the instruction
	if (will_exe){
		if (opcode<54){
			return CPU_OPS[opcode]();
		}
		else return 0;
	} else return 0; //if does not execute instruction then does nothing
}