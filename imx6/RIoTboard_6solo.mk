# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

ifneq ($(wildcard device/fsl/RIoTboard_6solo/fstab_nand.freescale),)
$(shell touch device/fsl/RIoTboard_6solo/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/RIoTboard_6solo/fstab.freescale),)
$(shell touch device/fsl/RIoTboard_6solo/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := RIoTboard_6solo
PRODUCT_DEVICE := RIoTboard_6solo

PRODUCT_COPY_FILES += \
	device/fsl/RIoTboard_6solo/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/RIoTboard_6solo/init.rc:root/init.freescale.rc \
	device/fsl/RIoTboard_6solo/gpsreset.sh:system/etc/gpsreset.sh \
	device/fsl/RIoTboard_6solo/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/RIoTboard_6solo/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/fsl/RIoTboard_6solo/rt5370sta.ko:system/lib/hw/rt5370sta.ko \
	device/fsl/RIoTboard_6solo/RT2870STA.dat:/system/etc/Wireless/RT2870STA/RT2870STA.dat \
	device/fsl/RIoTboard_6solo/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
	device/fsl/RIoTboard_6solo/ads7846.idc:system/usr/idc/ads7846.idc

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/RIoTboard_6solo/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
endif
