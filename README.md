#INTRO
This is a simple makefile that will download and make the avr development environment (which you can use to program arduino avr boards for example) on a linux machine. 

After running the script you will be able to compile avr programs and upload them into your avr microcontroller using one of the openly available programming units that you can buy online. 

What else you will need: an avr microcontroller, board to mount the microcontroller and wire it to DC power supply, a USB programmer to connect your MCU to the PC. 

This is a good starting point on how to wire your MCU to compile and test the simple blink.c program provided in this package:
http://www.micahcarrick.com/tutorials/avr-microcontroller-tutorial/getting-started.html

#INSTALLATION
Checkout the scripts using "git clone https://github.com/martinvolk/AVR-GCC.git". Then cd into the AVR-GCC directory and issue "make". 

This will download, make and install avr binutils, avr-gcc toolchain and avr-libc on your machine. 

#USAGE
Compile avr program: 
- compile the program into elf
avr-gcc -mmcu=atmega328p -Wall -Os -o code.elf code.c
- create hex file compatible with avr programmers
avr-objcopy -j .text -j .data -O ihex blink.elf blink.hex

Upload the avr program to the chip: 
- use avrdude and the usbtiny programmer to flash the chip with the resulting hex firmware. 
avrdude -p m328p -c usbtiny -e -U flash:w:blink.hex

See examples folder for example usage. 
