tarball := lfs/sources/iana-etc-20260805.tar.gz
srcdir := lfs/sources/iana-etc
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: run

run: $(srcdir)/services $(srcdir)/protocols
	sudo $(lfs-chroot) -C $(chroot_srcdir) cp -v services protocols /etc

$(srcdir)/services $(srcdir)/protocols:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
