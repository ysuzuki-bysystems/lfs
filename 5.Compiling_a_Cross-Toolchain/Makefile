stamps := .stamps

c1 := 1.Introduction
c2 := 2.Binutils-2.47_-_Pass_1
c3 := 3.GCC-16.2.0_-_Pass_1
c4 := 4.Linux-7.1.8_API_Headers
c5 := 5.Glibc-2.44
c6 := 6.Libstdc++_from_GCC-16.2.0

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
$(stamps)/$(c3):
$(stamps)/$(c4):
$(stamps)/$(c5):
$(stamps)/$(c6):
