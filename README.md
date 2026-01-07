# pillly

A simple, privacy-focused pill reminder app for Android.

## Features

- Schedule daily pill reminders
- Customizable alarm times
- Persistent notifications with sound and vibration
- Add descriptions to your medications
- Dark mode support
- Completely offline - all data is stored locally on your device
- 100% free and open source - no ads, no tracking

## Build Instructions

### Building from source

1. Clone this repo
2. Run `flutter pub get`
3. Create a `key.properties` file in `android/` dir
    ```
    storePassword=<your-store-password>
    keyPassword=<your-key-password>
    keyAlias=<your-key-alias>
    storeFile=<path-to-keystore>
    ```
4. Build the release APK with `flutter build apk --release`

## Contributing

This is my first ever Flutter app - I usually do React Native. So I'm more than open to any contributions through issues/pull requests.

## Attribution

The app icon symbol was made by [Atif Arshad](https://thenounproject.com/icon/medicine-time-5907806/).

## License

This project is licensed under [GPL-3](LICENSE)