// a file system handler for CPU 10

// significantly more high level than in real life
#include <unistd.h>

char nameBuffer[256] = {0}; // the buffer for a name to add to the address
char dirBuffer[1024] = {0};
int namePointer = 0;
int dirPointer = 0;

#define NULL ((void *)0)
FILE *currentOpenFile = NULL;


	// commands:
#define CNB 0		// clear name buffer (CNB):
						// sets name buffer to the empty string
#define ANB 1		// add to name buffer (ANB):
						// adds the input char to the name buffer
#define CDB 2		// change dir buffer (CDB):
						// creates a cd to "name buffer"
#define OPF 3		// open file (OPF):
						// opens the name of the file in the name buffer
#define CHR 4		// read char from file (CHR):
						// reads a char from the open file
#define CHW 5		// write char to file (CHW):
						// writes a char to the open file
#define CLF 6 		// close file (CLF):
						// close the current open file
#define GWD 7		// get current working directory (GWD): 
						// open up a "file" containing the current working directory
#define DIR 8 		// list current working directory 
						// opens up a "file" containing a list of names  of files in the current working directory

unsigned int doAccess(unsigned int command, unsigned int payload){
	switch (command) {
		case CNB:
			*(nameBuffer) = 0; // nullifies string
			break;
			
		case ANB:

			break;
		case CDB:


			break;

		case OPF:
			
			break;
		case CHR 4:

			break;
		case CHW:

			break;
		case CLF:

			break;
		case GWD:

			break;
		case DIR:

			break;
		default:
			return 0;

	}


}



struct UIB_ENTRY fileSystem = {0,*doAccess};


void fileSystemInit(){
	addDevice(fileSystem,0);
}


int chdir(char *path); // changes directory
char *getwd(char *path); // returns working directory

