tarball := lfs/sources/file-5.48.tar.gz
srcdir := lfs/sources/file-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/config.guess)

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	$(rm) -v lfs/usr/lib/libmagic.la

make: $(srcdir)/Makefile $(srcdir)/build/src/file
	make FILE_COMPILE=$(CURDIR)/$(srcdir)/build/src/file -j $(shell nproc) -C $(srcdir)

$(srcdir)/Makefile: $(srcdir)/configure $(srcdir)/build/src/file
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

$(srcdir)/build/src/file: $(srcdir)/configure
	mkdir -pv $(srcdir)/build
	(cd $(srcdir)/build && ../configure --disable-bzlib --disable-libseccomp --disable-xzlib --disable-zlib)
	make -C $(srcdir)/build

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
