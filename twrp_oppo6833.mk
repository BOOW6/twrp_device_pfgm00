# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit from TWRP common configurations
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := oppo6833
PRODUCT_NAME := omni_oppo6833
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6833
PRODUCT_MANUFACTURER := alps

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=oppo6833 \
    PRODUCT_NAME=oppo6833 \
    PRIVATE_BUILD_DESC="sys_oplus_mssi_64_cn-user 11 RP1A.200720.011 1648716329077 release-keys"

BUILD_FINGERPRINT="alps/twrp_oppo6833/oppo6833:11/RP1A.200720.011/1648716329077:user/release-keys"

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.device \
    ro.product.name
