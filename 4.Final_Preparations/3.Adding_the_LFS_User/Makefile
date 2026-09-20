.PHONY: run

run:
	test -n "$(LFS)"
	getent group lfs
	getent passwd lfs
	sudo chown -v lfs $(LFS)/{usr{,/*},var,etc,tools}
	sudo chown -v lfs $(LFS)/lib64
