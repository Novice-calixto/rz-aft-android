# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2021 Renesas Electronics Corp
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include only for Renesas ones.
ifneq (,$(filter $(TARGET_DEVICE), rzg2l-versa smarc_rzg2l hihope_rzg2n hihope_rzg2m))

PRODUCT_OUT_ABS     := $(abspath $(PRODUCT_OUT))

IPL_BUILD           := release

IPL_SRC             := $(abspath ./device/renesas/bootloaders/ipl)
IPL_SA_SRC          := $(abspath ./device/renesas/bootloaders/ipl/tools/renesas/rzg_layout_create)

# bl2 bl31 build output
IPL_OUT_ABS            := $(PRODUCT_OUT_ABS)/obj/IPL_OBJ
IPL_OUT_VERSA_ABS      := $(IPL_OUT_ABS)/IPL_VERSA_OBJ
IPL_OUT_SMARC_ABS      := $(IPL_OUT_ABS)/IPL_SMARC_OBJ
IPL_OUT_SMARC_PMIC_ABS := $(IPL_OUT_ABS)/IPL_SMARC_PMIC_OBJ
IPL_OUT_DEV_ABS        := $(IPL_OUT_ABS)/IPL_DEV_OBJ

ifeq ($(DEBUG),1)
    IPL_BUILD := debug
endif

ifeq ($(USE_OPTEE),)
USE_OPTEE := false
endif # USE_OPTEE

ifeq ($(USE_S2R),)
USE_S2R := false
endif # USE_S2R

# For VERSA board
IPL_BL2_VERSA_BINARY      := $(IPL_OUT_VERSA_ABS)/g2l/$(IPL_BUILD)/bl2.bin
IPL_BL2_BP_VERSA_BINARY   := $(IPL_OUT_VERSA_ABS)/bl2_bp.bin
IPL_BL2_BP_VERSA_ESD_BINARY   := $(PRODUCT_OUT_ABS)/bl2_bp-rzg2l-versa.bin
IPL_BL31_VERSA_BINARY     := $(IPL_OUT_VERSA_ABS)/g2l/$(IPL_BUILD)/bl31.bin

IPL_BL2_VERSA_SREC        := $(IPL_OUT_VERSA_ABS)/bl2.srec
IPL_BL2_BP_VERSA_SREC     := $(IPL_OUT_VERSA_ABS)/bl2_bp.srec
IPL_BL31_VERSA_SREC       := $(IPL_OUT_VERSA_ABS)/bl31.srec

FIP_VERSA_BIN             := $(IPL_OUT_VERSA_ABS)/fip.bin
FIP_VERSA_SREC            := $(IPL_OUT_VERSA_ABS)/fip.srec

# For SMARC board
IPL_BL2_SMARC_BINARY      := $(IPL_OUT_SMARC_ABS)/g2l/$(IPL_BUILD)/bl2.bin
IPL_BL2_BP_SMARC_BINARY   := $(IPL_OUT_SMARC_ABS)/bl2_bp.bin
IPL_BL2_BP_SMARC_ESD_BINARY   := $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l_discrete_esd.bin
IPL_BL31_SMARC_BINARY     := $(IPL_OUT_SMARC_ABS)/g2l/$(IPL_BUILD)/bl31.bin

IPL_BL2_SMARC_SREC        := $(IPL_OUT_SMARC_ABS)/bl2.srec
IPL_BL2_BP_SMARC_SREC     := $(IPL_OUT_SMARC_ABS)/bl2_bp.srec
IPL_BL31_SMARC_SREC       := $(IPL_OUT_SMARC_ABS)/bl31.srec

FIP_SMARC_BIN             := $(IPL_OUT_SMARC_ABS)/fip.bin
FIP_SMARC_SREC            := $(IPL_OUT_SMARC_ABS)/fip.srec

# For SMARC PMIC board
IPL_BL2_SMARC_PMIC_BINARY      := $(IPL_OUT_SMARC_PMIC_ABS)/g2l/$(IPL_BUILD)/bl2.bin
IPL_BL2_BP_SMARC_PMIC_BINARY   := $(IPL_OUT_SMARC_PMIC_ABS)/bl2_bp.bin
IPL_BL2_BP_SMARC_PMIC_ESD_BINARY   := $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l_esd.bin
IPL_BL31_SMARC_PMIC_BINARY     := $(IPL_OUT_SMARC_PMIC_ABS)/g2l/$(IPL_BUILD)/bl31.bin

