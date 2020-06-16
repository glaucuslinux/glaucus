export GLAD=$(PWD)

export BAKD=$(GLAD)/backup
export CERD=$(GLAD)/cerata
export LOGD=$(GLAD)/logs
export SCRD=$(GLAD)/scripts
export SRCD=$(GLAD)/sources
export SYSD=$(GLAD)/system
export TMPD=$(GLAD)/temporary
export TLCD=$(GLAD)/toolchain

export PATH=$(TLCD)/bin:/usr/bin

export PKG_CONFIG_PATH=$(SYSD)/usr/lib/pkgconfig:$(SYSD)/usr/share/pkgconfig
export PKG_CONFIG_LIBDIR=$(SYSD)/usr/lib/pkgconfig:$(SYSD)/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=$(SYSD)
export PKG_CONFIG_SYSTEM_INCLUDE_PATH=$(SYSD)/usr/include
export PKG_CONFIG_SYSTEM_LIBRARY_PATH=$(SYSD)/usr/lib

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

export MAKEFLAGS=-j1

all: toolchain system

initialize:
	@scripts/$@
	@$(SCRD)/contact "$@ complete"

update:
	@scripts/$@
	@$(SCRD)/contact "$@ complete"

toolchain:
	@scripts/$@/run
	@$(SCRD)/contact "$@ complete"

release:
	@scripts/$@
	@$(SCRD)/contact "$@ complete"

chroot: restore-toolchain
	@scripts/$@/run
	@$(SCRD)/contact "$@ complete"

system: restore-toolchain
	@$(SCRD)/contact
	@scripts/$@/run
	@$(SCRD)/contact "$@ complete"

img:
	@sudo \
		scripts/system/$@
	@$(SCRD)/contact "$@ complete"

clean:
	@scripts/$@
	@$(SCRD)/contact "$@ complete"

distclean:
	@scripts/$@
	@$(RM) $(BAKD)
	@$(RM) $(LOGD)
	@$(RM) $(SRCD)
	@$(RM) $(TMPD)
	@$(RM) $(TOLD)
	@$(SCRD)/contact "$@ complete"

restore restore-toolchain: clean
ifneq ($(wildcard $(BAKD)/toolchain/*),)
	@$(SCRD)/contact
	@$(RSYNC) $(BAKD)/toolchain/ $(GLAD)/toolchain --delete
	@$(SCRD)/contact "$@ complete"
else
	@$(SCRD)/contact "$@ Please construct the toolchain first!"
	@echo 	@exit 1
endif

restore-chroot: clean
ifneq ($(wildcard $(BAKD)/chroot/*),)
	@sudo \
		$(RSYNC) $(BAKD)/chroot/ $(GLAD)/toolchain --delete
	@$(SCRD)/contact "$@ complete"
else
	@$(SCRD)/contact "$@ Please construct the chroot first!"
	@exit 1
endif

enter enter-chroot: restore-chroot
	@$(SCRD)/contact
	@. $(SCRD)/chroot/variables
	@. $(SCRD)/chroot/root
	@. $(SCRD)/chroot/vkfs
	@. $(SCRD)/chroot/resolv
	@. $(SCRD)/system/check
	@. $(SCRD)/chroot/enter
	@$(SCRD)/contact "$@ complete"

.PHONY: toolchain
