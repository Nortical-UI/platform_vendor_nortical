#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2021 Nortical-UI and Aurora Workgroup
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

PLATFORM_NORTICAL_RELEASE := 12-S
PLATFORM_NORTICAL_VERSION := $(PLATFORM_NORTICAL_RELEASE).$(shell date +%m%d%H%M)

TARGET_PRODUCT_SHORT := $(subst nortical_,,$(TARGET_DEVICE))

PLATFORM_NORTICAL_ANDROID_VERSION := 12
PLATFORM_NORTICAL_SPECIFIC_VERSION := 0
PLATFORM_NORTICAL_CHANGE_VERSION := 0
PLATFORM_NORTICAL_VERSION := $(PLATFORM_NORTICAL_ANDROID_VERSION).$(PLATFORM_NORTICAL_SPECIFIC_VERSION).$(PLATFORM_NORTICAL_CHANGE_VERSION)

PLATFORM_NORTICAL_TYPE := Vanilla

ifeq ($(PLATFORM_NORTICAL_GAPPS), true)
     $(call inherit-product, vendor/gapps/common/common-vendor.mk)
     PLATFORM_NORTICAL_TYPE := Gapps
endif

ifeq ($(PLATFORM_NORTICAL_MAINTAINER_VARIANT), OFFICIAL)
     PLATFORM_NORTICAL_FULL_VERSION += Nortical-UI_$(PLATFORM_NORTICAL_VERSION)-$(TARGET_DEVICE)-$(shell date +%Y%m%d%H%M)-$(PLATFORM_NORTICAL_TYPE)-OFFICIAL
else
     PLATFORM_NORTICAL_FULL_VERSION += Nortical-UI_$(PLATFORM_NORTICAL_VERSION)-$(TARGET_DEVICE)-$(shell date +%Y%m%d%H%M)-$(PLATFORM_NORTICAL_TYPE)-UNOFFICIAL
endif


PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.nortical.version=$(PLATFORM_NORTICAL_VERSION)