IPL_BL2_SMARC_PMIC_SREC        := $(IPL_OUT_SMARC_PMIC_ABS)/bl2.srec
IPL_BL2_BP_SMARC_PMIC_SREC     := $(IPL_OUT_SMARC_PMIC_ABS)/bl2_bp.srec
IPL_BL31_SMARC_PMIC_SREC       := $(IPL_OUT_SMARC_PMIC_ABS)/bl31.srec

FIP_SMARC_PMIC_BIN             := $(IPL_OUT_SMARC_PMIC_ABS)/fip.bin
FIP_SMARC_PMIC_SREC            := $(IPL_OUT_SMARC_PMIC_ABS)/fip.srec

# For DEV board
IPL_BL2_DEV_BINARY        := $(IPL_OUT_DEV_ABS)/g2l/$(IPL_BUILD)/bl2.bin
IPL_BL2_BP_DEV_BINARY     := $(IPL_OUT_DEV_ABS)/bl2_bp.bin
IPL_BL31_DEV_BINARY       := $(IPL_OUT_DEV_ABS)/g2l/$(IPL_BUILD)/bl31.bin

IPL_BL2_DEV_SREC          := $(IPL_OUT_DEV_ABS)/bl2.srec
IPL_BL2_BP_DEV_SREC       := $(IPL_OUT_DEV_ABS)/bl2_bp.srec
IPL_BL31_DEV_SREC         := $(IPL_OUT_DEV_ABS)/bl31.srec

FIP_DEV_BIN               := $(IPL_OUT_DEV_ABS)/fip.bin
FIP_DEV_SREC              := $(IPL_OUT_DEV_ABS)/fip.srec

# ----------------------------Start of RZ/G2MN--------------------------

# SA0 SA6 for bootloader.img build output
IPL_SA_OUT_ABS      := $(PRODUCT_OUT_ABS)/obj/IPL_SA_OBJ
IPL_SA_SRC_ABS      := $(IPL_SA_OUT_ABS)/tools/renesas/rzg_layout_create

# SA0 SA6 SREC (HyperFlash) build output
IPL_SA_HF_OUT_ABS   := $(PRODUCT_OUT_ABS)/obj/IPL_SA_HF_OBJ
IPL_SA_HF_SRC_ABS   := $(IPL_SA_HF_OUT_ABS)/tools/renesas/rzg_layout_create

# SA0 SA6 SREC (eMMC) build output
IPL_SA_EMMC_OUT_ABS   := $(PRODUCT_OUT_ABS)/obj/IPL_SA_EMMC_OBJ
IPL_SA_EMMC_SRC_ABS   := $(IPL_SA_EMMC_OUT_ABS)/tools/renesas/rzg_layout_create

IPL_SA0_BINARY      := $(IPL_SA_OUT_ABS)/tools/renesas/rzg_layout_create/bootparam_sa0.bin
IPL_SA6_BINARY      := $(IPL_SA_OUT_ABS)/tools/renesas/rzg_layout_create/cert_header_sa6.bin
IPL_BL2_BINARY      := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl2.bin
IPL_BL31_BINARY     := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl31.bin

IPL_SA0_SREC        := $(IPL_SA_HF_OUT_ABS)/tools/renesas/rzg_layout_create/bootparam_sa0.srec
IPL_SA6_SREC        := $(IPL_SA_HF_OUT_ABS)/tools/renesas/rzg_layout_create/cert_header_sa6.srec
IPL_BL2_SREC        := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl2.srec
IPL_BL31_SREC       := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl31.srec

IPL_SA0_EMMC_SREC   := $(IPL_SA_EMMC_OUT_ABS)/tools/renesas/rzg_layout_create/bootparam_sa0.srec
IPL_SA6_EMMC_SREC   := $(IPL_SA_EMMC_OUT_ABS)/tools/renesas/rzg_layout_create/cert_header_sa6.srec
IPL_BL2_EMMC_SREC   := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl2.srec
IPL_BL31_EMMC_SREC  := $(IPL_OUT_ABS)/rzg/$(IPL_BUILD)/bl31.srec

