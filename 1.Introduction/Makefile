stamps := .stamps

c1 := 1.How_to_Build_an_LFS_System
c2 := 2.Whats_new_since_the_last_release
c3 := 3.Changelog
c4 := 4.Resources
c5 := 5.Help

.PHONY: all

all: $(stamps)/$(c1)
all: $(stamps)/$(c2)
all: $(stamps)/$(c3)
all: $(stamps)/$(c4)
all: $(stamps)/$(c5)

$(stamps)/%:
	test -n "$(LFS)"
	mkdir -p $(dir $@)
	$(MAKE) -C $(@:$(stamps)/%=%)
	touch $@

$(stamps)/$(c1):
$(stamps)/$(c2):
$(stamps)/$(c3):
$(stamps)/$(c4):
$(stamps)/$(c5):
