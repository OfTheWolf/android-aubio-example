LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := aubio
APP_ABI := all

#traverse all the directory and subdirectory
define walk
  $(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef

#find all the file recursively under jni/
ALLFILES = $(call walk, $(LOCAL_PATH))
FILE_LIST := $(filter %.c, $(ALLFILES))
LOCAL_CFLAGS += -DHAVE_CONFIG_H
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include/
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := pitch
LOCAL_SRC_FILES := pitch.c
LOCAL_SHARED_LIBRARIES := aubio
include $(BUILD_SHARED_LIBRARY)