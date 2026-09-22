tarball := lfs/sources/ncurses-6.6.tar.gz
srcdir := lfs/sources/ncurses
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --mandir=/usr/share/man
configure_opts += --with-shared
configure_opts += --without-debug
configure_opts += --without-normal
configure_opts += --with-cxx-shared
configure_opts += --enable-pc-files
configure_opts += --with-pkg-config-libdir=/usr/lib/pkgconfig


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make DESTDIR=$(chroot_srcdir)/dest install
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -e 's/^#if.*XOPEN.*$$/#if 1/' -i dest/usr/include/curses.h 
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'cp --remove-destination -av dest/* /'
	sudo $(lfs-chroot) ln -sfv libncursesw.so /usr/lib/libncurses.so
	sudo $(lfs-chroot) ln -sfv ncursesw.pc    /usr/lib/pkgconfig/ncurses.pc
	sudo $(lfs-chroot) ln -sfv libformw.so /usr/lib/libform.so
	sudo $(lfs-chroot) ln -sfv formw.pc    /usr/lib/pkgconfig/form.pc
	sudo $(lfs-chroot) ln -sfv libpanelw.so /usr/lib/libpanel.so
	sudo $(lfs-chroot) ln -sfv panelw.pc    /usr/lib/pkgconfig/panel.pc
	sudo $(lfs-chroot) ln -sfv libmenuw.so /usr/lib/libmenu.so
	sudo $(lfs-chroot) ln -sfv menuw.pc    /usr/lib/pkgconfig/menu.pc
	sudo $(lfs-chroot) ln -sfv libncursesw.so /usr/lib/libcurses.so
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -v -R doc -T /usr/share/doc/ncurses-6.6

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
