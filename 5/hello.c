/*  hello.c − Hello World kernel module*   
Demonstrates module initialization, module release and printk.*   
(Adapted from various example modules including those found in the*   
Linux Kernel Programming Guide, Linux Device Drivers book and*   
FSM’s device driver tutorial)
*/

#include <linux/module.h>    /* Needed by all modules */
#include <linux/kernel.h>    /* Needed for KERN_* and printk */
#include <linux/init.h>      /* Needed for init and exit macros */

/*  This function is run upon module load. This is where you set up data
	structures and reserve resources used by the module. */

static int __init my_init(void) {
	printk(KERN_INFO "Hello, world!\n");	/* Linux kernel’s version of printf */
	return 0;			// A non 0 return meansinit_module failed; module can’t be loaded.
}



/*  This function is run just prior to the module’s removal from the
	system. You should release ALL resources used by your module
	here (other wise be prepared for a reboot). */

static void __exit my_exit(void) 
{
	printk(KERN_ALERT "Goodbye, world!\n");
}



/*These define info that can be displayed by mod info*/
MODULE_LICENSE("GPL");
MODULE_AUTHOR("ECE 4730 Student (and others)");
MODULE_DESCRIPTION("Simple Hello World Module");

/*  Here we define which functions we want to use for initialization
	and cleanup */
module_init(my_init);
module_exit(my_exit);