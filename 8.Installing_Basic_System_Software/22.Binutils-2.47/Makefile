tarball := lfs/sources/binutils-2.47.tar.xz
srcdir := lfs/sources/binutils
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --sysconfdir=/etc
configure_opts += --enable-ld=default
configure_opts += --enable-plugins
configure_opts += --enable-shared
configure_opts += --disable-werror
configure_opts += --enable-64-bit-bfd
configure_opts += --enable-new-dtags
configure_opts += --with-system-zlib
configure_opts += --with-lib-path=/usr/lib
configure_opts += --enable-default-hash-style=gnu


.PHONY: make make-install

make-install: $(srcdir)/build/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make tooldir=/usr install
	sudo $(lfs-chroot) rm -rfv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a /usr/share/doc/gprofng/ 

make: $(srcdir)/build/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make tooldir=/usr

$(srcdir)/build/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ../configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