PLATFORM_FLAGS_RZG2 := \
    PLAT=rzg \
    PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0 \
    RCAR_RPC_HYPERFLASH_LOCKED=0

ifeq ($(TARGET_DEVICE),hihope_rzg2m)
PLATFORM_FLAGS_RZG2 += \
    LSI=G2M \
    PMIC_ROHM_BD9571=0 \
    RCAR_SYSTEM_SUSPEND=0 \
    RCAR_DRAM_SPLIT=2
endif

ifeq ($(TARGET_DEVICE),hihope_rzg2n)
ifeq ($(USE_S2R),true)
PLATFORM_FLAGS_RZG2 += \
    LSI=G2N \
    PMIC_LEVEL_MODE=1 \
    PMIC_ROHM_BD9571=1 \
    RCAR_SYSTEM_SUSPEND=1
else
PLATFORM_FLAGS_RZG2 += \
    LSI=G2N \
    PMIC_ROHM_BD9571=0 \
    RCAR_SYSTEM_SUSPEND=0
endif
endif

ifeq ($(USE_OPTEE),false)
PLATFORM_FLAGS_RZG2 += SPD="none"
else
PLATFORM_FLAGS_RZG2 += SPD="opteed"
endif #USE_OPTEE

PLATFORM_FLAGS_RZG2 += \
    BUILD=$(IPL_BUILD) \
    CROSS_COMPILE=$(BSP_GCC_CROSS_COMPILE)

# Use multimedia
PLATFORM_FLAGS_RZG2 += \
    RCAR_LOSSY_ENABLE=1

IPL_BL_BUILD_CMD := SCAN_BUILD=1 $(ANDROID_MAKE) -C $(IPL_SRC) \
        IPL_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_RZG2) rzg all

# ----------------------------End of RZ/G2MN----------------------------

# ----------------------------------------------------------------------

BOOTPARAMS_BIN            := $(IPL_OUT_ABS)/bootparameter
FIPTOOL                   := $(IPL_OUT_ABS)/fiptool
HOST_COMPILE              := $(abspath ./prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8_deprecated/bin/x86_64-linux-)
LOAD_ADDRESS              := 0x00011E00
UBOOT_VERSA              := $(PRODUCT_OUT_ABS)/u-boot_versa.bin
UBOOT_SMARC               := $(PRODUCT_OUT_ABS)/u-boot_smarc.bin
UBOOT_DEV                 := $(PRODUCT_OUT_ABS)/u-boot_dev.bin

# ----------------------------------------------------------------------

PLATFORM_FLAGS := \
    PLAT=g2l \
    BUILD=$(IPL_BUILD) \
    CROSS_COMPILE=$(BSP_GCC_CROSS_COMPILE) \
    HOST_COMPILE=$(HOST_COMPILE)

ifeq ($(REDUCE_RESERVED_MEM), true)
# Reducing reserved memory
PLATFORM_FLAGS += \
    REDUCE_RESERVED_MEM=1
endif

PLATFORM_FLAGS_VERSA := $(PLATFORM_FLAGS) BOARD=CALIXTO_RZG2L_VERSA_2GB
PLATFORM_FLAGS_VERSA := $(PLATFORM_FLAGS) BOARD=CALIXTO_RZG2L_VERSA_1GB
PLATFORM_FLAGS_SMARC := $(PLATFORM_FLAGS) BOARD=smarc_2
PLATFORM_FLAGS_SMARC_PMIC := $(PLATFORM_FLAGS) BOARD=smarc_pmic_2
PLATFORM_FLAGS_DEV := $(PLATFORM_FLAGS) BOARD=dev15_4

IPL_SCAN_BUILD_CMD := $(abspath $(LLVM_PREBUILTS_PATH)/scan-build) \
	-o $(OUT_DIR)/sb-reports/ipl --use-analyzer \
	$(abspath $(LLVM_PREBUILTS_PATH)/clang) \
	--use-cc $(BSP_GCC_CROSS_COMPILE)gcc \
	--analyzer-target=aarch64-linux-gnu \
	--force-analyze-debug-code -analyze-headers


