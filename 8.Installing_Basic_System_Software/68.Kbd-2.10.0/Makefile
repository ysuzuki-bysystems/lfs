tarball := lfs/sources/kbd-2.10.0.tar.xz
srcdir := lfs/sources/kbd
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-vlock


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -R -v docs/doc -T /usr/share/doc/kbd-2.10.0

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../kbd-2.10.0-backspace-1.patch
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
