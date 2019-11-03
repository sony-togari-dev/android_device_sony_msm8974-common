# Debug current init_sony settings
$(info device-sony-common-init: init_sony for "$(TARGET_DEVICE)", platform "$(PRODUCT_PLATFORM)", with '$(BOARD_SONY_INIT_FLAGS)')

# Init overrides for init_sony
ramdisk_init      := $(TARGET_RAMDISK_OUT)/init
ramdisk_init_real := $(TARGET_RAMDISK_OUT)/init.real

# If /init is a file and not a symlink then rename it to /init.real
# and make /init be a symlink to /bin/init_sony (which will execute
# /init.real, if appropriate.
$(ramdisk_init_real): $(ramdisk_init) $(TARGET_RECOVERY_ROOT_OUT)/system/bin/toybox_static $(PRODUCT_OUT)/utilities/keycheck $(PRODUCT_OUT)/utilities/init_sony
	$(hide) if [ ! -d $(TARGET_RAMDISK_OUT)/bin ]; then \
		mkdir -p $(TARGET_RAMDISK_OUT)/bin; \
	fi
	cp $(TARGET_RECOVERY_ROOT_OUT)/system/bin/toybox_static $(TARGET_RAMDISK_OUT)/bin/toybox_init
	cp $(PRODUCT_OUT)/utilities/keycheck $(TARGET_RAMDISK_OUT)/bin/keycheck
	cp $(PRODUCT_OUT)/utilities/init_sony $(TARGET_RAMDISK_OUT)/bin/init_sony
	$(hide) if [ ! -L $(ramdisk_init) ]; then \
	  mv $(ramdisk_init) $(ramdisk_init_real); \
	  ln -s /bin/init_sony $(ramdisk_init); \
	else \
	  echo "/init $(ramdisk_init) is already a symlink"; \
	fi

ALL_DEFAULT_INSTALLED_MODULES += $(ramdisk_init_real)