IPL_BL_BUILD_CMD_VERSA := SCAN_BUILD=1 $(ANDROID_MAKE) -C $(IPL_SRC) \
	IPL_OUT=$(IPL_OUT_VERSA_ABS) $(PLATFORM_FLAGS_VERSA) all
	
scan-build-rzg2l_versa_bl:
	@echo "Starting scan-build for IPLs VERSA"
	$(MKDIR) -p $(IPL_OUT_VERSA_ABS)
	export $(PLATFORM_FLAGS_VERSA)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_VERSA_ABS) $(PLATFORM_FLAGS_VERSA) -C $(IPL_SRC) clean
	$(IPL_SCAN_BUILD_CMD) /bin/bash -c "$(IPL_BL_BUILD_CMD_VERSA)"
	
	
IPL_BL_BUILD_CMD_SMARC := SCAN_BUILD=1 $(ANDROID_MAKE) -C $(IPL_SRC) \
	IPL_OUT=$(IPL_OUT_SMARC_ABS) $(PLATFORM_FLAGS_SMARC) all
		
scan-build-rzg2l_smarc_bl:
	@echo "Starting scan-build for IPLs SMARC"
	$(MKDIR) -p $(IPL_OUT_SMARC_ABS)
	export $(PLATFORM_FLAGS_SMARC)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_SMARC_ABS) $(PLATFORM_FLAGS_SMARC) -C $(IPL_SRC) clean
	$(IPL_SCAN_BUILD_CMD) /bin/bash -c "$(IPL_BL_BUILD_CMD_SMARC)"

IPL_BL_BUILD_CMD_SMARC_PMIC := SCAN_BUILD=1 $(ANDROID_MAKE) -C $(IPL_SRC) \
       IPL_OUT=$(IPL_OUT_SMARC_PMIC_ABS) $(PLATFORM_FLAGS_SMARC_PMIC) all

scan-build-rzg2l_smarc_pmic_bl:
	@echo "Starting scan-build for IPLs SMARC PMIC"
	$(MKDIR) -p $(IPL_OUT_SMARC_PMIC_ABS)
	export $(PLATFORM_FLAGS_SMARC_PMIC)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_SMARC_PMIC_ABS) $(PLATFORM_FLAGS_SMARC_PMIC) -C $(IPL_SRC) clean
	$(IPL_SCAN_BUILD_CMD) /bin/bash -c "$(IPL_BL_BUILD_CMD_SMARC_PMIC)"

IPL_BL_BUILD_CMD_DEV := SCAN_BUILD=1 $(ANDROID_MAKE) -C $(IPL_SRC) \
	IPL_OUT=$(IPL_OUT_DEV_ABS) $(PLATFORM_FLAGS_DEV) all

scan-build-rzg2l_dev_bl:
	@echo "Starting scan-build for IPLs DEV"
	$(MKDIR) -p $(IPL_OUT_DEV_ABS)
	export $(PLATFORM_FLAGS)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_DEV_ABS) $(PLATFORM_FLAGS_DEV) -C $(IPL_SRC) clean
	$(IPL_SCAN_BUILD_CMD) /bin/bash -c "$(IPL_BL_BUILD_CMD_DEV)"
build_bin:
	$(MKDIR) -p $(IPL_OUT_ABS)
	@echo "Build bootparameter and fiptool"
	$(ANDROID_MAKE) $(PLATFORM_FLAGS) BIN_OUT=$(IPL_OUT_ABS) -C $(IPL_SRC)/bootparameters_src clean
	$(ANDROID_MAKE) $(PLATFORM_FLAGS) BIN_OUT=$(IPL_OUT_ABS) -C $(IPL_SRC)/tools/fiptool clean
	$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_ABS) BIN_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_VERSA) bootparam fiptool
        #$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_ABS) BIN_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_SMARC) bootparam fiptool

