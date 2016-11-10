

void sort(int in[], int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < i; j++){
			if (in[i] < in[j]){
				int temp = in[i];
				in[i] = in[j];
				in[j] = temp;
			}
		}
	}

	for (i = 0; i < n; i++){
		printf("%d\n", in[i]);
	}
}



void sortChars(char in[], int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < i; j++){
			if (in[i] < in[j]){
				char temp = in[i];
				in[i] = in[j];
				in[j] = temp;
			}
		}
	}

	for (i = 0; i < n; i++){
		printf("%c\n", in[i]);
	}
}

