TARGET = simulator:clang::7.0
ARCHS = x86_64 i386

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = test

test_FILES = TTTRootListController.m
test_FRAMEWORKS = UIKit
test_PRIVATE_FRAMEWORKS = Preferences
test_INSTALL_PATH = /Library/PreferenceBundles
test_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/test.plist"$(ECHO_END)