# ----------------------------------------------------------------------
# Build RZ/G2L SMARC IPL
# ----------------------------------------------------------------------
rzg2l_smarc_bl: u-boot_smarc
	$(MKDIR) -p $(IPL_OUT_SMARC_ABS)
	@echo "Starting build RZ/G2L SMARC IPL"
	export $(PLATFORM_FLAGS_SMARC)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_SMARC_ABS) $(PLATFORM_FLAGS_SMARC) -C $(IPL_SRC) clean
	$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_SMARC_ABS) $(PLATFORM_FLAGS_SMARC) all
	# Create bl2_bp.bin
	cp -vF $(IPL_BL2_SMARC_BINARY) $(PRODUCT_OUT_ABS)/bl2-smarc-rzg2l_discrete.bin
	$(BOOTPARAMS_BIN) $(IPL_BL2_SMARC_BINARY) $(IPL_BL2_BP_SMARC_BINARY)
	cp -vF $(IPL_BL2_BP_SMARC_BINARY) $(IPL_BL2_BP_SMARC_ESD_BINARY)
	cat $(IPL_BL2_SMARC_BINARY) >> $(IPL_BL2_BP_SMARC_BINARY)
	# Create fip.bin
	$(FIPTOOL) create --align 16 --soc-fw $(IPL_BL31_SMARC_BINARY) --nt-fw $(UBOOT_SMARC) $(FIP_SMARC_BIN)
	# Convert to srec
	objcopy -v -O srec --adjust-vma=$(LOAD_ADDRESS) --srec-forceS3 -I binary $(IPL_BL2_BP_SMARC_BINARY) $(IPL_BL2_BP_SMARC_SREC)
	objcopy -v -I binary -O srec --adjust-vma=0x0000 --srec-forceS3  $(FIP_SMARC_BIN) $(FIP_SMARC_SREC)
	cp -vF $(IPL_BL2_BP_SMARC_BINARY) $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l_discrete.bin
	cp -vF $(FIP_SMARC_BIN) $(PRODUCT_OUT_ABS)/fip-smarc-rzg2l_discrete.bin
	cp -vF $(IPL_BL2_BP_SMARC_SREC) $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l_discrete.srec
	cp -vF $(FIP_SMARC_SREC) $(PRODUCT_OUT_ABS)/fip-smarc-rzg2l_discrete.srec

# ----------------------------------------------------------------------
# Build RZ/G2L SMARC PMIC IPL
# ----------------------------------------------------------------------
rzg2l_smarc_pmic_bl: u-boot_smarc
	$(MKDIR) -p $(IPL_OUT_SMARC_PMIC_ABS)
	@echo "Starting build RZ/G2L SMARC PMIC IPL"
	export $(PLATFORM_FLAGS_SMARC_PMIC)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_SMARC_PMIC_ABS) $(PLATFORM_FLAGS_SMARC_PMIC) -C $(IPL_SRC) clean
	$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_SMARC_PMIC_ABS) $(PLATFORM_FLAGS_SMARC_PMIC) all
	# Create bl2_bp.bin
	cp -vF $(IPL_BL2_SMARC_PMIC_BINARY) $(PRODUCT_OUT_ABS)/bl2-smarc-rzg2l.bin
	$(BOOTPARAMS_BIN) $(IPL_BL2_SMARC_PMIC_BINARY) $(IPL_BL2_BP_SMARC_PMIC_BINARY)
	cp -vF $(IPL_BL2_BP_SMARC_PMIC_BINARY) $(IPL_BL2_BP_SMARC_PMIC_ESD_BINARY)
	cat $(IPL_BL2_SMARC_PMIC_BINARY) >> $(IPL_BL2_BP_SMARC_PMIC_BINARY)
	# Create fip.bin
	$(FIPTOOL) create --align 16 --soc-fw $(IPL_BL31_SMARC_PMIC_BINARY) --nt-fw $(UBOOT_SMARC) $(FIP_SMARC_PMIC_BIN)
	# Convert to srec
	objcopy -v -O srec --adjust-vma=$(LOAD_ADDRESS) --srec-forceS3 -I binary $(IPL_BL2_BP_SMARC_PMIC_BINARY) $(IPL_BL2_BP_SMARC_PMIC_SREC)
	objcopy -v -I binary -O srec --adjust-vma=0x0000 --srec-forceS3  $(FIP_SMARC_PMIC_BIN) $(FIP_SMARC_PMIC_SREC)
	cp -vF $(IPL_BL2_BP_SMARC_PMIC_BINARY) $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l.bin
	cp -vF $(FIP_SMARC_PMIC_BIN) $(PRODUCT_OUT_ABS)/fip-smarc-rzg2l.bin
	cp -vF $(IPL_BL2_BP_SMARC_PMIC_SREC) $(PRODUCT_OUT_ABS)/bl2_bp-smarc-rzg2l.srec
	cp -vF $(FIP_SMARC_PMIC_SREC) $(PRODUCT_OUT_ABS)/fip-smarc-rzg2l.srec

