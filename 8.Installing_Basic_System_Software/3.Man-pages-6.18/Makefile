tarball := lfs/sources/man-pages-6.18.tar.xz
srcdir := lfs/sources/man-pages
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: make

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -R GIT=false prefix=/usr install

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'rm -v man3/crypt*'
