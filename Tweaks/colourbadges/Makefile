export SDKVERSION=13.7

ARCHS = arm64 arm64e
THEOS_DEVICE_IP=192.168.0.14

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = colourbadges

colourbadges_FILES = Tweak.x
colourbadges_CFLAGS = -fobjc-arc
colourbadges_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += colourbadgesprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
