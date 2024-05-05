ARCHS = arm64 #arm64e
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = study
study_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
CFLAGS = -fobjc-arc #-w #-Wno-deprecated -Wno-deprecated-declarations
study_FILES = Tweak.xm View.mm switches.mm $(wildcard KittyMemory/*.cpp)
study_LIBRARIES += substrate

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
