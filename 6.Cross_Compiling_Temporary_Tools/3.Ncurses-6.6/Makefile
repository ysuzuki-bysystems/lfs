tarball := lfs/sources/ncurses-6.6.tar.gz
srcdir := lfs/sources/ncurses-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/config.guess)
configure_opts += --mandir=/usr/share/man
configure_opts += --with-manpage-format=normal
configure_opts += --with-shared
configure_opts += --without-normal
configure_opts += --with-cxx-shared
configure_opts += --without-debug
configure_opts += --without-ada
configure_opts += --disable-stripping
configure_opts += AWK=gawk


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	ln -svf libncursesw.so lfs/usr/lib/libncurses.so
	sed -e 's/^#if.*XOPEN.*$$/#if 1/' -i lfs/usr/include/curses.h

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure lfs/tools/bin/tic
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

lfs/tools/bin/tic: $(srcdir)/configure
	mkdir -pv $(srcdir)/build
	(cd $(srcdir)/build && ../configure --prefix=$(LFS)/tools AWK=gawk)
	make -C $(srcdir)/build/include
	make -C $(srcdir)/build/progs tic
	install $(srcdir)/build/progs/tic lfs/tools/bin

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
