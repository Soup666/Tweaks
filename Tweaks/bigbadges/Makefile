export SDKVERSION=13.7

ARCHS = arm64 arm64e
THEOS_DEVICE_IP=192.168.0.14

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = bigbadges

bigbadges_FILES = Tweak.x
bigbadges_CFLAGS = -fobjc-arc
bigbadges_FRAMEWORKS = UIKit

DEBUG=1

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += bigbadgespref
include $(THEOS_MAKE_PATH)/aggregate.mk
