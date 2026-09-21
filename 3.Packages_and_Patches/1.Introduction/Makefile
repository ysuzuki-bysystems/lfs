wget-list-systemd_url := https://www.linuxfromscratch.org/lfs/view/13.1-systemd/wget-list-systemd
md5sums_url := https://www.linuxfromscratch.org/lfs/view/13.1-systemd/md5sums
# for override
WGET_LIST_URL ?= $(wget-list-systemd_url)

download := download

.PHONY: run

run: download.mk md5sums
	test -n '$(LFS)'
	mkdir -p $(download)
	$(MAKE) -f download.mk -j4
	(cd $(download) && md5sum --quiet -c $(CURDIR)/md5sums)
	sudo mkdir -pv '$(LFS)/sources'
	sudo chmod a+wt '$(LFS)/sources'
	sudo install -o root -g root -m 644 -t '$(LFS)/sources' $(download)/*

wget-list-systemd:
	curl -fL '$(WGET_LIST_URL)' -o$@
	# patch for issues with ftpmirror.gnu.org (2026/9/20)
	sed -i -e's|ftpmirror.gnu.org/|mirrors.edge.kernel.org/gnu/|g' $@

md5sums:
	curl -fL '$(md5sums_url)' -o$@

download.mk: wget-list-systemd
	./gen-make-download $< $(download) > $@
