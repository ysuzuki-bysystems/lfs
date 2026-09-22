tarball := lfs/sources/util-linux-2.42.2.tar.xz
srcdir := lfs/sources/util-linux-r1
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --libdir=/usr/lib
configure_opts += --runstatedir=/run
configure_opts += --disable-chfn-chsh
configure_opts += --disable-login
configure_opts += --disable-nologin
configure_opts += --disable-su
configure_opts += --disable-setpriv
configure_opts += --disable-runuser
configure_opts += --disable-pylibmount
configure_opts += --disable-static
configure_opts += --disable-liblastlog2
configure_opts += --without-python
configure_opts += ADJTIME_PATH=/var/lib/hwclock/adjtime
configure_opts += --docdir=/usr/share/doc/util-linux-2.42.2


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv /var/lib/hwclock
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
