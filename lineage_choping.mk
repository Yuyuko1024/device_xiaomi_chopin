#
# Copyright (C) 2019 Potato Open Sauce Project
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
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

# Inherit from device makefile
$(call inherit-product, device/xiaomi/chopin/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

IS_GLOBAL := true

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_choping
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := choping
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 21061110AG

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Build info
BUILD_FINGERPRINT := redmi/chopin/chopin:11/RP1A.200720.011/V12.5.6.0.RKPCNXM:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=chopin \
    PRODUCT_NAME=chopin \
	PRIVATE_BUILD_DESC="chopin-user 11 RP1A.200720.011 V12.5.6.0.RKPCNXM release-keys"
