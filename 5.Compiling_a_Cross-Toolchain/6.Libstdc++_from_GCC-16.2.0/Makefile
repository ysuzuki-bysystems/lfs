srcdir := lfs/sources/gcc-16.2.0

configure_opts  = --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/config.guess)
configure_opts += CXX=$(LFS_TGT)-gcc
configure_opts += --prefix=/usr
configure_opts += --disable-multilib
configure_opts += --disable-nls
configure_opts += --disable-libstdcxx-pch
configure_opts += --with-gxx-include-dir=/tools/$(LFS_TGT)/include/c++/16.2.0

.PHONY: make make-install

make-install: $(srcdir)/build2/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	rm -v lfs/usr/lib/lib{stdc++{,exp,fs},supc++}.la

make: $(srcdir)/build2/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build2/Makefile: $(srcdir)/libstdc++-v3/configure
	test -n $(LFS)
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	(cd $(@D) && ../libstdc++-v3/configure $(configure_opts))

$(srcdir)/libstdc++-v3/configure:
