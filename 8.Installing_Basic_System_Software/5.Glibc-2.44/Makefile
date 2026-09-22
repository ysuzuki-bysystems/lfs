tarball := lfs/sources/glibc-2.44.tar.xz
srcdir := lfs/sources/glibc
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-werror
configure_opts += --disable-nscd
configure_opts += libc_cv_slibdir=/usr/lib
configure_opts += --enable-stack-protector=strong
configure_opts += --enable-kernel=5.10


.PHONY: configuring-glibc make make-install

configuring-glibc: make-install
	cat adding-nsswitch-conf | sudo $(lfs-chroot) -C $(chroot_srcdir)/build
	cat adding-timezone-data | sudo $(lfs-chroot) -C $(chroot_srcdir)/build
	cat configuring-the-dynamic-loader | sudo $(lfs-chroot) -C $(chroot_srcdir)/build

make-install: $(srcdir)/build/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make install
	sudo $(lfs-chroot) sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd
	sudo $(lfs-chroot) localedef -i C -f UTF-8 C.UTF-8

make: $(srcdir)/build/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build touch /etc/ld.so.conf
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build sed '/test-installation/s@$$(PERL)@echo not running@' -i ../Makefile

$(srcdir)/build/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ../configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../glibc-fhs-1.patch
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../glibc-2.44-upstream_fixes-1.patch
