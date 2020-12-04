LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := toybox_init
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := bin/toybox_init
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)/bin
include $(BUILD_PREBUILT)
