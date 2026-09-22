tarball := lfs/sources/expect5.45.4.tar.gz
srcdir := lfs/sources/expect
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --with-tcl=/usr/lib
configure_opts += --enable-shared
configure_opts += --disable-rpath
configure_opts += --mandir=/usr/share/man
configure_opts += --with-tclinclude=/usr/include


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) python3 -c 'from pty import spawn; spawn(["echo", "ok"])'
	sudo $(lfs-chroot) -C $(chroot_srcdir) patch -Np1 -i ../expect-5.45.4-gcc15-1.patch
