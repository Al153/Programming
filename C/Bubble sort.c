#include <stdio.h>
#include <stdlib.h>

int bubble_sort(int array[]){
	int i;
	int j;
	int temp;
	int size_of_array;
	float f = 0.3;

	printf("Size of array = %i\n",sizeof array);
	printf("Size of first element = %i\n",sizeof array[0]);
	size_of_array = (sizeof array)/(sizeof array[0]);
	for (j = size_of_array;j>0;j--){
		for(i = j;i>0;i--){
			if (array[i]<array[i-1]){
				temp = array[i];//swap
				array[i] = array[i-1];
				array[i-1] = temp;
			}
		}
	}
}


void print_array(int array[]){
	int size_of_array;
	int i;

	size_of_array = (sizeof array)/(sizeof array[0]);
	for (i=0;i<size_of_array;i++){
		printf("%i\n",array[i]);
	}
}

void main(){
	int i;
	int my_array[10];
	int r;
	int sorted_array[];


	srand(time(NULL));
	for (i = 0;i<10;i++){
		r = rand();
		printf("r = %i\n",r);
		my_array[i] = r;
		}	
	sorted_array = bubble_sort(my_array);
	printf("New array = %s\n","");
	print_array(sorted_array);
	exit(0);
}