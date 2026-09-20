stamps := .stamps

c1 := 1.Introduction
c2 := 2.Creating_a_Limited_Directory_Layout_in_the_LFS_Filesystem
c3 := 3.Adding_the_LFS_User
c4 := 4.Setting_Up_the_Environment
c5 := 5.About_SBUs
c6 := 6.About_the_Test_Suites
c7 := 7.III._Building_the_LFS_Cross_Toolchain_and_Temporary_Tools
c8 := 8.Important_Preliminary_Material
c9 := 9.Introduction
c10 := 10.Toolchain_Technical_Notes
c11 := 11.General_Compilation_Instructions

.PHONY: all

all: $(stamps)/$(c1)
all: $(stamps)/$(c2)
all: $(stamps)/$(c3)
all: $(stamps)/$(c4)
all: $(stamps)/$(c5)
all: $(stamps)/$(c6)
all: $(stamps)/$(c7)
all: $(stamps)/$(c8)
all: $(stamps)/$(c9)
all: $(stamps)/$(c10)
all: $(stamps)/$(c11)

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
$(stamps)/$(c8):
$(stamps)/$(c9):
$(stamps)/$(c10):
$(stamps)/$(c11):
