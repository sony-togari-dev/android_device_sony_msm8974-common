LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := toybox_init
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := sbin/toybox_init
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)/sbin
include $(BUILD_PREBUILT)
