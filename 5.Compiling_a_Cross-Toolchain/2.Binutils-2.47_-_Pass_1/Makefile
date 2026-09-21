tarball := lfs/sources/binutils-2.47.tar.xz
srcdir := lfs/sources/binutils-r1

configure_opts  = --prefix=$(LFS)/tools
configure_opts += --with-sysroot=$(LFS)
configure_opts += --target=$(LFS_TGT)
configure_opts += --disable-nls
configure_opts += --enable-gprofng=no
configure_opts += --disable-werror
configure_opts += --enable-new-dtags
configure_opts += --enable-default-hash-style=gnu


.PHONY: make make-install

make-install: $(srcdir)/build/Makefile make
	$(MAKE) install -C $(<D)

make: $(srcdir)/build/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build/Makefile: $(srcdir)/configure
	test -n $(LFS)
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	(cd $(@D) && ../configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
