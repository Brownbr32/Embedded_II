#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int fd; //file descriptor
	char input = 0;
	int strLen = 7;
	char strIn[strLen];
	char strOut[strLen];
       	strcpy(strIn,"hello!\0");
	//open device file for reading and writing
	//user open to open 'dev/multiplier'/
	fd = open("/dev/my_chardev_mem", O_RDWR);
	
	//handle error opening file
	if (fd == -1) {
		printf("Failed to open device file!\n");
		return -1;
	}
	
	write(fd, strIn, strLen);
	read(fd, strOut, strLen);			
	printf("Input: %s\n\tOutput: %s\nAre they the same?\n\n", strIn, strOut);
	printf("Try the following commands as well:\n");
	printf("\t' echo string_here > /dev/my_chardev_mem '\n");
	printf("\t' cat /dev/my_chardev_mem '\n");
	
	close(fd);

	return 0;
}
