CFLAGS= -f elf32
LFLAGS= -m elf_i386

all: lab

lab: lab.o
	ld $(LFLAGS) lab.o -o lab

lab.o: lab.asm
	nasm $(CFLAGS) lab.asm -o lab.o

clean:
	rm -f lab1.o lab1
        
.INTERMEDIA: lab.o
