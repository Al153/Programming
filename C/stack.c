#include <stdio.h>

typedef struct  //create a stack type
{
	int* pointer;
	int array[100];
	int current_size;
	int max_size;
} Stack;

Stack initialize_stack(){
	Stack my_stack; //creates stack struct
	my_stack.pointer = &my_stack.array[99];		//finds start of stack
	my_stack.current_size = 0;
	my_stack.max_size = 100;
	return my_stack;
}

void Push_stack(int value, Stack stack){
	if (stack.current_size < stack.max_size){
		*stack.pointer = value;
		stack.pointer += 4;
		stack.current_size += 1;
	}
	else{
		printf("Stack full\n");
	}
}

int pop_stack(Stack stack){
	int out;
	stack.pointer -= 4;
	out = *stack.pointer;
	if (stack.current_size > 0){
		stack.current_size -= 1;
	}
	else{
		stack.pointer += 4;
	}
	return out;
}

void main(){
	Stack my_stack;
	my_stack = initialize_stack;
	for (int i=0;i<50;i++){
		Push_stack(i,my_stack);
	}
	for (int i=0;i<50;i++)
	{
		printf("Popped: %i\n", pop_stack(my_stack));
	}


}