tarball := lfs/sources/kmod-34.2.tar.xz
srcdir := lfs/sources/kmod
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --buildtype=release
configure_opts += -D manpages=false


.PHONY: ninja ninja-install

ninja-install: $(srcdir)/build/build.ninja ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja install

ninja: $(srcdir)/build/build.ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja

$(srcdir)/build/build.ninja: $(srcdir)/meson.build
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build meson setup .. $(configure_opts)

$(srcdir)/meson.build:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
