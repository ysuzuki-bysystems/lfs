stamps := .stamps

c1 := 1.Introduction
c2 := 2.Preparing_the_Host_System
c3 := 3.Packages_and_Patches
c4 := 4.Final_Preparations
c5 := 5.Compiling_a_Cross-Toolchain
c6 := 6.Cross_Compiling_Temporary_Tools
c7 := 7.Entering_Chroot_and_Building_Additional_Temporary_Tools
c8 := 8.Installing_Basic_System_Software
c9 := 9.System_Configuration
c10 := 10.Making_the_LFS_System_Bootable
c11 := 11.The_End


.PHONY: all

all: lfs.image

lfs.image: $(stamps)/$(c11)
	sudo ./lfs-chroot rm -rf /etc/fstab
	sudo systemd-repart --definitions=repart.d --root=$(LFS) --empty=create --size=10G --generate-fstab=/etc/fstab --json=short $@ | tee repart-out.json
	-sudo ./setup-grub-cfg %@ repart-out.json # TODO

$(stamps)/%:
	test -n "$(LFS)"
	mkdir -p $(dir $@)
	$(MAKE) -C $(@:$(stamps)/%=%)
	touch $@

$(stamps)/$(c1):
$(stamps)/$(c2): $(stamps)/$(c1)
$(stamps)/$(c3): $(stamps)/$(c2)
$(stamps)/$(c4): $(stamps)/$(c3)
$(stamps)/$(c5): $(stamps)/$(c4)
$(stamps)/$(c6): $(stamps)/$(c5)
$(stamps)/$(c7): $(stamps)/$(c6)
$(stamps)/$(c8): $(stamps)/$(c7)
$(stamps)/$(c9): $(stamps)/$(c8)
$(stamps)/$(c10): $(stamps)/$(c9)
$(stamps)/$(c11): $(stamps)/$(c10)
