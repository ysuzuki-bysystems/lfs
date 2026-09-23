tarball := lfs/sources/iproute2-7.1.0.tar.xz
srcdir := lfs/sources/iproute2
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make SBINDIR=/usr/sbin install
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'install -vDm644 COPYING README* -t /usr/share/doc/iproute2-7.1.0'

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make NETNS_RUN_DIR=/run/netns

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i /ARPD/d Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) rm -fv man/man8/arpd.8
