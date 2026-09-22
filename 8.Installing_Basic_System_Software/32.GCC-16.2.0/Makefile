tarball := lfs/sources/gcc-16.2.0.tar.xz
srcdir := lfs/sources/gcc
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts += --prefix=/usr
configure_opts += LD=ld
configure_opts += --enable-languages=c,c++
configure_opts += --enable-default-pie
configure_opts += --enable-default-ssp
configure_opts += --enable-host-pie
configure_opts += --enable-targets=all
configure_opts += --disable-multilib
configure_opts += --disable-bootstrap
configure_opts += --disable-fixincludes
configure_opts += --with-system-zlib


.PHONY: make make-install check

check: make-install
	cat check-gcc | sudo $(lfs-chroot)

make-install: $(srcdir)/build/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make install
	sudo $(lfs-chroot) bash -c 'chown -v -R root:root $$(gcc -print-file-name=include){,-fixed}'
	sudo $(lfs-chroot) ln -svrf /usr/bin/cpp /usr/lib
	sudo $(lfs-chroot) ln -svf gcc.1 /usr/share/man/man1/cc.1
	sudo $(lfs-chroot) bash -c 'ln -sfvr $$(gcc -print-prog-name=liblto_plugin.so) /usr/lib/bfd-plugins/'
	sudo $(lfs-chroot) mkdir -pv /usr/share/gdb/auto-load/usr/lib
	sudo $(lfs-chroot) bash -c 'mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib'

make: $(srcdir)/build/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make

$(srcdir)/build/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ../configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64 
