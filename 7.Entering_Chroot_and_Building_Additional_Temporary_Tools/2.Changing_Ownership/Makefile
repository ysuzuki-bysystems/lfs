.PHONY: run

run:
	test -n $(LFS)
	sudo chown --from lfs -R root:root $(LFS)/{usr,var,etc,tools}
	sudo chown --from lfs -R root:root $(LFS)/lib64
