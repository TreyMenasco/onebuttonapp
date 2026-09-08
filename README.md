# One Little Button

A Flutter app with one button that changes the background to a different pastel color on every press. Includes responsive layout, an accessible color announcement, and reduced-motion support.

## Run in a browser

Install the [Flutter SDK](https://docs.flutter.dev/install) and add its `bin` directory to your PATH. From this folder, run:

```powershell
flutter pub get
flutter run -d chrome
```

## Add native platforms

The app code also uses standard Flutter widgets compatible with mobile and desktop. Generate the desired platform runners before running on those platforms:

```powershell
flutter create --platforms=android,ios,windows .
flutter run -d windows
```

Native builds require the corresponding platform toolchain; iOS builds require macOS and Xcode. See [Flutter platform setup](https://docs.flutter.dev/platform-integration/desktop).

## Build for the web

```powershell
flutter build web
```

Deploy the contents of `build/web`. The Flutter source is in `lib/main.dart`; `web/index.html` is its web shell. The root `index.html` is the original standalone HTML version, still served by the earlier Python server. That server does not compile or run Flutter.

## Validation

Flutter was not available on PATH in the conversion environment, so compilation and runtime validation have not been performed. After installing the SDK, run `flutter analyze` and launch the app with the commands above.
