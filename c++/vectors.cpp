#include <stdio.h>

#include <stdlib.h>
#include <time.h>




struct Vector {
	float x;
	float y;
	float z;
	float w;
};

float rand_float()
{
	// 0.0 to 1.0
	return float((float)rand() / (float)RAND_MAX );
}

void vectable(unsigned int runs)
{
	
	Vector data[1024];

	for (int i = 0; i < 1024; ++i) {
		data[i].x = rand_float();
		data[i].y = rand_float();
		data[i].z = rand_float();
		data[i].w = rand_float();
	}

	int start = clock();

	
	double total = 0;
	double dot = 0;

	for (unsigned int i = 0; i < runs; ++i) {
		for (int j = 0; j < 1023; ++j) {
			dot = (data[j].x * data[j+1].x) + (data[j].y * data[j+1].y) + (data[j].z * data[j+1].z) + (data[j].w * data[j+1].w);
			total += dot;
		}
	}
	int end = clock();

	int cycles = end-start;

	float seconds = (double)cycles / CLOCKS_PER_SEC;
	printf("took %f seconds.  total: %f\n", seconds, total);
}



int main(int argc, char *argv[])
{
    
	unsigned int runs = 20000;
	printf("Runs: %i \n", runs);
	for (int i = 0; i < 5; ++i) {
		vectable(runs);
	}
	return 0;
}