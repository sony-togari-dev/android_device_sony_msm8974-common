ramdisk_init        := $(TARGET_RAMDISK_OUT)/init
ramdisk_init_real   := $(TARGET_RAMDISK_OUT)/init.real
ramdisk_init_sony   := $(TARGET_RAMDISK_OUT)/bin/init_sony
ramdisk_keycheck    := $(TARGET_RAMDISK_OUT)/bin/keycheck
ramdisk_toybox_init := $(TARGET_RAMDISK_OUT)/bin/toybox_init

# If /init is a file and not a symlink then rename it to /init.real
# and make /init be a symlink to /bin/init_sony (which will execute
# /init.real, if appropriate.
$(ramdisk_init_real): \
	$(ramdisk_init) \
	$(ramdisk_init_sony) \
	$(ramdisk_keycheck) \
	$(ramdisk_toybox_init)
	if [ ! -L $(ramdisk_init) ]; then \
	  mv $(ramdisk_init) $(ramdisk_init_real); \
	  ln -s /bin/init_sony $(ramdisk_init); \
	else \
	  echo "init.real: $(ramdisk_init) is already a symlink"; \
	fi

ALL_DEFAULT_INSTALLED_MODULES += $(ramdisk_init_real)
