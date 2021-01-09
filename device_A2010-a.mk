$(call inherit-product-if-exists, vendor/Lenovo/A2010-a/A2010-a-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Product Inherit
ifeq ($(FORCE_32_BIT),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/aosp_arm64.mk)
endif

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/Lenovo/A2010-a/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_DEFAULT_LANGUAGE := en
PRODUCT_DEFAULT_REGION   := EG

# Prebuilt Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/Lenovo/A2010-a/prebuilt/Image.gz-dtb
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Ramdisk
PRODUCT_COPY_FILES += \
    device/Lenovo/A2010-a/rootdir/init.rc:root/init.rc \
    device/Lenovo/A2010-a/rootdir/init.target.rc:root/init.target.rc \
    device/Lenovo/A2010-a/rootdir/init.mt6735.rc:root/init.mt6735.rc \
    device/Lenovo/A2010-a/rootdir/init.ssd.rc:root/init.ssd.rc \
    device/Lenovo/A2010-a/rootdir/init.xlog.rc:root/init.xlog.rc \
    device/Lenovo/A2010-a/rootdir/init.usb.rc:root/init.usb.rc \
    device/Lenovo/A2010-a/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
    device/Lenovo/A2010-a/rootdir/init.aee.rc:root/init.aee.rc \
    device/Lenovo/A2010-a/rootdir/init.project.rc:root/init.project.rc \
    device/Lenovo/A2010-a/rootdir/init.modem.rc:root/init.modem.rc \
    device/Lenovo/A2010-a/rootdir/init.trace.rc:root/init.trace.rc \
    device/Lenovo/A2010-a/rootdir/fstab.mt6735:root/fstab.mt6735 \
    device/Lenovo/A2010-a/rootdir/fstab.swap:root/fstab.swap \
    device/Lenovo/A2010-a/rootdir/ueventd.rc:root/ueventd.rc
    
# system inits
PRODUCT_COPY_FILES += \
    device/Lenovo/A2010-a/prebuilt/system/etc/init/audioserver.rc:system/etc/init/audioserver.rc \
    device/Lenovo/A2010-a/prebuilt/system/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    device/Lenovo/A2010-a/prebuilt/system/etc/init/cameraserver.rc:system/etc/init/cameraserver.rc \
    device/Lenovo/A2010-a/prebuilt/system/etc/init/rild.rc:system/etc/init/rild.rc
    
# Media
PRODUCT_COPY_FILES += \
    device/Lenovo/A2010-a/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/Lenovo/A2010-a/configs/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Camera
PRODUCT_PACKAGES += \
    Camera2    

# RIL
PRODUCT_PACKAGES += \
    gsm0710muxd

# Mtk_symbols
PRODUCT_PACKAGES += \
    libmtk_symbols \

# xlog
PRODUCT_PACKAGES += \
    libxlog \
    libperfservicenative \
    libcurl

# Power
PRODUCT_PACKAGES += \
    power.mt6735m

# Wifi + a2dp
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    lib_driver_cmd_mt66xx
    
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory    

PRODUCT_COPY_FILES += \
    device/Lenovo/A2010-a/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \

# Audio componets from source
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.r_submix.default \
    audio.a2dp.default

#PRODUCT_PACKAGES += stlport_shared
PRODUCT_COPY_FILES += \
    prebuilts/ndk/current/sources/cxx-stl/stlport/libs/armeabi-v7a/libstlport_shared.so:system/lib/libstlport.so

# These additionals go to /default.prop
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mtp \
ro.mount.fs=EXT4 \
persist.radio.multisim.config=dsds \
ro.telephony.ril_class=MT6735 \
ro.telephony.ril.config=fakeiccid \
ro.telephony.sim.count=2 \
persist.gemini.sim_num=2 \
ril.current.share_modem=2 \
persist.debug.xlog.enable=1 \
persist.service.adb.enable=1 \
ro.adb.secure=0 \
ro.secure=0 \
ro.debuggable=1

# Keyhandler package
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

PRODUCT_SYSTEM_SERVER_JARS += com.cyanogenmod.keyhandler

# Never dexopt the keyhandler
$(call add-product-dex-preopt-module-config,com.cyanogenmod.keyhandler,disable)
