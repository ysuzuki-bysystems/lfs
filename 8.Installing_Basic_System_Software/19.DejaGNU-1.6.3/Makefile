tarball := lfs/sources/dejagnu-1.6.3.tar.gz
srcdir := lfs/sources/dejagnu
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr


.PHONY: make-install

make-install: $(srcdir)/build/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make install
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build install -v -dm755  /usr/share/doc/dejagnu-1.6.3
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build bash -c 'install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3'

$(srcdir)/build/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ../configure $(configure_opts)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
