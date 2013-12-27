# Release name
PRODUCT_RELEASE_NAME := falcon_umts

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/falcon_umts/device_falcon_umts.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := falcon_umts
PRODUCT_NAME := cm_falcon_umts
PRODUCT_BRAND := motorola
PRODUCT_MODEL := XT1032
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=falcon_retde BUILD_PRODUCT=falcon_umts BUILD_FINGERPRINT=motorola/falcon_retde/falcon_umts:4.3/14.10.0Q3.X-76-LGG-8/54:user/release-keys
