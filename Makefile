export GLAD=$(PWD)

export BAKD=$(GLAD)/backup
export CERD=$(GLAD)/cerata
export LOGD=$(GLAD)/logs
export SCRD=$(GLAD)/scripts
export SRCD=$(GLAD)/sources
export TMPD=$(GLAD)/temporary
export TLCD=$(GLAD)/toolchain

export TOOL=/toolchain

export CCCH=/usr/lib64/ccache

export PATH=$(TOOL)/bin/ccache:$(TOOL)/bin:$(CCCH):/usr/bin

export AUTORECONF=autoreconf -vfis
export CHMOD=chmod -Rv
export CHOWN=chown -Rv
export LN=ln -fnsv
export MAKE=make \
	V=1
export MKDIR=$(shell which install) -dv
export MV=mv -v
export RM=rm -frv
export RSYNC=rsync -vaHAXSx
export UMOUNT=umount -fRv

export MAKEFLAGS=-j1

all: toolchain chroot

initialize:
	time scripts/$@

toolchain:
	time scripts/$@/run

chroot:
	time scripts/$@/run

system:
	time scripts/$@/run

release:
	time scripts/$@

clean:
	time scripts/$@

distclean:
	time scripts/$@
	$(RM) $(BAKD)
	$(RM) $(LOGD)
	$(RM) $(SRCD)
	$(RM) $(TMPD)
	$(RM) $(TOLD)

restore restore-toolchain: clean
ifneq ($(wildcard $(BAKD)/toolchain/*),)
	sudo \
		$(RSYNC) $(BAKD)/toolchain/ $(GLAD)/toolchain --delete
else
	@echo Please construct the toolchain first!
	@exit 1
endif

restore-chroot: clean
ifneq ($(wildcard $(BAKD)/chroot/*),)
	sudo \
		$(RSYNC) $(BAKD)/chroot/ $(GLAD)/toolchain --delete
else
	@echo Please construct the chroot first!
	@exit 1
endif

enter enter-chroot: restore-chroot
	. $(SCRD)/chroot/variables
	. $(SCRD)/chroot/root
	. $(SCRD)/chroot/vkfs
	. $(SCRD)/chroot/resolv
	. $(SCRD)/system/check
	. $(SCRD)/chroot/enter

.PHONY: toolchain
