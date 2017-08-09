# RIL config parameters
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d[SPACE]/dev/smd0 \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    ro.ril.enable.amr.wideband=1

# LTE, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9 \
    ro.ril.telephony.mqanelements=5 \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.add_power_save=1 \
    persist.radio.oem_socket=true \
    persist.data.netmgrd.qos.enable=true \
	persist.data.tcpackprio.enable=true \
	ro.data.large_tcp_window_size=true \
    persist.radio.calls.on.ims=0
