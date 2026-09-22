tarball := lfs/sources/coreutils-9.11.tar.xz
srcdir := lfs/sources/coreutils
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) mv -v /usr/bin/chroot /usr/sbin
	sudo $(lfs-chroot) mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
	sudo $(lfs-chroot) sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) env FORCE_UNSAFE_CONFIGURE=1 ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../coreutils-9.11-i18n-1.patch
	sudo $(lfs-chroot) -C $(chroot_srcdir) autoreconf -fv
	sudo $(lfs-chroot) -C $(chroot_srcdir) automake -af
