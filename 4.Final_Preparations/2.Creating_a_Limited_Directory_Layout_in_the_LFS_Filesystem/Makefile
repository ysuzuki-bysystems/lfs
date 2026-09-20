.PHONY: run

run:
	test -n "$(LFS)"
	sudo mkdir -pv $(LFS)/{etc,var} $(LFS)/usr/{bin,lib,sbin}
	sudo ln -svf usr/bin $(LFS)/bin
	sudo ln -svf usr/lib $(LFS)/lib
	sudo ln -svf usr/sbin $(LFS)/sbin
	sudo mkdir -pv $(LFS)/lib64
	sudo mkdir -pv $(LFS)/tools
