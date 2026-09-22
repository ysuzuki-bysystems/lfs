tarball := lfs/sources/shadow-4.20.2.tar.xz
srcdir := lfs/sources/shadow
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot

configure_opts  = --sysconfdir=/etc
configure_opts += --disable-static
configure_opts += --with-bcrypt
configure_opts += --with-yescrypt
configure_opts += --without-libbsd
configure_opts += --disable-logind
configure_opts += --with-group-name-max-length=32


.PHONY: make make-install configuring-shadow

configuring-shadow: make-install
	sudo $(lfs-chroot) pwconv
	sudo $(lfs-chroot) grpconv
	sudo $(lfs-chroot) mkdir -p /etc/default
	sudo $(lfs-chroot) useradd -D --gid 999
	sudo $(lfs-chroot) sed -i '/MAIL/s/yes/no/' /etc/default/useradd
	sudo $(lfs-chroot) touch /etc/subuid 
	sudo $(lfs-chroot) touch /etc/subgid 

make-install: $(srcdir)/Makefile make
	sudo $(lfs-chroot) -C $(chroot_srcdir) make exec_prefix=/usr install
	sudo $(lfs-chroot) -C $(chroot_srcdir) make -C man install-man

make: $(srcdir)/Makefile
	sudo $(lfs-chroot) -C $(chroot_srcdir) make

$(srcdir)/Makefile: $(srcdir)/configure
	sudo $(lfs-chroot) -C $(chroot_srcdir) touch /usr/bin/passwd
	sudo $(lfs-chroot) -C $(chroot_srcdir) ./configure $(configure_opts)

$(srcdir)/configure:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
	sudo $(lfs-chroot) -C $(chroot_srcdir) find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -e 's:#ENCRYPT_METHOD SHA512:ENCRYPT_METHOD YESCRYPT:' \
    -e 's:/var/spool/mail:/var/mail:'                      \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                     \
    -i etc/login.defs
