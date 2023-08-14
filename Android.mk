LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),oppo6833)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
