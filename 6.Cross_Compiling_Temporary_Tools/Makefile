stamps := .stamps

c1 := 1.Introduction
c2 := 2.M4-1.4.21
c3 := 3.Ncurses-6.6
c4 := 4.Bash-5.3
c5 := 5.Coreutils-9.11
c6 := 6.Diffutils-3.12
c7 := 7.File-5.48
c8 := 8.Findutils-4.11.0
c9 := 9.Gawk-5.4.1
c10 := 10.Grep-3.12
c11 := 11.Gzip-1.14
c12 := 12.Make-4.4.1
c13 := 13.Patch-2.8
c14 := 14.Sed-4.10
c15 := 15.Tar-1.35
c16 := 16.Xz-5.8.3
c17 := 17.Binutils-2.47_-_Pass_2
c18 := 18.GCC-16.2.0_-_Pass_2

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
all: $(stamps)/$(c16)
all: $(stamps)/$(c17)
all: $(stamps)/$(c18)

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
$(stamps)/$(c16):
$(stamps)/$(c17):
$(stamps)/$(c18):
