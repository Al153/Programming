// this file contains the locations of the registers as described in the table above
// copy it into your example-c/src folder from the clarvi distribution
#include "avalon_addr.h"

int avalon_read(unsigned int address)
{
	volatile int *pointer = (volatile int *) address;
	return pointer[0];
}

void avalon_write(unsigned int address, int data)
{
	volatile int *pointer = (volatile int *) address;
	pointer[0] = data;
}


// our pixel format in memory is 5 bits of red, 6 bits of green, 5 bits of blue
#define PIXEL16(r,g,b) (((b & 0x1F)<<11) | ((g & 0x3F)<<5) | ((r & 0x1F)<<0))
// ... but for ease of programming we refer to colours in 8/8/8 format and discard the lower bits
#define PIXEL24(r,g,b) PIXEL16((r>>3), (g>>2), (b>>3))
#define PIXEL_WHITE PIXEL24(0xFF, 0xFF, 0xFF)
#define PIXEL_BLACK PIXEL24(0x00, 0x00, 0x00)
#define PIXEL_RED   PIXEL24(0xFF, 0x00, 0x00)
#define PIXEL_GREEN PIXEL24(0x00, 0xFF, 0x00)
#define PIXEL_BLUE  PIXEL24(0x00, 0x00, 0xFF)
#define DISPLAY_WIDTH	480
#define DISPLAY_HEIGHT	272

int x_global = 0;
int y_global = 0;
int x_rot = 0;
int y_rot = 0;

void vid_set_pixel(int x, int y, int colour)
{
	// derive a pointer to the framebuffer described as 16 bit integers
	volatile short *framebuffer = (volatile short *) (AVALON_BASE + FRAMEBUFFER_BASE);
	// make sure we don't go past the edge of the screen
	if ((x<0) || (x>DISPLAY_WIDTH-1))
		return;
	if ((y<0) || (y>DISPLAY_HEIGHT-1))
		return;
	framebuffer[x+y*DISPLAY_WIDTH] = colour;
}

void reset()
{
	for (int x = 0;  x < DISPLAY_WIDTH; x++ ){
		for (int y = 0; y < DISPLAY_HEIGHT; y++){
			vid_set_pixel(x,y,PIXEL_BLACK);
		}
	}
}

void handle_x(int new_x)
{
	int differential = new_x - x_rot;
	if (differential == 255 || differential == -1 )
	{
		// decrement
		x_global -= 1;
		while (x_global < 0)
		{
			x_global += DISPLAY_WIDTH;
		}

	}
	else if (differential = 1 || differential == -255)
	{
		// increment
		x_global += 1;
		while (x_global >= DISPLAY_WIDTH)
		{
			x_global -= DISPLAY_WIDTH;
		}
	}
	x_rot = new_x;
}

void handle_y(int new_y)
{
	int differential = new_y - y_rot;
	if (differential == 255 || differential == -1 )
	{
		// decrement
		y_global -= 1;
		while (y_global < 0)
		{
			y_global += DISPLAY_HEIGHT;
		}

	}
	else if (differential = 1 || differential == -255)
	{
		// increment
		y_global += 1;
		while (y_global >= DISPLAY_HEIGHT)
		{
			y_global -= DISPLAY_HEIGHT;
		}
	}
	y_rot = new_y;
}

int get_reset(){
	short buttons = avalon_read(AVALON_BASE + PIO_BUTTONS);
	int left_click = buttons & (1<<15);
	int right_click = buttons & (1<<14);
	return (left_click || right_click)? 1:0;
}

void main()
{
	while (true){
		handle_x(avalon_read(AVALON_BASE + PIO_ROTARY_L));
		handle_y(avalon_read(AVALON_BASE + PIO_ROTARY_R));
		vid_set_pixel(x_global, y_global, PIXEL_WHITE);
		if (get_reset)
		{
			reset();
		}
	}
}

