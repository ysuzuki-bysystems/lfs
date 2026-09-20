.PHONY: check

check: version-check.out
	grep -ve '^ERROR:' $<

version-check.out: version-check.sh
	bash $< | tee $@
