LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

gps_conf_dir := $(LOCAL_PATH)
gps_debug_conf := gps_debug.conf
gps_conf := gps.conf

$(gps_conf_dir)/$(gps_debug_conf):
		ln -s $(gps_conf) $(TARGET_OUT_ETC)/$(gps_debug_conf)

ALL_DEFAULT_INSTALLED_MODULES += $(gps_conf_dir)/$(gps_debug_conf)
