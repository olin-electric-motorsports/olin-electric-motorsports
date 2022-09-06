DEVICE=stm32f103c8t6
OPENCM3_DIR=../../../libopencm3

CFLAGS          += -Os -ggdb3
CPPFLAGS		+= -MD
LDFLAGS         += -static -nostartfiles
LDLIBS          += -Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group

include $(OPENCM3_DIR)/mk/genlink-config.mk
include $(OPENCM3_DIR)/mk/gcc-config.mk

include $(OPENCM3_DIR)/mk/genlink-rules.mk
include $(OPENCM3_DIR)/mk/gcc-rules.mk

.PHONY: clean all

all: binary.elf binary.hex

clean:
	(RM) -rf binary.* *.o

