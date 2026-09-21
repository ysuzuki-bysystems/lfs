tarball := lfs/sources/linux-7.1.8.tar.xz
srcdir := lfs/sources/linux-7.1.8


.PHONY: headers-install

headers-install: $(srcdir)/Makefile
	make mrproper -C $(<D)
	make headers -C $(<D)
	# broken make mrproper: scripts/Makefile.clean:12: usr/include/Makefile: No such file or directory
	#find $(<D)/usr/include -type f ! -name '*.h' -delete
	#cp -rv $(<D)/usr/include $(LFS)/usr
	cp -r $(<D)/usr/include $(<D)/usr/include2
	find $(<D)/usr/include2 -type f ! -name '*.h' -delete
	cp -rv $(<D)/usr/include2/* lfs/usr/include
	$(RM) -r $(<D)/usr/include2

$(srcdir)/Makefile:
	tar -xf $(tarball) -C lfs/sources
