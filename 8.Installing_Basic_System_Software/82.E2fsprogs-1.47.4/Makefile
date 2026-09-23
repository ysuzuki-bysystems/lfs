tarball := lfs/sources/e2fsprogs-1.47.4.tar.gz
srcdir := lfs/sources/e2fsprogs
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --sysconfdir=/etc
configure_opts += --enable-elf-shlibs
configure_opts += --disable-libblkid
configure_opts += --disable-libuuid
configure_opts += --disable-uuidd
configure_opts += --disable-fsck


.PHONY: make make-install

make-install: $(srcdir)/build/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make install
	sudo $(lfs-chroot) bash -c 'rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a'
	sudo $(lfs-chroot) gunzip -v /usr/share/info/libext2fs.info.gz 
	sudo $(lfs-chroot) install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build install -v -m644 doc/com_err.info /usr/share/info
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
	sudo $(lfs-chroot) sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf

make: $(srcdir)/build/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build make

$(srcdir)/build/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ../configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
