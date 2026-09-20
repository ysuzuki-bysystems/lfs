stamps := .stamps

c1 := 1.Introduction
c2 := 2.Host_System_Requirements
c3 := 3.Building_LFS_in_Stages
c4 := 4.Creating_a_New_Partition
c5 := 5.Creating_a_File_System_on_the_Partition
c6 := 6.Setting_the_LFS_Variable_and_the_Umask
c7 := 7.Mounting_the_New_Partition

.PHONY: all

all: $(stamps)/$(c1)
all: $(stamps)/$(c2)
all: $(stamps)/$(c3)
all: $(stamps)/$(c4)
all: $(stamps)/$(c5)
all: $(stamps)/$(c6)
all: $(stamps)/$(c7)

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
$(stamps)/$(c6):
$(stamps)/$(c7):
