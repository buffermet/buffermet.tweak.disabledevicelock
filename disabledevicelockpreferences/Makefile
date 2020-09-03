include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DisableDeviceLockPreferences

DisableDeviceLockPreferences_FILES = NLDPRootListController.m
DisableDeviceLockPreferences_INSTALL_PATH = /Library/PreferenceBundles
DisableDeviceLockPreferences_FRAMEWORKS = UIKit
DisableDeviceLockPreferences_PRIVATE_FRAMEWORKS = Preferences
DisableDeviceLockPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DisableDeviceLockPreferences.plist$(ECHO_END)
