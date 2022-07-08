## Release App - IOS

Collect Info:

- Team ID - WY98B4934N
- Bundle ID - com.bradbirney.tok
- Provisioning Profile:
  - Method - (development or app-store)
  - Name - pp-tok-d-1

https://betterprogramming.pub/deploy-an-ios-app-to-testflight-or-the-app-store-using-github-actions-c4d7082b1430

Code Signing and Provisioning Profile:

- Turn off auto managed signing
  - "auto managed signing potentially results in a new certificate and corresponding provisioning profile being created every time the workflow runs"
- Create App ID
- Create Certificate
- Create Device
- Create Provisioning Profile
  - Download Profile
  - import profile Runner > Signing & Capabilities tab
    - (Sets Build Settings)
    - Provisioning Profile = name of the imported profile
    - Code Signing Identity = iOS Distribution
    - Development Team = team name associated with the provisioning profile
  - Add exportOptions.plist under ios folder (flutter specific) - https://jtmuller5-98869.medium.com/flutter-build-an-ipa-90520e813a96 - Update PP Method, TeamId, BundleId, and PP name

Project Setup:
GitHub Secrets:
CI and Scripts:

Manual Release Notes:

- https://www.youtube.com/watch?v=DLvdZtTAJrE&ab_channel=SeanAllen
- Export Compliance Information: Does your app qualify for any of the exemptions provided in Category 5, Part 2 of the U.S. Export Administration Regulations? - https://www.bis.doc.gov/index.php/policy-guidance/encryption/4-reports-and-reviews/a-annual-self-classification

## Release App - Android

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
   - Create a keystore (.jks) in android folder
     - https://docs.flutter.dev/deployment/android#create-an-upload-keystore
     - keytool -genkey -v -keystore upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
     - keytool -genkey -v -keystore [keyName].jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias [alias]
     - remember keystore password for next step
     - move .jks file to android/app folder
   - Add "key.properties" to "./android" folder
     - https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app
     - Add store and key passwords to key.properties
     - Add path to .jks file
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

## Setup CI/CD Pipeline

- Github Actions
  - https://github.com/marketplace?type=actions
  - https://github.com/RobertBrunhage/flutter-github-action/blob/master/.github/workflows/ci.yml
  -
- Android
  - https://medium.com/@niraj_prajapati/automate-android-app-publishing-on-play-store-using-github-actions-554de7801c36
  -

## Flutter Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
