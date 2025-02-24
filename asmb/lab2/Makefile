CFLAGS= -f elf32
LFLAGS= -m elf_i386

all: lab2

lab2: lab2.o lib.o
	 ld $(LFLAGS) lab2.o lib.o -o lab2

lab2.o: lab2.asm
	 nasm $(CFLAGS) lab2.asm -o lab2.o

lib.o: lib.asm
	 nasm $(CFLAGS) lib.asm -o lib.o

clean:
	rm -f lab2.o lib.o lab2

.INTERMEDIA: lab2.o

