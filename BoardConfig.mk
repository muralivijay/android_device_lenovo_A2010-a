
DEVICE_PATH := device/lenovo/a2010
VENDOR_PATH := vendor/lenovo/a2010

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Build arm based ROM
# disable this incase if building arm64
FORCE_32_BIT = true

# inherit from the proprietary version
-include $(VENDOR_PATH)/BoardConfigVendor.mk

# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
endif

TARGET_BOARD_PLATFORM := mt6735m
TARGET_CPU_SMP := true

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := false
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := A2010-a
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive ## Permissive selinux
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000 --board B3502_AC50CO_3M
#in case we want to build kernel from source
# uncomment the following lines
#TARGET_KERNEL_SOURCE := kernel/lenovo/a2010
#TARGET_KERNEL_CONFIG := a2010_debug_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-android-
#BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
# end of commented lines
#for now lets use prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

# Partition size extracted from /proc/partinfo
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 0x1000000 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 50331648 # 0x3000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 0x60000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12831948800 # 0x2fcd80000
BOARD_CACHEIMAGE_PARTITION_SIZE := 419439400 # 0x19000000
BOARD_FLASH_BLOCK_SIZE := 131072

# Global Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true

#recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

# Assert
TARGET_OTA_ASSERT_DEVICE := A2010-a

#system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true

#Mediatek flags
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# Display
BOARD_EGL_CFG := /device/lenovo/a2010/egl.cfg
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# CyanogenMod Hardware Hooks
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/cmhw/

# RIL
BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/ril

# Sepolicy
BOARD_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy

# Seccomp
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# Symlink
TARGET_LDPRELOAD += libmtk_symbols.so:libshim_mmsdk.so
TARGET_LD_SHIM_LIBS := \
        /system/lib/libmmsdkservice.feature.so|libshim_mmsdk.so

# Init.rc
TARGET_PROVIDES_INIT_RC := true

# Zygote
ifeq ($(FORCE_32_BIT),true)
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote32
else
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote64_32
endif
