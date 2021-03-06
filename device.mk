# Copyright (C) 2012 The CyanogenMod Project
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

# Include espresso-common makefile
$(call inherit-product, device/samsung/espressowifi/espresso-common.mk)

# 3g overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/device

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/espresso3g/configs/audio_policy.conf:system/etc/audio_policy.conf

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-compat

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=SamsungOmap4RIL

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Non-open-source parts.
$(call inherit-product, device/samsung/espresso3g/blobs/espresso3g-blobs.mk)
