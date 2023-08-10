LOCAL_PATH := device/alps/oppo6833

TARGET_BOARD_PLATFORM := mt6833             # From ro.mediatek.platform, but lowercase value

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := oppo6833    # From ro.product.board

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true          # To add info about F2FS Filesystem Data Block
# Put The Size of your Recovery Partition below, get it from your "MT****_Android_scatter.txt"
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
#BOARD_SUPPRESS_SECURE_ERASE := true
#BOARD_HAS_NO_MISC_PARTITION := true        # Delete if your partition table has /misc
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
RECOVERY_SDCARD_ON_DATA := true             # Optional: If /sdcard partition is emulated on /data partition

# TWRP stuff
#TW_EXCLUDE_SUPERSU := true                   # true/false: Add SuperSU or not
TW_INCLUDE_CRYPTO := true                     # true/false: Add Data Encryption Support or not
TW_INPUT_BLACKLIST := "hbtp_vm"               # Optional: Disables virtual mouse
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true

DEVICE_RESOLUTION := 1080x2400                 # The Resolution of your Device
TARGET_SCREEN_HEIGHT := 2400                    # The height
TARGET_SCREEN_WIDTH := 1080                      # The width
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/devices/platform/disp_leds/leds/lcd-backlight/brightness
#TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/odm/odm:vibrator@0/leds/vibrator/brightness
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 255                   # Set custom brightness, low is better

# Set the Path of Logical Units (LUNs) for Storage below (as per your chip/device)
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

TW_INCLUDE_NTFS_3G := true                    # Include NTFS Filesystem Support
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TWRP_INCLUDE_LOGCAT := true                   # Include LogCat Binary
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support
TW_DEFAULT_LANGUAGE := en                     # Set Default Language
TW_EXTRA_LANGUAGES := false

# Kernel
TARGET_IS_64_BIT := true                      # true/false: Determine if the device is 64-bit or not
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/zImage
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/prebuilt/zImage

# Get the CMDLine, Base, Pagesize and offsets from Unpacked recovery image and put below
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

TARGET_BOARD_SUFFIX := _64                    # Remove if the device is 32-bit
TARGET_USES_64_BIT_BINDER := true             # Remove if the device is 32-bit

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
