export SDKVERSION=13.7

ARCHS = arm64 arm64e
THEOS_DEVICE_IP=192.168.0.14
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TimeChanger

TimeChanger_FILES = Tweak.x
TimeChanger_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += timechanger
include $(THEOS_MAKE_PATH)/aggregate.mk
