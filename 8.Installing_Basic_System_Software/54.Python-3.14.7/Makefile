tarball := lfs/sources/Python-3.14.7.tar.xz
srcdir := lfs/sources/Python
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --enable-shared
configure_opts += --with-system-expat
configure_opts += --enable-optimizations
configure_opts += --without-static-libpython


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	cat configure-pip | sudo $(lfs-chroot)
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -v -dm755 /usr/share/doc/python-3.14.7/html
	sudo $(lfs-chroot) -C $(chroot_srcdir) tar --strip-components=1 --no-same-owner --no-same-permissions -C /usr/share/doc/python-3.14.7/html -xvf ../python-3.14.7-docs-html.tar.bz2

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../Python-3.14.7-openssl_4-1.patch
