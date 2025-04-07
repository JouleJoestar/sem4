CFLAGS= -f elf32
LFLAGS= -m elf_i386

all: rk2

rk2:  rk2.o lib.o
	 ld $(LFLAGS) rk2.o lib.o -o rk2

rk2.o: rk2.asm
	 nasm $(CFLAGS) rk2.asm -o rk2.o

lib.o: lib.asm
	 nasm $(CFLAGS) lib.asm -o lib.o

clean:
	rm -f rk2.o lib.o rk2

.INTERMEDIA: rk2.o

