// file which handles Hard disk access of CPU emulator
int HD_LOADED;
FILE* HD_FILE;


int load_HD(char *name){
	HD_FILE = fopen(name, "r+b");  //get file
	if (HD_FILE == NULL){ 				//check valid file
		printf("ERROR: Failed to open file \"%s\"\n",name);
		return 0;
	} else {
		return 1;
	}
}

unsigned int DiskSeekABSOLUTE(int address){ //seeks to ABSOLUTE position on disk
	if (HD_LOADED == 0) return 1; // failure
	if (fseek(HD_FILE, (long int) address, SEEK_SET) != 0) return 1; // failure
	return 0;
}

unsigned int LoadFromDisk(unsigned int memAddress, unsigned int length){
	if (HD_LOADED == 0) return 1; // failure
	unsigned int nbytes = fread(MEMORY + memAddress, 1, length, HD_FILE);
	if (nbytes < length) return 1; // return 1 if there is an EOF
	return 0;
}

unsigned int StoreToDisk(unsigned int memAddress, unsigned int length){
	if (HD_LOADED == 0) return 1; // failure
	unsigned int nbytes = fwrite(MEMORY + memAddress, 1, length, HD_FILE);
	if (nbytes < length) return 1; // return 1 if there is an EOF 
	return 0;
}