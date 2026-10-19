# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device
PRODUCT_DEVICE := C71
PRODUCT_NAME := omni_C71
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX5303
PRODUCT_MANUFACTURER := realme

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1604
TARGET_SCREEN_WIDTH := 720

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/fstab.realme

# Vendor Android 13 (API 33) — System GSI Android 15/16 (API 35/36)
PRODUCT_TARGET_VNDK_VERSION := 33
PRODUCT_SHIPPING_API_LEVEL := 33
TARGET_RECOVERY_API_LEVEL := 33

# Virtual A/B
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Property overrides split (Android 10+)
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Proprietary blobs
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/proprietary/vendor,$(TARGET_COPY_OUT_VENDOR))

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
