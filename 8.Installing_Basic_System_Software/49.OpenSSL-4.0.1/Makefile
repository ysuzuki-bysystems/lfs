tarball := lfs/sources/openssl-4.0.1.tar.gz
srcdir := lfs/sources/openssl
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --openssldir=/etc/ssl
configure_opts += --libdir=lib
configure_opts += shared
configure_opts += zlib-dynamic


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make INSTALL_LIBS= MANSUFFIX=ssl install
	sudo $(lfs-chroot) -C $(chroot_srcdir) rm -rf /usr/share/doc/openssl-4.0.1
	sudo $(lfs-chroot) -C $(chroot_srcdir) mv -v /usr/share/doc/openssl /usr/share/doc/openssl-4.0.1
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'cp -vfr doc/* /usr/share/doc/openssl-4.0.1'

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/config
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./config $(configure_opts)

$(srcdir)/config:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
