char *strfind(const char *s, const char *f){
	
	do {
		char *current = s;
		int found = 1;
		for (int i = 0; f[i] > 0; i++){
			if (f[i] != s[i] || s[i] == 0){
				found = 0;
				break;
			}
		}
		if (found) {
			return s;
		}
	} while (*(s++));
}

// Q3???


// Q4:
enum OPS { FAILED, PLUS, SUB, MUL, DIV}

int isInteger(char *value){

}

int convertInteger(char *value){

}

OPS getOp(char *value){

}

void calc(int argc, char *argv[]){
	int stack[1024];
	int sp = 0;
	for (int i = 0 i < argc; i++){
		if (isInteger argv[i]){
			stack[sp++] = convertInteger(argv[i]);
		} else {
			enum OPS op = getOp(argv[i]);
			if (op){

			} else {
				// failure
			}
		}
	}

}