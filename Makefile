PARALLEL = $(or $(P),$(PARALLEL))
VERBOSE = $(or $(V),$(VERBOSE))

export GLAD=$(PWD)

export BAKD=$(GLAD)/backup
export CERD=$(GLAD)/cerata
export LOGD=$(GLAD)/logs
export SCRD=$(GLAD)/scripts
export SRCD=$(GLAD)/sources
export TMPD=$(GLAD)/temporary
export TOLD=$(GLAD)/toolchain

export TOOL=/toolchain

export CCCH=/usr/lib64/ccache

export PATH=$(TOOL)/bin/ccache:$(TOOL)/bin:$(CCCH):/usr/bin

ifneq ($(V),)
	export AUTORECONF=autoreconf -fis
	export CHMOD=chmod -R
	export CHOWN=chown -R
	export LN=ln -fs
	export MAKE=make
	export MKDIR=install -d
	export MV=mv
	export RM=rm -fr
	export RSYNC=rsync -aHAXSx
	export UMOUNT=umount -fR
else
	export AUTORECONF=autoreconf -vfis
	export CHMOD=chmod -Rv
	export CHOWN=chown -Rv
	export LN=ln -fsv
	export MAKE=make \
		V=1
	export MKDIR=/usr/bin/install -dv
	export MV=mv -v
	export RM=rm -frv
	export RSYNC=rsync -vaHAXSx
	export UMOUNT=umount -fRv
endif

#ifneq ($(P),)
#	export MAKEFLAGS=$(printf "%.0f\n" $(echo "$(nproc) * 1.5" | bc))
#	@echo Using multiple cores $(MAKEFLAGS)...
#else
#	export MAKEFLAGS=-j1
#	@echo Using a single core...
#endif

all: toolchain chroot

initialize:
	time scripts/$@

toolchain:
	time scripts/$@/run

chroot:
	time scripts/$@/run

system:
	export PATH=/usr/bin/ccache:/usr/bin:/bin:$(TOOL)/bin/ccache:$(TOOL)/bin
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

enter-chroot:
	dash -eux /home/glaucus/scripts/chroot/chroot

.PHONY: toolchain
