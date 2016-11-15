#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// 1. What is the difference between ’a’ and "a"?

// 'a' is another representation for the int 97
// "a" is a string. It is a char array of {97,0}

// 2. Will char i,j; for(i=0; i<10,j<5; i++,j++) ; terminate? If so, under what circumstances?

// Terminates if i or j is greater than 9 or 4 respectively at any point.

void q2(char j){
	for (char i = 0; i<10,j<5; i++,j++){
		printf("i = %i, j = %i\n", i,j);
	}
}

// 3. Write an implementation of bubble sort for a fixed array of integers. (An array of integers
// can be defined as int i[] = {1,2,3,4}; the 2nd integer in an array can be printed using
// printf("%d\n",i[1]);.)

void sort(int in[], int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n-1; j++){
			if (in[j+1] < in[j]){
				int temp = in[j];
				in[j] = in[j+1];
				in[j+1] = temp;
			}
		}
	}

	for (int i = 0; i < n; i++){
		printf("%d\n", in[i]);
	}
}

// 4. Modify your answer to (3) to sort characters into lexicographical order. (The 2nd character
// in a character array i can be printed using printf("%c\n",i[1]);.)

void sortChars(char *in, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n-1; j++){
			if (in[j+1] < in[j]){
				char temp = in[j];
				in[j] = in[j+1];
				in[j+1] = temp;
			}
		}
	}

	printf(in);
}


void main(int argc, char const *argv[]) {

	// arg gives a string to sort
	int a[] = {5,6,4,23,6,3,4,1,6,3,9,0,6};
	sort(a,13);

	if (argc >1){
		int len = strlen(argv[1])+1;
		char *ca = malloc(len);
		memcpy(ca,argv[1],len);
		sortChars(ca,len-1);
	}
	

	q2(0);
}