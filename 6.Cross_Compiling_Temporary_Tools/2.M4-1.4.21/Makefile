tarball := lfs/sources/m4-1.4.21.tar.xz
srcdir := lfs/sources/m4-r1

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/build-aux/config.guess)


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)

make: $(srcdir)/Makefile
	$(MAKE) -j $(shell nproc) -C $(<D)

$(srcdir)/Makefile: $(srcdir)/configure lfs/usr/share/config.site
	test -n $(LFS_TGT)
	(cd $(@D) && ./configure $(configure_opts))

lfs/usr/share/config.site:
	echo 'ac_cv_func_posix_spawn_file_actions_addchdir=yes' > $@
	echo 'ac_cv_func_posix_spawn_file_actions_addfchdir=yes' >> $@

$(srcdir)/configure:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
