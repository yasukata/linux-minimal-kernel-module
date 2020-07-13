PWD := $(shell pwd)
KDIR := /lib/modules/$(shell uname -r)/build

obj-m += kmod.o

EXTRA_CFLAGS=-I$(PWD)/include

SUBDIRS := $(PWD)
COMMON_OPS = -C $(KDIR) M='$(SUBDIRS)' EXTRA_CFLAGS='$(EXTRA_CFLAGS)'

deafult:
	$(MAKE) $(COMMON_OPS) modules

clean:
	rm -rf *.o *.ko *.cmd *.mod.c *.mod .*.cmd .tmp_versions modules.order Module.symvers *~
