ifneq ($(filter oppo6833,$(TARGET_DEVICE)),)
LOCAL_PATH := device/alps/oppo6833
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
