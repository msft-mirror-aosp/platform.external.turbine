#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := turbine
LOCAL_SRC_FILES := \
    $(call all-java-files-under, java) \
    $(call all-proto-files-under, proto)

LOCAL_JAR_MANIFEST := manifest.txt
LOCAL_STATIC_JAVA_LIBRARIES := \
    asm-5.2 \
    asm-commons-5.2 \
    asm-tree-5.2 \
    error_prone_annotations-2.0.18 \
    guava-20.0 \
    jsr305-3.0.1 \

LOCAL_IS_HOST_MODULE := true

LOCAL_PROTOC_OPTIMIZE_TYPE := full
LOCAL_PROTOC_FLAGS := --proto_path=$(LOCAL_PATH)/proto/

include $(BUILD_HOST_JAVA_LIBRARY)
