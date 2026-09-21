tarball := lfs/sources/glibc-2.44.tar.xz
srcdir := lfs/sources/glibc-2.44

configure_opts  = --prefix=/usr
configure_opts += --host=$(LFS_TGT)
configure_opts += --build=$(shell $(srcdir)/scripts/config.guess)
configure_opts += --disable-nscd
configure_opts += libc_cv_slibdir=/usr/lib
configure_opts += --enable-kernel=5.10


.PHONY: check make make-install

check: make-install
	echo 'int main(){}' | $(LFS_TGT)-gcc -x c - -v -Wl,--verbose &> dummy.log
	test "$$($(LFS_TGT)-readelf -l a.out | grep ': /lib' | xargs)" = '[Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]'
	test "$$(grep -E -o 'lfs/lib.*/S?crt[1in].*succeeded' dummy.log|xargs)" = 'lfs/lib/Scrt1.o succeeded lfs/lib/crti.o succeeded lfs/lib/crtn.o succeeded'
	test "$$(grep -B3 '^ $(LFS)/usr/include' dummy.log | xargs)" = '#include <...> search starts here: $(LFS)/tools/lib/gcc/x86_64-lfs-linux-gnu/16.2.0/include $(LFS)/tools/lib/gcc/x86_64-lfs-linux-gnu/16.2.0/include-fixed $(LFS)/usr/include'
	test "$$(grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' | xargs)" = 'SEARCH_DIR(=$(LFS)/tools/x86_64-lfs-linux-gnu/lib64) SEARCH_DIR(=/usr/local/lib64) SEARCH_DIR(=/lib64) SEARCH_DIR(=/usr/lib64) SEARCH_DIR(=$(LFS)/tools/x86_64-lfs-linux-gnu/lib) SEARCH_DIR(=/usr/local/lib) SEARCH_DIR(=/lib) SEARCH_DIR(=/usr/lib);'
	test "$$(grep "/lib.*/libc.so.6 " dummy.log)" = 'attempt to open $(LFS)/usr/lib/libc.so.6 succeeded'
	test "$$(grep found dummy.log)" = 'found ld-linux-x86-64.so.2 at $(LFS)/usr/lib/ld-linux-x86-64.so.2'

make-install: $(srcdir)/build1/Makefile make
	$(MAKE) DESTDIR=$(LFS) install -C $(<D)
	sed '/RTLDLIST=/s@/usr@@g' -i lfs/usr/bin/ldd

make: $(srcdir)/build1/Makefile
	$(MAKE) -C $(<D)

$(srcdir)/build1/Makefile: $(srcdir)/configure | lfs/lib64/ld-linux-x86-64.so.2 lfs/lib64/ld-lsb-x86-64.so.3
	test -n $(LFS_TGT)
	mkdir -pv $(@D)
	echo "rootsbindir=/usr/sbin" > $(@D)/configparms
	(cd $(@D) && ../configure $(configure_opts))

lfs/lib64/ld-linux-x86-64.so.2:
	ln -sfv ../lib/ld-linux-x86-64.so.2 $@

lfs/lib64/ld-lsb-x86-64.so.3:
	ln -sfv ../lib/ld-linux-x86-64.so.2 $@

$(srcdir)/configure:
	tar -xf $(tarball) -C lfs/sources
	patch -Np1 -i ../glibc-fhs-1.patch -d $(@D)
	patch -Np1 -i ../glibc-2.44-upstream_fixes-1.patch -d $(@D)
