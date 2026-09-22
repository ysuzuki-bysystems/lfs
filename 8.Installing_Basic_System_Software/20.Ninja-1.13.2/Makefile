tarball := lfs/sources/ninja-1.13.2.tar.gz
srcdir := lfs/sources/ninja
chroot_tarball := $(tarball:lfs/%=/%)
chroot_srcdir := $(srcdir:lfs/%=/%)

lfs-chroot := ../../lfs-chroot


.PHONY: install

install: $(srcdir)/ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -vm755 ninja /usr/bin/
	sudo $(lfs-chroot) -C $(chroot_srcdir) install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
	sudo $(lfs-chroot) -C $(chroot_srcdir) bash -c 'install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja'

$(srcdir)/ninja: $(srcdir)/configure.py
	sudo $(lfs-chroot) -C $(chroot_srcdir) python3 configure.py --bootstrap --verbose

$(srcdir)/configure.py:
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. mkdir -pv $(chroot_srcdir)
	sudo $(lfs-chroot) -C $(chroot_srcdir)/.. tar -xf $(chroot_tarball) -C $(chroot_srcdir) --strip-components=1
	sudo $(lfs-chroot) -C $(chroot_srcdir) sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc
