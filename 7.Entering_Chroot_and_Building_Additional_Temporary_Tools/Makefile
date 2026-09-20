stamps := .stamps

c1 := 1.Introduction
c2 := 2.Changing_Ownership
c3 := 3.Preparing_Virtual_Kernel_File_Systems
c4 := 4.Entering_the_Chroot_Environment
c5 := 5.Creating_Directories
c6 := 6.Creating_Essential_Files_and_Symlinks
c7 := 7.Gettext-1.0
c8 := 8.Bison-3.8.2
c9 := 9.Perl-5.44.0
c10 := 10.Zlib-1.3.2
c11 := 11.mpdecimal-4.0.1
c12 := 12.Python-3.14.7
c13 := 13.Texinfo-7.3
c14 := 14.Util-linux-2.42.2
c15 := 15.Cleaning_up_and_Saving_the_Temporary_System

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
all: $(stamps)/$(c12)
all: $(stamps)/$(c13)
all: $(stamps)/$(c14)
all: $(stamps)/$(c15)

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
$(stamps)/$(c12):
$(stamps)/$(c13):
$(stamps)/$(c14):
$(stamps)/$(c15):
