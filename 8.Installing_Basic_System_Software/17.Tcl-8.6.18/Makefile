tarball := lfs/sources/tcl8.6.18-src.tar.gz
srcdir := lfs/sources/tcl
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --mandir=/usr/share/man
configure_opts += --disable-rpath


.PHONY: make make-install

make-install: $(srcdir)/unix/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix make install
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix chmod 644 /usr/lib/libtclstub8.6.a
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix chmod -v u+w /usr/lib/libtcl8.6.so
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix make install-private-headers
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix ln -sfv tclsh8.6 /usr/bin/tclsh
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix bash -c 'mv -v /usr/share/man/man3/{Thread,Tcl_Thread}.3'
	sudo $(lfs-chroot) -C $(chroot_srcdir) tar -xf ../tcl8.6.18-html.tar.gz --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -v -p /usr/share/doc/tcl-8.6.18
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'cp -v -r  ./html/* /usr/share/doc/tcl-8.6.18'

make: $(srcdir)/unix/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix sed -e "s|$(chroot_srcdir)/unix|/usr/lib|" \
    -e "s|$(chroot_srcdir)|/usr/include|"  \
    -i tclConfig.sh
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix sed -e "s|$(chroot_srcdir)/unix/pkgs/tdbc1.1.13|/usr/lib/tdbc1.1.13|" \
    -e "s|$(chroot_srcdir)/pkgs/tdbc1.1.13/generic|/usr/include|"     \
    -e "s|$(chroot_srcdir)/pkgs/tdbc1.1.13/library|/usr/lib/tcl8.6|"  \
    -e "s|$(chroot_srcdir)/pkgs/tdbc1.1.13|/usr/include|"             \
    -i pkgs/tdbc1.1.13/tdbcConfig.sh
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix sed -e "s|$(chroot_srcdir)/unix/pkgs/itcl4.3.7|/usr/lib/itcl4.3.7|" \
    -e "s|$(chroot_srcdir)/pkgs/itcl4.3.7/generic|/usr/include|"    \
    -e "s|$(chroot_srcdir)/pkgs/itcl4.3.7|/usr/include|"            \
    -i pkgs/itcl4.3.7/itclConfig.sh 

$(srcdir)/unix/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir)/unix ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
