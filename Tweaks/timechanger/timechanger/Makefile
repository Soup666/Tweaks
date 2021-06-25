TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = timechanger

timechanger_FILES = STCRootListController.m
timechanger_FRAMEWORKS = UIKit
timechanger_PRIVATE_FRAMEWORKS = Preferences
timechanger_INSTALL_PATH = /Library/PreferenceBundles
timechanger_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/timechanger.plist"$(ECHO_END)