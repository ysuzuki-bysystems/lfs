tarball := lfs/sources/bzip2-1.0.8.tar.gz
srcdir := lfs/sources/bzip2
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make PREFIX=/usr install
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'cp -av libbz2.so.* /usr/lib'
	sudo $(lfs-chroot) -C $(chroot_srcdir) ln -sfv libbz2.so.1.0.8 /usr/lib/libbz2.so
	sudo $(lfs-chroot) -C $(chroot_srcdir) ln -sfv libbz2.so.1.0.8 /usr/lib/libbz2.so.1
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -v bzip2-shared /usr/bin/bzip2
	sudo $(lfs-chroot) -C $(chroot_srcdir) ln -sfv bzip2 /usr/bin/bzcat
	sudo $(lfs-chroot) -C $(chroot_srcdir) ln -sfv bzip2 /usr/bin/bunzip2
	sudo $(lfs-chroot) -C $(chroot_srcdir) rm -fv /usr/lib/libbz2.a

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make clean
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -f Makefile-libbz2_so
	sudo $(lfs-chroot) -C $(chroot_srcdir) make clean
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i 's@\(ln -s -f \)$$(PREFIX)/bin/@\1@' Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
