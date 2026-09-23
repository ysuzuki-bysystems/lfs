tarball := lfs/sources/systemd-261.2.tar.gz
srcdir := lfs/sources/systemd
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --prefix=/usr
configure_opts += --buildtype=release
configure_opts += -D default-dnssec=no
configure_opts += -D firstboot=false
configure_opts += -D install-tests=false
configure_opts += -D ldconfig=false
configure_opts += -D sysusers=false
configure_opts += -D rpmmacrosdir=no
configure_opts += -D homed=disabled
configure_opts += -D man=disabled
configure_opts += -D mode=release
configure_opts += -D pamconfdir=no
configure_opts += -D dev-kvm-mode=0660
configure_opts += -D nobody-group=nogroup
configure_opts += -D sysupdate=disabled
configure_opts += -D ukify=disabled
configure_opts += -D docdir=/usr/share/doc/systemd-261.2


.PHONY: ninja ninja-install

ninja-install: $(srcdir)/build/build.ninja ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja install
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build tar -xf ../../systemd-man-pages-261.2.tar.xz --no-same-owner --strip-components=1 -C /usr/share/man 
	sudo $(lfs-chroot) systemd-machine-id-setup # TODO Right here!?
	sudo $(lfs-chroot) systemctl preset-all

ninja: $(srcdir)/build/build.ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build ninja

$(srcdir)/build/build.ninja: $(srcdir)/meson.build
	sudo $(lfs-chroot) -C $(chroot_srcdir) mkdir -pv build
	sudo $(lfs-chroot) -C $(chroot_srcdir)/build meson setup .. $(configure_opts)

$(srcdir)/meson.build:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -e 's/GROUP="render"/GROUP="video"/' -e 's/GROUP="sgx", //' -i rules.d/50-udev-default.rules.in 
