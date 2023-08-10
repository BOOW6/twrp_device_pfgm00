$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Add this line if your device is 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)
# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
# If you are building from OmniROM's minimal source, Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_COPY_FILES += device/alps/oppo6833/prebuilt/zImage:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

PRODUCT_DEVICE := oppo6833
PRODUCT_NAME := omni_oppo6833
PRODUCT_BRAND := alps
PRODUCT_MODEL := oppo6833
PRODUCT_MANUFACTURER := alps

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="alps/twrp_oppo6833/oppo6833:11/RP1A.200720.011/1648716329077:user/release-keys" \
    PRIVATE_BUILD_DESC="sys_oplus_mssi_64_cn-user 11 RP1A.200720.011 1648716329077 release-keys"
