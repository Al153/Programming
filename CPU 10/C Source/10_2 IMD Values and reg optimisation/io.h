#include <conio.h>

void out_char(uint32_t data){
	uint8_t output;
	output = data &255;
	printf("%c",output );
}

void out_data(uint32_t data){
	printf("%u", data);

}

uint32_t input(){
	uint32_t input_data;
	if (_kbhit()){
		input_data = (uint32_t)_getch();
	}
	else{
		input_data = 0;
	}
	return input_data;
}