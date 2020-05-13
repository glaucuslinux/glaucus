all: toolchain chroot

toolchain:
	time scripts/$@/run

chroot:
	time scripts/$@/run

system:
	time scripts/$@/run

initialize:
	time scripts/$@

release:
	time scripts/$@

clean:
	time scripts/$@

.PHONY: toolchain
