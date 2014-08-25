#include <stdio.h>


// __________________ ALU _____________________________
void ALU_op(int *to_return, unsigned int r1_value, unsigned int r2_value, unsigned int op){ //need to pass an array to the function
    unsigned int result = 0;
	unsigned int top_of_result = 0;
	unsigned long long_result = 0;
	int flags = 0;

	if (op == 0){  			//ADD
		result = r1_value + r2_value;
		if (result < r1_value){	//if there is a carry
			flags = 16;
		}
	}
	else if (op == 1){		//SUB
		result = r1_value - r2_value;
		if (result > r1_value){ 	//if there is a borrow
			flags = 8;
		}


	}
	else if (op == 2){		//MUl
		long_result = (long)r1_value * (long)r2_value;
		result = long_result & 4294967295;
		top_of_result = long_result>>32;
	}
	else if (op == 3){		//DIV
		if  (r2_value == 0){ 	//division by 0
			flags = 4;
			result = 4294967295;	
		}
		else {
			result = r1_value/r2_value;
		}
	}
	else if (op == 4){		//MOD
		if (r2_value == 0){
			flags = 4;
			result = 0;
		}
		else {
			result = r1_value % r2_value;
		}

	}
	else if (op == 5){		//AND
		result = r1_value & r2_value;
	}
	else if (op == 6){		//OR
		result = r1_value | r2_value;
	}
	else if (op == 7){		//XOR
		result = r1_value ^ r2_value;
	}
	else if (op == 8){ 		//NOT
		result = r1_value ^ 4294967295;
	}
	else if (op == 9){		//NAND
		result = (r1_value & r2_value) ^ 4294967295;
	}
	else if (op == 10){ 		//NOR
		result = (r1_value | r2_value) ^ 4294967295;
	}
	else if (op == 11){		//XNOR
		result = (r1_value ^ r2_value) ^ 4294967295;
	}
	else if (op == 12){		//SHL
		result = r1_value << r2_value;

	}
	else if (op == 13){		//SHR
		result = r1_value >> r2_value;

	}
	else if (op == 14){		//ADDc
		result = r1_value + r2_value + 1;
		if (result < r1_value){	//if there is a carry
			flags = 16;
		}
	}
	else if (op == 15){		//SUBb
		result = r1_value - 1 - r2_value;
		if (result > r1_value){ 	//if there is a borrow
			flags = 8;
		}
	}
	to_return[0] = result;
	to_return[1] = top_of_result;
	to_return[2] = flags;
}

int main(){
	int result[3];
	printf("working\n");
    ALU_op(result,15,16,1);
	printf("bottom of result = %u\n",result[0]);

	printf("top of result = %u\n",result[1]);

	printf("flags = %u\n",result[2]);
}
