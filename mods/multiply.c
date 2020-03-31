#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_* and printk */
#include <linux/init.h>/* Needed for init and exit macros */
#include <asm/io.h>/* Needed for IOreads and writes */
#include "~/lab6/mods/multiply.h"/* Needed for physical address of multiplier */

/*  
This function is run upon module load. This is where you set up data
structures and reserve resources used by the module. */
static int __init my_init(void)
{
	/*  Linux kernel’s version of printf */
	printk(KERN_INFO "Mapping virtual address...\n");
	/*  map virtual address to multiplier physical address */
	virt_addr = ioremap(PHY_ADDR, MEMSIZE);

	// NEW stuff
  	Major = register_chrdev(0, DEVICE_NAME, &fops);




	// end of NEW stuff

	/*  write 7 to register 0 */
	printk(KERN_INFO "Writing a 7 to register 0\n");
	iowrite32(7, virt_addr+0); //base address + offset
	iowrite32(2, virt_addr+4);
	/*  Write 2 to register 1 */
	printk(KERN_INFO"Writing a 2 to register 1\n"); 
	//use iowrite32
	
	printk("Read %d from register 0\n", ioread32(virt_addr+0));
	printk("Read %d from register 1\n", ioread32(virt_addr+4));
	printk("Read %d from register 2\n", ioread32(virt_addr+8));
	//A non 0 return means init_module failed; module can’t be loaded.
	return 0;
}

/*  
This function is run just prior to the module’s removal from the
system. You should release ALL resources used by your module 
here (otherwise be prepared for a reboot). */
static void __exit my_exit(void) 
{
	printk(KERN_ALERT "unmapping virtual address space....\n");
	iounmap((void*)virt_addr);
}
	
	
	
	
/*  These define info that can be displayed by mod info */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("ECE 4730 Student(and others)");
MODULE_DESCRIPTION("Simple multiplier module");




/*  Here we define which functions we want to use for initializationand cleanup */
module_init(my_init);
module_exit(my_exit);
