# Kernel
include vendor/nortical/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/nortical/config/BoardConfigQcom.mk
endif

# Soong
include vendor/nortical/config/BoardConfigSoong.mk
