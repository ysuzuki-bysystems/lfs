tarball := lfs/sources/findutils-4.11.0.tar.xz
srcdir := lfs/sources/findutils-r1

configure_opts  = --prefix=/usr
configure_opts += --localstatedir=/var/lib/locate
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
