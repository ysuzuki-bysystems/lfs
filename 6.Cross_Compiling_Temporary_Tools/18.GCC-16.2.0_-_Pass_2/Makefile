tarball := lfs/sources/gcc-16.2.0.tar.xz
srcdir := lfs/sources/gcc-r2

mpfr_tarball := lfs/sources/mpfr-4.2.2.tar.xz
gmp_tarball := lfs/sources/gmp-6.3.0.tar.xz
mpc_tarball := lfs/sources/mpc-1.4.1.tar.xz

configure_opts  = --build=$(shell $(srcdir)/config.guess)
configure_opts += --host=$(LFS_TGT)
configure_opts += --target=$(LFS_TGT)
configure_opts += --prefix=/usr
configure_opts += --with-build-sysroot=$(LFS)
configure_opts += --enable-default-pie
configure_opts += --enable-default-ssp
configure_opts += --disable-fixincludes
configure_opts += --disable-nls
configure_opts += --disable-multilib
configure_opts += --disable-libatomic
configure_opts += --disable-libgomp
configure_opts += --disable-libquadmath
configure_opts += --disable-libsanitizer
configure_opts += --disable-libssp
configure_opts += --disable-libvtv
configure_opts += --enable-languages=c,c++
configure_opts += CXX_FOR_TARGET='$(LFS_TGT)-gcc -nostdinc++'
configure_opts += LDFLAGS_FOR_TARGET=-L$(CURDIR)/$(srcdir)/build/$(LFS_TGT)/libgcc
configure_opts += target_configargs=gcc_cv_target_thread_file=posix


.PHONY: make make-install

make-install: $(srcdir)/build/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	ln -svf gcc lfs/usr/bin/cc

make: $(srcdir)/build/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/build/Makefile: $(srcdir)/configure $(srcdir)/mpfr/configure $(srcdir)/gmp/configure $(srcdir)/mpc/configure
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
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
	sed -e '/m64=/s/lib64/lib/' -i.orig $(srcdir)/gcc/config/i386/t-linux64

