#
# Copyright (C) 2024 VoidUI Project
#
# SPDX-License-Identifier: Apache-2.0
#

CAMERA_PATH := vendor/xiaomi/camera

# Permissions
PRODUCT_COPY_FILES += \
     $(call find-copy-subdir-files,*,$(CAMERA_PATH)/configs/permissions/,$(TARGET_COPY_OUT_SYSTEM)/etc)

# CameraX Config Overwrite
PRODUCT_COPY_FILES += \
     $(CAMERA_PATH)/configs/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

# Device-Features
PRODUCT_COPY_FILES += \
     $(CAMERA_PATH)/configs/device_features/alioth.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/device_features/alioth.xml \
     $(CAMERA_PATH)/configs/device_features/aliothin.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/device_features/aliothin.xml

# Properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.com.google.lens.oem_camera_package=com.android.camera \
    ro.miui.notch=1

# Logging
PRODUCT_SYSTEM_PROPERTIES += \
   log.tag.CHIUSECASE=ERROR

PRODUCT_VENDOR_PROPERTIES += \
   persist.vendor.camera.logInfoMask=false

# Sepolicy Camera
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(CAMERA_PATH)/sepolicy/camera/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(CAMERA_PATH)/sepolicy/camera/private

# Sepolicy MiSys
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(CAMERA_PATH)/sepolicy/misys/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(CAMERA_PATH)/sepolicy/misys/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(CAMERA_PATH)/sepolicy/misys/public

# MiSys HIDL deps
PRODUCT_PACKAGES += \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0.vendor \
    android.hidl.memory.block@1.0 \
    android.hidl.memory.block@1.0.vendor \
    android.hidl.memory@1.0-impl

# RRO Overlays
PRODUCT_PACKAGES += \
    MiuiCameraOverlay \
    MiuiCameraOverlayLos \
    MiuiCameraOverlayAosp

# System Properties
PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.camera.privapp.list=com.android.camera \
    ro.com.google.lens.oem_camera_package=com.android.camera \
    vendor.camera.aux.packagelist=com.android.camera,org.pixelexperience.faceunlock

$(call inherit-product, $(CAMERA_PATH)/camera-vendor.mk)
