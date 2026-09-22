tarball := lfs/sources/pkgconf-3.0.5.tar.xz
srcdir := lfs/sources/pkgconf
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: ninja ninja-install

ninja-install: $(srcdir)/build/build.ninja ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja install
	sudo $(lfs-chroot) rm -rf /usr/share/doc/pkgconf-3.0.5
	sudo $(lfs-chroot) bash -c 'mv /usr/share/doc/pkgconf{,-3.0.5}'
	sudo $(lfs-chroot) ln -svf pkgconf   /usr/bin/pkg-config
	sudo $(lfs-chroot) ln -svf pkgconf.1 /usr/share/man/man1/pkg-config.1

ninja: $(srcdir)/build/build.ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja

$(srcdir)/build/build.ninja: $(srcdir)/meson-1.12.0/meson.py $(srcdir)/meson.build
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build python3 ../meson-1.12.0/meson.py setup --prefix=/usr --buildtype=release ..

$(srcdir)/meson-1.12.0/meson.py: $(srcdir)/meson.build
	sudo $(lfs-chroot) -C $(chroot_srcdir) tar -xf ../meson-1.12.0.tar.gz

$(srcdir)/meson.build:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
