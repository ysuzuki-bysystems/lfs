tarball := lfs/sources/gmp-6.3.0.tar.xz
srcdir := lfs/sources/gmp
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --enable-cxx
configure_opts += --disable-static
configure_opts += --docdir=/usr/share/doc/gmp-6.3.0


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
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/long long t1;/,+1s/()/(...)/' configure
