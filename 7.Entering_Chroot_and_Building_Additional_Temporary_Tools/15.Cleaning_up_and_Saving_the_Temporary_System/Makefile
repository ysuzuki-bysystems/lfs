lfs-chroot := ../../lfs-chroot

.PHONY: run

run:
	sudo $(lfs-chroot) rm -rf /usr/share/{info,man,doc}/*
	sudo $(lfs-chroot) find /usr/{lib,libexec} -name \*.la -delete
	#sudo $(lfs-chroot) rm -rf /tools
