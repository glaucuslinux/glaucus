all: toolchain chroot

toolchain:
	time dash -e scripts/$@/run

chroot:
	time dash -e scripts/$@/run

system:
	time dash -e scripts/$@/run

initialize:
	time dash -e scripts/$@

release:
	time dash -e scripts/$@

clean:
	time dash -e scripts/$@

.PHONY: toolchain
