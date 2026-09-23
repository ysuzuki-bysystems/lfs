tarball := lfs/sources/linux-7.1.8.tar.xz
srcdir := lfs/sources/linux
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make modules_install
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -iv arch/x86/boot/bzImage /boot/vmlinuz-7.2.6-lfs-r13.1-11 
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -iv System.map /boot/System.map-7.2.6
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -iv .config /boot/config-7.2.6
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -r Documentation -T /usr/share/doc/linux-7.2.6

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) make mrproper
	sudo $(lfs-chroot) -C $(chroot_srcdir) make defconfig
