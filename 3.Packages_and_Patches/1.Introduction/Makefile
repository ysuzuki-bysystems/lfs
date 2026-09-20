wget-list-systemd_url := https://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list-systemd
md5sums_url := https://www.linuxfromscratch.org/lfs/view/stable-systemd/md5sums

download := download

.PHONY: run

run: download.mk md5sums
	test -n '$(LFS)'
	mkdir -p $(download)
	$(MAKE) -f download.mk
	(cd $(download) && md5sum -c $(CURDIR)/md5sums)
	sudo mkdir -pv '$(LFS)/sources'
	sudo chmod a+wt '$(LFS)/sources'
	sudo install -o root -g root -m 644 -t '$(LFS)/sources' $(wildcard $(download)/*)

wget-list-systemd:
	curl -fL '$(wget-list-systemd_url)' -o$@
	# patch for issues with ftpmirror.gnu.org (2026/9/20)
	sed -i -e's|ftpmirror.gnu.org/|mirrors.edge.kernel.org/gnu/|g' $@

md5sums:
	curl -fL '$(md5sums_url)' -o$@

download.mk: wget-list-systemd
	./gen-make-download $< $(download) > $@
