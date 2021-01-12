####### mmsdk #######
## libshim_mmsdk
LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	MediaBuffer.cpp \

LOCAL_SHARED_LIBRARIES := \
	libgui \
	libui \
	libstagefright_foundation

LOCAL_MODULE := libshim_mmsdk

LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
