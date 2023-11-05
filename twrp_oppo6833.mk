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
# Boot control HAL
# Health HAL
# Storage health HAL
# A/B support
# Write flags to the vendor space in /misc partition
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0 \
    android.hardware.fastboot@1.0-impl-mtk \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service \
    \
    android.hardware.health@2.0-service.crosshatch \
    \
    android.hardware.health.storage@1.0-service \
    android.hardware.power.stats@1.0-service \
    \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    \
    misc_writer \
    \
    update_engine_sideload \
    libmalistener

PRODUCT_PACKAGES_DEBUG += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs \
    bootctl \
    update_engine_client

# PRODUCT_STATIC_BOOT_CONTROL_HAL is obsolete. Use shared library module instead.
#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    libcutils \
#    libgptutils \
#    libz

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := oppo6833
#PRODUCT_PLATFORM := mt6833
PRODUCT_NAME := twrp_oppo6833
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6833
PRODUCT_MANUFACTURER := alps

# Hack: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.crypto.volume.filenames_mode=aes-256-cts

# PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
#     ro.product.device \
#     ro.product.name
