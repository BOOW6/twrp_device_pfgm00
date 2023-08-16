ALLOW_MISSING_DEPENDENCIES=true
DEVICE_PATH := device/alps/oppo6833
BOARD_MKBOOTIMG_ARGS :=

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Platform
BOARD_VENDOR := alps
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOOTLOADER_BOARD_NAME := oppo6833
BOARD_HAS_MTK_HARDWARE := true
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
# Cmdline for crypto, ufs, aes-256-xts (No embedded encryption hardware?)
BOARD_KERNEL_CMDLINE += CONFIG_EXT4_ENCRYPTION=y
BOARD_KERNEL_CMDLINE += CONFIG_F2FS_FS_ENCRYPTION=y
BOARD_KERNEL_CMDLINE += CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
#BOARD_KERNEL_CMDLINE += CONFIG_CRYPTO_SHA2_ARM64_CE=y
BOARD_KERNEL_CMDLINE += CONFIG_SCSI_UFS_CRYPTO=y

BOARD_KERNEL_BASE := 0x40078000
BOARD_NAME :=
BOARD_PAGE_SIZE := 2048
BOARD_HASH_TYPE := sha1
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_OS_VERSION := 11.0.0
BOARD_OS_PATCH_LEVEL := 2022-04
BOARD_HEADER_SIZE := 1660
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS += --kernel $(TARGET_PREBUILT_KERNEL)

BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_USE_CLANG := true
TARGET_KERNEL_CLANG_COMPILE := true
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-androidkernel-
#TARGET_KERNEL_CLANG_VERSION := r383902
#TARGET_KERNEL_SOURCE := kernel/alps/mt6833
TARGET_KERNEL_VERSION := 4.14
#TARGET_KERNEL_CONFIG := oppo6833_defconfig

#BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
#BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
#BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_SECOND_OFFSET := 0xbff88000
BOARD_TAGS_OFFSET := 0x07c08000
BOARD_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_HEADER_VERSION)

# dtb
BOARD_DTB_SIZE := 142071
BOARD_DTB_OFFSET := 0x07c08000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
#TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(BOARD_PREBUILT_DTBIMAGE_DIR)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# recovery_dtbo
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/recoveryDtbo
BOARD_PREBUILT_RECOVERY_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/recoveryDtbo
BOARD_MKBOOTIMG_ARGS += --recovery_dtbo $(BOARD_PREBUILT_RECOVERY_DTBOIMAGE)
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# System as root
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := oppo6833

# Init
TARGET_INIT_VENDOR_LIB := libinit_oppo6833
TARGET_RECOVERY_DEVICE_MODULES := libinit_oppo6833

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
VENDOR_SECURITY_PATCH := 2099-12-31

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS := --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000 # 32 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x08000000 # 128 MB

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 10737418240
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 10737410048
BOARD_GOOGLE_DYNAMIC_PARTITIONS_LIST := system system_ext vendor product odm

BOARD_SUPPRESS_SECURE_ERASE := true

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# System props
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Recovery
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_SDCARD_ON_DATA := true

# Crypto
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TARGET_PROVIDES_KEYMASTER := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1023 # 25%
TW_EXCLUDE_TWRPAPP := true

TW_NO_SCREEN_BLANK := true

TW_EXCLUDE_DEFAULT_USB_INIT := true

TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone4/temp
TW_Y_OFFSET := 115
TW_H_OFFSET := -115
TW_EXCLUDE_APEX := true

# For debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_CRYPTO_SYSTEM_VOLD_DEBUG := true
TW_CRYPTO_SYSTEM_VOLD_DISABLE_TIMEOUT := true

# supress error messages while building
ALLOW_MISSING_DEPENDENCIES := true
# overriding commands for target `out/target/product/oppo6833/recovery/root/system/lib64/android.hardware.keymaster@3.0.so', previously defined at build/make/core/base_rules.mk:525
BUILD_BROKEN_DUP_RULES := true
