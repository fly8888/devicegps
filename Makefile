
#ldid -Sentitlements.xml $(THEOS_STAGING_DIR)/usr/bin/devicegps

export THEOS_DEVICE_IP = p92
export DEBUG = 0
export ARCHS = armv7 armv7s arm64
TARGET = iphone:latest:7.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = devicegps
devicegps_FILES = main.mm common.mm 
devicegps_CFLAGS = -fobjc-arc
defaults_FRAMEWORKS =  Foundation CoreLocation
#LDFLAGS = -sectcreate __TEXT __info_plist Info.plist

include $(THEOS_MAKE_PATH)/tool.mk


before-package::

	ldid -Sentitlements.xml $(THEOS_STAGING_DIR)/usr/bin/devicegps
	

after-package::
	

after-install::