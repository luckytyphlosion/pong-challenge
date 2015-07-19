#gawk sort order
#export LC_CTYPE=C

.SUFFIXES: .asm .o .gb

all: pong.gb

pong.o: pong.asm
	rgbasm -p 0xff -o pong.o pong.asm

pong.gb: pong.o
	rgblink -n pong.sym -o $@ $<
	rgbfix -p 0x00 -jv -k OK -l 0x33 -m 0x03 -p 0 -r 0 -t "PONG" $@

clean:
	rm -f pong.o pong.gb