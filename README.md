
# Android aubio example
This repo shows how to build aubio from source files in android.

jni/include is copied from https://github.com/aubio/aubio/tree/master/src

# IMPORTANT
1. config.h is added manually which is required and normally created by wscript_build.
2. ndk-build may not work with mac m1 (arm64) devices. Refer to below hack for the ndk version specified in build.gradle.
   https://stackoverflow.com/a/69555276

# Using ndk-build (Optional)
(This creates libs directory which contains .so files for each platforms defined)

Running Android studio will create .so files under build/ directory but in case you want to generate .so files and use them instead of source code, follow below steps.

cd path_to_project_dir
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=$(pwd)/jni/Android.mk  APP_PLATFORM=android-32
