#
# Copyright (C) 2020 Android Open Source Project
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

DEVICE_PATH := device/xiaomi/chopin

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_SHIPPING_API_LEVEL := 30

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Call proprietary blob setup
$(call inherit-product-if-exists, vendor/xiaomi/chopin/chopin-vendor.mk)
$(call inherit-product-if-exists, vendor/mediatek/ims/mtk-ims.mk)

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0.vendor  \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer \
    libtinycompress \
    libaudiofoundation.vendor \
    libtinycompress.vendor

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_stub.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_stub.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default_volume_tables.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/config/audio/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_default_stream_volumes.xml \
    $(LOCAL_PATH)/config/audio/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/config/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_stream_volumes.xml

# A/B
PRODUCT_VIRTUAL_AB_OTA := true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Audio Shim
PRODUCT_PACKAGES += \
    libshim_audio

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl.mt6893.recovery \
    bootctrl.mt6893

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/lib64/android.hardware.boot@1.0-impl-1.1-mtkimpl.so:recovery/root/system/lib64/hw/android.hardware.boot@1.0-impl-1.1-mtkimpl.so

# Build MT-PL-Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Camera
PRODUCT_PACKAGES += \
    Snap \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6.vendor

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    libdrm.vendor \
    libvulkan

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-resources.vendor \
    android.hidl.allocator@1.0.vendor \
    android.hardware.memtrack@1.0.vendor

PRODUCT_PACKAGES += \
    disable_configstore

PRODUCT_PACKAGES += \
    libfmq.vendor

# DTB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl:64 \
    android.hardware.drm@1.0-service-lazy \
    android.hardware.drm@1.4-service.clearkey

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.4.vendor

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/lib64/android.hardware.fastboot@1.0-impl-mtk.so:recovery/root/system/lib64/hw/android.hardware.fastboot@1.0-impl-mtk.so

# Exclude sensor from InputManager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/sensor/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Fstab in ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.mt6893 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.mt6891 \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_RAMDISK)/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6893 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6891 \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6893 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6891 \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_RAMDISK)/fstab.emmc \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:recovery/root/first_stage_ramdisk/fstab.mt6891 \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6891:recovery/root/first_stage_ramdisk/fstab.mt6893 \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:recovery/root/first_stage_ramdisk/fstab.emmc

# F2FS
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor

# Heath hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder \
    libhardware \
    libhardware.recovery \
    libhardware_legacy \
    libhardware_legacy.recovery

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6891:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6891

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Copy the kernel from the prebuilts directory.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz:Image.gz

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/config/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/config/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl

# Additional target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor:64 \
    libkeymaster4support.vendor:64 \
    libkeymaster_portable.vendor:64 \
    libkeymaster_messages.vendor:64 \
    libsoft_attestation_cert.vendor:64 \
    libpuresoftkeymasterdevice.vendor:64 \
    android.hardware.keymaster@4.1-service

PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.chopin

# Media Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Minijail
PRODUCT_PACKAGES += \
    libavservices_minijail.vendor

# Net
PRODUCT_PACKAGES += \
    libpcap.vendor

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    com.nxp.nfc.nq \
    libnqnfc_nci_jni \
    nfc_nci.nqx.default.hw \
    NQNfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    Tag \
    SecureElement \
    vendor.nxp.hardware.nfc@1.1-service

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_PACKAGES += \
    FrameworkResOverlay \
    SettingsOverlay \
    TelephonyOverlay \
    TetheringConfigOverlay \
    WifiOverlay

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

PRODUCT_ENFORCE_RRO_TARGETS := *

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/config/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Rootdir
PRODUCT_PACKAGES += \
    init.recovery.mt6891.rc \
    init.recovery.mt6893.rc \
    init.recovery.usb.rc \
    init.mt6891.rc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.mt6891.rc:recovery/root/init.recovery.mt6891.rc

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor

# Ramdisk
PRODUCT_PACKAGES += \
    ueventd.mtk.rc

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge \
    android.frameworks.sensorservice@1.0

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Shims
PRODUCT_PACKAGES += \
    libshim_vtservice

# Properties
include $(LOCAL_PATH)/config/prop/default.mk

# Text classifier
PRODUCT_PACKAGES += \
    libtextclassifier_hash.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0.vendor

# TinyXML
PRODUCT_PACKAGES += \
    libtinyxml \
    libtinyxml.vendor

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Vibrator
PRODUCT_PACKAGES += \
     android.hardware.vibrator-V1-ndk_platform.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    wpa_supplicant