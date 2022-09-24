#
# Copyright (C) 2019-2020 The LineageOS Project
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

# Vendor blobs
$(call inherit-product, vendor/vsmart/casuarina/casuarina-vendor.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)


# System properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Set system properties identifying the chipset
PRODUCT_VENDOR_PROPERTIES += ro.soc.manufacturer=QTI
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=SDM450

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.mapper@2.1-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.frameworks.displayservice@1.0 \

PRODUCT_PACKAGES += \
    gralloc.msm8953 \
    hwcomposer.msm8953 \
    memtrack.msm8953 \
    libdisplayconfig \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libgralloc.qti \
    libqdMetaData \
    libqdMetaData.system \
    libqdMetaData.vendor \
    libvulkan \
    libtinyxml \
    libtinyxml.vendor

PRODUCT_PACKAGES += \
    vendor.display.config@1.0.vendor \
    vendor.display.config@2.0.vendor

# Disable skip validate
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.disable_skip_validate=1

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.disable_ahardware_buffer=1

#
# system prop for opengles version
#
# 196608 is decimal for 0x30000 to report major/minor versions as 3/0
# 196609 is decimal for 0x30001 to report major/minor versions as 3/1
# 196610 is decimal for 0x30002 to report major/minor versions as 3/2
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

PRODUCT_PROPERTY_OVERRIDES += ro.hardware.vulkan=adreno
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.egl=adreno

# Encryption
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.allow_encrypt_override=true
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.volume.filenames_mode=aes-256-cts

# FRP
PRODUCT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/bootdevice/by-name/config

# Keystore
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.keystore_desede=true

# LED packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.msm8953

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# IPV4
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.data.profile_update=true

PRODUCT_PROPERTY_OVERRIDES += ro.telephony.iwlan_operation_mode=legacy

#INIT
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    init.recovery.qcom.rc \
    init.qcom.factory.rc \
    init.qcom.usb.rc \
    init.msm.usb.configfs.rc \
    ueventd.qcom.rc \
    vold.fstab \
    init.time_daemon.rc \
    init.fpsensor.rc

PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.class_late.sh \
    init.mdm.sh \
    init.qcom.early_boot.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sdio.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.can.sh \
    init.qti.ims.sh \
    init.qti.charger.sh \
    qca6234-service.sh \

# CRDA += init.crda.sh #TODO fix CRDA packages later

#Add init.qcom.test.rc to PRODUCT_PACKAGES_DEBUG list
PRODUCT_PACKAGES += \
	init.qcom.test.rc \
	init.qcom.debug.sh

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor \
    libgui_vendor \
    libstdc++.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.isp.clock.optmz=0 \
    persist.vendor.camera.lib2d.rotation=on

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Component overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
           dalvik.vm.heapminfree=4m \
           dalvik.vm.heapstartsize=16m \
           vendor.vidc.disable.split.mode=1

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)


# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0 \
    android.hardware.audio.common@7.0 \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio@7.0-impl:32 \
    android.hardware.audio.effect@7.0 \
    android.hardware.audio.effect@7.0-impl:32 \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.1-impl \
    audio.a2dp.default \
    audio.primary.msm8953 \
    audio.r_submix.default \
    audio.usb.default \
    libaacwrapper \
    libaudio-resampler \
    libautohal \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    tinymix


AUDIO_HAL_PATH := hardware/qcom-caf/msm8953/audio

# Audio files
PRODUCT_COPY_FILES += \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_sku3_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_sku3_tasha.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_sku4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_sku4.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_platform_info_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tashalite.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_sku3_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_sku3_tasha.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_sku4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_sku4.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9306.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9306.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(AUDIO_HAL_PATH)/configs/msm8953/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Audio config files
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Audio Specific properties
# Properties
-include $(LOCAL_PATH)/audio_properties.mk

DEVICE_PACKAGE_OVERLAYS += $(AUDIO_HAL_PATH)/configs/common/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Media / StagefrightCodec 2.0
PRODUCT_PACKAGES += \
    libstagefright_ccodec

PRODUCT_PROPERTY_OVERRIDES += debug.stagefright.omx_default_rank=0

# OMX
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    sensors.casuarina \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_PACKAGES += \
    LumiOverlay

# FBE support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qti.qseecomd.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.qseecomd.sh

# Gatekeeper and Keymaster for vendor
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@3.0.vendor \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.keymaster@4.1.vendor

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml \
    $(LOCAL_PATH)/configs/perf/perf-profile0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perf-profile0.conf

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcomsysd.enabled=1 \
    ro.vendor.extension_library=libqti-perfd-client.so \
    sys.vendor.shutdown.waittime=500

# Enable vndk-sp Libraries
PRODUCT_PACKAGES += \
    libgui_vendor:32 \
    vndk_package

# Disable Vulkan feature level 1
TARGET_NOT_SUPPORT_VULKAN_FEATURE_LEVEL_1 := true

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee \
    vendor.qti.hardware.cryptfshw@1.0 \
    vendor.qti.hardware.cryptfshw@1.0.vendor

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm \
    vendor.lineage.livedisplay@2.0-service-sysfs

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0 \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    vendor.qti.hardware.perf@1.0.vendor \
    vendor.qti.hardware.perf@2.2 \
    vendor.qti.hardware.perf@2.2.vendor

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/msm_irqbalance_little_big.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance_little_big.conf \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Service Tracker
PRODUCT_PACKAGES += \
	vendor.qti.hardware.servicetracker@1.2.vendor

# System helper
PRODUCT_PACKAGES += \
	vendor.qti.hardware.systemhelper@1.0

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl:64 \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl:32 \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0 \
    vendor.qti.hardware.btconfigstore@2.0.vendor \
    AntHalService

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti:64 \
    android.hardware.gnss@2.1-service-qti \
    libbatching \
    libgeofencing \
    libgnss \
    libgnsspps \
    libsynergy_loc_api \
    libwifi-hal-ctrl \
    libgps.utils

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    xtwifi.conf

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

PRODUCT_PROPERTY_OVERRIDES += \
    persist.backup.ntpServer=0.pool.ntp.org

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Netd
PRODUCT_PACKAGES += \
    libnetd_resolv

# QMI
PRODUCT_PACKAGES += \
    libjson

# Radio
PRODUCT_PACKAGES += \
    librmnetctl \
    libprotobuf-cpp-full

# Radio Config for vendor
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor

# Netd for vendor
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += vendor.rild.libpath=/vendor/lib64/libril-qc-qmi-1.so
#vendor prop to disable advanced network scanning
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.enableadvancedscan=false
# Enable Dual SIM by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.procedure_bytes=SKIP

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Secure Element
PRODUCT_PACKAGES += \
    SecureElement \
    android.hardware.secure_element@1.2 \
    android.hardware.secure_element@1.1.vendor \
    android.hardware.secure_element@1.2.vendor

# Framework Detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libvndfwk_detect_jni.qti \
    libqti_vndfwk_detect.vendor

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

# Hostapd
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd_default.conf

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libnl \
    libqsap_sdk \
    libwifi-hal-crtl \
    libwifi-hal-qcom \
    libwpa_client \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor \
    wificond \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf

# Wifi (Temporary)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/libwifi-hal-hoanglong.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwifi-hal-hoanglong.so

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_wlan_dictionary.dat

# Wi-Fi Display
PRODUCT_BOOT_JARS += \
    WfdCommon
