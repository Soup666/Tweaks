include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = bigbadgespref

bigbadgespref_FILES = SBBRootListController.m
bigbadgespref_FRAMEWORKS = UIKit
bigbadgespref_PRIVATE_FRAMEWORKS = Preferences
bigbadgespref_INSTALL_PATH = /Library/PreferenceBundles
bigbadgespref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bigbagdes.plist"$(ECHO_END)