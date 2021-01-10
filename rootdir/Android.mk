LOCAL_PATH := $(call my-dir)

# Device init scripts
include $(CLEAR_VARS)
LOCAL_MODULE           := fstab.mt6735
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := fstab.mt6735
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := fstab.swap
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := fstab.swap
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.mt6735.rc
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.mt6735.rc
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.trace.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.trace.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.aee.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.aee.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.project.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.project.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.modem.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.modem.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.xlog.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.xlog.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.ssd.rc
LOCAL_MODULE_TAGS       := optional eng
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := init.ssd.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.usb.rc
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.usb.rc
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.mt6735.usb.rc
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.mt6735.usb.rc
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := init.target.rc
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := init.target.rc
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE           := ueventd.mt6735.rc
LOCAL_MODULE_STEM      := ueventd.rc
LOCAL_MODULE_TAGS      := optional eng
LOCAL_MODULE_CLASS     := ETC
LOCAL_SRC_FILES        := ueventd.mt6735.rc
LOCAL_MODULE_PATH      := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
