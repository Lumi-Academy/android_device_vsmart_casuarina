#
# Copyright (C) 2020 The LineageOS Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from vin8953 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := vsmart
PRODUCT_DEVICE := vin8953
PRODUCT_MANUFACTURER := vsmart
PRODUCT_NAME := lineage_vin8953
PRODUCT_MODEL := Vin8953

# userdebug
PRODUCT_BUILD_PROP_OVERRIDES += \
        TARGET_DEVICE=casuarina \
        PRIVATE_BUILD_DESC="casuarina-user 10 QKQ1.200311.002 V430A_OPN_U_B13_210315 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := vsmart/casuarina_open/casuarina:10/QKQ1.200311.002/V430A_OPN_U_B15_211112:user/release-keys
