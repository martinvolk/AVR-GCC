BINUTILS=binutils-2.23
GCC=gcc-4.8.0
MPC=mpc-1.0.1
MPFR=mpfr-3.1.2
LIBC=avr-libc-1.8.0
all:
	if [ ! -f $(BINUTILS).tar.gz ]; then wget http://ftp.gnu.org/gnu/binutils/$(BINUTILS).tar.gz; fi
	if [ ! -f $(GCC).tar.gz ]; then wget http://mirror.sdunix.com/gnu/gcc/$(GCC)/$(GCC).tar.gz; fi
	if [ ! -f $(MPC).tar.gz ]; then wget http://mirror.sdunix.com/gnu/mpc/$(MPC).tar.gz; fi
	if [ ! -f $(MPFR).tar.gz ]; then wget http://mirror.sdunix.com/gnu/mpfr/$(MPFR).tar.gz; fi
	if [ ! -f $(LIBC).tar.bz2 ]; then wget http://download.savannah.gnu.org/releases/avr-libc/$(LIBC).tar.bz2; fi
	for i in *.tar.gz; do tar -xzf "$$i"; done
	bunzip2 $(LIBC).tar.bz2 && tar xf $(LIBC).tar
	mv $(MPC) $(GCC)/mpc
	mv $(MPFR) $(GCC)/mpfr
	mkdir avr-gcc
	cd $(BINUTILS) && ./configure --target=avr --program-prefix="avr-" && make && sudo make install
	cd ../avr-gcc/ && ../$(GCC)/configure --target=avr --enable-languages=c --disable-libssp && make && sudo make install
	cd ../$(LIBC) && ./configure --host=avr && make && sudo make install
	sudo apt-get install avrdude
