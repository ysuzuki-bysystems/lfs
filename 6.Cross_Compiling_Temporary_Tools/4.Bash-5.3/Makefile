tarball := lfs/sources/bash-5.3.tar.gz
srcdir := lfs/sources/bash-r1

configure_opts  = --prefix=/usr
configure_opts += --build=$(shell sh $(srcdir)/support/config.guess)
configure_opts += --host=$(LFS_TGT)
configure_opts += --without-bash-malloc
configure_opts += --docdir=/usr/share/doc/bash-5.3


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	ln -svf bash lfs/bin/sh

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
