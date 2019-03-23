# React Native Update APK

Easily check for new APKs and install them in React Native.

## Installation

```bash
npm install rn-update-apk --save
```

Linking automatically with react-native link

```bash
react-native link rn-update-apk
react-native link react-native-fs
```

## Manual steps for Android

1. **FileProviders:** Android API24+ requires the use of a FileProvider to share "content" (like
   downloaded APKs) with other applications (like the system installer, to install
   the APK update). So you must add a FileProvider entry to your [AndroidManifest.xml](example/android/app/src/main/AndroidManifest.xml),
   and it will reference a "[filepaths](example/android/app/src/main/res/xml/filepaths.xml)" XML file. Both are demonstrated in the example as linked here.

1. **Permissions** For Android 25+ you need to add REQUEST_INSTALL_PACKAGES to your [AndroidManifest.xml](example/android/app/src/main/AndroidManifest.xml)

**Please install and run the example to see how it works before opening issues**.
Then adapt it into your own app. Getting the versions right is tricky and setting up FileProviders is _very_ easy to do incorrectly, especially if using another module that defines one (like rn-fetch-blob)

## Usage

Please see [the example App.js](example/App.js) as it is very full featured and
has very thorough documentation about what each feature is for. You just need to check out the module from github, `cd example && npm install && npm start` then `react-native run-android` in another terminal with an emulator up to see everything in action.

## Changelog

See the [Changelog](CHANGELOG.md) on github

## Testing

This application has been tested on API16-API28 Android and lightly on iOS (let's admit, it
is not as useful for iOS since it just takes you to the App Store)

## Version JSON example

Note that you can host tests on dropbox.com using their "shared links", but if you do so
will need to put '?raw=1' at the end of the link they give you so you get the raw file contents
instead of a non-JSON XML document

```javascript
// version.json example
// Note you will need to verify SSL works for Android <5 as it has SSL Protocol bugs
// If it doesn't then you may be able to use Google Play Services to patch the SSL Provider, or just serve your updates over HTTP for Android <5
// https://stackoverflow.com/a/36892715
{
  "versionName":"1.0.0",
  "apkUrl":"https://github.com/NewApp.apk",
  "forceUpdate": false
}
```

## Library Dependency

- react-native-fs (at react-native / npm level)
- conscrypt SSL library (at Java level)
- Android Support library (at Java level)
