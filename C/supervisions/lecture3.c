#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// 1. If p is a pointer, what does p[-2] mean? When is this legal?

// *(p-2)
// legal whenever *(p-2) is a legal address to access

// 2. Write a string search function with a declaration of char *strfind(const char *s, const char *f);
// which returns a pointer to first occurrence of s in f (and NULL otherwise)

char *strfind(const char *s, const char *f){
	
	do {			// for each starting point
		const char *current = s;
		int found = 1;
		for (int i = 0; f[i] > 0; i++){	// for each char in the string until the end of f
			if (f[i] != s[i] || s[i] == 0){		// make sure they're equal and s hasn't ended
				found = 0;
				break;
			}
		}
		if (found) {
			return s;
		}
	} while (*(s++));
	return NULL;
}
// 3. If p is a pointer to a structure, write some C code which uses all the following code snippets:
// “++p->i”, “p++->i”, “*p->i”, “*p->i++”, “(*p->i)++” and “*p++->i”; describe the action of
// each code snippet

struct test {
	int *i;
};

void q3(void){
	struct test *p_base = malloc(4 * sizeof(struct test));
	for (int j =0; j<3; j++){
		(p_base+j)->i = (int *) malloc(sizeof(int));
		*((p_base+j)->i) = 2*j;
	} struct test *p = p_base;

	printf("%i\n", p->i); // original 8984888  

	printf("%i\n", ++p->i); // 8984892 increments p, then derefs to get i [(++p) -> i]
	printf("%i\n",p++->i); //8984892 post increments p, then deref to get same i [(p++) -> i]
	printf("%i\n",*p->i); // 2 - derefs i 	[*(p->i)]
	printf("%i\n",*p->i++); // 2 - derefs i and increments it [(*(p->i))++]
	printf("%i\n",(*p->i)++); // 8978624  from *p->i, one would assume that this is incrementing *i, but this value doesnt fit
	printf("%i\n",*p++->i); // 8978625  previous value incremented
}


// 4. Write a program calc which evaluates a reverse Polish expression given on the command line; for
// example
// $ calc 2 3 4 + *
// should print 14 (K&R Exercise 5-10)

// I'll spare you my full FORTH implementation in my own C like language!

#define STACK_SIZE 1024

enum OPS { FAILED, PLUS, SUB, MUL, DIV, SWAP}; // define the operators

void prints(int* stack, int sp){ // print out the stack
	for (int i = 0; i < sp; i++){
		printf("%i,  ", stack[i] );
	}
}

int isInteger(const char *value){ // determines if the token is a number
	for (; *value; value ++) {
		if (*value > '9' || *value < '0'){
			return false;
		}
	} return true;
}

int convertInteger(const char  *value){ // if the token is a number, then this function converts it
										// to that number
	int tot;
	for (tot = 0 ; *value > 0; value ++) {
		tot = (tot * 10) + (*value - '0');
	}
	return tot;
}

int getOp(const char *value){		// gets the operation to be done
	if (strcmp(value,"+") == 0) return PLUS;
	if (strcmp(value,"-") == 0) return SUB;
	if (strcmp(value,"*") == 0) return MUL;
	if (strcmp(value,"/") == 0 ) return DIV;
	if (strcmp(value,"SWAP") == 0) return SWAP;
	return FAILED;
}

int pop(int *stack, int *sp){	// simple push/pop functions that update sp
	if (*sp == 0){
		printf("ERROR: stack underflow.\n");
	} else {
		return stack[--(*sp)];
	}
}

void push(int *stack, int *sp, int value){
	if (*sp == STACK_SIZE){
		printf("ERROR: stack overflow.\n");
	} else {
		stack[(*sp)++] = value;
	}
}

void calc(int argc, const char  *argv[]){ //main code
	int stack[STACK_SIZE];
	int sp = 0;
	int o1;
	int o2;
	for (int i = 1; i < argc; i++){
		if (isInteger(argv[i])){
			push(stack, &sp, convertInteger(argv[i]));
		} else {
			enum OPS op = getOp(argv[i]);
			switch(op){ 			// lookup the op
				case FAILED:
					printf("FAILED\n");
					printf("Error: unrecognised operator or operand: %s\n", argv[i]);
					break;	
				case PLUS:
					o1 = pop(stack, &sp);
					o2 = pop(stack, &sp);
					push(stack, &sp, o1+o2);
					break;
				case SUB:
					o1 = pop(stack, &sp);
					o2 = pop(stack, &sp);
					push(stack, &sp, o2-o1);
					break;
				case MUL:
					o1 = pop(stack, &sp);
					o2 = pop(stack, &sp);
					push(stack, &sp, o1*o2);
					break;					
				case DIV:
					o1 = pop(stack, &sp);
					o2 = pop(stack, &sp);
					push(stack, &sp, o1/o2);
					break;
				case SWAP:
					o1 = pop(stack, &sp);
					o2 = pop(stack, &sp);
					push(stack, &sp, o1);
					push(stack, &sp, o2);
					break;		
			}
		}
	}
	prints(stack,sp); printf("ok\n");
}

void main(int argc, char const *argv[])
{
	calc(argc,argv);
	printf("%s\n", strfind("Hello world", "o w"));
	q3();
}