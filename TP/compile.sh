#!/bin/sh
set -e
NAME="tp2b"
PORT=/dev/ttyUSB0
rm -f $NAME.o $NAME.bin $NAME.hex
xc32-as -O0 -o $NAME.o $NAME.s
xc32-gcc -T ldscript.ld -o $NAME.bin \
$NAME.o
xc32-objcopy -O ihex $NAME.bin $NAME.hex
avrdude -C avrdude.conf -p pic32-360 -c \
stk500 -P $PORT -U flash:w:$NAME.hex
