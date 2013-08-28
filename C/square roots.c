//#include <Python.h>
#include <stdio.h>


float sqrt(int x,int accuracy){
	float guess;
	int rounds;
	guess = 2;
	for (rounds=0;rounds<accuracy;rounds++){
		guess = (guess+(x/guess))/2;
	}
	return guess;
}

void main(){
	int i;
	for(i=0;i<10;i++){
		printf("Square root of %d is %f\n",i,sqrt(i,10));
	}
}