tarball := lfs/sources/perl-5.44.0.tar.xz
srcdir := lfs/sources/perl
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = -des
configure_opts += -D prefix=/usr
configure_opts += -D vendorprefix=/usr
configure_opts += -D privlib=/usr/lib/perl5/5.44/core_perl
configure_opts += -D archlib=/usr/lib/perl5/5.44/core_perl
configure_opts += -D sitelib=/usr/lib/perl5/5.44/site_perl
configure_opts += -D sitearch=/usr/lib/perl5/5.44/site_perl
configure_opts += configure_opts += -D vendorlib=/usr/lib/perl5/5.44/vendor_perl
configure_opts += -D vendorarch=/usr/lib/perl5/5.44/vendor_perl
configure_opts += -D man1dir=/usr/share/man/man1
configure_opts += -D man3dir=/usr/share/man/man3
configure_opts += -D pager="/usr/bin/less -isR"
configure_opts += -D useshrplib
configure_opts += -D usethreads


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) env BUILD_ZLIB=False BUILD_BZIP2=0 make install

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) env BUILD_ZLIB=False BUILD_BZIP2=0 make

$(srcdir)/Makefile: $(srcdir)/Configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) env BUILD_ZLIB=False BUILD_BZIP2=0 sh Configure $(configure_opts)

$(srcdir)/Configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
