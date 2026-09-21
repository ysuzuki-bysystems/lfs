tarball := lfs/sources/xz-5.8.3.tar.xz
srcdir := lfs/sources/xz-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/build-aux/config.guess)
configure_opts += --disable-static
configure_opts += --docdir=/usr/share/doc/xz-5.8.3


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	rm -v lfs/usr/lib/liblzma.la

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
