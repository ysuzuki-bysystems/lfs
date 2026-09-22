tarball := lfs/sources/meson-1.12.0.tar.gz
srcdir := lfs/sources/meson
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: wheel install

install: $(srcdir)/pyproject.toml wheel
	sudo $(lfs-chroot) -C $(chroot_srcdir) pip3 install --no-index --find-links dist meson
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

wheel: $(srcdir)/pyproject.toml
	sudo $(lfs-chroot) -C $(chroot_srcdir) pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $(chroot_srcdir)

$(srcdir)/pyproject.toml:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
