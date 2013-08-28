#include <stdio.h>


int fib(int a){
	if (a <2){
		return 1;
	}
	else{
		return fib(a-1)+fib(a-2);
	}
}


void main(){
	int i = 0;
	while (i<10){
		printf("fib = %d\n",fib(i));
		i++;
		}
	 
}
