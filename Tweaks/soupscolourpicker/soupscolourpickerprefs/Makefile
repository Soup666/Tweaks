include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SoupsColourPickerPrefs

SoupsColourPickerPrefs_FILES = SSCRootListController.m
SoupsColourPickerPrefs_FRAMEWORKS = UIKit
SoupsColourPickerPrefs_PRIVATE_FRAMEWORKS = Preferences
SoupsColourPickerPrefs_INSTALL_PATH = /Library/PreferenceBundles
SoupsColourPickerPrefs_CFLAGS = -fobjc-arc
SoupsColourPickerPrefs_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk


internal-stage::
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences"$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist "$(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/soupscolourpicker.plist"$(ECHO_END)