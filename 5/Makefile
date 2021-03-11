obj-m += hello.o
foobers := ~/linux		# verify this is the path to the kernel source directory
all:
	make -C $(foobers) M=$(PWD) modules | tee ./tmpDebug/all.txt
clean:
	make -C $(foobers) M=$(PWD) clean | tee ./tmpDebug/clean.txt
