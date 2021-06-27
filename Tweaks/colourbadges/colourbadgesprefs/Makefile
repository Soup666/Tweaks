

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = colourbadgesprefs

colourbadgesprefs_FILES = SCBRootListController.m
colourbadgesprefs_FRAMEWORKS = UIKit
colourbadgesprefs_PRIVATE_FRAMEWORKS = Preferences
colourbadgesprefs_INSTALL_PATH = /Library/PreferenceBundles
colourbadgesprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/colourbadges.plist"$(ECHO_END)