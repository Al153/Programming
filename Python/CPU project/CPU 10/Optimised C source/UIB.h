// the Unified IO Bus controlls access to all IO devices

struct UIB_entry
{
	unsigned int Address;
	unsigned int *(function)(unsigned int, unsigned int); // a function which calls the behaviour of the value
};

// define the states:
#define IDLE 0
#define READ_DATA 0
#define SET_ADDRESS 0 
#define SET_COMMAND 0
#define SET_DATA 0
#define EXECUTE 0


struct UIB_INTERFACE
{
	unsigned int Address;
	unsigned int Command;
	unsigned int data;
	unsigned int state;
	struct UIB_entry UIB_ARRAY[16]; //array containing the UIB_ENTRIES
};

struct UIB_INTERFACE GLOBAL_INTERFACE;


unsigned int NULL_UIB_FUNCTION(unsigned int a, unsigned int b){return 0;}
struct UIB_ENTRY NULL_UIB_ENTRY = {0,&NULL_UIB_FUNCTION};


unsigned int UIB_FSM(unsigned int busData){
	if (GLOBAL_INTERFACE.state == IDLE){
		GLOBAL_INTERFACE.state = busData;
		return 0;
	} else if (GLOBAL_INTERFACE.state == READ_DATA){
		GLOBAL_INTERFACE.state = IDLE;
		return GLOBAL_INTERFACE.data;
	} else if (GLOBAL_INTERFACE.state == SET_ADDRESS){
		GLOBAL_INTERFACE.state = IDLE;
		GLOBAL_INTERFACE.Address = busData &0xf;
		return 0;
	} else if (GLOBAL_INTERFACE.state == SET_COMMAND){
		GLOBAL_INTERFACE.state = IDLE;
		GLOBAL_INTERFACE.Command = busData;
		return 0;
	} else if (GLOBAL_INTERFACE.state == SET_DATA){
		GLOBAL_INTERFACE.state = IDLE;
		GLOBAL_INTERFACE.data = busData;
		return 0;
	} else if (GLOBAL_INTERFACE.state == EXECUTE){
		GLOBAL_INTERFACE.state = IDLE;
		return GLOBAL_INTERFACE[GLOBAL_INTERFACE.address](GLOBAL_INTERFACE.Command,GLOBAL_INTERFACE.data);
	}

}

void addDevice(struct UIB_ENTRY a, unsigned int address){
	// Adds a device to the UIB interface.
	a.entry = address &0xf;
	GLOBAL_INTERFACE[address&0xf] = a;
}

void removeDevice(unsigned int address){
	// remove a device from the UIB interface
	GLOBAL_INTERFACE[address&0xf] = NULL_UIB_ENTRY;
}

void UIB_INIT(){
	for (unsigned int i = 0; i<16; i++){
		GLOBAL_INTERFACE[i] = NULL_UIB_ENTRY;
	}
}