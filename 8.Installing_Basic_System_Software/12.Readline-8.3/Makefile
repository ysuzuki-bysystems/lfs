tarball := lfs/sources/readline-8.3.tar.gz
srcdir := lfs/sources/readline
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-static
configure_opts += --with-curses
configure_opts += --docdir=/usr/share/doc/readline-8.3


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.3'

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make SHLIB_LIBS="-lncursesw"

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/MV.*old/d' Makefile.in
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/{OLDSUFF}/c:' support/shlib-install
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -e '270a\     else\n       chars_avail = 1;' -e '288i\   result = -1;' -i.orig input.c