# ----------------------------------------------------------------------
# Build RZ/G2L DEV IPL
# ----------------------------------------------------------------------

rzg2l_dev_bl: u-boot_dev
	$(MKDIR) -p $(IPL_OUT_DEV_ABS)
	@echo "Starting build RZ/G2L DEV IPL"
	export $(PLATFORM_FLAGS_DEV)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_DEV_ABS) $(PLATFORM_FLAGS_DEV) -C $(IPL_SRC) clean
	$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_DEV_ABS) $(PLATFORM_FLAGS_DEV) all
	# Create bl2_bp.bin
	$(BOOTPARAMS_BIN) $(IPL_BL2_DEV_BINARY) $(IPL_BL2_BP_DEV_BINARY)
	cat $(IPL_BL2_DEV_BINARY) >> $(IPL_BL2_BP_DEV_BINARY)
	# Create fip.bin
	$(FIPTOOL) create --align 16 --soc-fw $(IPL_BL31_DEV_BINARY) --nt-fw $(UBOOT_DEV) $(FIP_DEV_BIN)
	# Convert to srec
	objcopy -v -O srec --adjust-vma=$(LOAD_ADDRESS) --srec-forceS3 -I binary $(IPL_BL2_BP_DEV_BINARY) $(IPL_BL2_BP_DEV_SREC)
	objcopy -v -I binary -O srec --adjust-vma=0x0000 --srec-forceS3  $(FIP_DEV_BIN) $(FIP_DEV_SREC)
	cp -vF $(IPL_BL2_BP_DEV_SREC) $(PRODUCT_OUT_ABS)/bl2_dev_bp.srec
	cp -vF $(FIP_DEV_SREC) $(PRODUCT_OUT_ABS)/fip_dev.srec


# ----------------------------------------------------------------------
# Build RZ/G2L VERSA IPL
# ----------------------------------------------------------------------
rzg2l_versa_bl: u-boot_versa
	$(MKDIR) -p $(IPL_OUT_VERSA_ABS)
	@echo "Starting build RZ/G2L VERSA IPL"
	export $(PLATFORM_FLAGS_VERSA)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_VERSA_ABS) $(PLATFORM_FLAGS_VERSA) -C $(IPL_SRC) clean
	$(ANDROID_MAKE) -C $(IPL_SRC) IPL_OUT=$(IPL_OUT_VERSA_ABS) $(PLATFORM_FLAGS_VERSA) all
	# Create bl2_bp.bin
	$(BOOTPARAMS_BIN) $(IPL_BL2_VERSA_BINARY) $(IPL_BL2_BP_VERSA_BINARY)
	cat $(IPL_BL2_VERSA_BINARY) >> $(IPL_BL2_BP_VERSA_BINARY)
	# Create fip.bin
	#$(FIPTOOL) create --align 16 --soc-fw $(IPL_BL31_VERSA_BINARY) --nt-fw $(UBOOT_DEV) $(FIP_VERSA_BIN)
	# Convert to srec
	#objcopy -v -O srec --adjust-vma=$(LOAD_ADDRESS) --srec-forceS3 -I binary $(IPL_BL2_BP_VERSA_BINARY) $(IPL_BL2_BP_VERSA_SREC)
	#objcopy -v -I binary -O srec --adjust-vma=0x0000 --srec-forceS3  $(FIP_VERSA_BIN) $(FIP_VERSA_SREC)
	cp -vF $(IPL_BL2_BP_VERSA_BINARY) $(PRODUCT_OUT_ABS)/bl2_bp-rzg2l_versa.bin 
	cp -vF $(FIP_VERSA_BIN) $(PRODUCT_OUT_ABS)/fip-rzg2l_versa.bin 
	cp -vF $(IPL_BL2_BP_VERSA_SREC) $(PRODUCT_OUT_ABS)/bl2_bp-rzg2l_versa.srec
	cp -vF $(FIP_VERSA_SREC) $(PRODUCT_OUT_ABS)/fip-rzg2l_versa.srec 

# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Build RZ/G2[M|N] srec files
# ----------------------------------------------------------------------

ipl_sa:
	$(MKDIR) -p $(IPL_SA_OUT_ABS)
	cp -R $(IPL_SRC)/tools $(IPL_SA_OUT_ABS)/
	cp -R $(IPL_SRC)/include $(IPL_SA_OUT_ABS)/
	export $(PLATFORM_FLAGS_RZG2)
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SA_SRC_ABS) clean
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) CPPFLAGS="-D=AARCH64" ARCH=aarch64 -C $(IPL_SA_SRC_ABS) all
	cp -vF $(IPL_SA0_BINARY) $(IPL_SA6_BINARY) $(PRODUCT_OUT_ABS)/

ipl_sa_hf:
	$(MKDIR) -p $(IPL_SA_HF_OUT_ABS)
	cp -R $(IPL_SRC)/tools $(IPL_SA_HF_OUT_ABS)/
	cp -R $(IPL_SRC)/include $(IPL_SA_HF_OUT_ABS)/
	export $(PLATFORM_FLAGS_RZG2)
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SA_HF_SRC_ABS) clean
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) CPPFLAGS="-D=AARCH64" ARCH=aarch64 RCAR_SA6_TYPE=0 -C $(IPL_SA_HF_SRC_ABS) all
	cp -vF $(IPL_SA0_SREC) $(IPL_SA6_SREC) $(PRODUCT_OUT_ABS)/

ipl_sa_emmc:
	$(MKDIR) -p $(IPL_SA_EMMC_OUT_ABS)
	cp -R $(IPL_SRC)/tools $(IPL_SA_EMMC_OUT_ABS)/
	cp -R $(IPL_SRC)/include $(IPL_SA_EMMC_OUT_ABS)/
	export $(PLATFORM_FLAGS_RZG2)
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SA_EMMC_SRC_ABS) clean
	$(ANDROID_MAKE) $(PLATFORM_FLAGS_RZG2) CPPFLAGS="-D=AARCH64" ARCH=aarch64 RCAR_SA6_TYPE=1 -C $(IPL_SA_EMMC_SRC_ABS) all
	cp -vF $(IPL_SA0_EMMC_SREC) $(PRODUCT_OUT_ABS)/bootparam_sa0_emmc.srec
	cp -vF $(IPL_SA6_EMMC_SREC) $(PRODUCT_OUT_ABS)/cert_header_sa6_emmc.srec

ipl_bl:
	$(MKDIR) -p $(IPL_OUT_ABS)
	export $(PLATFORM_FLAGS_RZG2)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SRC) clean
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SRC) rzg all
	cp -vF $(IPL_BL2_BINARY) $(IPL_BL31_BINARY) $(IPL_BL2_SREC) $(IPL_BL31_SREC) $(PRODUCT_OUT_ABS)/

scan-build-ipl_bl:
	@echo "Starting scan-build for IPLs"
	$(MKDIR) -p $(IPL_OUT_ABS)
	export $(PLATFORM_FLAGS_RZG2)
	$(ANDROID_MAKE) IPL_OUT=$(IPL_OUT_ABS) $(PLATFORM_FLAGS_RZG2) -C $(IPL_SRC) clean
	$(IPL_SCAN_BUILD_CMD) /bin/bash -c "$(IPL_BL_BUILD_CMD)"

# --------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE                := scan-build-rzg2l_smarc_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := scan-build-rzg2l_versa_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := scan-build-rzg2l_smarc_pmic_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := scan-build-rzg2l_dev_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := rzg2l_smarc_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := rzg2l_versa_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := rzg2l_smarc_pmic_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := rzg2l_dev_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := build_bin
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := ipl_sa
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := ipl_sa_hf
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := ipl_sa_emmc
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := ipl_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE                := scan-build-ipl_bl
LOCAL_MODULE_TAGS           := optional
include $(BUILD_PHONY_PACKAGE)

endif # TARGET_DEVICE smarc_rzg2l hihope_rzg2n hihope_rzg2m rzg2l_versa
