#!/bin/bash
cd ../../../..
cd frameworks/av
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/frameworks_av/0001-Disable-usage-of-get_capture_position.patch 
cd ../..
cd frameworks/native
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/frameworks_native/0003-be-compatible-with-MTK-Lollipop-blobs.patch
cd ../..
cd system/core
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_core/0001-Remove-CAP_SYS_NICE-from-surfaceflinger.patch
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_core/0001-fix-ifx-thermal-spaming.patch
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_core/0001-mt6735-init-patches.patch
#git apply -v ../../device/lenovo/a2010/patches/system_core/0002-Changes-for-more-level-log.patch
cd ../..
cd system/netd
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_netd/0001-Revert-Don-t-start-tethering-if-IPv6-RPF-is-not-supp.patch
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_netd/0002-Enable-Tethering.patch
cd ../..
cd packages/apps/Settings
git apply --ignore-space-change --ignore-whitespace -v ../../../device/lenovo/a2010/patches/packages_app_Settings/author.patch
cd ../../../
cd system/sepolicy
git apply --ignore-space-change --ignore-whitespace -v ../../device/lenovo/a2010/patches/system_sepolicy/0001-Revert-back-to-version-29.patch
cd ../..
echo Patches Applied Successfully!
