tarball := lfs/sources/man-db-2.13.1.tar.xz
srcdir := lfs/sources/man-db
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --docdir=/usr/share/doc/man-db-2.13.1
configure_opts += --sysconfdir=/etc
configure_opts += --disable-setuid
configure_opts += --enable-cache-owner=bin
configure_opts += --with-browser=/usr/bin/lynx
configure_opts += --with-vgrind=/usr/bin/vgrind
configure_opts += --with-grap=/usr/bin/grap


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
