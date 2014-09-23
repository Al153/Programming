// __________________ ALU _____________________________
void ALU_op(unsigned int *to_return, unsigned int r1_value, unsigned int r2_value, unsigned int op){ //need to pass an array to the function
    unsigned int result = 0;
	unsigned int top_of_result = 0;
	unsigned long long long_result = 0;
	unsigned int flags = 0;

	switch (op){
		case 0: 			//ADD
			result = r1_value + r2_value;
			if (result < r1_value){	//if there is a carry
				flags = 16;
			}
			break;
		case 1:		//SUB
			result = r1_value - r2_value;
			if (result > r1_value){ 	//if there is a borrow
				flags = 8;
			}
			break;
		case 2:		//MUl
			long_result = (unsigned long long)r1_value * (unsigned long long)r2_value;
			result = long_result & 4294967295;
			top_of_result = (unsigned int) (long_result>>32);
			break;
		case 3:		//DIV
			if  (r2_value == 0){ 	//division by 0
				flags = 4;
				result = 4294967295;	
			}
			else {
				result = r1_value/r2_value;
			}
			break;
		case 4:		//MOD
			if (r2_value == 0){
				flags = 4;
				result = 0;
			}
			else {
				result = r1_value % r2_value;
			}
			break;
		case 5:		//AND
			result = r1_value & r2_value;
			break;
		case 6:		//OR
			result = r1_value | r2_value;
			break;
		case 7:		//XOR
			result = r1_value ^ r2_value;
			break;
		case 8: 		//NOT
			result = r1_value ^ 4294967295;
			break;
		case 9:		//NAND
			result = (r1_value & r2_value) ^ 4294967295;
			break;
		case 10:		//NOR
			result = (r1_value | r2_value) ^ 4294967295;
			break;
		case 11:		//XNOR
			result = (r1_value ^ r2_value) ^ 4294967295;
			break;
		case 12:		//SHL
			if (r2_value < 32){
				result = (r1_value << r2_value)&4294967295;
			} else {
				result = 0;
			}
			break;
		case 13:		//SHR
			if (r2_value < 32){
				result = (r1_value >> r2_value)&4294967295;
			} else {
				result = 0;
			}
			break;
		case 14:		//ADDc
			result = r1_value + r2_value + 1;
			if (result < r1_value){	//if there is a carry
				flags = 16;
			}
			break;
		case 15:		//SUBb
			result = r1_value - r2_value - 1;
			if (result > r1_value){ 	//if there is a borrow
				flags = 8;
			}
			break;
	}

	to_return[0] = result;
	to_return[1] = top_of_result;
	to_return[2] = flags;
}