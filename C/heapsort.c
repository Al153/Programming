#include "<stdio.h>"

int create_heap(int[16] array){
	int heap_pointer = 0;
	int ptr;
	int new_ptr;
	bool stop;
	int temp;
	for (heap_pointer = 0;heap_pointer<16;heap_pointer++){
		ptr = heap_pointer;
		stop = false;
		while ((ptr <> 0)&&(stop = false)){
			new_ptr = (ptr-1)/2
			if (array[new_ptr]<array[ptr]){
				temp = array[new_ptr];
				array[new_ptr] = array[ptr];
				array[ptr] = temp;
			}
			ptr = new_ptr;
		}
	}
	return array;
}

int sort_heap(int[16] array){
	int heap_pointer;
	int temp;
	int ptr;
	for (heap_pointer = 15;heap_pointer>=0;heap_pointer--){
		temp = array[0];
		ptr = 0;
		while (ptr <= heap_pointer){
			if(array[(2*ptr)+1]>array[(2*ptr)+2]){
				if((2*ptr)+1)<=heap_pointer){
					array[ptr] = array[(2*ptr)+1];
				}
				ptr = (2*ptr)+1;
			}
			else:
				if((2*ptr)+2<=heap_pointer){
					array[ptr] = array[(2*ptr)+2];
				}
				ptr = (2*ptr)+1;

		}
		array[heap_pointer] = temp;
	}
	return array;
}

void print_array(int[16] array){
	for(int i = 0;i<16;i++){
		printf("%i",array[i]);
	}
	printf("\n");
	return void;
}



int main(){

	int[16] heap;

	heap = [0,1,2,3,4,5,6,7,8,9,20,11,12,13,14,15];
	heap = create_heap(heap);
	print_array(heap);
	heap = sort_heap(heap);
	print_array(heap);
	return 0;
}

int create_heap(int[16] array){
	int heap_pointer = 0;
	int ptr;
	int new_ptr;
	bool stop;
	int temp;
	for (heap_pointer = 0;heap_pointer<16;heap_pointer++){
		ptr = heap_pointer;
		stop = false;
		while ((ptr <> 0)&&(stop = false)){
			new_ptr = (ptr-1)/2
			if (array[new_ptr]<array[ptr]){
				temp = array[new_ptr];
				array[new_ptr] = array[ptr];
				array[ptr] = temp;
			}
			ptr = new_ptr;
		}
	}
	return array;
}

int sort_heap(int[16] array){
	int heap_pointer;
	int temp;
	int ptr;
	for (heap_pointer = 15;heap_pointer>=0;heap_pointer--){
		temp = array[0];
		ptr = 0;
		while (ptr <= heap_pointer){
			if(array[(2*ptr)+1]>array[(2*ptr)+2]){
				if((2*ptr)+1)<=heap_pointer){
					array[ptr] = array[(2*ptr)+1];
				}
				ptr = (2*ptr)+1;
			}
			else:
				if((2*ptr)+2<=heap_pointer){
					array[ptr] = array[(2*ptr)+2];
				}
				ptr = (2*ptr)+1;

		}
		array[heap_pointer] = temp;
	}
	return array;
}

void print_array(int[16] array){
	for(int i = 0;i<16;i++){
		printf("%i",array[i]);
	}
	printf("\n");
	return void;
}
