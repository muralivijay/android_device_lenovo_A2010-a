cd ../../../..
cd frameworks/av
git reset --hard && git clean -f -d
cd ../..
cd system/core
git reset --hard && git clean -f -d
cd ../..
cd system/netd
git reset --hard && git clean -f -d
cd ../..
cd packages/apps/Settings
git reset --hard && git clean -f -d
cd ../../../
cd system/sepolicy
git reset --hard && git clean -f -d
cd ../..
echo Patches Removed Successfully!
