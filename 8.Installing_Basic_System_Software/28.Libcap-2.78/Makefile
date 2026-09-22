tarball := lfs/sources/libcap-2.78.tar.xz
srcdir := lfs/sources/libcap
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --enable-shared
configure_opts += --without-ensurepip
configure_opts += --without-static-libpython


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make prefix=/usr lib=lib install

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make prefix=/usr lib=lib

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/install -m.*STA/d' libcap/Makefile
