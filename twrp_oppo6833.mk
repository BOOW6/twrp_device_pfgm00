# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
# Inherit from TWRP common configurations
$(call inherit-product, vendor/twrp/config/common.mk)
# enable v-ab ota
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

$(call inherit-product, device/alps/oppo6833/device.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Extra required packages
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0 \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.1-service \
    android.hardware.health@2.0-impl-default \
    android.hardware.health@2.0-impl-2.1 \
    android.hardware.health@2.1 \
    android.hardware.health@2.0 \
    android.hardware.health@1.0 \
    android.hardware.health@2.1-service \
    android.hardware.health@2.0-service \
    libion.recovery \
    update_engine \
    update_verifier \
    fsck.f2fs \
    mkfs.f2fs \
    otapreopt_script

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    libcutils \
    libgptutils \
    libz

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := oppo6833
#PRODUCT_PLATFORM := mt6833
PRODUCT_NAME := twrp_oppo6833
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6833
PRODUCT_MANUFACTURER := alps

# Hack: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
#     ro.product.device \
#     ro.product.name
