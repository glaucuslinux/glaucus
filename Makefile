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

export PATH=$(TOOL)/bin/ccache:$(TOOL)/bin:$(TOOL)/lib/gcc:$(CCCH):/usr/bin

export AUTORECONF=autoreconf -fis
export CHMOD=chmod -R
export CHOWN=chown -R
export LN=ln -fns
export MAKE=make
export MKDIR=$(shell which install) -d
export MV=mv
export RM=rm -fr
export RSYNC=rsync -aHAXSx
export UMOUNT=umount -fqR

export MAKEFLAGS=-j12

all: toolchain chroot

initialize:
	@scripts/$@

toolchain:
	@scripts/$@/run

chroot:
	@scripts/$@/run

system:
	@scripts/$@/run

release:
	@scripts/$@

clean:
	@scripts/$@

distclean:
	@scripts/$@
	@$(RM) $(BAKD)
	@$(RM) $(LOGD)
	@$(RM) $(SRCD)
	@$(RM) $(TMPD)
	@$(RM) $(TOLD)

restore restore-toolchain: clean
ifneq ($(wildcard $(BAKD)/toolchain/*),)
	@sudo \
		$(RSYNC) $(BAKD)/toolchain/ $(GLAD)/toolchain --delete
else
	@echo Please construct the toolchain first!
	@exit 1
endif

restore-chroot: clean
ifneq ($(wildcard $(BAKD)/chroot/*),)
	@sudo \
		$(RSYNC) $(BAKD)/chroot/ $(GLAD)/toolchain --delete
else
	@echo Please construct the chroot first!
	@exit 1
endif

enter enter-chroot: restore-chroot
	@. $(SCRD)/chroot/variables
	@. $(SCRD)/chroot/root
	@. $(SCRD)/chroot/vkfs
	@. $(SCRD)/chroot/resolv
	@. $(SCRD)/system/check
	@. $(SCRD)/chroot/enter

.PHONY: toolchain
