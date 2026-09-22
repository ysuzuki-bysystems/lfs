tarball := lfs/sources/libxcrypt-4.5.2.tar.xz
srcdir := lfs/sources/libxcrypt
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts += --prefix=/usr
configure_opts += --enable-hashes=strong,glibc
configure_opts += --enable-obsolete-api=no
configure_opts += --disable-static
configure_opts += --disable-failure-tokens


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
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c "sed -i '/strchr/s/const//' lib/crypt-{sm3,gost}-yescrypt.c"
