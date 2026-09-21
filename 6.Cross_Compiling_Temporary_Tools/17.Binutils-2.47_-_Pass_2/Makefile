tarball := lfs/sources/binutils-2.47.tar.xz
srcdir := lfs/sources/binutils-r2

configure_opts  = --prefix=/usr
configure_opts += --build=$(shell $(srcdir)/config.guess)
configure_opts += --host=$(LFS_TGT)
configure_opts += --disable-nls
configure_opts += --enable-shared
configure_opts += --enable-gprofng=no
configure_opts += --disable-werror
configure_opts += --enable-64-bit-bfd
configure_opts += --enable-new-dtags
configure_opts += --enable-default-hash-style=gnu


.PHONY: make make-install

make-install: $(srcdir)/build/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	rm -v lfs/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

make: $(srcdir)/build/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build/Makefile: $(srcdir)/configure
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	(cd $(@D) && ../configure $(configure_opts))

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
	sed '6031s/$add_dir//' -i $(srcdir)/ltmain.sh
