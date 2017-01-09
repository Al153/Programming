//______ Timing fns (not necessary for CPU logic) ___________

//______ Timing variables _____
struct timeval begin;
struct timeval end;
long seconds_elapsed;
long useconds_elapsed;
double time_elapsed;
double instructions_per_second;
uint64_t count = 0;

void doStart(void){
	printf("______________________ running ______________________\n");
	gettimeofday(&begin,NULL); //uses this to work out running time
}

void doStartDebug(void){
	printf("______________________ running Debug ______________________\n");
	gettimeofday(&begin,NULL);
}


void doEnd(void){
	gettimeofday(&end,NULL);
	seconds_elapsed = end.tv_sec - begin.tv_sec; //calculates running time
	useconds_elapsed = end.tv_usec - begin.tv_usec;  //microseconds

	time_elapsed =  (double)(seconds_elapsed) + ((double)useconds_elapsed)/1000000.0;

	instructions_per_second = ((double)(count))/time_elapsed;  //speed of operation
	printf("\n______________________ Execution halted ______________________\n");
	printf("executed %u instructions in ",count);
	printf("%f seconds ", time_elapsed);
	if (time_elapsed > 0.0001){
		printf("at %f ips\n", instructions_per_second);
	}

}
