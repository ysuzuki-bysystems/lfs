tarball := lfs/sources/linux-7.1.8.tar.xz
srcdir := lfs/sources/linux-api-headers


.PHONY: headers-install

headers-install: $(srcdir)/Makefile
	make headers -C $(<D)
	find $(<D)/usr/include -type f ! -name '*.h' -delete
	cp -rv $(<D)/usr/include lfs/usr

$(srcdir)/Makefile:
	mkdir -pv $(srcdir)
	tar -xf $(tarball) -C $(srcdir) --strip-components=1
	make mrproper -C $(srcdir)
