tarball := lfs/sources/pcre2-10.47.tar.bz2
srcdir := lfs/sources/pcre2
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --docdir=/usr/share/doc/pcre2-10.47
configure_opts += --enable-unicode
configure_opts += --enable-jit
configure_opts += --enable-pcre2-16
configure_opts += --enable-pcre2-32
configure_opts += --enable-pcre2grep-libz
configure_opts += --enable-pcre2grep-libbz2
configure_opts += --enable-pcre2test-libreadline
configure_opts += --disable-static


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
