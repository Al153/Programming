#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// 1. Write a function definition which matches the declaration int cntlower(char str[]);.
// The implementation should return the number of lower-case letters in a string

int cntlower(char str[]){
	int n = 0;
	int i = 0;
	do {
		char c = str[i];
		if (c <= 'z' && c >= 'a'){
			n++;
		}
	} while (str[i++] >0);
	return n;
}


// 2. Use function recursion to write an implementation of merge sort for a fixed array of
// integers; how much memory does your program use for a list of length n?
void printArray(int *values, int len) {
	for (int i = 0; i < len; i++){
		printf("%d, ", values[i]);
	}
}

void merge(int *left, int *right, int *res, int n, int n_left, int n_right){
	int left_ptr = 0; // merges two arrays into one
	int right_ptr = 0;
	for (int i = 0; i < n; i++){
		if (left_ptr < n_left && right_ptr < n_right){
			if (left[left_ptr] < right[right_ptr]) {
				res[i] = left[left_ptr++];
			} else {
				res[i] = right[right_ptr++];
			}
		} else { // if one of the sub arrays is empty
			if (left_ptr == n_left){ // if it's left then we are done, since right array is in place
				return;
			} else { // otherwise copy in the left array
				res[i] = left[left_ptr++];
			}
		}

	}
}

void mergeSort(int *arr, int n){
	if (n > 1){		// if the array is not guaranteed to be sorted
		int n_left = n/2;	// find left and right arrays
		int n_right = n - n_left;
		int *left = malloc(n_left*sizeof(int));
		int *right = arr+n_left;
	
	
		mergeSort(arr,n_left);					// recurse on each
		mergeSort(arr+n_left,n_right);


	
		for (int i = 0; i < n_left; i++){ // copy out lower half
			left[i] = arr[i];
		}
	
		merge(left, right, arr, n, n_left, n_right); // merge
		free(left);
	}
}



// 3. Define a macro SWAP(t,x,y) that exchanges two arguments of type t (K&R, Exercise 4-14)

#define SWAP(t,x,y)  {t temp##t=x;x=y;y=temp##t;}

// 4. Does your macro work as expected for SWAP(int, v[i++], w[f(x)])?

// no, since i changes between the two uses, as may f(x)

// 5. Define a macro SWAP(x,y) that exchanges two arguments of the same type (e.g. int or
// char) without using a temporary


#define SWAP_int(x,y) {x^=y;y^=x;x^=y;}





void main(int argc, char const *argv[])
{
	if (argc >1){
		printf("count = %i\n", cntlower(argv[1]));
	}

	int arr[] = {7,6,5,4,3,2,1};
	mergeSort(arr,7);
	printArray(arr,7);

	int a = 2;
	int b = 3;
	SWAP(int,a,b);
	printf("\na = %i, b = %i.\n", a,b);
	SWAP_int(a,b);
	printf("a = %i, b = %i.\n", a,b);

}