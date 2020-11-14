$(call inherit-product-if-exists, vendor/lenovo/a2010/a2010-vendor.mk)
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
DEVICE_PACKAGE_OVERLAYS += device/lenovo/a2010/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_DEFAULT_LANGUAGE := en
PRODUCT_DEFAULT_REGION   := EG

# Prebuilt Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/lenovo/a2010/prebuilt/Image.gz-dtb
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc \
    init.mt6735.rc \
    init.ssd.rc \
    init.usb.rc \
    init.mt6735.usb.rc \
    init.aee.rc \
    init.project.rc \
    init.modem.rc \
    init.trace.rc \
    fstab.mt6735 \
    fstab.swap \
    ueventd.mt6735.rc

# system inits
PRODUCT_COPY_FILES += \
    device/lenovo/a2010/prebuilt/system/etc/init/audioserver.rc:system/etc/init/audioserver.rc \
    device/lenovo/a2010/prebuilt/system/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    device/lenovo/a2010/prebuilt/system/etc/init/rild.rc:system/etc/init/rild.rc

# Media
PRODUCT_COPY_FILES += \
    device/lenovo/a2010/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/lenovo/a2010/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/lenovo/a2010/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    device/lenovo/a2010/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    device/lenovo/a2010/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
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
    Camera2 \
    libcam.halsensor

# RIL
PRODUCT_PACKAGES += \
    gsm0710muxd

# Mtk_symbols
PRODUCT_PACKAGES += \
    libmtk_symbols \

# libshims
PRODUCT_PACKAGES += \
   libshim_mmsdk \
   libshim_wvm

# Perf
PRODUCT_PACKAGES += \
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
    device/lenovo/a2010/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \

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

# YGPS
PRODUCT_PACKAGES += \
   YGPS

# Disable cameraserver
PRODUCT_PROPERTY_OVERRIDES += \
     media.stagefright.legacyencoder=true \
     media.stagefright.less-secure=true \
