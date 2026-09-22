tarball := lfs/sources/zstd-1.5.7.tar.gz
srcdir := lfs/sources/zstd
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make PREFIX=/usr install
	sudo $(lfs-chroot) rm -v /usr/lib/libzstd.a

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make PREFIX=/usr

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
