#include "stdio.h"



int  prep_search(int* array, int target){
	if (array[0] == target){
		return 0;
	}
	else{
		printf("%d\n", array[-1]);
		if (array[] == target){
			return -1;
		}
		else{
			printf("%d\n",sizeof(array) );
			return search(array,sizeof(array)/4-1,0,target);
		}
	}

}

int search(int* array, int higherbound, int lowerbound, int target){
	if (higherbound == lowerbound){
		return higherbound;
	}
	else{
		int middle;
		middle = (higherbound + lowerbound)/2;
		if (middle == lowerbound){
			return higherbound;
		}
		else{
			int trial;
			trial = array[middle];
			if (trial = target){
				return middle;
			}
			else{
				if (trial > target){
					return search(array,middle,lowerbound,target);
				}
				else{
					return search(array,higherbound,middle,target);
				}
			}
		}
	}
}
void main(){
	int table[] = {0,1,2,3,4};
	printf("%d\n", prep_search(table,4));
}