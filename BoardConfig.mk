# inherit from the proprietary version
-include vendor/motorola/falcon_umts/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/falcon_umts
TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

USE_CAMERA_STUB := true
BOARD_VENDOR := motorola-qcom

# Global flags
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DNEW_ION_API -DMOTOROLA_UIDS -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

TARGET_USES_MOTOROLA_LOG := true


# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# QCOM hardware
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_HARDWARE := true

# Arch related defines and optimizations
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8226

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true

# Optimisations used by Qualcomm
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_SIMULATOR := false

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/motorola/falcon_umts
TARGET_KERNEL_CONFIG := msm8226_mmi_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0 zcache androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --dt $(LOCAL_PATH)/dt.img

# Wifi related defines
BOARD_HAS_QCOM_WLAN := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
BOARD_WLAN_DEVICE := qcwcn

# Wifi Modules
 WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/prima
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/prima/prima_wlan.ko
	ln -sf /system/lib/modules/prima/prima_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko
 
 TARGET_KERNEL_MODULES += WLAN_MODULES

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_HAVE_LOW_LATENCY_AUDIO := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_DISABLED_SSR := true

# Fix this up by examining /proc/mtd on a running device(Already Fixed BTW)
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5930614784
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 40
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_HAS_LARGE_FILESYSTEM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/config/
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Thermal
BOARD_USES_EXTRA_THERMAL_SENSOR := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

# OpenGL drivers config file path
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg

# Misc
TARGET_NR_SVC_SUPP_GIDS := 28
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGBX8888 := true

# Graphics
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := msm8226
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_HAVE_FRONT_CAM :=true
BOARD_HAVE_BACK_CAM :=true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

# Power
TARGET_USES_CM_POWERHAL := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1031,xt1032,xt1033,xt1034,falcon_umts,falcon_umtsds,falcon_cdma

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TW_FLASH_FROM_STORAGE := true
TW_ALWAYS_RMRF := true
RECOVERY_TOUCHSCREEN_SWAP_XY := true 
RECOVERY_TOUCHSCREEN_FLIP_Y := true 
RECOVERY_TOUCHSCREEN_FLIP_X := true
RECOVERY_SDCARD_ON_DATA := true
TW_ALWAYS_RMRF := true
TW_NEVER_UNMOUNT_SYSTEM := true
HAVE_SELINUX := true

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy
BOARD_SEPOLICY_UNION += \
	adbd.te \
	app.te \
	bluetooth_loader.te \
	bridge.te \
	camera.te \
	device.te \
	dhcp.te \
	dnsmasq.te \
	domain.te \
	drmserver.te \
	file_contexts \
	file.te \
	hostapd.te \
	init_shell.te \
	init.te \
	libqc-opt.te \
	mediaserver.te \
	mpdecision.te \
	netd.te \
	netmgrd.te \
	nfc.te \
	property_contexts \
	property.te \
	qcom.te \
	qmux.te \
	radio.te \
	rild.te \
	rmt.te \
	sdcardd.te \
	sensors.te \
	shell.te \
	surfaceflinger.te \
	system.te \
	tee.te \
	te_macros \
	thermald.te \
	ueventd.te \
	vold.te \
	wpa_supplicant.te \
	zygote.te
