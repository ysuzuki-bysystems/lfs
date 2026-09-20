stamps := .stamps

c1 := 1.Introduction
c2 := 2.Creating_a_Limited_Directory_Layout_in_the_LFS_Filesystem
c3 := 3.Adding_the_LFS_User
c4 := 4.Setting_Up_the_Environment
c5 := 5.About_SBUs
c6 := 6.About_the_Test_Suites

.PHONY: all

all: $(stamps)/$(c1)
all: $(stamps)/$(c2)
all: $(stamps)/$(c3)
all: $(stamps)/$(c4)
all: $(stamps)/$(c5)
all: $(stamps)/$(c6)

$(stamps)/%:
	test -n "$(LFS)"
	mkdir -p $(dir $@)
	$(MAKE) -C $(@:$(stamps)/%=%)
	touch $@

$(stamps)/$(c1):
$(stamps)/$(c2):
$(stamps)/$(c3): $(stamps)/$(c2)
$(stamps)/$(c4):
$(stamps)/$(c5):
$(stamps)/$(c6):
