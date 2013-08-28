#include <stdio.h>
int fibonacci(n){
	int i;
	int a;
	int b;
	a = 0;
	b = 1;
	for (i=0,i<n,i++){
		a,b = a+b,a;
	}
	return a;
}

void main(){
	printf("%s\n", );
}