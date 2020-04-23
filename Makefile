all: toolchain chroot

toolchain:
	time dash scripts/$@/run.sh

chroot:
	time dash scripts/$@/run.sh

system:
	time dash scripts/$@/run.sh

clean:
	time dash scripts/$@.sh

.PHONY: toolchain
