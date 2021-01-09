## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := A2010-a

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/A2010-a/device_A2010-a.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A2010-a
PRODUCT_NAME := lineage_A2010-a
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := lenovo A2010-a
PRODUCT_MANUFACTURER := lenovo

RODUCT_GMS_CLIENTID_BASE := android-lenovo
