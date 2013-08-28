#include <stdlib.h>
#include <stdio.h>

int fib(int a){
	int fib_list[100];
	int i;
	for (i = 0; i < a; i++)
	{
		if (i>1){
			fib_list[i] = fib_list[i-1]+fib_list[i-2];
		}
		else{
			fib_list[i] = 1;
		}
		//printf("%i\n",fib_list[i] );	
	}
	return fib_list[a-1];
}

void main(){
	int j;
	for (j = 0;j<10;j++){
		printf ("fib(%i) = %i\n",j,fib(j));
	}
	exit(0);
}