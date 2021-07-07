#
# Copyright (C) 2018 The LineageOS Project
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


DEVICE_PATH := device/samsung/ha3g-common

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    device/samsung/ha3g-common/overlay-lineage \
    device/samsung/ha3g-common/overlay/hardware/samsung/AdvancedDisplay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml \
    $(DEVICE_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ysound.xml

#Bluetooth
PRODUCT_COPY_FILES += \
     $(DEVICE_PATH)/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth/bt_vendor.conf

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Key-layout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(DEVICE_PATH)/configs/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/sec_e-pen.idc \
    $(DEVICE_PATH)/configs/keylayout/sec_e-pen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_e-pen.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl \
    
# Wifi
PRODUCT_PACKAGES += \
    macloader

# Properties
 include $(LOCAL_PATH)/system_prop.mk

# Shipping API level
$(call inherit-product, vendor/lineage/build/target/product/product_launched_with_j_mr2.mk)

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.universal5420 

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/ha3g-common/sepolicy

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/ha3g-common/ha3g-common-vendor.mk)

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)
