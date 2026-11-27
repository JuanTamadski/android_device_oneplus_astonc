#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from astonc device
$(call inherit-product, device/oneplus/astonc/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Enable UI enhancements
TARGET_ENABLE_BLUR := true

# Enable features
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
EVO_BUILD_TYPE := Unofficial

# Optional Settings entry for the custom boot splash flasher.
CUSTOM_GOODIES_ENABLED ?= false
# (if above is true) include packages/apps/Settings/custom_goodies/custom_goodies.mk

PRODUCT_NAME := lineage_astonc
PRODUCT_DEVICE := astonc
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := PJE110

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi-user 16 BP2A.250605.015 1792383505723 release-keys" \
    BuildFingerprint=OnePlus/PJE110/OP5CF9L1:16/TP1A.220905.001/U.c18fa1_1a6b5b6_19412fa:user/release-keys \
    DeviceName=OP5CF9L1 \
    DeviceProduct=PJE110 \
    SystemDevice=OP5CF9L1 \
    SystemName=PJE110
