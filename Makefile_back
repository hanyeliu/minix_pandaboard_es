INC=-I/home/junzhe/git/obj.evbearm-el/destdir.evbearm-el/usr/include 
LIB=-L/home/junzhe/git/obj.evbearm-el/destdir.evbearm-el/lib
FLAGS=-D__minix

uImage: kernel.bin
		mkimage -A arm -n junzhez -C none -T kernel -d kernel.bin -a 0x82000000 -e 0x82000040 -n junzhez uImage	

kernel.bin: kernel.elf
		arm-none-linux-gnueabi-objcopy kernel.elf -O binary kernel.bin		

kernel.elf: kernel/arch/earm/head.S kernel/arch/earm/kernel.lds pre_init.o omap_serial.o pg_utils.o
		arm-none-linux-gnueabi-gcc -W -Wall -Werror $(LIB) $(INC) $(FLAGS) kernel/arch/earm/head.S pre_init.o omap_serial.o pg_utils.o -T kernel/arch/earm/kernel.lds -o kernel.elf -nostdlib -nostartfiles

omap_serial.o: kernel/arch/earm/omap_serial.c
		arm-none-linux-gnueabi-gcc -W -Wall -Werror $(LIB) $(INC) $(FLAGS) -c kernel/arch/earm/omap_serial.c

pre_init.o: kernel/arch/earm/pre_init.c
		arm-none-linux-gnueabi-gcc -W -Wall -Werror $(LIB) $(INC) $(FLAGS) -c kernel/arch/earm/pre_init.c

pg_utils.o: kernel/arch/earm/pg_utils.c
		arm-none-linux-gnueabi-gcc -W -Wall -Werror $(LIB) $(INC) $(FLAGS) -c kernel/arch/earm/pg_utils.c

clean:
	rm -rf *.o kernel.elf kernel.bin uImage
