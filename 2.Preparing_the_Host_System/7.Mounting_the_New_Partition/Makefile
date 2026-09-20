.PHONY: run

run:
	mkdir -pv '$(LFS)'
	findmnt -n -T'$(LFS)' -oOPTIONS | grep -ve'nosuid\|nodev'
