stamps := .stamps

c1 := 1.Introduction
c2 := 2.Creating_the_etc_fstab_file
c3 := 3.Linux-7.1.8
c4 := 4.Using_GRUB_to_Set_Up_the_Boot_Process

.PHONY: all

all: $(stamps)/$(c1)
all: $(stamps)/$(c2)
all: $(stamps)/$(c3)
all: $(stamps)/$(c4)

$(stamps)/%:
	test -n "$(LFS)"
	mkdir -p $(dir $@)
	$(MAKE) -C $(@:$(stamps)/%=%)
	touch $@

$(stamps)/$(c1):
$(stamps)/$(c2):
$(stamps)/$(c3):
$(stamps)/$(c4):
