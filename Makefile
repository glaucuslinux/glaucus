all: toolchain chroot

toolchain:
	time dash scripts/$@/run.sh

chroot:
	time dash scripts/$@/run.sh

system:
	time dash scripts/$@/run.sh

release:
	time dash scripts/$@

clean:
	time dash scripts/$@

.PHONY: toolchain
