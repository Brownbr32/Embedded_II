obj-m += my_chardev_mem.o
foobers := ~/linux		# verify this is the path to the kernel source directory
all:
	make -C $(foobers) M=$(PWD) modules | tee ./tmpDebug/all.txt
clean:
	make -C $(foobers) M=$(PWD) clean | tee ./tmpDebug/clean.txt
	rm ~/linux/lib/modules.order 
