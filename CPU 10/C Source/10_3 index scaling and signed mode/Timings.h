#include <time.h>
struct timeval begin;
struct timeval end;


void start_running(void){
		printf("______________________ running ______________________\n");
		gettimeofday(&begin,NULL); //uses this to work out running time
}

void start_running_debug(void){
	printf("______________________ running Debug ______________________\n");
	gettimeofday(&begin,NULL);
}

void get_running_stats(void){
		gettimeofday(&end,NULL);
		long seconds_elapsed = (end.tv_sec - begin.tv_sec); //calculates running time
		long useconds_elapsed = end.tv_usec - begin.tv_usec;  //microseconds
		double time_elapsed = (double)seconds_elapsed + ((double)useconds_elapsed)/1000000;
		double instructions_per_second = count/time_elapsed;  //speed of operation
		printf("\n______________________ Execution halted ______________________\n");
		printf("executed %u instructions in ",count);
		printf("%lf seconds ", time_elapsed);
		if (time_elapsed > 0.0001){
			printf("at %lf ips\n", instructions_per_second);
		}
}