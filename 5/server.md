# ECE 4730: Embedded Systems II
### _Project 5: Kernel Module Development_

***



## Objectives
- Create an utilize a **Makefile**
- Create and run a **kernel module**
- Use virtual addresses to access **physical addresses** (locations)

## Deliverables
- 6   `Hello.ko`
- 9   `Multiply.ko`
- 10  Answers to in-lab questions
Total: 25

## Hints
- _Save a copy of all files on the SD card in an easily-accessible place on your computer. If there are mounting problems, format it and replace the files._
- _In Windows, `Win + Shift + S` captures a selected area of the screen; if you've made it this far in Windows without knowing that, I **deeply** lament your loss_

## Procedure

#### Part 1 - Exploration
###### I) The Ramdisk Filesystem
1. Boot Linux on the Zybo Z7-10 and connect to it on PuTTY.
2. _Change directory_ to any directory (i.e. `cd /mnt`, just not `/dev`) and _list_ its contents (`ls`). 
- [**What do your elf eyes see?**](https://www.youtube.com/watch?v=pLj1jyLQKWM) _(worth it, I promise)_
3. _Create_ a new file (`touch newfile`) and _list_ the directory's contents once more (`ls`). **What changed?**
4. Reset the processor using the `SRST` button (found by the always-on LEDs).
5. Return to the directory we wrote the file in and _list_ its contents. 
- **Is the file still there?**

###### II) The SD Card
1. Boot Linux on the Zybo Z7-10 and connect to it on PuTTY.
2. Once inside the Zybo terminal, _mount_ the SD card to the `/mnt` _directory_ with the following command:
```
mount /dev mmcblk0p1 /mnt/
```
3. _Change directory_ to the newly-mounted device (`cd /mnt`) and _list_ its contents (`ls`). 
- [**What do your elf eyes see?**](https://www.youtube.com/watch?v=_hW_cSGunh8) (_still worth it)_
4. _Create_ a new file (`touch newfile`) and _list_ the directory's contents once more (`ls`). **What changed?**
5. _Change Directory_ back to `root` (`cd /`), then _unmount_ the SD card (`umount /mnt`).
- ***ALWAYS DO THIS VEFORE EJECTING THE SD CARD OR POWERING OFF***
6. Reset the processor using the `SRST` button (found by the always-on LEDs). Remount the SD card (`mount /dev mmcblk0p1 /mnt/`).
7. Return to `/mnt` and _list_ its contents (`ls`).
- [**What do your elf eyes see?**](https://www.youtube.com/watch?v=m4gnMWua4xo) _(Ok, don't waste your time on this one.)_
- **What was the difference between file `I` and file `II`?**
- **Why do you think they did (or didn't) perservere a reboot?**

#### Part 2 - Your First Kernel Module (`hello.ko`)
1. Create a new folder (lab5modules) on the server and copy hello.c, multiply.c, and Makefile (from `torials/5`) into it. (make sure there is a `\t` in all indented spaces)
2. Edit the Makefile with the following adjustments: (`\t` represents the "Tab" character)
- Ensure the document follows the following format _(I cushioned the `\t` with a `' '` for **readability**, don't include the `' '`)
```
file.o: \t file.c
foobers ...
all:
\t make -C ...
clean:
\t make -C ...
```
- Ensure `foobers` (Worst variable name ever, I know.) contains the **path** to the post-compiled linux directory _(hopefully `~/labs/os/linux`)_
- Ensure the `file.c` does _not_, in fact, say `file.c`, but something useful, like `hello.c`, or whatever file you hope to compile into a **kernel module**
3. _Make_ the `*.c` file by entering the following command:
```
make ARCH=arm CROSS_COMPILE=arm-none-eabi-
```
_`hello.ko` should appear in that directory upon completion._

4. Place `hello.ko` on your SD card.
5. Eject it, then place the SD card in the Zybo and _mount_ it (`mount /dev mmcblk0p1 /mnt/`).
6. _Change directory_ to the newly-mounted SD card and _list_ its contents; verify that `hello.ko` is present.
7. Insert the **kernel object module** (`insmod hello.ko`).
8. Run `dmesg | tail` to see the kernel's loading output. Screnshot the output and attach it to your report. _(see the "Hints" section for screnshotting help)_
9. To remove the inserted module, run the following commands:
```
mkdir /lib/modules/`uname -r` # "`" != "'", it's above Tab
rmmod hello                   # removes the module
lsmod                         # verifies module removal
```
- the "\`" character runs the enclosed command _first_, and places the command's _output_ as an argument.
- `uname -r` returns the kernel's current name and version; it's necessary for safe module dismantling.

#### Part 3 - Your turn (`multiply.ko`, memory mapping)
1. Return to the server and create a new folder to create your new multiply module (multiply), and place multiply.c and Makefile in it.
2. Verify that the path to the Linux kernel directory (in the newly copied Makefile) remains unchanged, and modify it to compile multiply.c.
3. In your sdk folder (Xilinx, project 4), find ‘xparameters.h’ and ‘xparameters_ps.h’ and copy them to your newly-made multiply module directory.
4. Edit the code in multiply.c to compile and run correctly. Consult Linux Device [Drivers, 3rd Edition](https://lwn.net/Kernel/LDD3/), [chapter 2](https://static.lwn.net/images/pdf/LDD3/ch02.pdf) for tips.
5. Once compiled, run the kernel module `multiply.ko` on the Zybo; screenshot the output and place it in the report.
- What is your computer's mount point for the SD card?
- If we changed `hello.c` to `goodbye.c`, what would we need to change in the `Makefile`?
