// a file system handler for CPU 10
#include <unistd.h>

char nameBuffer[256]; // the buffer for a name to add to the address
char nameBuffer[1024];

unis



unsigned int doAccess(unsigned int command, unsigned int payload){

}



struct UIB_ENTRY fileSystem = {0,*doAccess};
void fileSystemInit(){
	addDevice(fileSystem,0);
}


int chdir(char *path); // changes directory
char *getwd(char *path); // returns working directory
