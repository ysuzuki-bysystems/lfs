tarball := lfs/sources/mpfr-4.2.2.tar.xz
srcdir := lfs/sources/mpfr
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-static
configure_opts += --enable-thread-safe
configure_opts += --docdir=/usr/share/doc/mpfr-4.2.2


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install-html

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make html

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
