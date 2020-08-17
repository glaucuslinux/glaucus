all: toolchain cross

initialize:
	@scripts/$@

update:
	@scripts/$@

toolchain:
	@scripts/$@/run

release:
	@scripts/$@

chroot: restore-toolchain
	@scripts/$@/run

cross: restore-toolchain
	@scripts/$@/run

img:
	@sudo \
		scripts/cross/$@

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
	@$(RSYNC) $(BAKD)/toolchain $(GLAD) --delete
else
	@echo 	@exit 1
endif

restore-chroot: clean
ifneq ($(wildcard $(BAKD)/chroot/*),)
	@sudo \
		$(RSYNC) $(BAKD)/chroot $(GLAD) --delete
else
	@exit 1
endif

enter enter-chroot: restore-chroot
	@. $(SCRD)/chroot/variables
	@. $(SCRD)/chroot/root
	@. $(SCRD)/chroot/vkfs
	@. $(SCRD)/chroot/resolv
	@. $(SCRD)/cross/check
	@. $(SCRD)/chroot/enter

.PHONY: toolchain
