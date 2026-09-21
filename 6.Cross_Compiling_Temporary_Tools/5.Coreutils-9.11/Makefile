tarball := lfs/sources/coreutils-9.11.tar.xz
srcdir := lfs/sources/coreutils-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/build-aux/config.guess)
configure_opts += --enable-install-program=hostname


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	mv -v lfs/usr/bin/chroot lfs/usr/sbin
	mkdir -pv lfs/usr/share/man/man8
	mv -v lfs/usr/share/man/man1/chroot.1 lfs/usr/share/man/man8/chroot.8
	sed -i 's/"1"/"8"/' lfs/usr/share/man/man8/chroot.8

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
