// _______________________ execution instructions ________________________

unsigned int fetch_instruction(unsigned int *registers, unsigned char *MEMORY){ //fetches next instruction
	unsigned int instruction; 				
	instruction = read_memory(registers[4],MEMORY); //reads instruction from memory, using registers[4] (program counter as an index)
	registers[4] += 4; 								//increments program counter
	return instruction;
}

unsigned int fetch_address(unsigned int *registers, unsigned char *MEMORY){ //fetches address of instruction
	unsigned int address;													//mostly the same as fetch_instruction
	address = read_memory(registers[4],MEMORY);
	registers[4] += 4;
	return address;
}

unsigned char get_conditional(unsigned int *registers,unsigned char conditional){ //checks whether instr is conditional and if condition is true returns 1
	//woop woop, lots of logic!
	if (conditional&128){ //if there is a conditional bit set (if instruction is conditional)
		if (!(conditional & 64)){ //if conditional based on a flag
			if (!((1<<(31-(conditional & 31))) & registers[5])){ //if condition true
				if (((conditional&31) == 24) || ((conditional&31) == 25) || ((conditional&31) == 26)){
					registers[5] &= 4294967071; //reset all three of the  ><= flags
				} 
				else{
					registers[5] &=  (1<<(31 - (conditional&31)))^4294967295;   //resets just the tested flag
				}
				return 0;

			}
			else{
				if  (((conditional&31) == 24) || ((conditional&31) == 25) || ((conditional&31) == 26)){
					registers[5] &= 4294967071;					//#reset all three of the  ><= flags
				}
				else{
					registers[5] &= (1<<(31-(conditional&31)))^4294967295;
				}
				return 1;

			}
		}
		else{ //if conditional based on a register
			if  (registers[conditional&15]){
				return 1;
			}
			else{
				return 0;
			}
		}
	}
	else {
		return 1;
	}
}

unsigned int do_ALU_op(unsigned int value1,unsigned int value2,unsigned char opcode,unsigned int *registers){
	unsigned int ALU_return_array[3];
	opcode &= 15;

	if (opcode == 14){ //add with carry
		if (!(registers[5]&16)){ //if no carry flag do a normal addition
			opcode = 0;
		}
		else {
			registers[5] &= 4294967279;  //reset carry flag
		}
	}
	else if(opcode == 15){ //sub with borrow
		if (!(registers[5] & 8)){  //if no borrow flag then do a normal subtract
			opcode= 1;
		}
		else {
			registers[5] &= 4294967287; //reset carry flag
		}
	}
	ALU_op(ALU_return_array,value1,value2,opcode); //run ALU operation
	if (opcode == 2){  //if mmultiplication, ACC register = top 32bits of result
		registers[2] = ALU_return_array[1]; 
	}

	registers[5] |= ALU_return_array[2]; //rupdate flags
	return ALU_return_array[0]; //return value of result



}

void decode_instruction(unsigned char *decoded,unsigned int instruction){ //decodes instruction into bytes
	decoded[3] = instruction & 255; //pretty simple, separates instruction into bytes
	instruction >>= 8;
	decoded[2] = instruction & 255;
	instruction >>= 8;
	decoded[1] = instruction & 255;
	instruction >>= 8;
	decoded[0] = instruction & 255;
}

unsigned int execute(unsigned char instr, unsigned char reg1,unsigned char reg2,unsigned char conditional,unsigned int address,unsigned int *registers, unsigned char *MEMORY){
		unsigned int reg1_value;
		unsigned int reg2_value;
		
 
		
		char will_execute = get_conditional(registers,conditional); // if condition is true, then it will execute
		//printf("will_execute = %i\n",(int) will_execute);

		if (will_execute){
			
			reg1 = reg1&15; //actual register addresses, prevents C buffer overflows due to machine code self modifying
			reg2 = reg2&15;
			
			// execute instruction
			switch(instr){ //checks opcode
				case 0:
					return 1;   		//halt
	
				case 1: 				//Pass
 	
	 				return 0;
				case 2: 				//Move
					write_registers(registers,reg2,read_registers(registers,reg1));
					return 0;
				case 3: 				//Load
					address += read_registers(registers,reg2);
					write_registers(registers,reg1,read_memory(address,MEMORY));
					return 0;
				case 4: 				//Store
	 				address += read_registers(registers,reg2);
	 				store_memory(address,read_registers(registers,reg1),MEMORY);
	 				return 0;
				case 5:  				//Compare regs
					registers[5] &=  4294967071; //clear flags for <>=
					
					reg1_value = read_registers(registers,reg1); //get values
					reg2_value = read_registers(registers,reg2);
	
					if (reg1_value > reg2_value){
						registers[5] |= 64;
	
					}
					else if (reg1_value == reg2_value){
						registers[5] |= 128;
					}
					else {
						registers[5] |= 32;
					}
	
					return 0;
				case 6: 				//compare reg - address
	
					registers[5] &=  4294967071; //clear flags for <>=
					address += read_registers(registers,reg2);
					
					reg1_value = read_registers(registers,reg1); //get values
					reg2_value = read_memory(address,MEMORY);
	
					if (reg1_value > reg2_value){
						registers[5] |= 64;
	
					}
					else if (reg1_value == reg2_value){
						registers[5] |= 128;
					}
					else {
						registers[5] |= 32;
					}
	
					return 0;
	
				case 7: 				//Out reg
					out_char(read_registers(registers,reg1));
	 				return 0;
				case 8: 				//Out  address
					address += read_registers(registers,reg2);
					out_char(read_memory(address,MEMORY));
					return 0;
				case 9: 				//Outd reg
					out_data(read_registers(registers,reg1));
					return 0;
				case 10: 				//Outd address
					address += read_registers(registers,reg2);
					out_data(read_memory(address,MEMORY));
					return 0;
				case 11: 				//Load byte
					address += read_registers(registers,reg2);
					write_registers(registers,reg1,read_byte_memory(address,MEMORY));
					return 0;
				case 12:				//Store byte
	 				address += read_registers(registers,reg2);
	 				store_byte_memory(address,read_registers(registers,reg1),MEMORY);
					return 0;
				case 13: 				//Load word
					address += read_registers(registers,reg2);
					write_registers(registers,reg1,read_word_memory(address,MEMORY)); 
					return 0;
				case 14: 				//Store word
	 				address += read_registers(registers,reg2);
	 				store_word_memory(address,read_registers(registers,reg1),MEMORY);
					return 0;
				case 48: 				//in reg
					write_registers(registers,reg1,input());
					return 0;
				case 49:  				//in addr
					address += read_registers(registers,reg2);
	 				store_memory(address,input(),MEMORY);				
					return 0;
	
				default:
					if  ((16 <= instr) && (instr < 48)){ //ALU operations
						if (instr < 32){	//Reg/reg instr
							reg1_value = read_registers(registers,reg1); //get values
							reg2_value = read_registers(registers,reg2);
							reg1_value = do_ALU_op(reg1_value,reg2_value,instr,registers);
							write_registers(registers,reg1,reg1_value);
						}
						else {				//reg/addr
							address += read_registers(registers,reg2);
					
							reg1_value = read_registers(registers,reg1); //get values
							reg2_value = read_memory(address,MEMORY);
							reg1_value = do_ALU_op(reg1_value,reg2_value,instr&15,registers);
							write_registers(registers,reg1,reg1_value);
						}
					}
	
	
					return 0;
				}
	}
	else {
		return 0;
	}
}

