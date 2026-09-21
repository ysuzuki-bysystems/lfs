tarball := lfs/sources/gawk-5.4.1.tar.xz
srcdir := lfs/sources/gawk-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/build-aux/config.guess)


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
	sed -i 's/extras//' $(srcdir)/Makefile.in
