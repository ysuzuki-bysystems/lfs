tarball := lfs/sources/gcc-16.2.0.tar.xz
srcdir := lfs/sources/gcc-16.2.0

mpfr_tarball := lfs/sources/mpfr-4.2.2.tar.xz
gmp_tarball := lfs/sources/gmp-6.3.0.tar.xz
mpc_tarball := lfs/sources/mpc-1.4.1.tar.xz

configure_opts  = --target=$(LFS_TGT)
configure_opts += --prefix=$(LFS)/tools
configure_opts += --with-glibc-version=2.44
configure_opts += --with-sysroot=$(LFS)
configure_opts += --with-newlib
configure_opts += --without-headers
configure_opts += --enable-default-pie
configure_opts += --enable-default-ssp
configure_opts += --disable-fixincludes
configure_opts += --disable-nls
configure_opts += --disable-shared
configure_opts += --disable-multilib
configure_opts += --disable-threads
configure_opts += --disable-libatomic
configure_opts += --disable-libgomp
configure_opts += --disable-libquadmath
configure_opts += --disable-libssp
configure_opts += --disable-libvtv
configure_opts += --disable-libstdcxx
configure_opts += --enable-languages=c,c++


.PHONY: make make-install

make-install: $(srcdir)/build1/Makefile make
	$(MAKE) install -C $(<D)

make: $(srcdir)/build1/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build1/Makefile: $(srcdir)/configure $(srcdir)/mpfr/configure $(srcdir)/gmp/configure $(srcdir)/mpc/configure
	test -n $(LFS)
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	(cd $(@D) && ../configure $(configure_opts))

$(srcdir)/mpfr/configure: $(srcdir)/configure
	mkdir -pv $(@D)
	tar -xf $(mpfr_tarball) -C $(@D) --strip-components=1

$(srcdir)/gmp/configure: $(srcdir)/configure
	mkdir -pv $(@D)
	tar -xf $(gmp_tarball) -C $(@D) --strip-components=1

$(srcdir)/mpc/configure: $(srcdir)/configure
	mkdir -pv $(@D)
	tar -xf $(mpc_tarball) -C $(@D) --strip-components=1

$(srcdir)/configure:
	tar -xf $(tarball) -C lfs/sources
	sed -e '/m64=/s/lib64/lib/' -i.orig $(srcdir)/gcc/config/i386/t-linux
