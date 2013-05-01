all:
	make blink
blink:
	avr-gcc -mmcu=atmega328p -Wall -Os -o blink.elf blink.c
	avr-objcopy -j .text -j .data -O ihex blink.elf blink.hex
install:
	avrdude -p m328p -c usbtiny -e -U flash:w:blink.hex
clean:
	rm -rf *.elf *.hex
