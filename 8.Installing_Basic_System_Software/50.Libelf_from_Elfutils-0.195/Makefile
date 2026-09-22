tarball := lfs/sources/elfutils-0.195.tar.bz2
srcdir := lfs/sources/elfutils
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-debuginfod
configure_opts += --enable-libdebuginfod=dummy


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -C libelf install
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -vm644 config/libelf.pc /usr/lib/pkgconfig
	sudo $(lfs-chroot) -C $(chroot_srcdir) rm /usr/lib/libelf.a

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -C lib
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -C libelf

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
