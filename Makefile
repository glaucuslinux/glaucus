all: toolchain cross

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

cross: restore-toolchain
	@$(SCRD)/contact
	@scripts/$@/run
	@$(SCRD)/contact "$@ complete"

img:
	@sudo \
		scripts/cross/$@
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
	@$(RSYNC) $(BAKD)/toolchain $(GLAD) --delete
	@$(SCRD)/contact "$@ complete"
else
	@$(SCRD)/contact "$@ Please construct the toolchain first!"
	@echo 	@exit 1
endif

restore-chroot: clean
ifneq ($(wildcard $(BAKD)/chroot/*),)
	@sudo \
		$(RSYNC) $(BAKD)/chroot $(GLAD) --delete
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
	@. $(SCRD)/cross/check
	@. $(SCRD)/chroot/enter
	@$(SCRD)/contact "$@ complete"

.PHONY: toolchain
