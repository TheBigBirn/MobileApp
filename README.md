# my_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Brad's Notes

## Test App - Android

## Release App - android

https://docs.flutter.dev/deployment/android#signing-the-app

https://www.youtube.com/watch?v=g0GNuoCOtaQ&ab_channel=JohannesMilke

1. Make App Ready

- Create Logo and configure:
  - https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
  - https://pub.dev/packages/flutter_launcher_icons
- Rename Package to change app name:
  - https://pub.dev/packages/rename
- Create unique app ID
  - pub global run rename --bundleId [Reverse Domain + Project Name]
  - pub global run rename --bundleId com.bradbirney.tok

2. Sign App
   - Add "key.properties" to "./android" folder
     - https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app
     - Add store and key passwords to key.properties
   - Create a keystore (.jks) in android folder
     - https://docs.flutter.dev/deployment/android#create-an-upload-keystore
     - keytool -genkey -v -keystore %USERPROFILE%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
     - use key.properties store password for keystore password
     - move to android folder
   - Configure signing in gradle
     - https://docs.flutter.dev/deployment/android#configure-signing-in-gradle
     - copy keystore properties code blocks into build.gradle file
   - Ensure git will not commit in .gitignore
     ```
     key.properties
     **/*.keystore
     **/*.jks
     ```
3. Build and Release
   - Build
     - run "flutter clean"
     - run "flutter build appbundle"
   - Create app in google play developer account
     - log into google play console
     - create app
     - edit "Grow" / "store presence" / "main store listing"
     - edit "Grow" / "store presence" / "store settings"
   - Release
     - Production
       - upload .aab file created in Build step as app bundle
       - Finish Release details
       - Fill out info to remove errors
       - Open Beta
       - download on playstore
     - Closed Beta
       - invite only
     - Internal
       - invite only, max 100 users
