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


void merge(int *left, int *right, int *res, int n){
	int left_ptr = 0;
	int right_ptr = 0;
	for (int i = 0; i < n; i++){
		if (left[left_ptr] < right[right_ptr]){
			array[i] = left[left_ptr++];
		} else {
			array[i] = right[right_ptr++];
		}
	}
}

void mergeSort(int *arr, int n){
	if (n > 1){
		n_left = n/2;
		n_right = n - n_left;
		int *left = malloc(n_left*sizeof(int));
		int *right = arr+n_left;
	
	
		mergeSort(arr,n_left);
		mergeSort(arr+n_left,n_right);
	
		for (int i = 0; i < n_left; i++){ // copy out lower half
			left[i] = arr[i];
		}
	
		merge(left, right, arr, n);
	}
}


#define SWAP(t,x,y) (t temp##t = x; x = y; y = temp##t) // no, since i changes between the two uses, as may f(x)
#define SWAP_int(x,y) (x ^= y; y ^= x; x ^= y;)
