export SDKVERSION=13.7

ARCHS = arm64 arm64e
THEOS_DEVICE_IP=192.168.0.14

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SoupsColourPicker

SoupsColourPicker_FILES = Tweak.x
SoupsColourPicker_CFLAGS = -fobjc-arc
SoupsColourPicker_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += soupscolourpickerprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
