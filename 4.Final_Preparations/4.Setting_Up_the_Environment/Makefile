.PHONY: nop

nop:
	test -n $(LFS)
	test '$(LC_ALL)' = POSIX
	test '$(LFS_TGT)' = x86_64-lfs-linux-gnu
	test '$(PATH)' = '$(LFS)/tools/bin:/usr/bin'
	test '$(CONFIG_SITE)' = '$(LFS)/usr/share/config.site'
