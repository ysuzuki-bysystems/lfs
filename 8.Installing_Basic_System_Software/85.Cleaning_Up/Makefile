lfs-chroot := ../../lfs-chroot

.PHONY: run

run:
	sudo $(lfs-chroot) bash -c 'rm -rf /tmp/{*,.*}'
	sudo $(lfs-chroot) find /usr/lib /usr/libexec -name \*.la -delete
	sudo $(lfs-chroot) bash -c 'find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf'
	-sudo $(lfs-chroot) userdel -r tester
