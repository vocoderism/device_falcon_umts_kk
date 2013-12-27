# This is where cyanogenmod's copyright info must go, 
# since i am not a part of cm i will not include it here
# but im sure it will be added later on

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from falcon_umts device
$(call inherit-product, device/motorola/falcon_umts/device_falcon_umts.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := falcon_umts
PRODUCT_NAME := full_falcon_umts
PRODUCT_BRAND := motorola
PRODUCT_MODEL := falcon_umts
PRODUCT_MANUFACTURER := motorola
PRODUCT_RESTRICT_VENDOR_FILES := false
