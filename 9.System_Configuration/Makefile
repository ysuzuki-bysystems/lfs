stamps := .stamps

c1 := 1.Introduction
c2 := 2.General_Network_Configuration
c3 := 3.Overview_of_Device_and_Module_Handling
c4 := 4.Managing_Devices
c5 := 5.Configuring_the_System_Clock
c6 := 6.Configuring_the_Linux_Console
c7 := 7.Configuring_the_System_Locale
c8 := 8.Creating_the_etc_inputrc_file
c9 := 9.Creating_the_etc_shells_file
c10 := 10.Systemd_Usage_and_Configuration

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
