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

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Extra required packages
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    libion.recovery \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# PRODUCT_PACKAGES_DEBUG += \
#     bootctl
#
# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#     libcutils \
#     libgptutils \
#     libz

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := oppo6833
PRODUCT_PLATFORM := oppo6833
PRODUCT_NAME := twrp_oppo6833
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6833
PRODUCT_MANUFACTURER := alps

# Hack: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.options=::v2 \
    ro.vendor.mtk_f2fs_enable=1

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.device \
    ro.product.name

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    fsck.f2fs \
    mkfs.f2fs
# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script
