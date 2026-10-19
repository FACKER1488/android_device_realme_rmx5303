# Path
DEVICE_PATH := device/realme/C71

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

# Platform (Unisoc UMS9230 / T7250)
TARGET_BOARD_PLATFORM := ums9230
TARGET_BOARD_PLATFORM_GPU := mali-g57
TARGET_BOOTLOADER_BOARD_NAME := ums9230
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := androidboot.hardware=ums9230 androidboot.selinux=permissive androidboot.init_fatal_reboot_target=recovery loop.max_part=16
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

# Partitions (Realme C71 / RMX5303)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SUPER_PARTITION_SIZE := 9611001856
BOARD_SUPER_PARTITION_GROUPS := realme_dynamic_partitions
BOARD_REALME_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm system_dlkm vendor_dlkm
BOARD_REALME_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Virtual A/B
BOARD_USES_VIRTUAL_AB := true
BOARD_VIRTUAL_AB_PARTITION_LIST := system system_ext vendor product odm system_dlkm vendor_dlkm
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vbmeta_odm \
    vbmeta_product \
    vbmeta_system_ext \
    init_boot \
    system \
    system_ext \
    vendor \
    product \
    odm \
    system_dlkm \
    vendor_dlkm

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab.realme
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Recovery resources inside vendor_boot (Unisoc requirement)
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

# Fastbootd
BOARD_USES_FASTBOOTD := true

# Metadata partition for FBEv2 (Android 13)
BOARD_USES_METADATA_PARTITION := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

# GSI compatibility
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Symlinks for Unisoc/Sprd
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/dsp:/dsp /vendor/firmware_mnt:/firmware
