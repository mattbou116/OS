CC=gcc
CFLAGS=-g

mysh: shell.c interpreter.c
	# when working on segmenatation of processes
	# $(CC) $(CFLAGS) -D FRAME_STORE_SIZE=$(framesize) -D VAR_STORE_SIZE=$(varmemsize) -c shell.c interpreter.c
	$(CC) $(CFLAGS) -c shell.c interpreter.c
	$(CC) $(CFLAGS) -o mysh shell.o interpreter.o

clean: 
	rm $OS/env/mysh; rm $OS/src/*.o
