tarball := lfs/sources/vim-9.2.1025.tar.gz
srcdir := lfs/sources/vim
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr


.PHONY: make make-install

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make install
	sudo $(lfs-chroot) ln -svf vim /usr/bin/vi
	sudo $(lfs-chroot) bash -c 'for L in  /usr/share/man/{,*/}man1/vim.1; do ln -svf vim.1 $$(dirname $$L)/vi.1; done'
	sudo $(lfs-chroot) ln -svf ../vim/vim92/doc /usr/share/doc/vim-9.2.1025
	cat configuring-vim | sudo $(lfs-chroot)

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'echo '\''#define SYS_VIMRC_FILE "/etc/vimrc"'\'' >> src/feature.h'
