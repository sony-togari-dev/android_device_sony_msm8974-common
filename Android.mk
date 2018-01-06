LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),sony)
ifeq ($(TARGET_BOARD_PLATFORM),msm8974)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
    include hardware/qcom/gps/sdm845/Android.mk
endif
endif
