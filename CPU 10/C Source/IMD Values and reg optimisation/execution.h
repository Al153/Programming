// _______________________ execution of instructions ________________________

void fetch_instruction(void){ //fetches next instruction	
	instruction = read_step_memory(registers[4]); //reads instruction from memory, using registers[4] (program counter as an index)
	registers[4] += 8; 								//increments program counter
}

void fetch_address(void){ //fetches address of instruction
											//mostly the same as fetch_instruction
	address = read_step_memory(registers[4]-4);
}

unsigned char get_conditional(void){ //checks whether instr is conditional and if condition is true returns 1
	//woop woop, lots of logic!
	if (conditional&128){ //if there is a conditional bit set (if instruction is conditional)
		if (!(conditional & 64)){ //if conditional based on a flag
			if (!((1<<(31-(conditional & 31))) & registers[5])){ //if condition true
				if (((conditional&31) == 24) || ((conditional&31) == 25) || ((conditional&31) == 26)){
					registers[5] &= 4294967071; //reset all three of the  ><= flags
				} else {
					registers[5] &=  (1<<(31 - (conditional&31)))^4294967295;   //resets just the tested flag
				}
				return 0;

			} else {
				if  (((conditional&31) == 24) || ((conditional&31) == 25) || ((conditional&31) == 26)){
					registers[5] &= 4294967071;					//#reset all three of the  ><= flags
				}
				else {
					registers[5] &= (1<<(31-(conditional&31)))^4294967295;
				}
				return 1;

			}
		} else{ //if conditional based on a register
			if  (registers[conditional&15]){
				return 1;
			} else {
				return 0;
			}
		}
	} else {
		return 1;
	}
}

unsigned int do_ALU_op(unsigned int value1,unsigned int value2,unsigned char opcode){
	unsigned int ALU_return_array[3];
	opcode &= 15;
	if (opcode == 14){ //add with carry
		if (!(registers[5]&16)){ //if no carry flag do a normal addition
			opcode = 0;
		} else {
			registers[5] &= 4294967279;  //reset carry flag
		}
	} else if(opcode == 15){ //sub with borrow
		if (!(registers[5] & 8)){  //if no borrow flag then do a normal subtract
			opcode= 1;
		} else {
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