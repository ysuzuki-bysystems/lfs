tarball := lfs/sources/inetutils-2.8.tar.gz
srcdir := lfs/sources/inetutils
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --bindir=/usr/bin
configure_opts += --localstatedir=/var
configure_opts += --disable-logger
configure_opts += --disable-whois
configure_opts += --disable-rcp
configure_opts += --disable-rexec
configure_opts += --disable-rlogin
configure_opts += --disable-rsh
configure_opts += --disable-servers


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) mv -v /usr/{,s}bin/ifconfig

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i 's/def HAVE_TERMCAP_TGETENT/ 1/' telnet/telnet.c
