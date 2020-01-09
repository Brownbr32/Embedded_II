obj-m += multiply.o
foobers := ../linux-v2019.1	# verify this is the path to the kernel source directory
all:
	make -C $(foobers) M=$(PWD) modules
clean:
	make -C $(foobers) M=$(PWD) clean