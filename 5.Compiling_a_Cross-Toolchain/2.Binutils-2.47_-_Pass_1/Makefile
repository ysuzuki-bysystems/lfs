tarball := lfs/sources/binutils-2.47.tar.xz
srcdir := lfs/sources/binutils-2.47

configure_opts  = --prefix=$(LFS)/tools
configure_opts += --with-sysroot=$(LFS)
configure_opts += --target=$(LFS_TGT)
configure_opts += --disable-nls
configure_opts += --enable-gprofng=no
configure_opts += --disable-werror
configure_opts += --enable-new-dtags
configure_opts += --enable-default-hash-style=gnu


.PHONY: make make-install

make-install: $(srcdir)/build1/Makefile make
	$(MAKE) install -C $(<D)

make: $(srcdir)/build1/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build1/Makefile: $(srcdir)/configure
	test -n $(LFS)
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	(cd $(@D) && ../configure $(configure_opts))

$(srcdir)/configure:
	tar -xf $(tarball) -C lfs/sources
