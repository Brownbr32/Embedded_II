#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
	unsigned int result, read_i, read_j;
	int fd; //file descriptor
	int i, j; //loop variables
	char input = 0;
	// add buffers here

	//open device file for reading and writing
	//user open to open 'dev/multiplier'/
	
	//handle error opening file
	if (fd == -1) {
		printf("Failed to open device file!\n");
		return -1;
	}
	
	while (input != 'q') { //continue until user decides to quit
		for (i = 0; i <= 16; i++) {
			for (j = 0; j <= 16; j++) {
				// use write() to write i and j to peripheral
				// use read() to read i, j, and result from peripheral
				
				// print unsigned ints to screen
				printf("%u * %u = %u\n", read_i, read_j, result);

				// validate result:
				if (result == (i * j)) {
					printf("Result Correct!\n");
				}
				else {
					printf("Result Incorrect!\n");
				}
			}
		}
		//read from terminal
		input = getchar();
	}
	close(fd);
	return 0;
}