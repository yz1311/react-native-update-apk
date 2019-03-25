#!/bin/bash
pushd example

# Fresh checkouts on macOS fail because ANDROID_HOME isn't available for some reason?
# Work around this by creating a local.properties file that should work on macOS
if [ ! -f "android/local.properties" ] && [ "$(uname)" == "Darwin" ]; then
    echo "No local.properties file found on macOS"
    if [ -d "$HOME/Library/Android/sdk" ]; then
        echo "Android SDK directory located. Generating default local.properties file"
        echo "sdk.dir=$HOME/Library/Android/sdk" > android/local.properties
    else
        echo "Unable to locate Android SDK directory. Create android/local.properties"
        echo "file manually, or open android directory in Android Studio to initialize it"
        exit
    fi
fi

mkdir -p android/app/src/main/assets/
npx react-native bundle --platform android --dev true --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/
pushd android
./gradlew assembleDebug
cp app/build/outputs/apk/debug/app-debug.apk ../rn-update-apk-example-3.0.1.apk
