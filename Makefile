INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DisableDeviceLock

DisableDeviceLock_FILES = Tweak.x DisableDeviceLock.xm
DisableDeviceLock_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += disabledevicelockpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
