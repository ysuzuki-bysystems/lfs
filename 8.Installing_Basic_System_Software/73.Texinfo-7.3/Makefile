tarball := lfs/sources/texinfo-7.3.tar.xz
srcdir := lfs/sources/texinfo
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) -C $(chroot_srcdir) make TEXMF=/usr/share/texmf install-tex
	sudo $(lfs-chroot) -C /usr/share/info bash -c 'rm -vf dir && for f in *; do install-info $$f dir 2>/dev/null; done'

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
