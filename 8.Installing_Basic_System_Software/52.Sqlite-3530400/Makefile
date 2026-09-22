tarball := lfs/sources/sqlite-autoconf-3530400.tar.gz
srcdir := lfs/sources/sqlite
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --disable-static
configure_opts += --enable-fts4
configure_opts += --enable-fts5
configure_opts += CPPFLAGS="-D SQLITE_ENABLE_COLUMN_METADATA=1 -D SQLITE_ENABLE_UNLOCK_NOTIFY=1 -D SQLITE_ENABLE_DBSTAT_VTAB=1 -D SQLITE_SECURE_DELETE=1"


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -v -R sqlite-doc-3530400 -T /usr/share/doc/sqlite-3.53.4

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make LDFLAGS.rpath=""

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) python3 -m zipfile -e ../sqlite-doc-3530400.zip .
