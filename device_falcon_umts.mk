$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/motorola/falcon_umts/falcon_umts-vendor.mk)

LOCAL_PATH := device/motorola/falcon_umts

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BOOT_JARS += qcmediaplayer

PRODUCT_LOCALES := \
        en_GB 

# Display 
PRODUCT_PACKAGES += \
	hwcomposer.msm8226 \
	gralloc.msm8226 \
	copybit.msm8226 \
	memtrack.msm8226 \
	libgenlock \
	libmemalloc \
	liboverlay \
	libqdutils \
	libtilerenderer

# Camera
PRODUCT_PACKAGES += \
	camera.msm8226 

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default 

# Wifi
PRODUCT_PACKAGES += \
	p2p_supplicant_overlay.conf \
	wpa_supplicant_overlay.conf

# Wifi AP
PRODUCT_PACKAGES += \
	hostapd.accept \
	hostapd.deny \
	hostapd_default.conf \
	libnetcmdiface

# Symlinks
PRODUCT_PACKAGES += \
	libxml2

# Thermal profiles
PRODUCT_PACKAGES += \
	thermald-ghost.conf \
	thermal-engine-8226.conf

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio_policy.msm8226 \
	audio.primary.msm8226 \
	audio.r_submix.default \
	alsa.msm8226 \
	libalsa-intf \
	libaudio-resampler \
	libaudioutils \
	aplay \
	amix \
	arec \
	alsaucm_test \
	libaudioparameter \
	libqcomvisualizer \
	libqcomvoiceprocessing \
	libqcompostprocbundle

# FM radio
PRODUCT_PACKAGES += \
	qcom.fmradio \
	libqcomfm_jni \
	FM2 \
	FMRecord

# Omx
PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libmm-omxcore \
	libOmxCore \
	libstagefrighthw \
	libOmxVdec \
	libOmxVenc \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libdashplayer \
	qcmediaplayer

# Other
PRODUCT_PACKAGES += \
	lights.msm8226 \
	sensors.msm8226 \
	gps.msm8226 \
	power.msm8226 \
	com.android.future.usb.accessory \
	librs_jni

# Apps
PRODUCT_PACKAGES += \
	Focal \
	Gallery \
	Stk 

# Misc
PRODUCT_PACKAGES += \
	tcpdump \
	Torch \
	DevicePerformanceSettingsHelper

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	HoloSpiralWallpaper \
	VisualizationWallpapers

# Motorola
PRODUCT_PACKAGES += \
	aplogd \
	batt_health \
	charge_only_mode \
	graphicsd \
	mot_boot_mode

# Charger
PRODUCT_PACKAGES += charger charger_res_images

# QRNGD
PRODUCT_PACKAGES += qrngd
 
# Crda
PRODUCT_PACKAGES += \
	crda \
	linville.key.pub.pem \
	regdbdump \
	regulatory.bin

# Filesystem management tools
PRODUCT_PACKAGES += \
	mkfs.f2fs_arm \
	fsck.f2fs \
	fibmap.f2fs \
	wcnss_service \
	make_ext4fs \
	e2fsck \
	resize2fs \
	setup_fs

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.qcom.rc \
	init.recovery.qcom.rc \
	init.target.rc \
	ueventd.qcom.rc \
	init.qcom.usb.rc

# Init scripts
PRODUCT_PACKAGES += \
	init.mmi.boot.sh \
	init.mmi.rc \
	init.mmi.touch.sh \
	init.qcom.post_boot.sh \
	init.qcom.sh \
	init.qcom.wifi.sh \
	init.class_main.sh \
	init.crda.sh \
	init.qcom.bt.sh \
	init.qcom.class_core.sh \
	init.qcom.coex.sh \
	init.qcom.early_boot.sh \
	init.qcom.efs.sync.sh \
	init.qcom.fm.sh \
	init.qcom.mdm_links.sh \
	init.qcom.modem_links.sh \
	init.qcom.syspart_fixup.sh \
	init.qcom.thermal_conf.sh \
	init.qcom.usb.sh

# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Hardware properties 
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 

# Audio configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/config/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(LOCAL_PATH)/config/snd_soc_msm_Tapan:system/etc/snd_soc_msm/snd_soc_msm_Tapan \
	$(LOCAL_PATH)/config/snd_soc_msm_Tapan9302:system/etc/snd_soc_msm/snd_soc_msm_Tapan9302 \
	$(LOCAL_PATH)/config/snd_soc_msm_Tapan_SKUF:system/etc/snd_soc_msm/snd_soc_msm_Tapan_SKUF

# Camera
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

# Wifi
PRODUCT_COPY_FILES += \
	kernel/motorola/msm8226/drivers/net/wireless/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
	kernel/motorola/msm8226/drivers/net/wireless/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin

# WiFi Config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/config/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
	$(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# GPS configuration
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/config/gps.conf:system/etc/gps.conf \
    	$(LOCAL_PATH)/config/sec_config:system/etc/sec_config

# Thermal Config
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/config/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf

# Product Properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1 \
	ro.product.locale.language=en \
	ro.product.locale.region=GB \
	ro.telephony.call_ring.multiple=false \
	ro.vold.umsdirtyratio=50 \
	persist.sys.purgeable_assets=1 \
	ro.telephony.call_ring.delay=3000 \
	persist.webview.provider=classic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
